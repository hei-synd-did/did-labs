onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Group: XXX}
add wave -noupdate -divider Angle
add wave -noupdate -format Analog-Step -height 100 -max 4095.0 -radix unsigned -radixshowbase 0 /cordic_tb/phase
add wave -noupdate -divider Internals
add wave -noupdate -divider {Sine and cosine}
add wave -noupdate -format Analog-Step -height 100 -max 32000.0 -min -32000.0 -radix decimal -radixshowbase 0 /cordic_tb/sine
add wave -noupdate -format Analog-Step -height 100 -max 32000.0 -min -32000.0 -radix decimal -radixshowbase 0 /cordic_tb/cosine
add wave -noupdate -childformat {{/cordic_tb/I_DUT/x(0) -radix unsigned} {/cordic_tb/I_DUT/x(1) -radix unsigned} {/cordic_tb/I_DUT/x(2) -radix unsigned} {/cordic_tb/I_DUT/x(3) -radix unsigned} {/cordic_tb/I_DUT/x(4) -radix unsigned} {/cordic_tb/I_DUT/x(5) -radix unsigned} {/cordic_tb/I_DUT/x(6) -radix unsigned} {/cordic_tb/I_DUT/x(7) -radix unsigned} {/cordic_tb/I_DUT/x(8) -radix unsigned} {/cordic_tb/I_DUT/x(9) -radix unsigned} {/cordic_tb/I_DUT/x(10) -radix unsigned} {/cordic_tb/I_DUT/x(11) -radix unsigned} {/cordic_tb/I_DUT/x(12) -radix unsigned} {/cordic_tb/I_DUT/x(13) -radix unsigned} {/cordic_tb/I_DUT/x(14) -radix unsigned} {/cordic_tb/I_DUT/x(15) -radix unsigned} {/cordic_tb/I_DUT/x(16) -radix unsigned} {/cordic_tb/I_DUT/x(17) -radix unsigned} {/cordic_tb/I_DUT/x(18) -radix unsigned} {/cordic_tb/I_DUT/x(19) -radix unsigned} {/cordic_tb/I_DUT/x(20) -radix unsigned}} -expand -subitemconfig {/cordic_tb/I_DUT/x(0) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(1) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(2) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(3) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(4) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(5) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(6) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(7) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(8) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(9) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(10) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(11) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(12) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(13) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(14) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(15) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(16) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(17) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(18) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(19) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned} /cordic_tb/I_DUT/x(20) {-format Analog-Step -height 30 -max 32000.0 -min -32000.0 -radix unsigned}} /cordic_tb/I_DUT/x
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1537267 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 186
configure wave -valuecolwidth 64
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {1575 us}
