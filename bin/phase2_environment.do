vlib work


vlog ./dut/xswitch.svp
vlog ./dut/dut_top.sv
vlog ./verification/phase2_environment/*.sv

vopt +acc tbench_top -o tbench_top_opt
vsim tbench_top_opt

add wave *
view wave

run -all
