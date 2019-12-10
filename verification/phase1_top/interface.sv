`ifndef INTERFACE_SV
`define INTERFACE_SV

interface downstream(input logic clk, rst_b);

  logic [7:0] addr_in;
  logic [7:0] data_in;
  logic       valid_in;
  logic       rcv_rdy;


  clocking cb_down@(posedge clk);
    output data_in;
    output addr_in;
    input rcv_rdy;
    output valid_in;
  endclocking

  modport dut(input clk, rst_b,
              input data_in, input addr_in,
              output rcv_rdy,
              input valid_in);

endinterface

interface upstream(input logic clk, rst_b);
  logic [7:0] addr_out;
  logic [7:0] data_out;
  logic       valid_out;
  logic       data_rd;

  clocking cb_up@(posedge clk);
    input data_out;
    input addr_out;
    output data_rd;
    input valid_out;
  endclocking

  modport dut(input clk, rst_b,
              output data_out, output addr_out,
              input data_rd,
              output valid_out);

endinterface

`endif
