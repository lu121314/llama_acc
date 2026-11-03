import argparse
import faulthandler
import json
from pathlib import Path
import sys

from .board import PynqSession, inspect_files
from .config import BoardConfig


def main():
    parser = argparse.ArgumentParser(description='ZU7CG / PYNQ 4.0 Llama3.2-3B diagnostics and inference')
    parser.add_argument('--config', type=Path, default=Path(__file__).resolve().parents[1] / 'config/pynq.json')
    sub = parser.add_subparsers(dest='command', required=True)
    check = sub.add_parser('check', help='Offline file/size/profile inspection; no board access')
    check.add_argument('--probe-only', action='store_true', help='Require only the diagnostic overlay assets (not inference readiness)')
    probe = sub.add_parser('probe', help='Download overlay and test AXI-Lite registers on the board')
    probe.add_argument('--ddr-test', action='store_true', help='Read/write/restore the final page of dedicated DDR banks; baremetal permits PL only')
    probe.add_argument('--trace', action='store_true',
                       help='Dump Python stacks every 20 seconds while probing; diagnostic only, not a hardware timeout')
    run = sub.add_parser('run', help='Download, load and readback-verify both models, then infer')
    run.add_argument('--prompt', required=True)
    run.add_argument('--system-prompt')
    run.add_argument('--max-new-tokens', type=int, default=32)
    run.add_argument('--ps-sha256', help='Expected PS packed-image SHA-256, checked before either DDR bank is written')
    run.add_argument('--pl-sha256', help='Expected PL packed-image SHA-256, checked before either DDR bank is written')
    args = parser.parse_args()
    tracing = False
    try:
        config = BoardConfig.load(args.config)
        if args.command == 'check':
            report = inspect_files(config)
            print(json.dumps(report, ensure_ascii=False, indent=2))
            return 0 if report['probe_assets_ready' if args.probe_only else 'inference_assets_ready'] else 2
        if args.command == 'run':
            # Do not reconfigure the board or touch DDR for an unsupported image.
            config.require_inference()
            report = inspect_files(config)
            if not report['inference_assets_ready']:
                raise RuntimeError('; '.join(report['inference_blockers']))
        session = PynqSession(config)
        if args.command == 'run':
            # Reject malformed/oversized requests before downloading an overlay
            # or spending time loading the two multi-gigabyte model images.
            session.prepare_prompt(args.prompt, args.max_new_tokens, args.system_prompt)
            hashes = {bank: digest for bank, digest in (('ps', args.ps_sha256), ('pl', args.pl_sha256))
                      if digest is not None}
            session.preflight_models(hashes)
        if args.command == 'probe' and args.trace:
            faulthandler.dump_traceback_later(20, repeat=True)
            tracing = True
            print('[PYNQ] Trace enabled: Python stacks every 20 seconds; '
                  'this does not cancel blocked hardware accesses', file=sys.stderr, flush=True)
        print(json.dumps(session.connect(), ensure_ascii=False, indent=2))
        if args.command == 'probe':
            if args.ddr_test:
                print(json.dumps(session.ddr_smoke_test(), indent=2))
        else:
            last = {}
            def progress(bank, n, total):
                if n == total or n - last.get(bank, 0) >= 256 * 1024 * 1024:
                    print(f'{bank.upper()} DDR: {n / 2**20:.0f}/{total / 2**20:.0f} MiB', file=sys.stderr)
                    last[bank] = n
            print(json.dumps(session.load_models(progress, hashes), indent=2))
            result = session.generate(args.prompt, args.max_new_tokens, args.system_prompt)
            print(json.dumps(result.to_dict(), ensure_ascii=False, indent=2))
        return 0
    except (OSError, ValueError, TypeError, RuntimeError, ImportError) as exc:
        print(f'Validation failed: {exc}', file=sys.stderr)
        return 1
    finally:
        if tracing:
            faulthandler.cancel_dump_traceback_later()


if __name__ == '__main__':
    raise SystemExit(main())
