source $::env(SCRIPTS_DIR)/load.tcl
source $::env(SCRIPTS_DIR)/util.tcl
load_design 1_synth.v 1_synth.sdc

report_check_types -violators -verbose > $::env(REPORTS_DIR)/1_1_Pre_synthesis_repair_detailed.rpt

if {[info exists ::env(SYNTH_REPAIR_TIMING_LOOP_CNT)]} {
    for {set i 0} {$i < $::env(SYNTH_REPAIR_TIMING_LOOP_CNT)} {incr i} {
        puts "Running repair_timing, iteration [expr {$i + 1}] of $::env(SYNTH_REPAIR_TIMING_LOOP_CNT) ..."
        repair_timing_helper 0
    }
} else {
    puts "Warning: SYNTH_REPAIR_TIMING_LOOP_CNT environment variable not set, skipping repair_timing"
}

report_check_types -violators -verbose > $::env(REPORTS_DIR)/1_2_Post_synthesis_repair_detailed.rpt

write_verilog $::env(RESULTS_DIR)/1_2_synth-repair.v
write_db $::env(RESULTS_DIR)/1_2_synth-repair.odb
write_sdc -no_timestamp $::env(RESULTS_DIR)/1_2_synth-repair.sdc
