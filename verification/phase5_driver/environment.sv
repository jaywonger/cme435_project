`ifndef ENVIRONMENT_SV
`define ENVIRONMENT_SV

`include "verification/phase5_driver/generator.sv"
`include "verification/phase5_driver/driver.sv"

class environment;
  // declaring the classes
  generator gen;
  driver driv[4];

  // mailbox handles
  mailbox gen2driv[4];

  virtual downstream input_vif[4];
  virtual upstream output_vif[4];

  // constructor
  function new(virtual downstream input_vif[4], virtual upstream output_vif[4]);
    this.input_vif = input_vif;
    this.output_vif = output_vif;

    for (int i=0; i<4; i++) begin
        gen2driv[i] = new();
        driv[i] = new(this.input_vif[i], gen2driv[i]);
    end

    gen = new(gen2driv);
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
    gen.main();
    wait(gen.no_transactions == gen.repeat_count);

    fork
      driv[0].main();
      driv[1].main();
      driv[2].main();
      driv[3].main();
    join_none
    wait(driv[0].no_transactions == gen.repeat_count/4);
    wait(driv[1].no_transactions == gen.repeat_count/4);
    wait(driv[2].no_transactions == gen.repeat_count/4);
    wait(driv[3].no_transactions == gen.repeat_count/4);

    $display("%0d : Generated Packets: %d", $time, gen.no_transactions);
  //  $display("%0d : Generated Packets Driver: %d", $time, driv.no_transactions);
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
