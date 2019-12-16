`ifndef TESTBENCH_SV
`define TESTBENCH_SV

`timescale 1ns/1ns

`include "environment.sv"

program automatic testbench(downstream.driver input_vif[4], upstream.monitor output_vif[4]);
  //declaring environment instance
  environment env;
  integer sanity, min_payload, max_payload;

  initial begin
    sanity = 0;
    min_payload = 1;
    max_payload = 0;
  end

  initial begin

    //creating environment
    env = new(input_vif, output_vif, sanity, min_payload, max_payload);

    // setting the repeat count of generator such as 5, means to generate 5 packets
    env.gen.repeat_count = 900;

    $display("******************* Start of testcase ****************");
    //$root.tbench_top.dut.dut.enable_dut_bugs(11200941);

    env.run();
  end

  final
    $display("******************* End of testcase ****************");

endprogram

`endif
