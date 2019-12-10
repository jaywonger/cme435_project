`ifndef ENVIRONMENT_SV
`define ENVIRONMENT_SV

class environment;

virtual downstream input_vif[4];
virtual upstream output_vif[4];

// constructor
function new(virtual downstream input_vif[4], virtual upstream output_vif[4]);
  this.input_vif = input_vif;
  this.output_vif = output_vif;
endfunction

task pre_test();
  $display("%0d : Environment : start of pre_test()", $time);
  reset();
  $display("%0d : Environment : end of pre_test()", $time);
endtask

task reset();
  wait(input_vif[0].reset);
  $display("[ ENVIRONMENT ] ----- Reset Started -----");
  input_vif[3].cb_down.data_in <= 0;
  input_vif[2].cb_down.data_in <= 0;
  input_vif[1].cb_down.data_in <= 0;
  input_vif[0].cb_down.data_in <= 0;
  input_vif[3].cb_down.addr_in <= 0;
  input_vif[2].cb_down.addr_in <= 0;
  input_vif[1].cb_down.addr_in <= 0;
  input_vif[0].cb_down.addr_in <= 0;
  input_vif[3].cb_down.valid_in <= 0;
  input_vif[2].cb_down.valid_in <= 0;
  input_vif[1].cb_down.valid_in <= 0;
  input_vif[0].cb_down.valid_in <= 0;
  output_vif[3].cb_up.data_rd <= 0;
  output_vif[2].cb_up.data_rd <= 0;
  output_vif[1].cb_up.data_rd <= 0;
  output_vif[0].cb_up.data_rd <= 0;
  wait(!input_vif[0].reset);
  $display("[ ENVIRONMENT ] ----- Reset Ended   -----");
endtask

task test();
  $display("%0d : Environment : start of test()", $time);

  $display("%0d : Environment : end of test()", $time);
endtask

task post_test();
  $display("%0d : Environment : start of post_test()", $time);

  $display("%0d : Environment : end of post_test()", $time);
endtask

//run task
task run;
  $display("%0d : Environment : start of run()", $time);
  pre_test();
  test();
  post_test();
  $display("%0d : Environment : end of run()", $time);
  $finish;
endtask


endclass

`endif
