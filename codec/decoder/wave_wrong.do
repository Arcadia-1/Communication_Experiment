onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_wrong/d/clk
add wave -noupdate /test_wrong/d/sysclk
add wave -noupdate /test_wrong/d/en
add wave -noupdate /test_wrong/d/out
add wave -noupdate /test_wrong/d/in
add wave -noupdate /test_wrong/d/in_err
add wave -noupdate /test_wrong/d/in_state
add wave -noupdate /test_wrong/d/counter
add wave -noupdate /test_wrong/d/out_buf
add wave -noupdate /test_wrong/d/enable
add wave -noupdate {/test_wrong/d/out_buf[0]}
add wave -noupdate /test_wrong/d/consecutive_counter
add wave -noupdate /test_wrong/d/minerr
add wave -noupdate /test_wrong/d/prev_err
add wave -noupdate /test_wrong/d/min
add wave -noupdate /test_wrong/d/cur_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10514 ns} 0}
configure wave -namecolwidth 196
configure wave -valuecolwidth 153
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
WaveRestoreZoom {0 ns} {25952 ns}
