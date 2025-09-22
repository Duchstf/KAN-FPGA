# Usage:
#   vivado -mode batch -source vivado/build_full.tcl

# Define project name and paths
set PROJ "KAN_FPGA_PROJECT"
set DIR  [file normalize [pwd]]
set PART "xcvu9p-flgb2104-2-i"

# Create in-memory project with the specified part
create_project -name $PROJ -part $PART -force
set_property target_language VHDL [current_project]
set_property default_lib work [current_project]

# Define output files
file mkdir -p "$DIR/$PROJ"

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
set_property top top [get_filesets sources_1]

# Run synthesis
set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
set_property strategy "Flow_PerfOptimized_high" [get_runs synth_1]

set obj [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]

launch_runs synth_1 -jobs 8
wait_on_run synth_1
current_run -synthesis [get_runs synth_1]

# Open synthesized design (required to access ports)
open_run synth_1

# Create clock
create_clock -name clk -period 1.2 [get_ports clk]

# Run implementation
set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
set obj [get_runs impl_1]
set_property "steps.write_bitstream.args.readback_file" "0" $obj
set_property "steps.write_bitstream.args.verbose" "0" $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

launch_runs -jobs 8 impl_1 -to_step route_design
wait_on_run impl_1
open_run impl_1
report_utilization
report_timing
report_power

#Report the utilization
set util [report_utilization -return_string]
set util_lut [exec echo $util | grep LUT | head -n 1 | cut -d| -f3 | tr -d " "]

#set util_lut [llength [get_cells -hier -filter {PRIMITIVE_TYPE =~ *LUT*}]]
set util_ff [llength [get_cells -hier -filter {PRIMITIVE_TYPE =~ *.F*E*}]]
set util_dsp [llength [get_cells -hier -filter {PRIMITIVE_GROUP == DSP}]]
set util_bram [llength [get_cells -hier -filter {PRIMITIVE_TYPE =~ *BRAM*}]]
#set time_wns [get_property STATS.WNS [current_run]]
set time_wns [get_property SLACK [get_timing_paths]]

puts "LUT: $util_lut FF: $util_ff DSP: $util_dsp BRAM: $util_bram"

set fp [open res.txt w]
puts $fp "LUT=$util_lut"
puts $fp "FF=$util_ff"
puts $fp "DSP=$util_dsp"
puts $fp "BRAM=$util_bram"
puts $fp "WNS=$time_wns"
close $fp