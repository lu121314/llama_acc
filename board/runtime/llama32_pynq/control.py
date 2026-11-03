"""Register protocol derived from the selected RTL, not HLS ap_ctrl_hs."""
from dataclasses import dataclass
import math
import time


@dataclass(frozen=True)
class Status:
    raw: int

    @property
    def token_count(self):
        return self.raw & 0xFFFF

    @property
    def result_valid(self):
        return bool(self.raw & 0x80000000)

    @property
    def token(self):
        """Legacy status bits[30:16]; full 17-bit results live at 0x2c."""
        return (self.raw >> 16) & 0x7FFF


class AcceleratorTimeout(TimeoutError):
    pass


class Accelerator:
    TOKEN_HIGH = 0x28
    RESULT = 0x2C
    TOKEN = 0x00
    STATUS = 0x04
    TEST = 0x0C
    MAGIC = 0x44
    ACK = 0x80
    RESET = 0xC0
    PREFILL = 0x00030000
    PREFILL_LAST = 0x00050000
    DECODE = 0x00090000
    VOCAB = 128256
    EOS = frozenset((128001, 128008, 128009))
    CONTEXT = 8192

    def __init__(self, mmio, timeout_s=60.0, poll_interval_s=0.001,
                 clock=time.monotonic, sleep=time.sleep, *, inference_enabled=True,
                 context_tokens=None):
        if (not math.isfinite(timeout_s) or not math.isfinite(poll_interval_s)
                or timeout_s <= 0 or not 0 < poll_interval_s <= timeout_s):
            raise ValueError('Invalid timeout/poll interval')
        self.mmio = mmio
        self.timeout_s = timeout_s
        self.poll_interval_s = poll_interval_s
        self._clock = clock
        self._sleep = sleep
        self.inference_enabled = inference_enabled
        self.context_tokens = type(self).CONTEXT if context_tokens is None else context_tokens
        self.busy = False
        self.tainted = False

    def status(self):
        return Status(int(self.mmio.read(self.STATUS)))

    def _wait(self, predicate, description):
        deadline = self._clock() + self.timeout_s
        while True:
            status = self.status()
            if predicate(status):
                return status
            if self._clock() >= deadline:
                self.tainted = True
                raise AcceleratorTimeout(
                    f'{description} timed out; status=0x{status.raw:08x}, '
                    f'layer={self.mmio.read(0x20) & 0xff}. '
                    'Hardware may still have AXI transactions outstanding; '
                    'do not soft-reset or overwrite model memory. Reinitialize the board before retrying.')
            self._sleep(self.poll_interval_s)

    def smoke_test(self):
        if self.busy or self.tainted:
            raise RuntimeError('Accelerator is busy or needs board recovery')
        magic = int(self.mmio.read(self.MAGIC))
        if magic != 77:
            raise RuntimeError(f'Wrong accelerator: magic 0x{magic:08x}, expected 0x0000004d')
        old = int(self.mmio.read(self.TEST))
        try:
            for pattern in (0x13579BDF, 0xA5A55A5A):
                self.mmio.write(self.TEST, pattern)
                if int(self.mmio.read(self.TEST)) != pattern:
                    raise RuntimeError('AXI-Lite scratch register readback failed')
        finally:
            self.mmio.write(self.TEST, old)
        return {'magic': magic, 'status': self.status().raw}

    def soft_reset(self):
        if self.busy or self.tainted:
            raise RuntimeError('Soft reset is only supported when idle; recover the board after a timeout')
        try:
            self.mmio.write(self.RESET, 1)
            # RTL delays then pulses reset; allow status synchronizers to settle.
            self._sleep(0.01)
            self._wait(lambda s: s.token_count == 0 and not s.result_valid, 'idle reset')
        except BaseException:
            self.tainted = True
            raise

    @classmethod
    def _token(cls, token):
        if isinstance(token, bool) or not isinstance(token, int) or not 0 <= token < cls.VOCAB:
            raise ValueError(f'Token must be an integer in [0, {cls.VOCAB})')
        return token

    @classmethod
    def validate_generation(cls, prompt_tokens, max_new_tokens=32, on_token=None, *, context_tokens=None):
        """Validate a complete request without reading or writing registers."""
        prompt = [cls._token(token) for token in prompt_tokens]
        if (not prompt or isinstance(max_new_tokens, bool)
                or not isinstance(max_new_tokens, int) or max_new_tokens < 1):
            raise ValueError('A non-empty prompt and positive integer max_new_tokens are required')
        # The last output is returned without being submitted as another input.
        # Thus a prompt filling the context can still produce its first output.
        limit = cls.CONTEXT if context_tokens is None else context_tokens
        if len(prompt) + max_new_tokens - 1 > limit:
            raise ValueError(f'Prompt plus generation inputs exceeds the {limit}-token hardware context')
        if on_token is not None and not callable(on_token):
            raise TypeError('on_token must be callable')
        return prompt

    def _submit(self, token, command):
        # The high bit is a separate register: overwrite it even for small IDs.
        self.mmio.write(self.TOKEN_HIGH, token >> 16)
        self.mmio.write(self.TOKEN, command | (token & 0xFFFF))

    def generate_tokens(self, prompt_tokens, max_new_tokens=32, on_token=None):
        if not self.inference_enabled:
            raise RuntimeError(
                'Inference is disabled for the bare-metal overlay: its PS memory '
                'addresses conflict with Linux. Rebuild the high-address PYNQ '
                'hardware profile before submitting tokens.')
        prompt = self.validate_generation(prompt_tokens, max_new_tokens, on_token,
                                          context_tokens=self.context_tokens)
        if self.busy or self.tainted:
            raise RuntimeError('Accelerator is busy or needs board recovery')
        self.soft_reset()
        self.busy = True
        result = []
        try:
            # The input is Flow (no ready register). One completed prefill token
            # at a time avoids overrunning the original 64-entry control FIFOs.
            for index, token in enumerate(prompt[:-1]):
                self._submit(token, self.PREFILL)
                expected = index + 1
                self._wait(lambda s: s.token_count == expected, f'prefill token {expected}')
            self._submit(prompt[-1], self.PREFILL_LAST)
            for index in range(max_new_tokens):
                status = self._wait(lambda s: s.result_valid, f'output token {index + 1}')
                token = self._token(int(self.mmio.read(self.RESULT)) & 0x1FFFF)
                result.append(token)
                # Clear and observe the latch before requesting another token.
                self.mmio.write(self.ACK, 1)
                self._wait(lambda s: not s.result_valid, 'output acknowledgement')
                if on_token is not None:
                    on_token(token)
                if token in self.EOS or index + 1 == max_new_tokens:
                    break
                self._submit(token, self.DECODE)
        except BaseException:
            self.tainted = True
            raise
        else:
            self.busy = False
            return result
