#!/usr/bin/env python3
"""Run two independent prompts with one overlay download and one model load."""
import argparse
from datetime import datetime
import json
from pathlib import Path
import sys
import time

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from llama32_pynq import BoardConfig, control
from llama32_pynq.board import PynqSession, inspect_files
from llama32_pynq.overlay import sha256_file
from llama32_pynq.progress import log
from llama32_pynq.tokenizer import Tokenizer



def registers(accelerator):
    return {name: int(accelerator.mmio.read(address)) for name, address in (
        ('status', 0x04), ('prefill', 0x08), ('layer', 0x20), ('result', 0x2C))}


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prompt-1', '--prompt', default='Explain what an FPGA is.')
    parser.add_argument('--prompt-2', help='Omit to repeat prompt 1')
    parser.add_argument('--max-new-tokens', type=int, default=32)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args(argv)
    prompts = [args.prompt_1, args.prompt_1 if args.prompt_2 is None else args.prompt_2]
    output = args.output or ROOT / 'logs' / datetime.now().strftime('two_prompts_%Y%m%d_%H%M%S.json')
    started = time.monotonic()
    report = {'started_at': datetime.now().astimezone().isoformat(),
              'python': sys.executable, 'status': 'RUNNING',
              'request_mode': 'two independent requests; no conversation history',
              'max_new_tokens': args.max_new_tokens, 'runs': []}
    try:
        config = BoardConfig.load(ROOT / 'config/pynq.json')
        log(f'Python: {sys.executable}; project: {ROOT}')
        report['files'] = inspect_files(config)
        if not report['files']['inference_assets_ready']:
            raise RuntimeError('; '.join(report['files']['inference_blockers']))
        tokenizer = Tokenizer.from_file(config.tokenizer)
        requests = []
        for number, prompt in enumerate(prompts, 1):
            tokens = control.Accelerator.validate_generation(
                tokenizer.chat_tokens(prompt), args.max_new_tokens)
            requests.append(tokens)
            log(f'PROMPT {number}/2: {prompt!r}; input_tokens={len(tokens)}')
        report['same_input_tokens'] = requests[0] == requests[1]
        report['runtime_sha256'] = {Path(path).name: sha256_file(Path(path))
                                    for path in (__file__, control.__file__)}
        report['artifact_sha256'] = {path.name: sha256_file(path) for path in (
            config.bitfile, config.bitfile.with_suffix('.hwh'), config.bitfile.parent / 'manifest.json')}
        session = PynqSession(config)
        log('Loading overlay once')
        report['connect'] = session.connect()
        manifest = json.loads((ROOT / 'data/model_manifest.json').read_text())
        hashes = dict(zip(('ps', 'pl'), (core['image']['sha256'] for core in manifest['cores'])))
        log('Loading and readback-verifying both models once')
        report['load'] = session.load_models(expected_hashes=hashes)
        for number, (prompt, inputs) in enumerate(zip(prompts, requests), 1):
            run = {'number': number, 'prompt': prompt, 'input_tokens': inputs,
                   'before': registers(session.accelerator), 'tokens': []}
            report['runs'].append(run)
            log(f'RUN {number}/2 before={run["before"]}; using the existing internal soft reset')
            run_started = time.monotonic()
            arrivals = []

            def received(token):
                arrivals.append(time.monotonic() - run_started)
                run['tokens'].append(token)
                log(f'RUN {number}/2 TOKEN {len(run["tokens"])}: id={token}, '
                    f'elapsed={arrivals[-1]:.3f}s, text={tokenizer.decode(run["tokens"])!r}')

            result = session.accelerator.generate_tokens(list(inputs), args.max_new_tokens, received)
            run['elapsed_s'] = time.monotonic() - run_started
            run['token_arrival_s'] = arrivals
            run['time_to_first_token_s'] = arrivals[0]
            run['decode_tokens_per_s'] = ((len(arrivals) - 1) / (arrivals[-1] - arrivals[0])
                                          if len(arrivals) > 1 and arrivals[-1] > arrivals[0] else None)
            run['after'] = registers(session.accelerator)
            run['text'] = tokenizer.decode(result)
            run['stop_reason'] = 'eos' if result[-1] in control.Accelerator.EOS else 'max_new_tokens'
            log(f'RUN {number}/2 RETURNED: {run["text"]!r}')
            log(f'RUN {number}/2 elapsed={run["elapsed_s"]:.3f}s, '
                f'TTFT={run["time_to_first_token_s"]:.3f}s, '
                f'decode_tokens_per_s={run["decode_tokens_per_s"]}, '
                f'stop={run["stop_reason"]}, after={run["after"]}')
        if report['same_input_tokens']:
            first, second = (run['tokens'] for run in report['runs'])
            equal = first == second
            difference = next((index + 1 for index in range(max(len(first), len(second)))
                               if first[index:index + 1] != second[index:index + 1]), None)
            report['comparison'] = {'repeat_equal': equal, 'first_different_output_position': difference}
            report['status'] = 'REPEAT_EQUAL' if equal else 'REPEAT_DIFFERENT'
            log(f'Comparison: {report["comparison"]}')
            return 0 if equal else 2
        report['comparison'] = {'repeatability_checked': False, 'reason': 'The two input token lists differ'}
        report['status'] = 'TWO_PROMPTS_RETURNED'
        log('Both different prompts returned; output equality is not a pass/fail criterion')
        return 0
    except BaseException as error:
        report['status'] = 'INTERRUPTED' if isinstance(error, KeyboardInterrupt) else 'FAILED'
        report['error'] = {'type': type(error).__name__, 'message': str(error)}
        raise
    finally:
        report['elapsed_s'] = time.monotonic() - started
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
        log(f'{report["status"]}, total_elapsed={report["elapsed_s"]:.1f}s; report: {output}')


if __name__ == '__main__':
    raise SystemExit(main())
