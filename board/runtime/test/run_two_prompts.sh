#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.."
mkdir -p logs
log_file="logs/two_prompts_$(date +%Y%m%d_%H%M%S).log"
printf 'Live log: %s/%s\n' "$PWD" "$log_file"
"${PYNQ_PYTHON:-/usr/local/share/pynq-venv/bin/python3}" -u test/board_two_prompts.py "$@" 2>&1 | tee "$log_file"
