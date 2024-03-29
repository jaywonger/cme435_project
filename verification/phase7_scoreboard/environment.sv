`ifndef ENVIRONMENT_SV
`define ENVIRONMENT_SV

`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  // declaring the classes
  generator gen;
  driver driv[4];
  monitor mon[4];
  scoreboard scb;

  //creaing mailbox handle
  mailbox gen2driv[4], mon2scb[4], driv2scb[4];

  // virtual interface
  virtual downstream input_vif[4];
  virtual upstream output_vif[4];

  // constructor
  function new(virtual downstream input_vif[4], virtual upstream output_vif[4]);
    this.input_vif = input_vif;
    this.output_vif = output_vif;

    for (int i=0; i<4; i++) begin
      gen2driv[i] = new();
      mon2scb[i] = new();
      driv2scb[i] = new();
      driv[i] = new(this.input_vif[i], gen2driv[i], driv2scb[i]);
      mon[i] = new(this.output_vif[i], i, mon2scb[i]);
    end
    gen = new(gen2driv);
    scb = new(mon2scb, driv2scb);
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
    $display("%0d : Generator Packets: %0d", $time, gen.repeat_count);
    fork
      driv[0].main();
      driv[1].main();
      driv[2].main();
      driv[3].main();
      mon[0].main();
      mon[1].main();
      mon[2].main();
      mon[3].main();
      scb.main();
    join_none

    wait(driv[0].no_transactions + driv[1].no_transactions
        + driv[2].no_transactions + driv[3].no_transactions == gen.repeat_count);
    $display("%0d : Driver Packets: %0d", $time, gen.repeat_count);

    // these wait statements break everything since there can be lost packets
    // need a better way to check
    wait(mon[0].no_transactions + mon[1].no_transactions
        + mon[2].no_transactions + mon[3].no_transactions == gen.repeat_count);
    $display("%0d : Monitor Packets: %0d", $time, gen.repeat_count);

    //$display("%0d : scb no transactions: %d", $time, scb.no_transactions.sum());
    //$display("%0d : scb errors: %d", $time, scb.no_transactions.sum());
    //$display("%0d : scb packet: %d", $time, gen.repeat_count);
    wait(scb.no_transactions.sum() + scb.scb_errors.sum() == gen.repeat_count);
    $display("%0d : Scoreboard Packets: %0d", $time, gen.repeat_count);

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
