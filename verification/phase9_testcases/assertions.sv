`include "transaction.sv"

module assertions(downstream.driver input_vif[4], upstream.monitor output_vif[4]);

  property p_counter_reset;
    @(posedge input_vif.clk)
      input_vif[0].reset == 1 |-> input_vif[0].data_in == 0 && input_vif[0].addr_in == 0 && input_vif[0].valid_in == 0;
  endproperty

  counter_reset_check : assert property(p_counter_reset)
  else $display($stime,, "\tcounter reset check failed: reset=%d data_out=%d \n",
                input_vif.reset, input_vif.data_in);


endmodule
