本目录用于 `llama32_3b_ctx8192_250mhz`；须先取得本版本的 8K bit/HWH/manifest，当前未完成上板验收。

# 上板诊断与详细日志

本目录保存用于排查、对照和验收的上板测试。测试继续保留原有的权重 SHA256、DDR 回读及寄存器记录；日常交互运行使用项目新增的运行入口。

从项目目录执行：

```bash
# 完整诊断；BOS-only 用例仍有已知问题，普通文本测试可跳过该项。
bash test/run_terminal_validation.sh --skip-bos --prompt 'Explain what an FPGA is.' --max-new-tokens 16

# 同一进程中，两次相同输入；只加载一次 Overlay 和权重。
bash test/run_same_session_repeat.sh --prompt 'Explain what an FPGA is.' --max-new-tokens 16

# 同一进程中，两个独立请求；不继承对话历史。
bash test/run_two_prompts.sh --prompt-1 '解释一下 FPGA。' --prompt-2 'What is a CPU?' --max-new-tokens 64

# 原始 token / 寄存器 / DDR 测试；默认 BOS-only 属于已知问题诊断。
/usr/local/share/pynq-venv/bin/python3 test/board_smoke.py --tokens 128000 --max-new-tokens 2 --repeat 2
```

`run_*.sh` 将逐 token 详细日志同时打印到终端和项目根目录 `logs/`，对应 Python 脚本也把结果写入同一目录的 JSON。`board_smoke.py` 保持原有最终 JSON 输出方式。诊断文件不会写入 `test/logs/`。

项目根目录的旧命令继续可用，例如 `bash run_two_prompts.sh ...` 和 `python3 board_smoke.py ...`；它们只转发到本目录中的实现。原有参数、软复位、命令顺序、权重校验与测试判定均保留。`notebooks/` 不作搬移。

启动脚本默认使用 `/usr/local/share/pynq-venv/bin/python3`。如果板卡使用另一个已有虚拟环境，可通过 `PYNQ_PYTHON=/path/to/venv/bin/python3 bash test/run_two_prompts.sh ...` 指定解释器。

历史补丁附带的 SHA256 清单只适用于当时补丁原包中的文件；本次搬移后的文件使用新补丁的校验清单。
