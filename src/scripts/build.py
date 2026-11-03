#!/usr/bin/env python3
"""Create/resume the model-specific Version1 ZU7CG Vivado project."""
import argparse
import hashlib
import json
import re
import shutil
import subprocess
from pathlib import Path


def main():
    source = Path(__file__).resolve().parents[1]
    workspace = source.parents[1]
    project_info = json.loads((source / 'config' / 'project.json').read_text())
    project_name = project_info['project_name']
    generation_path = source / 'config/generation.json'
    if project_info.get('rtl_status') != 'generated_from_scala' or not generation_path.is_file():
        raise SystemExit('Generate 3B RTL from Scala before building; copied 7B RTL is not a 3B accelerator')
    generation = json.loads(generation_path.read_text())
    for relative, digest in generation['rtl_sha256'].items():
        if hashlib.sha256((source / relative).read_bytes()).hexdigest() != digest:
            raise SystemExit('Generated RTL changed after elaboration: ' + relative)
    if not re.fullmatch(r'[a-z][a-z0-9_]*', project_name):
        raise SystemExit('Invalid project_name in config/project.json')
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--profile', choices=['baremetal', 'pynq'], default='pynq',
                        help='pynq relocates the PS model window to reserved high DDR')
    parser.add_argument('--stage', choices=['project', 'generate', 'synth', 'impl', 'bitstream'], default='project')
    parser.add_argument('--clock-mhz', type=float, choices=[250.0], default=250.0,
                        help='PS PL0/core clock; this ctx8192_250mhz project is fixed at 250 MHz')
    parser.add_argument('--refresh', action='store_true',
                        help='Update owned project inputs in place and invalidate stale synthesis/implementation')
    parser.add_argument('--project-dir', type=Path,
                        help='default: Version1/vivado_prj/local_rebuild_20261031/<project_name>')
    parser.add_argument('--vivado', default='vivado')
    parser.add_argument('--jobs', type=int, default=1)
    parser.add_argument('--impl-run', default='impl_2',
                        help='Implementation run to build; its parent synthesis run is used (default: impl_2)')
    args = parser.parse_args()
    if args.jobs < 1:
        parser.error('--jobs must be positive')
    if not re.fullmatch(r'impl_[1-9][0-9]*', args.impl_run):
        parser.error('--impl-run must be impl_<positive integer>')
    executable = shutil.which(args.vivado)
    if executable is None:
        parser.error('Vivado not found; source the Vivado 2025.2 settings64.sh or pass --vivado')
    output = (args.project_dir or workspace / 'vivado_prj' / 'local_rebuild_20261031' / project_name).resolve()
    if output == source or source in output.parents:
        parser.error('project-dir must be separate from FPGA_src')
    output.mkdir(parents=True, exist_ok=True)
    marker = output / 'source_location.json'
    inputs = {}
    for subdir in ['rtl', 'ip', 'config', 'constraints', 'scripts']:
        for path in sorted((source / subdir).rglob('*')):
            active = subdir in {'rtl', 'ip', 'constraints'} or path.suffix in {'.tcl', '.json', '.py'}
            if args.profile == 'baremetal' and path.is_relative_to(source / 'rtl' / 'pynq'):
                active = False
            if path.is_file() and active and '__pycache__' not in path.parts:
                inputs[path.relative_to(source).as_posix()] = hashlib.sha256(path.read_bytes()).hexdigest()
    expected = {'format_version': 4, 'source_root': str(source), 'project_name': project_name,
                'profile': args.profile, 'input_sha256': inputs,
                'model': project_info['model'], 'hardware_revision': project_info['hardware_revision']}
    refresh_project = args.refresh
    if marker.exists():
        previous = json.loads(marker.read_text())
        owned = all(previous.get(key) == expected[key] for key in ['source_root', 'project_name', 'profile'])
        if not owned:
            parser.error('output belongs to another source tree/profile; refusing to modify it')
        matches = previous.get('format_version') == expected['format_version']
        matches = matches and all(previous.get('input_sha256', {}).get(key) == value for key, value in inputs.items())
        previous_active = {key for key in previous.get('input_sha256', {})
                           if key.split('/')[0] in {'rtl', 'ip', 'constraints'} or key.endswith(('.tcl', '.json', '.py'))}
        matches = matches and previous_active == set(inputs)
        if not matches and not args.refresh:
            parser.error('source/configuration changed; use --refresh to update this owned project in place')
        refresh_project = refresh_project or not matches
    elif any(output.iterdir()):
        parser.error('output is not empty and has no project marker; choose another --project-dir')
    # The marker is published only after Vivado validates the actual project.
    command = [executable, '-mode', 'batch', '-notrace', '-source', str(source / 'scripts' / 'create_project.tcl'),
               '-log', str(output / 'vivado.log'), '-journal', str(output / 'vivado.jou'),
               '-tclargs', str(output), args.stage, str(args.jobs), args.profile,
               '' if args.clock_mhz is None else str(args.clock_mhz), '1' if refresh_project else '0',
               args.impl_run, project_name]
    print('Vivado project:', output, flush=True)
    result = subprocess.run(command, cwd=output, check=False)
    if result.returncode == 0:
        bd = output / f'{project_name}.srcs/sources_1/bd/llama_system/llama_system.bd'
        if bd.is_file():
            design = json.loads(bd.read_text())['design']
            expected['clock_hz'] = int(design['components']['accelerator']['ports']['S00_ACLK']['parameters']['FREQ_HZ']['value'])
        else:
            expected['clock_hz'] = int((args.clock_mhz or 250.0) * 1000000)
        marker.write_text(json.dumps(expected, indent=2) + '\n')
    raise SystemExit(result.returncode)


if __name__ == '__main__':
    main()
