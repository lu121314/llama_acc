"""Use the exported local Hugging Face Llama3.2 tokenizer and chat template."""
from pathlib import Path


class Tokenizer:
    BOS = 128000
    EOS = (128001, 128008, 128009)
    VOCAB_SIZE = 128256

    def __init__(self, backend):
        self.backend = backend
        if len(backend) != self.VOCAB_SIZE or backend.bos_token_id != self.BOS:
            raise ValueError('Tokenizer is not the Llama3.2 128256-token vocabulary')

    @classmethod
    def from_file(cls, path):
        folder = Path(path)
        if not folder.is_dir() or not (folder / 'tokenizer.json').is_file():
            raise ValueError('Need an exported HF tokenizer directory containing tokenizer.json')
        from transformers import AutoTokenizer
        return cls(AutoTokenizer.from_pretrained(str(folder), local_files_only=True))

    def encode(self, text, bos=True, eos=False):
        tokens = self.backend.encode(text, add_special_tokens=False)
        return ([self.BOS] if bos else []) + tokens + ([self.EOS[0]] if eos else [])

    def chat_tokens(self, prompt, system_prompt=None):
        if not isinstance(prompt, str):
            raise TypeError('prompt must be a string')
        messages = []
        if system_prompt:
            messages.append({'role': 'system', 'content': system_prompt})
        messages.append({'role': 'user', 'content': prompt})
        return self.messages_tokens(messages)

    def messages_tokens(self, messages):
        """Format the complete conversation with the exported chat template."""
        return list(self.backend.apply_chat_template(messages, tokenize=True, add_generation_prompt=True))

    def decode(self, tokens, *, skip_special_tokens=True, clean_up_tokenization_spaces=None):
        options = {'skip_special_tokens': skip_special_tokens}
        if clean_up_tokenization_spaces is not None:
            options['clean_up_tokenization_spaces'] = clean_up_tokenization_spaces
        return self.backend.decode(tokens, **options)
