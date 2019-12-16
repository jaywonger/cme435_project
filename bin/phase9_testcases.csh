#!/bin/csh -f
source /CMC/scripts/mentor.questasim.2019.2.csh
set testcase_list="test_sanity test_max_payload test_min_payload"

if ("$1" == "-l") then
	foreach testcase ($testcase_list)
		echo $testcase
	end
else if ("$1" == "-t") then
	if("$2" != "test_sanity" && "$2" != "test_max_payload" && "$2" != "test_min_payload") then
		echo "Input Error"
	else
		cd ../verification/phase9_testcases
	if (! -e work) then
		vlib work
	endif
	vmap work work

	vlog ../../dut/xswitch.svp ../../dut/dut_top.sv scoreboard.sv environment.sv generator.sv interface.sv tbench_top.sv ../regression_test/$2.sv transaction.sv driver.sv monitor.sv assertions.sv

	vsim -vopt tbench_top -c -do 'run -all; exit'
	endif

endif
