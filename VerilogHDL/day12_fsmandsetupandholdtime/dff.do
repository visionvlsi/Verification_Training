vlib work
vlog dff_setup.v dff_tb.v  +acc
vsim work.tb
add wave -r *
run -all