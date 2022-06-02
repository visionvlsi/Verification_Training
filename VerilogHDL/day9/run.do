vlib work
vlog dff.v dff_tb.v +acc
vsim work.tb
add wave -r *
run 100ns