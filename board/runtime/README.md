# llama32_3b_ctx8192_250mhz PYNQ工程（不含权重）

目标：ZU7CG、PYNQ 4.0、8192 token上下文、250 MHz。本目录可整体复制到板卡；补齐权重后运行。

1. 在压缩包项目根目录的 `权重下载地址.txt` 查看网盘地址和提取码，下载本版的 `core0.bin` 与 `core1.bin`，放入本目录 `data/`。tokenizer、模型manifest和许可已包含，已有文件无需重新导出。
2. 确认板卡PS高地址DDR `0x800000000..0x87fffffff` 已保留为独占2GiB `no-map` 区域。使用已有PYNQ 4.0环境；新环境依赖见 `requirements.txt`，DDR访问辅助模块首次运行需要系统 `cc` 或 `gcc`。
3. 进入本目录，在板卡终端运行：

```bash
bash run.sh --mode ui --host 0.0.0.0 --port 8088
# 或终端多轮聊天
bash run.sh --mode chat --max-new-tokens 128
# 或单条提示词
bash run.sh --mode prompt --prompt '用中文简要解释 FPGA。' --max-new-tokens 64
```

日常模式只上传权重并显示进度，支持多语言、Chat、最大输出设置及性能指标。脚本自动选择已激活环境或PYNQ默认venv；可显式设置 `PYNQ_PYTHON=/path/to/python3`。

Notebook位于 `notebooks/`。带日志的诊断入口保留在 `test/`，例如：

```bash
bash test/run_two_prompts.sh --prompt-1 'Explain an FPGA.' --prompt-2 '用中文解释 CPU。' --max-new-tokens 32
bash test/run_same_session_repeat.sh --prompt 'Explain what an FPGA is.' --max-new-tokens 16
```

诊断保留权重校验和DDR回读，耗时明显高于日常上传；诊断脚本使用PYNQ默认venv或显式的 `PYNQ_PYTHON`，不自动选择其他已激活venv。运行时日志由程序写入 `logs/`，包中没有历史运行输出。

`hw/` 已包含本版配套bit/HWH和硬件清单；`hw/idle/` 保留清除加速器所需的独立idle bit。配置、驱动、UI和硬件内容均沿用完整版，未修改加速器逻辑。本包未重新进行板测；已有证据归属见原完整版。
