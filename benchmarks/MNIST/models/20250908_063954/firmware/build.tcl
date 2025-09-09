# Usage:
#   vitis-run --mode hls --threads 16 --tcl build.tcl
# or with overrides:
#   vitis-run --mode hls --tcl build.tcl -part xcvu9p-flgb2104-2-i -period 3.0

# ----------------------------
# Args (with defaults)
# ----------------------------
set fpga_part "xcvu9p-flgb2104-2-i"
set clk_period 3.0

for {set i 0} {$i < $argc} {incr i} {
  switch -- [lindex $argv $i] {
    -part   { incr i; set fpga_part [lindex $argv $i] }
    -period { incr i; set clk_period [lindex $argv $i] }
  }
}
puts "Using part: $fpga_part ; period: $clk_period ns"

# ----------------------------
# Helper
# ----------------------------
proc report_time { op_name time_start time_end } {
  set time_taken [expr {$time_end - $time_start}]
  set time_s [expr {($time_taken / 1000) % 60}]
  set time_m [expr {($time_taken / (1000*60)) % 60}]
  set time_h [expr {($time_taken / (1000*60*60)) % 24}]
  puts "***** ${op_name} COMPLETED IN ${time_h}h${time_m}m${time_s}s *****"
}

# ----------------------------
# Project / Solution
# ----------------------------
open_project -reset KAN
set_top KAN

# Add sources (no error if none)
set srcs [glob -nocomplain *.cpp]
if {[llength $srcs] == 0} {
  puts "WARNING: No .cpp files found in [pwd]"
}
foreach f $srcs {
  add_files $f
}

#Reset solution
open_solution -reset "solution1"

#Specify FPGA and clock constraints
catch {config_array_partition -maximum_size 8192}
config_compile -name_max_length 80
set_part $fpga_part
create_clock -period $clk_period -name default

# ----------------------------
# C/RTL Synthesis
# ----------------------------
puts "***** C/RTL SYNTHESIS *****"
set time_start [clock clicks -milliseconds]
csynth_design
set time_end [clock clicks -milliseconds]
report_time "C/RTL SYNTHESIS" $time_start $time_end

#Post-synthesis optimization and full implementation
# puts "***** POST-SYNTHESIS OPTIMIZATION AND FULL IMPLEMENTATION *****"
# set time_start [clock clicks -milliseconds]
# opt_design
# place_design
# route_design
# phys_opt_design