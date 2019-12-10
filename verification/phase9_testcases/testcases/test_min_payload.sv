`ifndef TESTBENCH_SV
`define TESTBENCH_SV

`include "testbench/environment.sv"
`include "testcases/test_ack.sv"
`include "testcases/test_newdata_len.sv"
`include "testcases/test_data_out.sv"
`include "testcases/test_data_trim.sv"

program testbench(intf i_intf);
  task error_check();
    begin
      wait(env.gen.ended.triggered); // optional
      wait(env.gen.repeat_count == env.driv.no_transactions);
      wait(env.gen.repeat_count == env.scb.no_transactions);

      if (ack_errors > 0)
        $display("############### ACK TEST FAILED %0d time(s) ###############", ack_errors);
      else
        $display("############### ACK TEST PASSED ###############");
      if (data_out_errors > 0)
        $display("############### DATA_OUT TEST FAILED %0d time(s) ###############", data_out_errors);
      else
      $display("############### DATA_OUT TEST PASSED ###############");
      if (data_trim_errors > 0)
        $display("############### DATA TRIM TEST FAILED %0d time(s) ###############", data_trim_errors);
      else
        $display("############### DATA TRIM TEST PASSED ###############");
      if (newdata_len_errors > 0)
        $display("############### NEWDATA_LEN TEST FAILED %0d time(s) ###############", newdata_len_errors);
      else
        $display("############### NEWDATA_LEN TEST PASSED ###############");
      if (env.scb.scb_errors > 0)
        $display("############### SCOREBOARD TEST FAILED %0d time(s) ###############", env.scb.scb_errors);
      else
        $display("############### SCOREBOARD TEST PASSED ###############");

      repeat(2)@(env.input_vif.clk);
      $display("******************* End of testcase ****************");
      $finish;
    end
  endtask

  //declaring environment instance
  environment env;

  integer sanity, buffer, min_payload, max_payload;

  initial
  begin
    sanity = 0;
    buffer = 0;
    min_payload = 1;
    max_payload = 0;

    //creating environment
    env = new(i_intf.driver, i_intf.monitor,
              sanity, buffer, min_payload, max_payload);

    //setting the repeat count of generator such as 5, means to generate 5 packets
    env.gen.repeat_count = 4;

    $display("******************* Start of testcase ****************");

    fork
      //calling run of env, it in turns calls other main tasks.
      env.run();
      test_ack();
      test_data_out();
      test_data_trim();
      test_newdata_len();
    join_none
    error_check();
  end

endprogram

`endif
