`ifndef TESTBENCH_SV
`define TESTBENCH_SV

program automatic testbench(downstream input_vif[4], upstream output_vif[4]);
  //declaring environment instance

  initial begin

    //creating environment
    $display("******************* Start of testcase ****************");
  end

  final
    $display("******************* End of testcase ****************");

endprogram

`endif
