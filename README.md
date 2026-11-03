# llama32_acc 精简工程（含PYNQ，不含权重）

Llama-3.2-3B-Instruct / ZU7CG / 双核PS+PL DDR / 8192 token / 250 MHz。

```text
llama32_acc/
├── README.md
├── 权重下载地址.txt       已填写8192权重网盘地址及提取码
├── src/                   已生成RTL、IP、约束、必要配置/构建脚本
├── build/                 build.sh、variant.json
├── board/
│   └── runtime/           可整体复制到板卡的PYNQ工程
│       ├── hw/            配套bit/HWH/manifest，以及idle bit
│       ├── data/          tokenizer、manifest、许可和测试prompt；无权重
│       ├── llama32_pynq/  驱动、推理及DDR访问C辅助模块
│       ├── ui/            网页UI
│       ├── config/        本版本默认配置
│       ├── notebooks/     Jupyter入口
│       ├── test/          带日志的诊断入口
│       └── run.sh         prompt/chat/ui运行入口
└── SHA256SUMS
```

## 板卡运行

将整个 `board/runtime/` 复制到PYNQ板卡。根据项目根目录的 `权重下载地址.txt` 下载匹配上下文的 `core0.bin`、`core1.bin`，放入板卡工程的 `data/`。补齐权重后，进入该目录运行：

```bash
bash run.sh --mode ui --host 0.0.0.0 --port 8088
# 或
bash run.sh --mode chat --max-new-tokens 128
```

环境、内存预留、Notebook和诊断说明见 `board/runtime/README.md`。同上下文两时钟共用权重内容，1K和8K镜像不能混用。

## Vivado服务器构建

```bash
source /path/to/Vivado/2025.2/settings64.sh
sha256sum -c SHA256SUMS
bash build/build.sh
bash build/build.sh --stage synth --jobs 1
bash build/build.sh --stage impl --jobs 1
```

直接使用现有RTL，产物写入 `build/work/llama32_3b_ctx8192_250mhz/`。配套硬件只存放一份，准确路径见 `build/variant.json`；新基础构建需独立检查时序，不能直接继承原候选的时序验收。

不包含模型镜像/原始权重、DCP、历史报告/日志、仿真资料、硬件生成语言源码、开发测试和离线wheel大包。保留requirements供已有PYNQ环境使用。下载地址TXT允许用户编辑，不计入SHA256SUMS；其他随包文件均有校验清单。

原完整版、硬件与远端工程保持不变。此更新仅整理PYNQ运行文件，没有修改RTL/IP/约束、驱动/推理/UI逻辑，没有启动真实Vivado构建或板测。
