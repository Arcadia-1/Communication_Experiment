onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test/d/clk
add wave -noupdate /test/d/sysclk
add wave -noupdate /test/d/en
add wave -noupdate /test/d/out
add wave -noupdate /test/d/in
add wave -noupdate /test/d/in_err
add wave -noupdate /test/d/in_state
add wave -noupdate /test/d/counter
add wave -noupdate /test/d/out_buf
add wave -noupdate -radix unsigned /test/d/buf_tail
add wave -noupdate -radix unsigned /test/d/counter_record
add wave -noupdate /test/d/enable
add wave -noupdate -radix unsigned /test/d/pointer
add wave -noupdate /test/d/o
add wave -noupdate /test/d/cur_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10893 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 110
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
WaveRestoreZoom {246740 ns} {302804 ns}
