`timescale 1ns/1ns

`ifndef TBENCH_TOP_SV
`define TBENCH_TOP_SV

module tbench_top;
  //clock and reset signal declaration
  bit clk;
  bit reset;

  //clock generation
  always #10 clk = ~clk;

  //reset Generation
  initial begin
    reset = 0;
    #10 reset = 1;
  end

  //creating instance of interface, inorder to connect DUT and testcase
  downstream input_vif[4](clk, reset);
  upstream output_vif[4](clk, reset);

  //Testcase instance, interface handle is passed to test as an argument
  testbench test(input_vif, output_vif);

  //DUT instance, interface signals are connected to the DUT ports
  dut_top dut(i_intf.dut);

  //enabling the wave dump
  initial begin
  $dumpfile("dump.vcd"); $dumpvars;
  end

endmodule

`endif
