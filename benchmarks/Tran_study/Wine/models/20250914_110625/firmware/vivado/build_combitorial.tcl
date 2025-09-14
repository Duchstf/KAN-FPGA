# vivado/build_ooc.tcl
# Usage:
#   vivado -mode batch -source vivado/build_ooc.tcl

# ----------------------------
# Project / paths / device
# ----------------------------
set PROJ "KAN_FPGA_PROJECT"
set DIR  [file normalize [pwd]]
set PART "xcvu9p-flgb2104-2-i"

create_project -name $PROJ -part $PART -in_memory

# Output dirs/files
file mkdir -p "$DIR/$PROJ"
set OOC_DCP_PATH "$DIR/$PROJ/KAN_FPGA.dcp"
set RPT_UTIL      "$DIR/$PROJ/post_impl_util.rpt"
set RPT_TIMSUM    "$DIR/$PROJ/post_impl_timing.rpt"
set RPT_DP        "$DIR/$PROJ/datapath_timing.rpt"
set TXT_FMAX      "$DIR/$PROJ/fmax_estimate.txt"
set SDF_PATH      "$DIR/$PROJ/post_route_slow.sdf"

if {[file exists $OOC_DCP_PATH]} {
  file delete -force $OOC_DCP_PATH
}

# ----------------------------
# Sources
# ----------------------------
add_files -norecurse [glob $DIR/src/*.vhd]

set mems [glob -nocomplain $DIR/mem/*.mem]
if {[llength $mems] > 0} {
  add_files -norecurse $mems
  foreach f $mems {
    set_property used_in_synthesis true [get_files $f]
  }
}

# ----------------------------
# Top / synth / impl
# ----------------------------
set_property top top [current_fileset]

# OOC synth (your current settings)
synth_design -top top -mode out_of_context -directive PerformanceOptimized -retiming

# Your real clock (won't affect datapath-only timing, but keep it for completeness)
create_clock -name clk -period 8.000 [get_ports clk]

write_checkpoint -force $OOC_DCP_PATH

opt_design
place_design
route_design
phys_opt_design

# Standard reports
report_utilization     -file $RPT_UTIL
report_timing_summary  -file $RPT_TIMSUM

# ===========================================================
# Datapath-only I/O timing to estimate latency & Fmax
# ===========================================================

# Helper: get input/output ports for this design (prefer 'input*'/'output*')
set in_ports  [get_ports -quiet input*]
set out_ports [get_ports -quiet output*]

# Fallbacks if patterns don't match (exclude the real clock/reset-like controls)
if {[llength $in_ports] == 0} {
  set in_ports  [all_inputs]
  # try to remove common non-data controls
  foreach p {clk reset rst en enable} {
    catch { set in_ports [lsearch -all -inline -not -exact $in_ports [get_ports -quiet $p]] }
  }
}
if {[llength $out_ports] == 0} {
  set out_ports [all_outputs]
}

# Create a virtual clock and constrain I/O for datapath-only timing
# (Period value is arbitrary; we're measuring absolute datapath delay.)
create_clock -name VCLK -period 8.000

# Zero I/O delays relative to the virtual clock for pure datapath measurement
if {[llength $in_ports]}  { set_input_delay  0 -clock VCLK $in_ports }
if {[llength $out_ports]} { set_output_delay 0 -clock VCLK $out_ports }

if {[llength $in_ports] && [llength $out_ports]} {
  # Constrain I/O paths with a loose max delay (e.g. 100 ns)
  set_max_delay 100 -from $in_ports -to $out_ports

  # Detailed datapath timing (input→output)
  report_timing \
    -from $in_ports -to $out_ports \
    -max_paths 20 -sort_by group \
    -file $RPT_DP

  # Capture first path in a string
  set rpt_str [report_timing \
                 -from $in_ports -to $out_ports \
                 -max_paths 1 -return_string]


  # Extract "data path delay" in ns (case-insensitive)
  set Tdp_ns ""
  if {[regexp -nocase {data path delay[^0-9]*([0-9]+(?:\.[0-9]+)*)} $rpt_str -> Tdp_ns]} {
    set Fmax_MHz [format "%.3f" [expr {1000.0 / double($Tdp_ns)}]]
    set msg "Worst datapath delay (Slow corner) = $Tdp_ns ns\nEstimated Fmax upper bound       = $Fmax_MHz MHz\n(Design latency in cycles = 0; time latency ≈ Tdp)"
  } else {
    set msg "Could not parse datapath delay from report_timing output.\nCheck $RPT_DP and port patterns (in_ports/out_ports)."
  }

  puts $msg
  set fp [open $TXT_FMAX w]
  puts $fp $msg
  close $fp
} else {
  puts "INFO: No candidate I/O ports found for datapath timing. Check your port names."
}

# Optional: write SDF for post-route timing simulation at Slow corner
catch { write_sdf -process_corner slow $SDF_PATH }
