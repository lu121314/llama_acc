#!/usr/bin/env python3
"""Board-only register/DDR checks and repeatable raw-token inference capture."""
import argparse
from datetime import datetime
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from llama32_pynq import BoardConfig
from llama32_pynq.board import PynqSession



def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, default=ROOT / 'config/pynq.json')
    parser.add_argument('--tokens', default='128000', help='Comma-separated input tokens; final token requests logits')
    parser.add_argument('--max-new-tokens', type=int, default=2)
    parser.add_argument('--repeat', type=int, default=2)
    parser.add_argument('--probe-only', action='store_true')
    parser.add_argument('--output', type=Path, default=ROOT / 'logs' / datetime.now().strftime('board_%Y%m%d_%H%M%S.json'))
    args = parser.parse_args()
    prompt = [int(word) for word in args.tokens.split(',')]
    config = BoardConfig.load(args.config)
    from llama32_pynq import Accelerator
    Accelerator.validate_generation(prompt, args.max_new_tokens)
    if args.repeat < 1: parser.error('--repeat must be positive')
    session = PynqSession(config)
    report = {'project': 'llama32_3b_ctx8192_250mhz', 'cases': []}
    report['connect'] = session.connect()
    report['ddr'] = session.ddr_smoke_test()
    if not args.probe_only:
        manifest = json.loads((config.model_ps.parent / 'model_manifest.json').read_text())
        hashes = dict(zip(('ps', 'pl'), (c['image']['sha256'] for c in manifest['cores'])))
        report['load'] = session.load_models(expected_hashes=hashes)
        for repeat in range(args.repeat):
            output = session.accelerator.generate_tokens(prompt, args.max_new_tokens)
            rows = [{'position': i, 'input_token': token, 'result': None} for i, token in enumerate(prompt[:-1])]
            for i, result in enumerate(output):
                rows.append({'position': len(prompt) - 1 + i,
                             'input_token': prompt[-1] if i == 0 else output[i-1],
                             'result': result})
            report['cases'].append({'name': f'repeat_{repeat}', 'tokens': rows})
        report['repeat_equal'] = all(c['tokens'] == report['cases'][0]['tokens'] for c in report['cases'])
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps(report, ensure_ascii=False, indent=2))
    return 0


if __name__ == '__main__': raise SystemExit(main())
