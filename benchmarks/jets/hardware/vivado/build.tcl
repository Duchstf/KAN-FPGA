# vivado/build.tcl
# Usage:
#   vivado -mode batch -source vivado/build.tcl

set PART "xcvu9p-flgb2104-2-i" ; 

set PROJ "KAN_FPGA_PROJECT"
set DIR  [file normalize [pwd]]

# Create project
create_project $PROJ $DIR/$PROJ -part $PART -force
set_property target_language VHDL [current_project]
set_property default_lib work [current_project]

# VHDL 2008 for all VHDL files
set_property file_type {VHDL 2008} [get_filesets sources_1]

# Add all .vhd files in $DIR/src
add_files -norecurse [glob $DIR/src/*.vhd]

# Add mem files (mark used in synth)
set mems [glob -nocomplain $DIR/mem/*.mem]
if {[llength $mems] > 0} {
  add_files -fileset sources_1 -norecurse $mems
  foreach f $mems {
    set_property used_in_synthesis true [get_files $f]
    set_property used_in_simulation true [get_files $f]
  }
}

# Set top
set_property top top [get_filesets sources_1]

# Out-of-context synthesis is fine
launch_runs synth_1 -jobs 8
wait_on_run synth_1

# (Optional) Implement & bitstream
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

# Reports
report_utilization -file $DIR/utilization.rpt -hierarchical
report_timing_summary -file $DIR/timing.rpt
