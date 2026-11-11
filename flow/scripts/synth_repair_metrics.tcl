utl::set_metrics_stage "synth__{}"
source $::env(SCRIPTS_DIR)/load.tcl
load_design 1_2_synth-repair.odb
report_metrics 1_2 "Post synthesis repair" false false
