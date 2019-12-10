`ifndef GENERATOR_SV
`define GENERATOR_SV

`include "verification/phase5_driver/transaction.sv"

class generator;
  //declaring transaction class
  rand transaction trans, driv_trans;
  int no_transactions;

  //repeat count, to specify number of items to generate
  int repeat_count;

  // mailboxes
  mailbox gen2driv[4];

  //constructor
  function new(mailbox gen2driv[4]);
    this.gen2driv[0] = gen2driv[0];
    this.gen2driv[1] = gen2driv[1];
    this.gen2driv[2] = gen2driv[2];
    this.gen2driv[3] = gen2driv[3];
  endfunction

  //main task, generates (creates and randomizes) transaction packets
  task main();
    trans = new();
    repeat(repeat_count) begin
      if( !trans.randomize() ) $fatal("Gen:: trans randomization failed");
      no_transactions++;
      driv_trans = new();
      driv_trans.data_in = trans.data_in;
      driv_trans.addr_in = trans.addr_in;
      driv_trans.port_in = trans.port_in;
      trans.display("[ Generator ]");
      gen2driv[driv_trans.port_in].put(driv_trans);
    end
  endtask

endclass

`endif
