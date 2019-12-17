`include "transaction.sv"

module assertions(downstream input_vif[4], upstream output_vif[4]);

  property p_reset_0;
    @(posedge input_vif[0].clk)
      input_vif[0].reset == 1 |-> output_vif[0].data_out === 8'Hz && output_vif[0].addr_out === 0 && output_vif[0].valid_out === 0;
  endproperty

  counter_reset_check_0 : assert property(p_reset_0)
  else $display($stime,, "\tcounter reset check failed: reset=%d data_out=%d \n",
                input_vif[0].reset, input_vif[0].data_in[0]);

  property p_reset_1;
    @(posedge input_vif[1].clk)
      input_vif[1].reset == 1 |-> output_vif[1].data_out === 8'Hz && output_vif[1].addr_out === 0 && output_vif[1].valid_out === 0;
  endproperty

  counter_reset_check_1 : assert property(p_reset_1)
  else $display($stime,, "\tcounter reset check failed: reset=%d data_out=%d \n",
                input_vif[1].reset, input_vif[1].data_in[1]);

  property p_reset_2;
    @(posedge input_vif[2].clk)
      input_vif[2].reset == 1 |-> output_vif[2].data_out === 8'Hz && output_vif[2].addr_out === 0 && output_vif[2].valid_out === 0;
  endproperty

  counter_reset_check_2 : assert property(p_reset_2)
  else $display($stime,, "\tcounter reset check failed: reset=%d data_out=%d \n",
                input_vif[2].reset, input_vif[2].data_in[2]);

  property p_reset_3;
    @(posedge input_vif[3].clk)
      input_vif[3].reset == 1 |-> output_vif[3].data_out === 8'Hz && output_vif[3].addr_out === 0 && output_vif[3].valid_out === 0;
  endproperty

  counter_reset_check_3 : assert property(p_reset_3)
  else $display($stime,, "\tcounter reset check failed: reset=%d data_out=%d \n",
                input_vif[3].reset, input_vif[3].data_in[3]);

endmodule
