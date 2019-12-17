`ifndef TESTBENCH_SV
`define TESTBENCH_SV

`include "environment.sv"

program automatic testbench(downstream.driver input_vif[4], upstream.monitor output_vif[4]);
  //declaring environment instance
  environment env;
  initial begin

    //creating environment
    env = new(input_vif, output_vif);

    // setting the repeat count of generator such as 5, means to generate 5 packets
    env.gen.repeat_count = 888;

    $root.tbench_top.dut.dut.enable_dut_bugs(11200941);

    $display("******************* Start of testcase ****************");
    env.run();
  end

  final
    $display("******************* End of testcase ****************");

endprogram

`endif
