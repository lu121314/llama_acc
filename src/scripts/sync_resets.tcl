# Correct the inactive constant for each auxiliary reset in an existing BD.
# proc_sys_reset defaults to active-low aux_reset_in; zero asserts that reset.
proc llama_sync_resets {} {
    foreach {name value} {zero 0 one 1} {
        set cell [get_bd_cells -quiet $name]
        if {[llength $cell] != 1 || [get_property CONFIG.CONST_VAL $cell] != $value} {
            error "Expected xlconstant $name with value $value for reset wiring"
        }
    }
    foreach name {reset_ddr reset_fabric reset_accelerator} {
        set cell [get_bd_cells -quiet $name]
        if {[llength $cell] != 1 || ![string match xilinx.com:ip:proc_sys_reset:* [get_property VLNV $cell]]} {
            error "Missing expected proc_sys_reset cell $name"
        }
        set active_high [get_property CONFIG.C_AUX_RESET_HIGH $cell]
        if {$active_high ni {0 1}} {
            error "Unsupported auxiliary reset polarity on $name: $active_high"
        }
        if {[get_property CONFIG.C_EXT_RESET_HIGH $cell] != 1} {
            error "$name/ext_reset_in must be active-high for the DDR/soft-reset source"
        }
        set inactive [expr {$active_high ? "zero" : "one"}]
        foreach {port constant} [list aux_reset_in $inactive mb_debug_sys_rst zero dcm_locked one] {
            set pin [get_bd_pins $name/$port]
            set desired [get_bd_nets -quiet -of_objects [get_bd_pins $constant/dout]]
            if {[llength $desired] != 1} {
                error "Expected a single reset constant net on $constant/dout"
            }
            set connected [get_bd_nets -quiet -of_objects $pin]
            if {$connected ne $desired} {
                foreach net $connected {disconnect_bd_net $net $pin}
                connect_bd_net [get_bd_pins $constant/dout] $pin
            }
        }
        puts "LLAMA_RESET_SYNC $name aux_active_high=$active_high aux_inactive=$inactive"
    }
}

# Build scripts load the procedure before the BD exists. In the GUI, source
# this file after opening llama_system to repair the existing design in place.
if {![info exists llama_reset_library_only] || !$llama_reset_library_only} {
    llama_sync_resets
}
