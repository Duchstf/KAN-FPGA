# run_hls.tcl
# Vivado HLS TCL script for add5_sat project

open_project add5_sat_prj
set_top add5_sat_ufixed

# Add source files
add_files dut.cpp
add_files -tb tb.cpp

# Create solution
open_solution "solution1"
set_part {xc7z020clg484-1}   ;# Change to your FPGA part if needed
create_clock -period 10 -name default

# Run C simulation
csim_design

# Run synthesis (optional, comment out if only sim is needed)
# csynth_design

# Run C/RTL co-simulation (optional)
# cosim_design

exit
