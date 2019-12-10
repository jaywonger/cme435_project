`ifndef TEST_NEWDATA_LEN_SV
`define TEST_NEWDATA_LEN_SV

integer data_len_received, newdata_len_errors;

task test_newdata_len();
  forever
  begin
    repeat(2) @(posedge $root.tbench_top.i_intf.bnd_plse);

    newdata_len_errors = 0;
    data_len_received = 0;
    for(int i=0; i<4; i++)
    begin
      @($root.tbench_top.i_intf.clk);
      if ($root.tbench_top.i_intf.newdata_len_1 ||
          $root.tbench_top.i_intf.newdata_len_2 ||
          $root.tbench_top.i_intf.newdata_len_3 ||
          $root.tbench_top.i_intf.newdata_len_4) data_len_received = 1;
    end

    if (data_len_received == 0)
    begin
      $display("%s\n", "NEWDATA_LEN not received within 1 to 4 cycles of the rising edge of packet-terminating assertion of BND_PLSE");
      newdata_len_errors++;
    end
  end
endtask

`endif
