`ifndef TEST_DATA_TRIM_SV
`define TEST_DATA_TRIM_SV

integer data_trimmed, data_trim_errors;

task test_data_trim();
  forever
  begin
    @(posedge $root.tbench_top.i_intf.ack);

    data_trim_errors = 0;
    data_trimmed = 0;
    if ($root.tbench_top.i_intf.newdata_len_1 == 4 ||
        $root.tbench_top.i_intf.newdata_len_1 == 8 ||
        $root.tbench_top.i_intf.newdata_len_1 == 12 ||
        $root.tbench_top.i_intf.newdata_len_1 == 16 ||
        $root.tbench_top.i_intf.newdata_len_2 == 4 ||
        $root.tbench_top.i_intf.newdata_len_2 == 8 ||
        $root.tbench_top.i_intf.newdata_len_2 == 12 ||
        $root.tbench_top.i_intf.newdata_len_2 == 16 ||
        $root.tbench_top.i_intf.newdata_len_3 == 4 ||
        $root.tbench_top.i_intf.newdata_len_3 == 8 ||
        $root.tbench_top.i_intf.newdata_len_3 == 12 ||
        $root.tbench_top.i_intf.newdata_len_3 == 16 ||
        $root.tbench_top.i_intf.newdata_len_4 == 4 ||
        $root.tbench_top.i_intf.newdata_len_4 == 8 ||
        $root.tbench_top.i_intf.newdata_len_4 == 12 ||
        $root.tbench_top.i_intf.newdata_len_4 == 16) data_trimmed = 1;

    if (data_trimmed == 0)
    begin
      $display("%s\n", "DATA_OUT did not trim out destination port");
      data_trim_errors++;
    end
  end
endtask

`endif
