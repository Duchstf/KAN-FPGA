## HELPER FUNCTIONS
proc report_time { op_name time_start time_end } {
  set time_taken [expr $time_end - $time_start]
  set time_s [expr ($time_taken / 1000) % 60]
  set time_m [expr ($time_taken / (1000*60)) % 60]
  set time_h [expr ($time_taken / (1000*60*60)) % 24]
  puts "***** ${op_name} COMPLETED IN ${time_h}h${time_m}m${time_s}s *****"
}

#Open the project and then reset it
open_project -reset KAN

# Top function
set_top KAN
add_files KAN.cpp 

#Reset solution
open_solution -reset "solution1"

#Specify FPGA and clock constraints
catch {config_array_partition -maximum_size 8192}
config_compile -name_max_length 80
set_part {xcvu13p-flga2577-2-e}
create_clock -period 3.0 -name default

#Synthethize
puts "***** C/RTL SYNTHESIS *****"
set time_start [clock clicks -milliseconds]
csynth_design
set time_end [clock clicks -milliseconds]
report_time "C/RTL SYNTHESIS" $time_start $time_end
