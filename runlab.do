# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./testscreen.sv"
vlog "./video_driver.sv"
vlog "./CLOCK25_PLL.v"
vlog "./altera_up_avalon_video_vga_timing.v"
vlog "./CLOCK25_PLL/CLOCK25_PLL_0002.v"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work testscreen_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do testscreen_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
