# sim_latency.tcl
# Usage:
#   vivado -mode batch -source sim_latency.tcl

# ----------------- Config -----------------
set PROJ "KAN_SIM"
set DIR  [file normalize [pwd]]
set PART "xcvu9p-flgb2104-2-i"

# ----------------- Project on disk -----------------
create_project -name $PROJ -part $PART -dir "$DIR/$PROJ" -force
set_property target_language VHDL [current_project]
set_property default_lib work [current_project]

# ----------------- Add RTL sources -----------------
# Add package + design files (adjust path if needed)
set rtl_files [glob -nocomplain $DIR/../src/*.vhd]
if {[llength $rtl_files] == 0} {
  puts "WARNING: No RTL files found under $DIR/../src"
}
add_files -norecurse $rtl_files

# Add .mem files and mark for synthesis
set mems [glob -nocomplain $DIR/../mem/*.mem]
if {[llength $mems] > 0} {
  add_files -norecurse $mems
  foreach f $mems {
    set_property used_in_synthesis true [get_files $f]
  }
}

# Set RTL top
set_property top KAN [get_filesets sources_1]

# ----------------- Add Testbench -----------------
if {[llength [get_filesets sim_1]] == 0} {
  create_fileset -simset sim_1
}
set tb_files [glob -nocomplain $DIR/tb_kan_latency.vhd]
if {[llength $tb_files] == 0} {
  error "Testbench file not found at $DIR/tb_kan_latency.vhd"
}
add_files -fileset sim_1 $tb_files
set_property top tb_kan_latency [get_filesets sim_1]

# ----------------- Add simulation data files -----------------
set vec_in  "$DIR/vectors_in.txt"
set vec_out "$DIR/vectors_out.txt"

foreach f [list $vec_in $vec_out] {
  if {![file exists $f]} { error "Simulation data file not found: $f" }
  add_files -fileset sim_1 -norecurse $f
}

# Resolve compile order
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# ----------------- Run behavioral sim -----------------
launch_simulation
run 2 ms
quit