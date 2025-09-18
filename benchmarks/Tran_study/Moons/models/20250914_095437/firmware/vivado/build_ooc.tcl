# Usage:
#   vivado -mode batch -source vivado/build_ooc.tcl

# Define project name and paths
set PROJ "KAN_FPGA_PROJECT"
set DIR  [file normalize [pwd]]
set PART "xczu7ev-ffvc1156-2-e"

# Create in-memory project with the specified part
create_project -name $PROJ -part $PART -in_memory

# Define output files
set OOC_DCP_PATH "$DIR/$PROJ/KAN_FPGA.dcp"
file mkdir -p "$DIR/$PROJ"

# Clean previous DCP
if {[file exists $OOC_DCP_PATH]} {
    file delete -force $OOC_DCP_PATH
}

# Add VHDL sources
add_files -norecurse [glob $DIR/src/*.vhd]

# Add .mem files and mark for synthesis
set mems [glob -nocomplain $DIR/mem/*.mem]
if {[llength $mems] > 0} {
    add_files -norecurse $mems
    foreach f $mems {
        set_property used_in_synthesis true [get_files $f]
    }
}

# Set top-level entity
set_property top top [current_fileset]

# Run out-of-context synthesis with aggressive optimization
synth_design -top top -mode out_of_context -directive PerformanceOptimized -retiming
create_clock -name clk -period 0.5 [get_ports clk]

# Write synthesized checkpoint
write_checkpoint -force $OOC_DCP_PATH

# Post-synthesis optimization and full implementation
opt_design
place_design
route_design
phys_opt_design

# Post-implementation utilization and timing
report_utilization -file "$DIR/$PROJ/post_impl_util.rpt"
report_timing_summary -file "$DIR/$PROJ/post_impl_timing.rpt"