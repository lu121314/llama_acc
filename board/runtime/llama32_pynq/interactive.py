"""Everyday terminal prompt/chat mode, using the existing accelerator protocol."""
import argparse
from pathlib import Path
import sys
import time

from .board import PynqSession
from .config import BoardConfig, IMAGE_BYTES
from .control import Accelerator
from .generation import DecodedText, generate
from .tokenizer import Tokenizer


class UploadProgress:
    """One progress bar for the two sequential DDR uploads; no dependencies."""
    def __init__(self, stream=None, clock=time.monotonic):
        self.stream = sys.stdout if stream is None else stream
        self.clock = clock
        self.started = clock()
        self.last_print = self.started
        self.done = {'ps': 0, 'pl': 0}
        self.total = 2 * IMAGE_BYTES
        self.render('ps')

    def render(self, bank):
        uploaded = sum(self.done.values())
        fraction = uploaded / self.total
        filled = int(20 * fraction)
        elapsed = self.clock() - self.started
        speed = uploaded / 2**20 / elapsed if elapsed else 0
        line = (f'上传 [{"#" * filled}{"-" * (20 - filled)}] {fraction * 100:6.2f}% '
                f'{uploaded / 2**20:.0f}/{self.total / 2**20:.0f} MiB '
                f'{speed:.2f} MiB/s {bank.upper()}')
        terminal = self.stream.isatty()
        print(('\r' if terminal else '') + line, end='\n' if not terminal or uploaded == self.total else '',
              file=self.stream, flush=True)
        self.last_print = self.clock()

    def __call__(self, bank, done, total):
        self.done[bank] = done
        if done == total or self.clock() - self.last_print >= 0.25:
            self.render(bank)


class TextOutput:
    """Delay incomplete UTF-8 token fragments until decoding yields a full character."""
    def __init__(self, tokenizer, stream=None):
        self.stream = sys.stdout if stream is None else stream
        self.decoder = DecodedText(tokenizer)
        self.printed = ''

    def __call__(self, token):
        text = self.decoder.append(token)
        print(text[len(self.printed):], end='', file=self.stream, flush=True)
        self.printed = text

    def finish(self):
        text = self.decoder.finish()
        print(text[len(self.printed):], file=self.stream, flush=True)
        return text


def generate_reply(session, tokenizer, messages, max_new_tokens, stream=None):
    """Validate all history before hardware access, stream the answer, return timing."""
    stream = sys.stdout if stream is None else stream
    printed = ''

    def beginning(input_tokens):
        print(f'输入 {input_tokens} token，最大输出 {max_new_tokens} token。', file=stream, flush=True)
        print('助手：', end='', file=stream, flush=True)

    def received(token, text, elapsed_s):
        nonlocal printed
        print(text[len(printed):], end='', file=stream, flush=True)
        printed = text

    result = generate(session, tokenizer, messages, max_new_tokens, received, beginning)
    text = result['text']
    print(text[len(printed):], file=stream, flush=True)
    metrics = {key: value for key, value in result.items() if key not in ('text', 'tokens')}
    metrics['stop_reason'] = 'EOS' if result['stop_reason'] == 'eos' else '最大输出限制'
    speed = f'{metrics["decode_tokens_per_s"]:.2f}' if metrics['decode_tokens_per_s'] is not None else '—'
    print(f'[性能] 输出 {metrics["output_tokens"]} token | 总耗时 {metrics["elapsed_s"]:.3f}s | '
          f'首 token {metrics["time_to_first_token_s"]:.3f}s | 解码 {speed} token/s | '
          f'含输入处理 {metrics["overall_tokens_per_s"]:.2f} token/s | 停止：{metrics["stop_reason"]}',
          file=stream, flush=True)
    return text, metrics


HELP = '命令：/max 数字 设置最大输出；/new 清空对话；/exit 退出；/help 帮助。'


def conversation(session, tokenizer, mode, max_new_tokens, system_prompt=None):
    initial = [{'role': 'system', 'content': system_prompt}] if system_prompt else []
    history = list(initial)
    print(f'已就绪。模式：{mode}；最大输出：{max_new_tokens} token；支持中文、英文及其他模型支持的语言。')
    print(HELP)
    while True:
        try:
            prompt = input('\n你：')
        except (EOFError, KeyboardInterrupt):
            print('\n已退出。')
            return
        if not prompt.strip():
            continue
        if prompt.strip() == '/exit':
            print('已退出。')
            return
        if prompt.strip() == '/help':
            print(HELP)
            continue
        if prompt.strip() == '/new':
            history = list(initial)
            print('已开始新对话。')
            continue
        if prompt.startswith('/max '):
            try:
                value = int(prompt.split(maxsplit=1)[1])
                if not 1 <= value <= Accelerator.CONTEXT:
                    raise ValueError
            except ValueError:
                print('请输入 /max 1 到 /max 8192。实际可用输出还取决于输入和历史长度。')
                continue
            max_new_tokens = value
            print(f'最大输出已设置为 {value} token。')
            continue
        messages = (history if mode == 'chat' else initial) + [{'role': 'user', 'content': prompt}]
        try:
            text, _ = generate_reply(session, tokenizer, messages, max_new_tokens)
        except ValueError as error:
            if session.accelerator.tainted:
                raise
            print(f'输入未提交：{error}。可用 /new 清空历史，或 /max 调小最大输出。')
            continue
        if mode == 'chat':
            history = messages + [{'role': 'assistant', 'content': text}]


def main(argv=None):
    parser = argparse.ArgumentParser(description='Llama3.2 PYNQ 日常推理：prompt / chat')
    parser.add_argument('--config', type=Path, default=Path(__file__).resolve().parents[1] / 'config/pynq.json')
    parser.add_argument('--mode', choices=('prompt', 'chat'), default='chat')
    parser.add_argument('--max-new-tokens', type=int, default=64)
    parser.add_argument('--system-prompt', help='可选，例如：请使用中文回答。')
    parser.add_argument('--prompt', help='执行这一条输入后退出；不指定则进入交互终端')
    args = parser.parse_args(argv)
    if not 1 <= args.max_new_tokens <= Accelerator.CONTEXT:
        parser.error('--max-new-tokens 必须在 1 到 8192 之间')
    try:
        print('[1/3] 检查工程配置并加载分词器。', flush=True)
        config = BoardConfig.load(args.config)
        config.require_inference()
        tokenizer = Tokenizer.from_file(config.tokenizer)
        session = PynqSession(config)
        print('[2/3] 下载硬件并连接加速器。', flush=True)
        session.connect()
        print('[3/3] 上传 PS / PL 权重（仅上传，不做权重哈希或 DDR 回读）。', flush=True)
        started = time.monotonic()
        session.load_models(progress=UploadProgress(), verify=False, verbose=False)
        print(f'权重上传完成，用时 {time.monotonic() - started:.2f}s。', flush=True)
        if args.prompt is None:
            conversation(session, tokenizer, args.mode, args.max_new_tokens, args.system_prompt)
        else:
            messages = ([{'role': 'system', 'content': args.system_prompt}] if args.system_prompt else [])
            messages.append({'role': 'user', 'content': args.prompt})
            generate_reply(session, tokenizer, messages, args.max_new_tokens)
        return 0
    except KeyboardInterrupt:
        print('\n运行已中断。', file=sys.stderr)
        return 130
    except (OSError, ValueError, RuntimeError, ImportError) as error:
        print(f'运行失败：{error}', file=sys.stderr, flush=True)
        return 1


if __name__ == '__main__':
    raise SystemExit(main())
