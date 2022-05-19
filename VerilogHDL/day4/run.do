vlib work
vlog mux41.v mux41tb.v +define+DFLOW +acc
vsim work.tb
add wave -r *
run -all
