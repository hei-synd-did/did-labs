onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -format Analog-Step -height 30 -max 2000.0 -min -2000.0 -radix decimal -childformat {{/cordicaddsub_tb/phaseIn(11) -radix decimal} {/cordicaddsub_tb/phaseIn(10) -radix decimal} {/cordicaddsub_tb/phaseIn(9) -radix decimal} {/cordicaddsub_tb/phaseIn(8) -radix decimal} {/cordicaddsub_tb/phaseIn(7) -radix decimal} {/cordicaddsub_tb/phaseIn(6) -radix decimal} {/cordicaddsub_tb/phaseIn(5) -radix decimal} {/cordicaddsub_tb/phaseIn(4) -radix decimal} {/cordicaddsub_tb/phaseIn(3) -radix decimal} {/cordicaddsub_tb/phaseIn(2) -radix decimal} {/cordicaddsub_tb/phaseIn(1) -radix decimal} {/cordicaddsub_tb/phaseIn(0) -radix decimal}} -radixshowbase 0 -subitemconfig {/cordicaddsub_tb/phaseIn(11) {-height 17 -radix decimal -radixshowbase 0} /cordicaddsub_tb/phaseIn(10) {-height 17 -radix decimal -radixshowbase 0} /cordicaddsub_tb/phaseIn(9) {-height 17 -radix decimal -radixshowbase 0} /cordicaddsub_tb/phaseIn(8) {-height 17 -radix decimal -radixshowbase 0} /cordicaddsub_tb/phaseIn(7) {-height 17 -radix decimal -radixshowbase 0} /cordicaddsub_tb/phaseIn(6) {-height 17 -radix decimal -radixshowbase 0} /cordicaddsub_tb/phaseIn(5) {-height 17 -radix decimal -radixshowbase 0} /cordicaddsub_tb/phaseIn(4) {-height 17 -radix decimal -radixshowbase 0} /cordicaddsub_tb/phaseIn(3) {-height 17 -radix decimal -radixshowbase 0} /cordicaddsub_tb/phaseIn(2) {-height 17 -radix decimal -radixshowbase 0} /cordicaddsub_tb/phaseIn(1) {-height 17 -radix decimal -radixshowbase 0} /cordicaddsub_tb/phaseIn(0) {-height 17 -radix decimal -radixshowbase 0}} /cordicaddsub_tb/phaseIn
add wave -noupdate -format Analog-Step -height 30 -max 2000.0 -min -2000.0 -radix decimal -radixshowbase 0 /cordicaddsub_tb/stepAngle
add wave -noupdate -format Analog-Step -height 30 -max 500.0 -radix unsigned -childformat {{/cordicaddsub_tb/xIn(8) -radix unsigned} {/cordicaddsub_tb/xIn(7) -radix unsigned} {/cordicaddsub_tb/xIn(6) -radix unsigned} {/cordicaddsub_tb/xIn(5) -radix unsigned} {/cordicaddsub_tb/xIn(4) -radix unsigned} {/cordicaddsub_tb/xIn(3) -radix unsigned} {/cordicaddsub_tb/xIn(2) -radix unsigned} {/cordicaddsub_tb/xIn(1) -radix unsigned} {/cordicaddsub_tb/xIn(0) -radix unsigned}} -radixshowbase 0 -subitemconfig {/cordicaddsub_tb/xIn(8) {-height 17 -radix unsigned -radixshowbase 0} /cordicaddsub_tb/xIn(7) {-height 17 -radix unsigned -radixshowbase 0} /cordicaddsub_tb/xIn(6) {-height 17 -radix unsigned -radixshowbase 0} /cordicaddsub_tb/xIn(5) {-height 17 -radix unsigned -radixshowbase 0} /cordicaddsub_tb/xIn(4) {-height 17 -radix unsigned -radixshowbase 0} /cordicaddsub_tb/xIn(3) {-height 17 -radix unsigned -radixshowbase 0} /cordicaddsub_tb/xIn(2) {-height 17 -radix unsigned -radixshowbase 0} /cordicaddsub_tb/xIn(1) {-height 17 -radix unsigned -radixshowbase 0} /cordicaddsub_tb/xIn(0) {-height 17 -radix unsigned -radixshowbase 0}} /cordicaddsub_tb/xIn
add wave -noupdate -format Analog-Step -height 30 -max 500.0 -radix unsigned -radixshowbase 0 /cordicaddsub_tb/xInShifted
add wave -noupdate -format Analog-Step -height 30 -max 500.0 -radix unsigned -radixshowbase 0 /cordicaddsub_tb/yIn
add wave -noupdate -format Analog-Step -height 30 -max 500.0 -radix unsigned -radixshowbase 0 /cordicaddsub_tb/yInShifted
add wave -noupdate -divider Outputs
add wave -noupdate -format Analog-Step -height 30 -max 2000.0 -min -2000.0 -radix decimal -radixshowbase 0 /cordicaddsub_tb/phaseOut
add wave -noupdate -format Analog-Step -height 30 -max 500.0 -radix unsigned -radixshowbase 0 /cordicaddsub_tb/xOut
add wave -noupdate -format Analog-Step -height 30 -max 500.0 -radix unsigned -radixshowbase 0 /cordicaddsub_tb/yOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 220
configure wave -valuecolwidth 40
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
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {577500 ns}
