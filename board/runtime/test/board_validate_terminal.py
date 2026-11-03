#!/usr/bin/env python3
"""Run the board-validation workflow with live terminal logs and one model load."""
import argparse
from datetime import datetime
import json
from pathlib import Path
import sys
import time

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from llama32_pynq import BoardConfig
from llama32_pynq.board import PynqSession, inspect_files
from llama32_pynq.overlay import sha256_file
from llama32_pynq.progress import log
from llama32_pynq.tokenizer import Tokenizer




def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prompt', default='Explain what an FPGA is.')
    parser.add_argument('--max-new-tokens', type=int, default=16)
    parser.add_argument('--skip-bos', action='store_true',
                        help='Go directly to text inference; BOS repeatability remains unverified')
    parser.add_argument('--output', type=Path)
    args = parser.parse_args(argv)
    output = args.output or ROOT / 'logs' / datetime.now().strftime('terminal_board_%Y%m%d_%H%M%S.json')
    started = time.monotonic()
    log(f'Python: {sys.executable}')
    report = {'project': ROOT.name, 'started_at': datetime.now().astimezone().isoformat(),
              'python': sys.executable, 'status': 'RUNNING', 'prompt': args.prompt,
              'max_new_tokens': args.max_new_tokens}
    try:
        log('1/6 Checking deployment files and tokenizer')
        config = BoardConfig.load(ROOT / 'config/pynq.json')
        files = inspect_files(config)
        report['files'] = files
        if not files['inference_assets_ready']:
            raise RuntimeError('; '.join(files['inference_blockers']))
        report['artifact_sha256'] = {path.name: sha256_file(path) for path in (
            config.bitfile, config.bitfile.with_suffix('.hwh'), config.bitfile.parent / 'manifest.json')}
        log(f'Hardware file SHA256: {report["artifact_sha256"]}')
        session = PynqSession(config)
        prompt_tokens = session.prepare_prompt(args.prompt, args.max_new_tokens)
        log('2/6 Downloading overlay and checking AXI-Lite registers')
        report['connect'] = session.connect()
        log('3/6 Checking PS/PL DDR scratch readback')
        report['ddr'] = session.ddr_smoke_test()
        log(f'DDR scratch test passed: {report["ddr"]}')
        manifest = json.loads((ROOT / 'data/model_manifest.json').read_text())
        hashes = dict(zip(('ps', 'pl'), (core['image']['sha256'] for core in manifest['cores'])))
        log('4/6 Loading both models with source SHA256 and full DDR readback')
        report['load'] = session.load_models(expected_hashes=hashes)
        log('Both model images loaded and readback-verified')
        if args.skip_bos:
            report['bos'] = {'skipped': True, 'reason': 'Direct text inference requested with --skip-bos'}
            log('5/6 BOS repeat test skipped; repeatability remains unverified')
        else:
            log('5/6 Repeating BOS decode twice')
            results = []
            for repeat in range(2):
                log(f'BOS repeat {repeat + 1}/2: waiting for first token')
                def bos_token(token, repeat=repeat):
                    log(f'BOS repeat {repeat + 1}/2: token_id={token}')
                results.append(session.accelerator.generate_tokens([128000], 2, bos_token))
            report['bos'] = {'input_tokens': [128000], 'first': results[0], 'second': results[1],
                             'repeat_equal': results[0] == results[1]}
            if not report['bos']['repeat_equal']:
                raise RuntimeError(f'BOS repeats differ: {results}')
            log(f'BOS repeat_equal=True: {results[0]}')
        log(f'6/6 Text inference: {len(prompt_tokens)} prompt tokens, '
            f'max_new_tokens={args.max_new_tokens}; waiting for first token')
        tokenizer = Tokenizer.from_file(config.tokenizer)
        received = []
        report['received_tokens'] = received
        def on_token(token):
            received.append(token)
            log(f'TOKEN {len(received)}: token_id={token}, text={tokenizer.decode(received)!r}')
        result = session.generate(args.prompt, args.max_new_tokens, on_token=on_token)
        report['inference'] = result.to_dict()
        report['status'] = 'INFERENCE_RETURNED'
        print(json.dumps(report['inference'], ensure_ascii=False, indent=2), flush=True)
        return 0
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
