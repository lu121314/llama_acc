# ZU7CG PS + PL DDR system. All board configuration is local to FPGA_src.
source [file join $source_root config ps_preset.tcl]
source [file join $source_root config ddr4.tcl]

create_bd_design llama_system
set ps [create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.5 ps]
set_property -dict [apply_preset $ps] $ps
# Keep the user's DDR/MIO preset; enable only the accelerator's AXI/clock ports.
set_property -dict [list \
    CONFIG.PSU__USE__M_AXI_GP0 {1} \
    CONFIG.PSU__USE__M_AXI_GP1 {1} \
    CONFIG.PSU__MAXIGP0__DATA_WIDTH {128} \
    CONFIG.PSU__MAXIGP1__DATA_WIDTH {32} \
    CONFIG.PSU__USE__S_AXI_GP2 {1} \
    CONFIG.PSU__USE__S_AXI_GP3 {1} \
    CONFIG.PSU__USE__S_AXI_GP4 {1} \
    CONFIG.PSU__USE__S_AXI_GP5 {1} \
    CONFIG.PSU__SAXIGP2__DATA_WIDTH {128} \
    CONFIG.PSU__SAXIGP3__DATA_WIDTH {128} \
    CONFIG.PSU__SAXIGP4__DATA_WIDTH {128} \
    CONFIG.PSU__SAXIGP5__DATA_WIDTH {128} \
    CONFIG.PSU__FPGA_PL0_ENABLE {1} \
    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ $core_clock_mhz \
    CONFIG.PSU__PL_CLK0_BUF {TRUE}] $ps
set core_frequency_hz [get_property CONFIG.FREQ_HZ [get_bd_pins ps/pl_clk0]]
if {$core_frequency_hz != round($core_clock_mhz * 1000000)} {
    error "PS PLL cannot produce requested $core_clock_mhz MHz; actual $core_frequency_hz Hz"
}

set ddr [create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 pl_ddr4]
set_property -dict [zu7cg_ddr4_config] $ddr
if {![info exists profile]} {set profile baremetal}
set accelerator_module DataPath_xN
if {$profile eq "pynq"} {set accelerator_module DataPath_Pynq}
create_bd_cell -type module -reference $accelerator_module accelerator
set_property -dict [list \
    CONFIG.ASSOCIATED_BUSIF {S00_AXIL:M01_AXI:m_axi_hp_0_0:m_axi_hp_0_1:m_axi_hp_0_2:m_axi_hp_0_3} \
    CONFIG.FREQ_HZ $core_frequency_hz] [get_bd_pins accelerator/S00_ACLK]

set mem [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 pl_memory]
set_property -dict [list CONFIG.NUM_SI {2} CONFIG.NUM_MI {1} CONFIG.NUM_CLKS {2}] $mem
set ctrl [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 control]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {1}] $ctrl
for {set i 0} {$i < 4} {incr i} {
    set hp [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 ps_hp$i]
    set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {1}] $hp
    connect_bd_intf_net [get_bd_intf_pins accelerator/m_axi_hp_0_$i] [get_bd_intf_pins ps_hp$i/S00_AXI]
    connect_bd_intf_net [get_bd_intf_pins ps_hp$i/M00_AXI] [get_bd_intf_pins ps/S_AXI_HP${i}_FPD]
    connect_bd_net [get_bd_pins ps/pl_clk0] [get_bd_pins ps_hp$i/aclk] [get_bd_pins ps/saxihp${i}_fpd_aclk]
}

connect_bd_intf_net [get_bd_intf_pins ps/M_AXI_HPM0_FPD] [get_bd_intf_pins pl_memory/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins accelerator/M01_AXI] [get_bd_intf_pins pl_memory/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins pl_memory/M00_AXI] [get_bd_intf_pins pl_ddr4/C0_DDR4_S_AXI]
connect_bd_intf_net [get_bd_intf_pins ps/M_AXI_HPM1_FPD] [get_bd_intf_pins control/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins control/M00_AXI] [get_bd_intf_pins accelerator/S00_AXIL]

# Keep exactly the external DDR port names used by the supplied pin constraints.
make_bd_intf_pins_external [get_bd_intf_pins pl_ddr4/C0_DDR4]
set_property name C0_DDR4 [get_bd_intf_ports C0_DDR4_0]
make_bd_intf_pins_external [get_bd_intf_pins pl_ddr4/C0_SYS_CLK]
set_property name C0_SYS_CLK [get_bd_intf_ports C0_SYS_CLK_0]
set_property CONFIG.FREQ_HZ {100000000} [get_bd_intf_ports C0_SYS_CLK]

set zero [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 zero]
set_property CONFIG.CONST_VAL {0} $zero
set one [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 one]
set_property CONFIG.CONST_VAL {1} $one
foreach name {reset_ddr reset_fabric reset_accelerator} {
    set reset [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 $name]
    set_property CONFIG.C_AUX_RESET_HIGH {0} $reset
    # C_EXT_RESET_HIGH is read-only in Vivado 2025.2; sync_resets validates
    # the propagated active-high polarity after connecting ext_reset_in.
    # AUX is active-low: hold it at one, while the active-high debug reset is zero.
    connect_bd_net [get_bd_pins zero/dout] [get_bd_pins $name/mb_debug_sys_rst]
    connect_bd_net [get_bd_pins one/dout] [get_bd_pins $name/aux_reset_in] [get_bd_pins $name/dcm_locked]
}
connect_bd_net [get_bd_pins zero/dout] [get_bd_pins pl_ddr4/sys_rst]
connect_bd_net [get_bd_pins pl_ddr4/c0_ddr4_ui_clk] [get_bd_pins reset_ddr/slowest_sync_clk] [get_bd_pins pl_memory/aclk1]
connect_bd_net [get_bd_pins pl_ddr4/c0_ddr4_ui_clk_sync_rst] [get_bd_pins reset_ddr/ext_reset_in] [get_bd_pins reset_fabric/ext_reset_in]
connect_bd_net [get_bd_pins reset_ddr/peripheral_aresetn] [get_bd_pins pl_ddr4/c0_ddr4_aresetn]

create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 accelerator_reset_or
set_property -dict [list CONFIG.C_OPERATION {or} CONFIG.C_SIZE {1}] [get_bd_cells accelerator_reset_or]
connect_bd_net [get_bd_pins accelerator/softReset] [get_bd_pins accelerator_reset_or/Op1]
connect_bd_net [get_bd_pins pl_ddr4/c0_ddr4_ui_clk_sync_rst] [get_bd_pins accelerator_reset_or/Op2]
connect_bd_net [get_bd_pins accelerator_reset_or/Res] [get_bd_pins reset_accelerator/ext_reset_in]
connect_bd_net [get_bd_pins reset_accelerator/peripheral_aresetn] [get_bd_pins accelerator/S00_ARESETN]

# PS core/AXI clock bridges to the unchanged 300 MHz DDR UI.
connect_bd_net [get_bd_pins ps/pl_clk0] \
    [get_bd_pins accelerator/S00_ACLK] \
    [get_bd_pins ps/maxihpm0_fpd_aclk] [get_bd_pins ps/maxihpm1_fpd_aclk] \
    [get_bd_pins pl_memory/aclk] [get_bd_pins control/aclk] \
    [get_bd_pins reset_fabric/slowest_sync_clk] [get_bd_pins reset_accelerator/slowest_sync_clk]
connect_bd_net [get_bd_pins reset_fabric/peripheral_aresetn] \
    [get_bd_pins pl_memory/aresetn] [get_bd_pins control/aresetn]
for {set i 0} {$i < 4} {incr i} {
    connect_bd_net [get_bd_pins reset_fabric/peripheral_aresetn] [get_bd_pins ps_hp$i/aresetn]
}

# Preserve the software-visible windows and accelerator-local zero-based memory.
assign_bd_address -offset 0x0400000000 -range 4G -target_address_space [get_bd_addr_spaces ps/Data] [get_bd_addr_segs pl_ddr4/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
assign_bd_address -offset 0x0500000000 -range 4G -target_address_space [get_bd_addr_spaces ps/Data] [get_bd_addr_segs accelerator/S00_AXIL/reg0] -force
assign_bd_address -offset 0x00000000 -range 4G -target_address_space [get_bd_addr_spaces accelerator/M01_AXI] [get_bd_addr_segs pl_ddr4/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
for {set i 0} {$i < 4} {incr i} {
    set gp [expr {$i + 2}]
    if {$profile eq "pynq"} {
        # No low DDR aperture: the wrapper moves every PS-model address here.
        assign_bd_address -offset 0x0800000000 -range 2G \
            -target_address_space [get_bd_addr_spaces accelerator/m_axi_hp_0_$i] \
            [get_bd_addr_segs ps/SAXIGP$gp/HP${i}_DDR_HIGH] -force
    } else {
        assign_bd_address -offset 0x00000000 -range 2G \
            -target_address_space [get_bd_addr_spaces accelerator/m_axi_hp_0_$i] \
            [get_bd_addr_segs ps/SAXIGP$gp/HP${i}_DDR_LOW] -force
    }
}
llama_sync_core_clock
validate_bd_design
save_bd_design
