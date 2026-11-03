"""Board-only PYNQ integration. Importing this module is safe on a host PC."""
from dataclasses import asdict, dataclass
import importlib.metadata
import sys
import time
import xml.etree.ElementTree as ET

from .config import (BAREMETAL_INFERENCE_ERROR, CONTROL_BASE, IMAGE_BYTES,
                     PL_BASE, PL_SIZE, PS_BASE, PS_SIZE)
from .control import Accelerator
from .memory import PhysicalMemory, assert_ps_reserved
from .overlay import sha256_file, validate_overlay
from .progress import ByteProgress, log


def inspect_files(config):
    result = {'root': str(config.root), 'profile': config.profile, 'files': {},
              'inference_supported': config.inference_supported, 'inference_blockers': []}
    for name, path, size in (('model_ps', config.model_ps, IMAGE_BYTES),
                             ('model_pl', config.model_pl, IMAGE_BYTES),
                             ('tokenizer', config.tokenizer, None),
                             ('bitfile', config.bitfile, None),
                             ('hwh', config.bitfile.with_suffix('.hwh'), None),
                             ('manifest', config.bitfile.parent / 'manifest.json', None)):
        exists = path.is_dir() if name == 'tokenizer' else path.is_file()
        actual = path.stat().st_size if exists and name != 'tokenizer' else None
        result['files'][name] = {'path': str(path), 'exists': exists, 'bytes': actual,
                                 'size_ok': exists and (size is None or actual == size)}
    for name in ('model_ps', 'model_pl', 'tokenizer'):
        if not result['files'][name]['size_ok']:
            result['inference_blockers'].append(f'{name}: missing or incorrect file size')
    try:
        manifest = validate_overlay(config.bitfile, config.profile)
        result['overlay_manifest_verified'] = True
        result['hardware'] = manifest['hardware']
    except (OSError, ValueError, KeyError, ET.ParseError) as exc:
        result['overlay_manifest_verified'] = False
        result['overlay_error'] = str(exc)
        result['inference_blockers'].append(str(exc))
    result['probe_assets_ready'] = result['overlay_manifest_verified']
    try:
        from .tokenizer import Tokenizer
        Tokenizer.from_file(config.tokenizer)
        result['tokenizer_verified'] = True
    except (OSError, ValueError, ImportError) as exc:
        result['tokenizer_verified'] = False
        result['inference_blockers'].append(f'tokenizer: {exc}')
    if not config.inference_supported:
        result['inference_blockers'].append(BAREMETAL_INFERENCE_ERROR)
    result['inference_assets_ready'] = not result['inference_blockers']
    return result


@dataclass
class GenerationResult:
    text: str
    tokens: list
    prompt_tokens: int
    elapsed_s: float
    time_to_first_token_s: float
    decode_tokens_per_s: float | None

    def to_dict(self):
        return asdict(self)


class PynqSession:
    def __init__(self, config):
        self.config = config
        self.overlay = None
        self.accelerator = None
        self.models_loaded = False
        self.load_report = None
        self._loading = False
        self._invalid_reason = None

    def _invalidate(self, reason):
        self._invalid_reason = reason
        self.models_loaded = False
        self.load_report = None
        if self.accelerator is not None:
            self.accelerator.tainted = True

    def connect(self):
        if self.overlay is not None or self._invalid_reason is not None:
            raise RuntimeError('Session is already connected; use a fresh session for a new overlay')
        def stage(message):
            print(f'[PYNQ] {message}', file=sys.stderr, flush=True)

        stage('Validating bitstream, HWH and reset network (no download yet)')
        manifest = validate_overlay(self.config.bitfile, self.config.profile)
        stage('Checking boot-time PS DDR reservation')
        reservation = assert_ps_reserved() if self.config.inference_supported else None
        stage('Importing PYNQ runtime')
        try:
            import pynq
            from pynq import MMIO, Overlay
        except ImportError as exc:
            raise RuntimeError('Board commands require the PYNQ 4.0 Python environment on the ZU7CG') from exc
        version = getattr(pynq, '__version__', None)
        if version is None:
            version = importlib.metadata.version('pynq')
        if str(version).split('.')[:2] != ['4', '0']:
            raise RuntimeError(f'Expected PYNQ 4.0.x, found {version}')
        # Do not instantiate overlay.accelerator: its legacy 4 GiB AXI-Lite
        # aperture would cause DefaultIP to create an unnecessarily huge MMIO.
        stage('Parsing overlay metadata (download=False)')
        overlay = Overlay(str(self.config.bitfile), download=False)
        self.overlay = overlay
        try:
            stage('Downloading overlay and configuring PL clocks/AXI ports')
            overlay.download()
            stage('Overlay download complete; mapping the 4 KiB control page')
            self.accelerator = Accelerator(MMIO(CONTROL_BASE, 0x1000),
                                           self.config.timeout_s, self.config.poll_interval_s,
                                           inference_enabled=self.config.inference_supported)
            stage('Reading accelerator magic and testing AXI-Lite registers')
            probe = self.accelerator.smoke_test()
            stage('AXI-Lite register probe passed')
        except BaseException:
            self._invalidate('Overlay download or register probe failed; reconnect using a fresh session')
            raise
        return {'pynq_version': str(version), 'profile': self.config.profile,
                'inference_supported': self.config.inference_supported,
                'hardware': manifest['hardware'], 'reservation': reservation, 'registers': probe}

    def _idle(self):
        if self._invalid_reason is not None:
            raise RuntimeError(self._invalid_reason)
        if self.accelerator is None:
            raise RuntimeError('Call connect() first')
        if self.overlay is not None and not self.overlay.is_loaded():
            self._invalidate('The overlay was replaced; create a fresh session and reload both models')
            raise RuntimeError(self._invalid_reason)
        if self._loading:
            raise RuntimeError('Model loading is in progress; wait before accessing accelerator memory')
        if self.accelerator.busy or self.accelerator.tainted:
            raise RuntimeError('Accelerator is busy or needs board recovery; memory access refused')
        if self.config.inference_supported:
            assert_ps_reserved()

    def ddr_smoke_test(self):
        self._idle()
        result = {'pl': PhysicalMemory(PL_BASE, PL_SIZE).smoke_test()}
        if self.config.inference_supported:
            result['ps'] = PhysicalMemory(PS_BASE, PS_SIZE).smoke_test()
        else:
            result['ps'] = {'tested': False, 'reason': 'DataPath_xN uses Linux-owned low DDR; PS access is disabled'}
        return result

    def preflight_models(self, expected_hashes=None, progress=None, *, verbose=True):
        """Check both source images and optional hashes before board access."""
        self.config.require_inference()
        if progress is not None and not callable(progress):
            raise TypeError('progress must be callable')
        # Fail before physical writes if the Python/tokenizer assets are incomplete.
        if verbose:
            log('Model preflight: checking local tokenizer and packed-image sizes')
        from .tokenizer import Tokenizer
        Tokenizer.from_file(self.config.tokenizer)
        # Validate both images before writing either bank.
        for path in (self.config.model_ps, self.config.model_pl):
            if not path.is_file() or path.stat().st_size != IMAGE_BYTES:
                raise ValueError(f'{path}: need the {IMAGE_BYTES}-byte PS/PL two-core packed image')
        expected_hashes = {} if expected_hashes is None else expected_hashes
        if not isinstance(expected_hashes, dict) or set(expected_hashes) - {'ps', 'pl'}:
            raise ValueError('expected_hashes must map ps/pl bank names to SHA-256 digests')
        # A wrong PL hash must fail before PS has already been overwritten.
        for bank, path in (('ps', self.config.model_ps), ('pl', self.config.model_pl)):
            digest = expected_hashes.get(bank)
            if digest is not None:
                if (not isinstance(digest, str) or len(digest) != 64
                        or any(c not in '0123456789abcdefABCDEF' for c in digest)):
                    raise ValueError(f'{bank}: expected a 64-character SHA-256 digest')
                hash_progress = ByteProgress(f'{bank.upper()} preflight SHA256') if verbose else None
                if sha256_file(path, hash_progress).lower() != digest.lower():
                    raise ValueError(f'{bank}: model SHA-256 does not match the expected digest')
                if verbose:
                    log(f'{bank.upper()} preflight SHA256 passed')
        return expected_hashes

    def load_models(self, progress=None, expected_hashes=None, *, verify=True, verbose=True):
        """Load both banks, optionally omitting all weight hash/readback work."""
        self.config.require_inference()
        self._idle()
        self.models_loaded = False
        self.load_report = None
        expected_hashes = self.preflight_models(expected_hashes if verify else None,
                                               progress, verbose=verbose)
        self._idle()
        report = {}
        self._loading = True
        try:
            for bank, path, base, size in (
                ('ps', self.config.model_ps, PS_BASE, PS_SIZE),
                ('pl', self.config.model_pl, PL_BASE, PL_SIZE),
            ):
                if verbose:
                    log(f'{bank.upper()} model load: {path.name}, physical base={base:#x}')
                callback = None if progress is None else lambda n, total, bank=bank: progress(bank, n, total)
                report[bank] = PhysicalMemory(base, size, chunk_bytes=self.config.chunk_bytes).load_file(
                    path, IMAGE_BYTES, expected_hashes.get(bank), callback,
                    verify=verify, verbose=verbose)
        finally:
            self._loading = False
        self._idle()
        self.load_report = report
        self.models_loaded = True
        return report

    def prepare_prompt(self, prompt, max_new_tokens=32, system_prompt=None, on_token=None):
        """Tokenize and check the context budget without requiring a board."""
        self.config.require_inference()
        from .tokenizer import Tokenizer
        tokenizer = Tokenizer.from_file(self.config.tokenizer)
        tokens = tokenizer.chat_tokens(prompt, system_prompt)
        return Accelerator.validate_generation(tokens, max_new_tokens, on_token)

    def generate(self, prompt, max_new_tokens=32, system_prompt=None, on_token=None):
        self.config.require_inference()
        self._idle()
        if not self.models_loaded:
            raise RuntimeError('Call load_models() successfully before inference')
        from .tokenizer import Tokenizer
        tokenizer = Tokenizer.from_file(self.config.tokenizer)
        prompt_tokens = tokenizer.chat_tokens(prompt, system_prompt)
        Accelerator.validate_generation(prompt_tokens, max_new_tokens, on_token)
        self._idle()
        started = time.monotonic()
        arrivals = []
        def received(token):
            arrivals.append(time.monotonic())
            if on_token is not None:
                on_token(token)
        tokens = self.accelerator.generate_tokens(prompt_tokens, max_new_tokens, received)
        ended = time.monotonic()
        rate = None
        if len(arrivals) > 1 and arrivals[-1] > arrivals[0]:
            rate = (len(arrivals) - 1) / (arrivals[-1] - arrivals[0])
        return GenerationResult(tokenizer.decode(tokens), tokens, len(prompt_tokens),
                                ended - started, arrivals[0] - started, rate)
