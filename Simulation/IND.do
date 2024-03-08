onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {ElN - IND}
add wave -noupdate -divider Inputs
add wave -noupdate /ind_tb/delai_livr_court
add wave -noupdate /ind_tb/stock_bas
add wave -noupdate /ind_tb/carnet_comm_rempli
add wave -noupdate /ind_tb/prix_bas
add wave -noupdate -divider Conditions
add wave -noupdate /ind_tb/I0/conditionA
add wave -noupdate /ind_tb/I0/conditionB
add wave -noupdate /ind_tb/I0/conditionC
add wave -noupdate /ind_tb/I0/conditionD
add wave -noupdate /ind_tb/I0/conditionE
add wave -noupdate -divider Output
add wave -noupdate /ind_tb/accept
add wave -noupdate -divider <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11751 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 181
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {210 ns}
