source $::env(SCRIPTS_DIR)/load.tcl
source $::env(SCRIPTS_DIR)/util.tcl
load_design 1_synth.v 1_synth.sdc
repair_timing_helper 0
write_verilog $::env(RESULTS_DIR)/1_2_synth-repair.v
write_db $::env(RESULTS_DIR)/1_2_synth-repair.odb
write_sdc -no_timestamp $::env(RESULTS_DIR)/1_2_synth-repair.sdc
