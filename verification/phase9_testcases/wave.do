onerror {resume}
quietly virtual signal -install /tbench_top/dut/dut { /tbench_top/dut/dut/data_in[31:24]} data_in3
quietly virtual signal -install /tbench_top/dut/dut { /tbench_top/dut/dut/data_in[23:16]} data_in2
quietly virtual signal -install /tbench_top/dut/dut { /tbench_top/dut/dut/data_in[15:8]} data_in1
quietly virtual signal -install /tbench_top/dut/dut { /tbench_top/dut/dut/data_in[7:0]} data_in0
quietly virtual signal -install /tbench_top/dut/dut { /tbench_top/dut/dut/addr_in[31:24]} addr_in3
quietly virtual signal -install /tbench_top/dut/dut { /tbench_top/dut/dut/addr_in[23:16]} addr_in2
quietly virtual signal -install /tbench_top/dut/dut { /tbench_top/dut/dut/addr_in[15:8]} addr_in1
quietly virtual signal -install /tbench_top/dut/dut { /tbench_top/dut/dut/addr_in[7:0]} addr_in0
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/rcv_rdy[3]  } rcv_rdy3
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/rcv_rdy[2]  } rcv_rdy2
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/rcv_rdy[1]  } rcv_rdy1
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/rcv_rdy[0]  } rcv_rdy0
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/valid_in[3]  } valid_in3
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/valid_in[2]  } valid_in2
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/valid_in[1]  } valid_in1
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/valid_in[0]  } valid_in0
quietly virtual function -install /tbench_top/dut/dut -env /tbench_top/dut/dut { &{/tbench_top/dut/dut/data_out[31], /tbench_top/dut/dut/data_out[30], /tbench_top/dut/dut/data_out[29], /tbench_top/dut/dut/data_out[28], /tbench_top/dut/dut/data_out[27], /tbench_top/dut/dut/data_out[26], /tbench_top/dut/dut/data_out[25], /tbench_top/dut/dut/data_out[24] }} data_out3
quietly virtual function -install /tbench_top/dut/dut -env /tbench_top/dut/dut { &{/tbench_top/dut/dut/data_out[23], /tbench_top/dut/dut/data_out[22], /tbench_top/dut/dut/data_out[21], /tbench_top/dut/dut/data_out[20], /tbench_top/dut/dut/data_out[19], /tbench_top/dut/dut/data_out[18], /tbench_top/dut/dut/data_out[17], /tbench_top/dut/dut/data_out[16] }} data_out2
quietly virtual function -install /tbench_top/dut/dut -env /tbench_top/dut/dut { &{/tbench_top/dut/dut/data_out[15], /tbench_top/dut/dut/data_out[14], /tbench_top/dut/dut/data_out[13], /tbench_top/dut/dut/data_out[12], /tbench_top/dut/dut/data_out[11], /tbench_top/dut/dut/data_out[10], /tbench_top/dut/dut/data_out[9], /tbench_top/dut/dut/data_out[8] }} data_out1
quietly virtual function -install /tbench_top/dut/dut -env /tbench_top/dut/dut { &{/tbench_top/dut/dut/data_out[7], /tbench_top/dut/dut/data_out[6], /tbench_top/dut/dut/data_out[5], /tbench_top/dut/dut/data_out[4], /tbench_top/dut/dut/data_out[3], /tbench_top/dut/dut/data_out[2], /tbench_top/dut/dut/data_out[1], /tbench_top/dut/dut/data_out[0] }} data_out0
quietly virtual function -install /tbench_top/dut/dut -env /tbench_top/dut/dut { &{/tbench_top/dut/dut/addr_out[31], /tbench_top/dut/dut/addr_out[30], /tbench_top/dut/dut/addr_out[29], /tbench_top/dut/dut/addr_out[28], /tbench_top/dut/dut/addr_out[27], /tbench_top/dut/dut/addr_out[26], /tbench_top/dut/dut/addr_out[25], /tbench_top/dut/dut/addr_out[24] }} addr_out3
quietly virtual function -install /tbench_top/dut/dut -env /tbench_top/dut/dut { &{/tbench_top/dut/dut/addr_out[23], /tbench_top/dut/dut/addr_out[22], /tbench_top/dut/dut/addr_out[21], /tbench_top/dut/dut/addr_out[20], /tbench_top/dut/dut/addr_out[19], /tbench_top/dut/dut/addr_out[18], /tbench_top/dut/dut/addr_out[17], /tbench_top/dut/dut/addr_out[16] }} addr_out2
quietly virtual function -install /tbench_top/dut/dut -env /tbench_top/dut/dut { &{/tbench_top/dut/dut/addr_out[15], /tbench_top/dut/dut/addr_out[14], /tbench_top/dut/dut/addr_out[13], /tbench_top/dut/dut/addr_out[12], /tbench_top/dut/dut/addr_out[11], /tbench_top/dut/dut/addr_out[10], /tbench_top/dut/dut/addr_out[9], /tbench_top/dut/dut/addr_out[8] }} addr_out1
quietly virtual function -install /tbench_top/dut/dut -env /tbench_top/dut/dut { &{/tbench_top/dut/dut/addr_out[7], /tbench_top/dut/dut/addr_out[6], /tbench_top/dut/dut/addr_out[5], /tbench_top/dut/dut/addr_out[4], /tbench_top/dut/dut/addr_out[3], /tbench_top/dut/dut/addr_out[2], /tbench_top/dut/dut/addr_out[1], /tbench_top/dut/dut/addr_out[0] }} addr_out0
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/data_rd[3]  } data_rd3
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/data_rd[2]  } data_rd2
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/data_rd[1]  } data_rd1
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/data_rd[0]  } data_rd0
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/valid_out[3]  } valid_out3
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/valid_out[2]  } valid_out2
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/valid_out[1]  } valid_out1
quietly virtual signal -install /tbench_top/dut/dut {/tbench_top/dut/dut/valid_out[0]  } valid_out0
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tbench_top/dut/dut/clk
add wave -noupdate -radix unsigned /tbench_top/dut/dut/reset
add wave -noupdate -divider data_in
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_in3
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_in2
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_in1
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_in0
add wave -noupdate -divider addr_in
add wave -noupdate -radix unsigned /tbench_top/dut/dut/addr_in3
add wave -noupdate -radix unsigned /tbench_top/dut/dut/addr_in2
add wave -noupdate -radix unsigned /tbench_top/dut/dut/addr_in1
add wave -noupdate -radix unsigned /tbench_top/dut/dut/addr_in0
add wave -noupdate -divider rcv_rdy
add wave -noupdate -radix unsigned /tbench_top/dut/dut/rcv_rdy3
add wave -noupdate -radix unsigned /tbench_top/dut/dut/rcv_rdy2
add wave -noupdate -radix unsigned /tbench_top/dut/dut/rcv_rdy1
add wave -noupdate -radix unsigned /tbench_top/dut/dut/rcv_rdy0
add wave -noupdate -divider valid_in
add wave -noupdate -radix unsigned /tbench_top/dut/dut/valid_in3
add wave -noupdate -radix unsigned /tbench_top/dut/dut/valid_in2
add wave -noupdate -radix unsigned /tbench_top/dut/dut/valid_in1
add wave -noupdate -radix unsigned /tbench_top/dut/dut/valid_in0
add wave -noupdate -divider data_out
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_out3
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_out2
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_out1
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_out0
add wave -noupdate -divider addr_out
add wave -noupdate -radix unsigned /tbench_top/dut/dut/addr_out3
add wave -noupdate -radix unsigned /tbench_top/dut/dut/addr_out2
add wave -noupdate -radix unsigned /tbench_top/dut/dut/addr_out1
add wave -noupdate -radix unsigned /tbench_top/dut/dut/addr_out0
add wave -noupdate -divider data_rd
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_rd3
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_rd2
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_rd1
add wave -noupdate -radix unsigned /tbench_top/dut/dut/data_rd0
add wave -noupdate -divider valid_out
add wave -noupdate -radix unsigned /tbench_top/dut/dut/valid_out3
add wave -noupdate -radix unsigned /tbench_top/dut/dut/valid_out2
add wave -noupdate -radix unsigned /tbench_top/dut/dut/valid_out1
add wave -noupdate -radix unsigned /tbench_top/dut/dut/valid_out0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 261
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {182 ns}
