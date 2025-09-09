# sim.tcl (template)
set RTL_DIR {{RTL_DIR}}
file delete -force xsim.dir work *.log *.jou *.pb

# Gather RTL
set rtl_vhd [concat [glob -nocomplain $RTL_DIR/**/*.vhd] [glob -nocomplain $RTL_DIR/*.vhd]]
set rtl_v   [concat [glob -nocomplain $RTL_DIR/**/*.v]   [glob -nocomplain $RTL_DIR/*.v]]

# Compile TB
xvhdl -2008 tb_kan.vhd

# Compile RTL
foreach f $rtl_vhd { xvhdl -2008 $f }
foreach f $rtl_v   { xvlog $f }

# Elaborate & run
xelab tb_kan -s tb_kan_sim
xsim tb_kan_sim -runall