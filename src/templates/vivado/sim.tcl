# sim.tcl
# Usage:
#   vivado -mode batch -source vivado/sim.tcl

# ----------------- Config -----------------
set PROJ "KAN_FPGA_PROJECT_SIM"
set DIR  [file normalize [pwd]]
set PART "xcvu9p-flgb2104-2-i"

# ----------------- Project on disk -----------------
create_project -name $PROJ -part $PART -dir "$DIR/$PROJ" -force
set_property target_language VHDL [current_project]
set_property default_lib work [current_project]

# ----------------- Add RTL sources -----------------
# Add package + design files (adjust path if needed)
set rtl_files [glob -nocomplain $DIR/src/*.vhd]
if {[llength $rtl_files] == 0} {
  puts "WARNING: No RTL files found under $DIR/src"
}
add_files -norecurse $rtl_files

# Add .mem files and mark for synthesis
set mems [glob -nocomplain $DIR/mem/*.mem]
if {[llength $mems] > 0} {
  add_files -norecurse $mems
  foreach f $mems {
    set_property used_in_synthesis true [get_files $f]
  }
}

# Set RTL top
set_property top top [get_filesets sources_1]

# ----------------- Add Testbench -----------------
if {[llength [get_filesets sim_1]] == 0} {
  create_fileset -simset sim_1
}
set tb_files [glob -nocomplain $DIR/testbench/tb_top.vhd]
if {[llength $tb_files] == 0} {
  error "Testbench file not found at $DIR/testbench/tb_top.vhd"
}
add_files -fileset sim_1 $tb_files
set_property top tb_top [get_filesets sim_1]

# Resolve compile order
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# ----------------- Run behavioral sim -----------------
launch_simulation
run 2 ms