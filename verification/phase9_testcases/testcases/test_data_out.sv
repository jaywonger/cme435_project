`ifndef TEST_DATA_OUT_SV
`define TEST_DATA_OUT_SV

integer data_out_received, data_out_errors;

task test_data_out();
  forever
  begin
    @(posedge $root.tbench_top.i_intf.proceed_1 or
      posedge $root.tbench_top.i_intf.proceed_2 or
      posedge $root.tbench_top.i_intf.proceed_3 or
      posedge $root.tbench_top.i_intf.proceed_4);

    data_out_errors = 0;
    data_out_received = 0;
    @(posedge $root.tbench_top.i_intf.clk);
    if ($root.tbench_top.i_intf.data_out_1 ||
        $root.tbench_top.i_intf.data_out_2 ||
        $root.tbench_top.i_intf.data_out_3 ||
        $root.tbench_top.i_intf.data_out_4) data_out_received = 1;

    if (data_out_received == 0)
    begin
      $display("%s\n", "First packet byte of DATA_OUT not received within 1 cycle after assertion of PROCEED");
      data_out_errors++;
    end
  end
endtask

`endif
