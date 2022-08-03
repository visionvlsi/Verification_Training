onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/clk
add wave -noupdate /top/rst
add wave -noupdate /top/wr
add wave -noupdate /top/addr
add wave -noupdate /top/wdata
add wave -noupdate /top/rdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {57 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {35 ns} {99 ns}
