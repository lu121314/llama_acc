# Invoked by build.py with PROJECT_DIR STAGE JOBS PROFILE CLOCK_MHZ REFRESH IMPL_RUN PROJECT_NAME.
set source_root [file normalize [file join [file dirname [info script]] ..]]
set project_dir [file normalize [lindex $argv 0]]
set stage [lindex $argv 1]
set jobs [lindex $argv 2]
set profile [lindex $argv 3]
set requested_clock_mhz [lindex $argv 4]
set refresh_project [lindex $argv 5]
set implementation_run [lindex $argv 6]
if {$implementation_run eq ""} {set implementation_run impl_2}
if {![regexp {^impl_[1-9][0-9]*$} $implementation_run]} {error "Invalid implementation run: $implementation_run"}
if {$refresh_project eq ""} {set refresh_project 0}
if {$profile eq ""} {set profile baremetal}
if {$profile ni {baremetal pynq}} {error "Unknown profile: $profile"}
set project_name [lindex $argv 7]
if {![regexp {^[a-z][a-z0-9_]*$} $project_name]} {error "Missing/invalid model-specific PROJECT_NAME"}
set reports [file join $project_dir reports]
file mkdir $reports

proc llama_report_completed_implementation {run stage reports project_dir project_name} {
    set managed_project [current_project]
    if {[get_property NEEDS_REFRESH $run]} {error "Implementation is out of date: $run"}
    set status [get_property STATUS $run]
    if {$stage eq "impl"} {
        # Vivado 2025.2 may expose the next step after a successful -to_step
        # run as "Not started write_bitstream", with progress below 100%.
        set directory [get_property DIRECTORY $run]
        set checkpoint [file join $directory llama_system_wrapper_postroute_physopt.dcp]
        if {![string match {phys_opt_design (Post-Route) Complete*} $status] &&
            ![string match {write_bitstream Complete*} $status] && $status ne {Not started write_bitstream}} {
            error "Implementation failed: $status"
        }
        if {![file isfile [file join $directory .post_route_phys_opt_design.end.rst]] ||
            [file exists [file join $directory .post_route_phys_opt_design.error.rst]] ||
            ![file isfile $checkpoint]} {error "Missing successful post-route marker/checkpoint: $status"}
        open_checkpoint $checkpoint
    } else {
        if {[get_property PROGRESS $run] ne "100%" || ![string match {write_bitstream Complete*} $status]} {
            error "Bitstream generation failed: $status"
        }
        open_run $run
    }
    report_timing_summary -check_timing_verbose -max_paths 20 -file [file join $reports timing_impl.rpt]
    check_timing -verbose -file [file join $reports check_timing_impl.rpt]
    report_clock_interaction -file [file join $reports clocks_impl.rpt]
    report_utilization -file [file join $reports utilization_impl.rpt]
    report_cdc -file [file join $reports cdc_impl.rpt]
    report_drc -file [file join $reports drc_impl.rpt]
    if {$stage eq "bitstream"} {
        write_hw_platform -fixed -include_bit -force -file [file join $project_dir $project_name.xsa]
    }
    if {[current_project] ne $managed_project} {close_project; current_project $managed_project}
}

proc critical_config {ip} {
    set values [dict create]
    foreach p [lsort [list_property $ip]] {
        if {[string match CONFIG.* $p] && [regexp -nocase {latency|flow_control|tready|precision|exponent|fraction|operation_type|_rate$|addr_width|data_width|id_width|c_include_mm2s|c_include_s2mm|c_m_axi_|c_m_axis_|c_s_axis_} $p]} {
            dict set values $p [get_property $p $ip]
        }
    }
    return $values
}

proc main {} {
    global source_root project_dir project_name profile stage jobs reports requested_clock_mhz refresh_project implementation_run
    set llama_clock_library_only 1
    source [file join $source_root scripts sync_clock.tcl]
    set llama_reset_library_only 1
    source [file join $source_root scripts sync_resets.tcl]
    if {[version -short] ne "2025.2"} { error "Use Vivado 2025.2; found [version -short]" }
    if {$stage ni {project generate synth impl bitstream}} { error "Unknown stage: $stage" }
    set xpr [file join $project_dir $project_name.xpr]
    source [file join $source_root config sources.tcl]
    if {$profile eq "pynq"} {
        lappend rtl_files [file join $source_root rtl pynq DataPath_Pynq.v]
    }
    if {[file exists $xpr]} {
        if {![file exists [file join $reports project_ready.txt]]} {
            error "Previous project creation did not complete; choose a new --project-dir"
        }
        open_project $xpr
        open_bd_design [get_files */llama_system.bd]
        if {$requested_clock_mhz ne ""} {
            set_property CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ $requested_clock_mhz [get_bd_cells ps]
        }
        # Module-reference clocks do not automatically follow a manual PS edit.
        llama_sync_core_clock
        if {$refresh_project} {
            foreach file $rtl_files {
                if {![llength [get_files -quiet $file]]} {add_files -norecurse $file}
            }
            update_compile_order -fileset sources_1
        }
        # Restore the profile aperture after PS customization/Auto Assign Address.
        # Extra low DDR/QSPI/OCM mappings are not part of the PYNQ model contract.
        if {$profile eq "pynq"} {
            for {set i 0} {$i < 4} {incr i} {
                set gp [expr {$i + 2}]
                set space [get_bd_addr_spaces accelerator/m_axi_hp_0_$i]
                foreach suffix {DDR_LOW LPS_OCM QSPI} {
                    exclude_bd_addr_seg -target_address_space $space \
                        [get_bd_addr_segs ps/SAXIGP$gp/HP${i}_$suffix]
                }
                assign_bd_address -offset 0x0800000000 -range 2G \
                    -target_address_space $space [get_bd_addr_segs ps/SAXIGP$gp/HP${i}_DDR_HIGH] -force
            }
        }
    } else {
        set core_clock_mhz [expr {$requested_clock_mhz eq "" ? 250.0 : $requested_clock_mhz}]
        create_project $project_name $project_dir -part xczu7cg-ffvc1156-1-e
        set_property target_language Verilog [current_project]
        set_property simulator_language Mixed [current_project]
        set_property default_lib xil_defaultlib [current_project]
        set_property ip_cache_permissions {read write} [current_project]
        add_files -norecurse $rtl_files
        # Import mutable IP instances into the build, preserving canonical source XCI.
        import_ip -files $ip_files
        set before [dict create]
        foreach ip [get_ips] { dict set before [get_property NAME $ip] [critical_config $ip] }
        set to_upgrade [get_ips -quiet -filter {IS_LOCKED == 1}]
        if {[llength $to_upgrade]} { upgrade_ip $to_upgrade -log [file join $reports ip_upgrade.log] }
        set audit [open [file join $reports ip_contracts.tsv] w]
        puts $audit "ip\tproperty\tbefore\tafter\tmatch"
        set mismatch 0
        foreach ip [get_ips] {
            set name [get_property NAME $ip]
            set after [critical_config $ip]
            dict for {p value} [dict get $before $name] {
                set new_value "<missing>"
                if {[dict exists $after $p]} {set new_value [dict get $after $p]}
                set same [expr {[string equal -nocase $value $new_value]}]
                puts $audit "$name\t$p\t$value\t$new_value\t$same"
                if {!$same} {incr mismatch}
            }
        }
        close $audit
        report_ip_status -file [file join $reports ip_status.rpt]
        if {$mismatch} { error "$mismatch IP latency/interface parameters changed; see ip_contracts.tsv" }
        if {[llength [get_ips -quiet -filter {IS_LOCKED == 1}]]} { error "Some accelerator IP remain locked" }
        update_compile_order -fileset sources_1
        source [file join $source_root scripts create_bd.tcl]
        set bd [get_files */llama_system.bd]
        set wrappers [make_wrapper -files $bd -top]
        add_files -norecurse $wrappers
        add_files -fileset constrs_1 -norecurse [file join $source_root constraints ddr4_pins.xdc]
        set_property top llama_system_wrapper [get_filesets sources_1]
        set_property STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY rebuilt [get_runs synth_1]
        # Use the same named run as deployment when creating a project for the
        # first time. Existing projects never silently create/fall back to runs.
        if {$implementation_run eq "impl_2"} {
            create_run synth_2 -flow {Vivado Synthesis 2025} -strategy Flow_PerfOptimized_high \
                -constrset constrs_1
            set_property STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY rebuilt [get_runs synth_2]
            create_run impl_2 -parent_run synth_2 -flow {Vivado Implementation 2025} \
                -strategy Performance_Explore -constrset constrs_1
        }
        update_compile_order -fileset sources_1
    }
    if {![llength [get_runs -quiet $implementation_run]]} {
        error "Requested implementation run $implementation_run does not exist; refusing to build another run"
    }
    set synthesis_run [get_property PARENT [get_runs $implementation_run]]
    if {$synthesis_run eq "" || ![llength [get_runs -quiet $synthesis_run]]} {
        error "Missing parent synthesis run for $implementation_run"
    }
    current_run -synthesis [get_runs $synthesis_run]
    current_run -implementation [get_runs $implementation_run]
    # Same implementation family as the current board reference; no old DCP reuse.
    set_property STEPS.PLACE_DESIGN.ARGS.DIRECTIVE Explore [get_runs $implementation_run]
    set_property STEPS.PHYS_OPT_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs $implementation_run]
    set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true [get_runs $implementation_run]
    set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE Explore [get_runs $implementation_run]
    set_property STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs $implementation_run]
    set_property -name {STEPS.ROUTE_DESIGN.ARGS.MORE OPTIONS} -value {-tns_cleanup} -objects [get_runs $implementation_run]
    set thread_hook [file normalize [file join $source_root scripts threads8.tcl]]
    set_property STEPS.SYNTH_DESIGN.TCL.PRE $thread_hook [get_runs $synthesis_run]
    foreach step {OPT_DESIGN PLACE_DESIGN PHYS_OPT_DESIGN ROUTE_DESIGN POST_ROUTE_PHYS_OPT_DESIGN} {
        set_property STEPS.$step.TCL.PRE $thread_hook [get_runs $implementation_run]
    }
    puts "LLAMA_RUN_SELECTION synthesis=$synthesis_run implementation=$implementation_run"
    if {$refresh_project && $stage in {synth impl bitstream}} {
        reset_runs $synthesis_run
    }
    llama_sync_resets
    llama_sync_core_clock
    validate_bd_design
    save_bd_design
    write_bd_tcl -force [file join $reports llama_system_export.tcl]
    report_ip_status -file [file join $reports ip_status.rpt]
    set ready [open [file join $reports project_ready.txt] w]
    puts $ready "Vivado [version -short]; part=[get_property PART [current_project]]; BD validated"
    close $ready
    if {$stage ne "project"} {
        set standalone_ips [list]
        foreach path $ip_files { lappend standalone_ips [get_ips [file rootname [file tail $path]]] }
        generate_target all $standalone_ips
        generate_target all [get_files */llama_system.bd]
        # IP checkpoints are separate OOC runs; prepare them before top synthesis.
        foreach ip $standalone_ips {
            set name [get_property NAME $ip]
            if {![llength [get_runs -quiet ${name}_synth_1]]} {
                create_ip_run [get_files [get_property IP_FILE $ip]]
            }
        }
        if {![llength [get_runs -quiet llama_system_*_synth_1]]} {
            create_ip_run [get_files */llama_system.bd]
        }
        update_compile_order -fileset sources_1
    }
    if {$stage in {synth impl bitstream}} {
        set ip_runs [get_runs -quiet *_synth_1]
        set pending [list]
        foreach run $ip_runs {
            if {[get_property NEEDS_REFRESH $run]} {reset_runs $run}
            if {[get_property PROGRESS $run] ne "100%"} {lappend pending $run}
        }
        if {[llength $pending]} {launch_runs $pending -jobs $jobs}
        foreach run $ip_runs {
            wait_on_run $run
            set ip_status [get_property STATUS $run]
            if {[get_property PROGRESS $run] ne "100%" ||
                (![string match {*Complete*} $ip_status] && $ip_status ne "Using cached IP results")} {
                error "IP synthesis failed: $run ($ip_status)"
            }
        }
        if {[get_property NEEDS_REFRESH [get_runs $synthesis_run]]} {reset_runs $synthesis_run}
        if {[get_property PROGRESS [get_runs $synthesis_run]] ne "100%"} {
            launch_runs $synthesis_run -jobs $jobs
            wait_on_run $synthesis_run
        }
        if {![string match {*Complete*} [get_property STATUS [get_runs $synthesis_run]]]} { error "Synthesis failed: [get_property STATUS [get_runs $synthesis_run]]" }
        open_run $synthesis_run
        report_utilization -file [file join $reports utilization_synth.rpt]
        report_timing_summary -file [file join $reports timing_synth.rpt]
        report_clock_interaction -file [file join $reports clocks_synth.rpt]
        close_design
    }
    if {$stage in {impl bitstream}} {
        if {[get_property NEEDS_REFRESH [get_runs $implementation_run]]} {reset_runs $implementation_run}
        if {$stage eq "bitstream"} {
            launch_runs $implementation_run -to_step write_bitstream -jobs $jobs
        } else {
            launch_runs $implementation_run -to_step {phys_opt_design (Post-Route)} -jobs $jobs
        }
        wait_on_run $implementation_run
        llama_report_completed_implementation [get_runs $implementation_run] $stage $reports $project_dir $project_name
    }
    puts "LLAMA_BUILD_SUCCESS profile=$profile stage=$stage project=$xpr"
    close_project
}
if {[catch {main} failure details]} {
    puts stderr "LLAMA_BUILD_FAILED: $failure"
    puts stderr [dict get $details -errorinfo]
    exit 1
}
exit 0
