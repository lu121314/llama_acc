# Custom ZU7CG PL DDR4 settings from PCIE_test/pcie_system.tcl lines 297-306.
# Values are preserved exactly; apply to a xilinx.com:ip:ddr4:2.2 cell.
proc zu7cg_ddr4_config {} {
    return [dict create \
        CONFIG.ADDN_UI_CLKOUT1_FREQ_HZ {None} \
        CONFIG.C0.BANK_GROUP_WIDTH {1} \
        CONFIG.C0.DDR4_AxiAddressWidth {32} \
        CONFIG.C0.DDR4_AxiDataWidth {512} \
        CONFIG.C0.DDR4_CasLatency {16} \
        CONFIG.C0.DDR4_CasWriteLatency {12} \
        CONFIG.C0.DDR4_DataWidth {64} \
        CONFIG.C0.DDR4_InputClockPeriod {9996} \
        CONFIG.C0.DDR4_MemoryPart {MT40A512M16HA-083E} \
        CONFIG.C0.DDR4_TimePeriod {833} \
    ]
}
