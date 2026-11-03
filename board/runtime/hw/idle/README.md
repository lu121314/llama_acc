# 演示用 PL 空闲配置

点击 UI“清除 bit”会在加速器空闲时，用此完整配置替换正在运行的加速器。配置不包含加速器、DDR 控制器、AXI 主机或外部端口；不是删除 bit 文件，也不是把 FPGA 变成完全未配置状态。PS Linux 和原生 PS DisplayPort 继续运行，清除后必须重新初始化并上传双 DDR 权重。

使用 PYNQ `Bitstream(...).download()` 进行实际完整重配置；`PL.reset()` 只处理软件状态，不能代替这个动作。空闲配置无需伪造加速器 HWH。原 187.5/250 MHz 及 8K 三件套保持原样。来源与 SHA 见 manifest.json，可用 Version1/tools/pl_idle/build.tcl 重新构建。

该配置已在 Vivado 2025.2 为 xczu7cg-ffvc1156-1-e 生成，DRC 无错误。没有外部负载产生的 RTSTAT-10 告警有意保留。实际“清除→重新初始化”流程仍须在板卡验证，清除不是已知硬件超时的恢复手段。
