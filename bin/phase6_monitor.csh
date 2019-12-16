#!/bin/csh -f
source /CMC/scripts/mentor.questasim.2019.2.csh
cd ../verification/phase6_monitor

if (! -e work) then
  vlib work
endif
vmap work work

vlog ../../dut/xswitch.svp ../../dut/dut_top.sv interface.sv tbench_top.sv testbench.sv environment.sv transaction.sv generator.sv driver.sv monitor.sv

vsim -vopt tbench_top -c -do 'run -all; exit'

endif
