onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testscreen_testbench/dut/CLOCK_50
add wave -noupdate {/testscreen_testbench/dut/SW[9]}
add wave -noupdate -radix unsigned /testscreen_testbench/dut/r
add wave -noupdate -radix unsigned /testscreen_testbench/dut/g
add wave -noupdate -radix unsigned /testscreen_testbench/dut/b
add wave -noupdate -radix unsigned /testscreen_testbench/dut/x
add wave -noupdate -radix unsigned /testscreen_testbench/dut/y
add wave -noupdate /testscreen_testbench/dut/Stage1Done
add wave -noupdate /testscreen_testbench/dut/Stage2Done
add wave -noupdate /testscreen_testbench/dut/Stage3Done
add wave -noupdate /testscreen_testbench/dut/ps
add wave -noupdate /testscreen_testbench/dut/ns
add wave -noupdate -radix unsigned /testscreen_testbench/dut/Counterx
add wave -noupdate -radix unsigned /testscreen_testbench/dut/Countery
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 126
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {482 ps}
