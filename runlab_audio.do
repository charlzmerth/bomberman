# File generated using scripted created by Allen Putich.# # Runlab format was adopted from Scott Hauck UW EE 271 course files.
# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./audio.sv"
vlog "./clock_divider.sv"
vlog "./DE1_SoC.sv"
vlog "./player_input.sv"
vlog "./testscreen.sv"
vlog "./video_driver.sv"

vlog "./Altera_UP_Audio_Bit_Counter.v"
vlog "./Altera_UP_Audio_In_Deserializer.v"
vlog "./Altera_UP_Audio_Out_Serializer.v"
vlog "./altera_up_avalon_video_vga_timing.v"
vlog "./Altera_UP_Clock_Edge.v"
vlog "./Altera_UP_I2C.v"
vlog "./Altera_UP_I2C_AV_Auto_Initialize.v"
vlog "./Altera_UP_I2C_DC_Auto_Initialize.v"
vlog "./Altera_UP_I2C_LCM_Auto_Initialize.v"
vlog "./Altera_UP_Slow_Clock_Generator.v"
vlog "./Altera_UP_SYNC_FIFO.v"
vlog "./audio_and_video_config.v"
vlog "./audio_codec.v"
vlog "./audio_rom.v"
vlog "./audio_rom_bb.v"
vlog "./CLOCK25_PLL/CLOCK25_PLL_0002.v"
vlog "./CLOCK25_PLL.v"
vlog "./clock_generator.v"
vlog "./keyboard_inner_driver.v"
vlog "./keyboard_press_driver.v"
vlog "./keyboard_scancoderaw_driver.v"


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs=\"+acc\" -t 1ps -lib work work.audio_testbench -Lf altera_mf_ver

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do audio_wave.do

# Set the window types
view wave 
view structure
view signals

# Run the simulation
run -all


# END