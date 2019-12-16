#!/bin/csh -f
source /CMC/scripts/mentor.questasim.2019.2.csh
set list="testbench"

if ("$1" == "-l") then
	foreach testcase ($list)
		echo $testcase
	end
else if ("$1" == "-f") then
	cd ../verification/phase8_coverage
	if (! -e work) then
	   vlib work
	endif
	vmap work work

  vlog ../../dut/xswitch.svp ../../dut/dut_top.sv scoreboard.sv environment.sv generator.sv interface.sv tbench_top.sv testbench.sv transaction.sv driver.sv monitor.sv

  vsim -vopt tbench_top -c -do 'run -all; exit'
else
	cd ../verification/phase8_coverage
	rm -rf *.ucdb work test_all_htmlreport_details *.log test_all_report transcript
	if (! -e work) then
		vlib work
	endif

  foreach testcase ($list)
    set testcase_uc = `echo $testcase | tr "[:lower:]" "[:upper:]"`

  		vlog +cover +acc ../../dut/xswitch.svp
  		vlog +cover +acc ../../dut/dut_top.sv
  		vlog +cover +acc interface.sv
  		vlog +cover +acc testbench.sv
  		vlog +cover +acc tbench_top.sv
  		vlog +cover +acc transaction.sv
  		vlog +cover +acc generator.sv
  		vlog +cover +acc driver.sv
  		vlog +cover +acc monitor.sv
  		vlog +cover +acc environment.sv
  		vlog +cover +acc scoreboard.sv
  		vlog +cover +acc coverage.sv

  	 vsim -coverage -vopt tbench_top -c -do "coverage save -onexit ../../results/phase8_coverage/$testcase.ucdb;run -all; exit"
  end
  cd ../../results/phase8_coverage/
  vcover merge -64 test_all.ucdb *.ucdb

  vcover report test_all.ucdb -output test_all_report.rpt
  vcover report -details -html test_all.ucdb -output htmlreport_details
  vcover report test_all.ucdb
endif
