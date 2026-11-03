#!/usr/bin/env python3
"""Compare two identical requests in one session, with one overlay/model load."""
import argparse
from datetime import datetime
import json
from pathlib import Path
import sys
import time

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from llama32_pynq import BoardConfig
from llama32_pynq import control
from llama32_pynq.board import PynqSession, inspect_files
from llama32_pynq.overlay import sha256_file
from llama32_pynq.progress import log
from llama32_pynq.tokenizer import Tokenizer



def registers(accelerator):
    return {name: int(accelerator.mmio.read(address)) for name, address in (
        ('status', 0x04), ('prefill', 0x08), ('layer', 0x20), ('result', 0x2C))}


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prompt', default='Explain what an FPGA is.')
    parser.add_argument('--max-new-tokens', type=int, default=16)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args(argv)
    output = args.output or ROOT / 'logs' / datetime.now().strftime('same_session_%Y%m%d_%H%M%S.json')
    started = time.monotonic()
    report = {'started_at': datetime.now().astimezone().isoformat(), 'python': sys.executable,
              'status': 'RUNNING', 'prompt': args.prompt, 'max_new_tokens': args.max_new_tokens,
              'runs': []}
    try:
        config = BoardConfig.load(ROOT / 'config/pynq.json')
        report['files'] = inspect_files(config)
        if not report['files']['inference_assets_ready']:
            raise RuntimeError('; '.join(report['files']['inference_blockers']))
        report['runtime_sha256'] = {Path(path).name: sha256_file(Path(path))
                                    for path in (__file__, control.__file__)}
        report['artifact_sha256'] = {path.name: sha256_file(path) for path in (
            config.bitfile, config.bitfile.with_suffix('.hwh'), config.bitfile.parent / 'manifest.json')}
        tokenizer = Tokenizer.from_file(config.tokenizer)
        prompt_tokens = control.Accelerator.validate_generation(
            tokenizer.chat_tokens(args.prompt), args.max_new_tokens)
        report['input_tokens'] = prompt_tokens
        log(f'Exact input: {len(prompt_tokens)} tokens, {prompt_tokens}')
        session = PynqSession(config)
        log('Loading overlay once')
        report['connect'] = session.connect()
        manifest = json.loads((ROOT / 'data/model_manifest.json').read_text())
        hashes = dict(zip(('ps', 'pl'), (core['image']['sha256'] for core in manifest['cores'])))
        log('Loading and readback-verifying both models once')
        report['load'] = session.load_models(expected_hashes=hashes)
        for number in (1, 2):
            run = {'number': number, 'before': registers(session.accelerator), 'tokens': []}
            report['runs'].append(run)
            log(f'RUN {number}/2 before={run["before"]}; generate_tokens will soft-reset internally')
            run_started = time.monotonic()

            def received(token):
                run['tokens'].append(token)
                if len(run['tokens']) == 1:
                    run['time_to_first_token_s'] = time.monotonic() - run_started
                log(f'RUN {number}/2 TOKEN {len(run["tokens"])}: id={token}, '
                    f'text={tokenizer.decode(run["tokens"])!r}')

            result = session.accelerator.generate_tokens(list(prompt_tokens), args.max_new_tokens, received)
            run['elapsed_s'] = time.monotonic() - run_started
            run['after'] = registers(session.accelerator)
            run['text'] = tokenizer.decode(result)
            log(f'RUN {number}/2 returned: {run["text"]!r}; after={run["after"]}')
        first, second = (run['tokens'] for run in report['runs'])
        equal = first == second
        first_difference = next((index + 1 for index in range(max(len(first), len(second)))
                                 if first[index:index + 1] != second[index:index + 1]), None)
        report['comparison'] = {'repeat_equal': equal, 'first_different_output_position': first_difference}
        report['status'] = 'REPEAT_EQUAL' if equal else 'REPEAT_DIFFERENT'
        log(f'Comparison: {report["comparison"]}')
        return 0 if equal else 2
    except BaseException as error:
        report['status'] = 'INTERRUPTED' if isinstance(error, KeyboardInterrupt) else 'FAILED'
        report['error'] = {'type': type(error).__name__, 'message': str(error)}
        raise
    finally:
        report['elapsed_s'] = time.monotonic() - started
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
        log(f'{report["status"]}, elapsed={report["elapsed_s"]:.1f}s; report: {output}')


if __name__ == '__main__':
    raise SystemExit(main())
