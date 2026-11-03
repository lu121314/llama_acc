#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.."
export PYTHONUTF8=1 PYTHONIOENCODING=utf-8
if [[ -n ${PYNQ_PYTHON:-${LLAMA_PYTHON:-}} ]]; then
  pynq_python="${PYNQ_PYTHON:-$LLAMA_PYTHON}"
  if ! command -v -- "$pynq_python" >/dev/null 2>&1; then
    printf '指定的 Python 不存在或不可执行：%s\n' "$pynq_python" >&2
    exit 1
  fi
elif [[ -n ${VIRTUAL_ENV:-} && -x "$VIRTUAL_ENV/bin/python3" ]]; then
  pynq_python="$VIRTUAL_ENV/bin/python3"
elif [[ -x /usr/local/share/pynq-venv/bin/python3 ]]; then
  pynq_python=/usr/local/share/pynq-venv/bin/python3
elif command -v python3 >/dev/null 2>&1; then
  pynq_python=python3
else
  printf '未找到 Python 3，请激活 PYNQ 环境或设置 PYNQ_PYTHON。\n' >&2
  exit 1
fi
mkdir -p logs/ui
log_file="logs/ui/server_$(date +%Y%m%d_%H%M%S).log"
"$pynq_python" -u ui/server.py "$@" 2>&1 | tee "$log_file"
