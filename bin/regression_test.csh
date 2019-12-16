#!/bin/csh -f
source /CMC/scripts/mentor.questasim.2019.2.csh
set list="test_sanity test_max_payload test_min_payload"

if ("$1" == "-fc") then
	cd ../verification/phase9_testcases
	rm -rf *.ucdb work test_all_htmlreport_details *.log test_all_report transcript
	if (! -e work) then
		vlib work
	endif

	foreach testcase ($list)
		set testcase_uc = `echo $testcase | tr "[:lower:]" "[:upper:]"`
		vlog +cover +acc ../../dut/xswitch.svp ../../dut/dut_top.sv scoreboard.sv environment.sv generator.sv interface.sv tbench_top.sv transaction.sv driver.sv monitor.sv assertions.sv
		vlog +cover +acc +define+$testcase_uc ../regression_test/$testcase.sv

		vsim -coverage -vopt tbench_top -c -do "coverage save -onexit -cvg ../../results/phase9_testcases/$testcase.ucdb;run -all; exit"
	end
	cd ../../results/phase9_testcases/
	vcover merge -64 xswitch_fc.ucdb *.ucdb

	vcover report xswitch_fc.ucdb -output xswitch_fc_report.rpt
	vcover report -details -html xswitch_fc.ucdb -output xswitch_fc_html_report_details
	vcover report xswitch_fc.ucdb
else if ("$1" == "-cc") then
	cd ../verification/phase9_testcases
	rm -rf *.ucdb work xswitch_cc_htmlreport_details *.log xswitch_cc_report transcript
	if (! -e work) then
		vlib work
	endif

	foreach testcase ($list)
		set testcase_uc = `echo $testcase | tr "[:lower:]" "[:upper:]"`
		vlog +cover +acc ../../dut/xswitch.svp ../../dut/dut_top.sv scoreboard.sv environment.sv generator.sv interface.sv tbench_top.sv transaction.sv driver.sv monitor.sv assertions.sv
		vlog +cover +acc +define+$testcase_uc ../regression_test/$testcase.sv

		vsim -coverage -vopt tbench_top -c -do "coverage save -onexit -codeAll -directive ../../results/phase9_testcases/$testcase.ucdb;run -all; exit"
	end
	cd ../../results/phase9_testcases/
	vcover merge -64 xswitch_cc.ucdb *.ucdb

	vcover report xswitch_cc.ucdb -output xswitch_cc_report.rpt
	vcover report -details -html xswitch_cc.ucdb -output xswitch_cc_html_report_details
	vcover report xswitch_cc.ucdb

endif
