`timescale 1ns/1ns

module dut_top(downstream.dut input_vif[4], upstream.dut output_vif[4]);

// some random connection for the tb by using the interface
  xswitch dut (
    .clk(input_vif[0].clk),
    .reset(input_vif[0].reset),
    .addr_in({input_vif[3].addr_in,
              input_vif[2].addr_in,
              input_vif[1].addr_in,
              input_vif[0].addr_in}),
    .data_in({input_vif[3].data_in,
              input_vif[2].data_in,
              input_vif[1].data_in,
              input_vif[0].data_in}),
    .valid_in({input_vif[3].valid_in,
               input_vif[2].valid_in,
               input_vif[1].valid_in,
               input_vif[0].valid_in}),
    .rcv_rdy({input_vif[3].rcv_rdy,
              input_vif[2].rcv_rdy,
              input_vif[1].rcv_rdy,
              input_vif[0].rcv_rdy}),
    .addr_out({output_vif[3].addr_out,
               output_vif[2].addr_out,
               output_vif[1].addr_out,
               output_vif[0].addr_out}),
    .data_out({output_vif[3].data_out,
               output_vif[2].data_out,
               output_vif[1].data_out,
               output_vif[0].data_out}),
    .valid_out({output_vif[3].valid_out,
                output_vif[2].valid_out,
                output_vif[1].valid_out,
                output_vif[0].valid_out}),
    .data_rd({output_vif[3].data_rd,
              output_vif[2].data_rd,
              output_vif[1].data_rd,
              output_vif[0].data_rd})
   );

endmodule
