vlib work
vlog fa.v rca.v rca_tb.v +acc
vsim work.tb
add wave -r *
run -all