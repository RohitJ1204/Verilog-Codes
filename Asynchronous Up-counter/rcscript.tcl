set_db / .init_lib_search_path {/home/install/FOUNDRY/digital/90nm/dig/lib}
# Read Lib,RTL and SDC files
set_db / .library "slow.lib"
set DESIGN asy
read_hdl "asy.v"
elaborate $DESIGN 
check_design -unresolved
read_sdc constraints_top.sdc


#Setting effort medium
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic 
syn_map
syn_opt

write_hdl > asy_netlist.v
write_sdc > asy_sdc.sdc
#PPA Reports
report_power > asy_power.rpt
report_gates > asy_gatescc.rpt
report_timing > asy_timing.rpt
report_area > asy_area.rpt
gui_show
