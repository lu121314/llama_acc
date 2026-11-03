#!/usr/bin/env python3
"""Read-only PYNQ runtime, boot reservation and deployment-path diagnostics."""
import argparse
import importlib.metadata
import json
import os
from pathlib import Path
import platform
import shutil
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from llama32_pynq.config import BoardConfig
from llama32_pynq.memory import assert_ps_reserved


def path_info(path):
    path = Path(path)
    return {'path': str(path), 'exists': path.exists(),
            'bytes': path.stat().st_size if path.is_file() else None}


def environment_report(config_path):
    report = {
        'python': {'executable': sys.executable, 'version': sys.version,
                   'architecture': platform.machine(), 'platform': platform.platform()},
        'uid': os.geteuid(),
        'environment': {name: os.environ.get(name)
                        for name in ('VIRTUAL_ENV', 'PYNQ_PYTHON', 'LLAMA_PYTHON')},
        'compilers': {name: shutil.which(name) for name in ('cc', 'gcc', 'clang')},
        'memory': {},
        'boot_config_paths': [path_info(path) for path in (
            '/boot/extlinux/extlinux.conf', '/boot/uEnv.txt', '/boot/boot.cmd',
            '/boot/firmware/extlinux/extlinux.conf')],
    }
    try:
        import pynq
        version = getattr(pynq, '__version__', None) or importlib.metadata.version('pynq')
        report['pynq'] = {'version': str(version), 'import_ok': True}
    except Exception as error:
        report['pynq'] = {'import_ok': False, 'error': f'{type(error).__name__}: {error}'}
    meminfo = Path('/proc/meminfo')
    if meminfo.is_file():
        relevant = {'MemTotal', 'MemAvailable', 'MemFree', 'Buffers', 'Cached',
                    'SwapTotal', 'SwapFree', 'CmaTotal', 'CmaFree'}
        for line in meminfo.read_text().splitlines():
            key, value = line.split(':', 1)
            if key in relevant:
                report['memory'][key] = value.strip()
    cmdline = Path('/proc/cmdline')
    report['cmdline'] = cmdline.read_text().strip() if cmdline.is_file() else None
    try:
        report['ps_reservation'] = {'ready': True, **assert_ps_reserved()}
    except (OSError, ValueError, RuntimeError) as error:
        report['ps_reservation'] = {'ready': False, 'error': str(error)}
    try:
        config = BoardConfig.load(config_path)
        report['config'] = {
            'path': str(Path(config_path).resolve()), 'valid': True,
            'profile': config.profile, 'context_tokens': config.context_tokens,
            'image_bytes': config.image_bytes, 'layout_id': hex(config.layout_id),
            'files': {name: path_info(path) for name, path in (
                ('bitfile', config.bitfile), ('hwh', config.bitfile.with_suffix('.hwh')),
                ('overlay_manifest', config.bitfile.parent / 'manifest.json'),
                ('model_ps', config.model_ps), ('model_pl', config.model_pl),
                ('tokenizer', config.tokenizer),
                ('model_manifest', config.model_manifest))},
        }
    except (OSError, ValueError, KeyError, TypeError) as error:
        report['config'] = {'path': str(Path(config_path).resolve()),
                            'valid': False, 'error': str(error)}
    return report


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, default=ROOT / 'config/pynq.json',
                        help='板卡运行配置，默认 config/pynq.json')
    args = parser.parse_args(argv)
    report = environment_report(args.config)
    print(json.dumps(report, ensure_ascii=False, indent=2))
    return 0 if report['config']['valid'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
