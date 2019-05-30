onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /audio_testbench/dut/CLOCK_50
add wave -noupdate /audio_testbench/dut/readdata
add wave -noupdate {/audio_testbench/dut/KEY[2]}
add wave -noupdate {/audio_testbench/dut/SW[0]}
add wave -noupdate /audio_testbench/dut/divided_clocks
add wave -noupdate /audio_testbench/dut/play_counter
add wave -noupdate /audio_testbench/dut/audio_clk
add wave -noupdate /audio_testbench/dut/cycled
add wave -noupdate /audio_testbench/dut/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
