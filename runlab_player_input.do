# File generated using scripted created by Allen Putich.# # Runlab format was adopted from Scott Hauck UW EE 271 course files.
# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./player_input.sv"
vlog "./keyboard_press_driver.v"
vlog "./keyboard_inner_driver.v"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work player_input_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do player_input_wave.do

# Set the window types
view wave 
view structure
view signals

# Run the simulation
run -all


# END