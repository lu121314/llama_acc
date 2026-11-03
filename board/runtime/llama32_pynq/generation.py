"""Shared text streaming and timings for the terminal and browser runtimes."""
import time

from .control import Accelerator


class DecodedText:
    """Hold incomplete byte-token characters until a full character is available."""
    def __init__(self, tokenizer):
        self.tokenizer = tokenizer
        self.tokens = []
        self.text = ''

    def append(self, token):
        self.tokens.append(token)
        text = self.tokenizer.decode(self.tokens, clean_up_tokenization_spaces=False)
        if not text.endswith('\ufffd'):
            self.text = text
        return self.text

    def finish(self):
        # The output limit can fall between byte tokens of one Unicode character.
        self.text = self.tokenizer.decode(
            self.tokens, clean_up_tokenization_spaces=False).rstrip('\ufffd')
        return self.text


def generate(session, tokenizer, messages, max_new_tokens, on_token=None, on_start=None):
    """Run the existing protocol; callbacks receive token ID, full text and elapsed seconds.

    Timings start after tokenization and include soft reset and hardware prefill.
    Decode speed excludes the first token; output counts include an emitted EOS.
    """
    inputs = Accelerator.validate_generation(tokenizer.messages_tokens(messages), max_new_tokens)
    session._idle()
    if on_start is not None:
        on_start(len(inputs))
    output = DecodedText(tokenizer)
    arrivals = []
    started = time.monotonic()

    def received(token):
        arrived = time.monotonic()
        arrivals.append(arrived)
        text = output.append(token)
        if on_token is not None:
            on_token(token, text, arrived - started)

    tokens = session.accelerator.generate_tokens(inputs, max_new_tokens, received)
    elapsed = time.monotonic() - started
    decode_s = arrivals[-1] - arrivals[0]
    return {
        'text': output.finish(), 'tokens': tokens,
        'input_tokens': len(inputs), 'output_tokens': len(tokens),
        'elapsed_s': elapsed, 'time_to_first_token_s': arrivals[0] - started,
        'decode_tokens_per_s': ((len(tokens) - 1) / decode_s
                                 if len(tokens) > 1 and decode_s > 0 else None),
        'overall_tokens_per_s': len(tokens) / elapsed if elapsed > 0 else None,
        'stop_reason': 'eos' if tokens[-1] in Accelerator.EOS else 'max_new_tokens',
    }
