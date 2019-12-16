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
    reset = 1;
    #10 reset = 0;
  end

  //creating instance of interface, inorder to connect DUT and testcase
  downstream input_vif[4](clk, reset);
  upstream output_vif[4](clk, reset);

  //Testcase instance, interface handle is passed to test as an argument
  testbench test(input_vif, output_vif);

  //DUT instance, interface signals are connected to the DUT ports
  dut_top dut(.input_vif(input_vif), .output_vif(output_vif));

  //bind dut_top assertions ass(.input_vif(input_vif), .output_vif(output_vif));

  //enabling the wave dump
  initial begin
  $dumpfile("dump.vcd"); $dumpvars;
  end

endmodule

`endif
