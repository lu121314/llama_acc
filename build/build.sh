#!/usr/bin/env bash
# Fresh build from the byte-preserved FPGA sources; no archived result is changed.
set -euo pipefail
project_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)
python_executable=${PYTHON:-python3}
metadata=$("$python_executable" -c 'import json,sys; d=json.load(open(sys.argv[1])); print(str(d["clock_mhz"])+"\t"+d["internal_project_name"])' "$project_root/build/variant.json")
IFS=$'\t' read -r clock_mhz internal_project_name <<< "$metadata"
exec "$python_executable" -B "$project_root/src/scripts/build.py" \
  --stage generate "$@" --profile pynq --clock-mhz "$clock_mhz" \
  --project-dir "$project_root/build/work/$internal_project_name" \
  --vivado "${VIVADO:-vivado}"
