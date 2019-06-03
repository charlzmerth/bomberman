onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /player_input_testbench/clk
add wave -noupdate /player_input_testbench/reset
add wave -noupdate /player_input_testbench/dut/valid
add wave -noupdate /player_input_testbench/dut/makeBreak
add wave -noupdate /player_input_testbench/dut/outCode
add wave -noupdate /player_input_testbench/PS2_DAT
add wave -noupdate /player_input_testbench/PS2_CLK
add wave -noupdate /player_input_testbench/p1_bomb
add wave -noupdate /player_input_testbench/p2_bomb
add wave -noupdate /player_input_testbench/p1_move
add wave -noupdate /player_input_testbench/p2_move
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {1434 ps}
