`ifndef GENERATOR_SV
`define GENERATOR_SV

`include "transaction.sv"
`include "coverage.sv"

class generator;
  //declaring transaction class
  rand transaction trans, driv_trans;
  coverage cov;

  // count number of transactions
  int no_transactions;

  //repeat count, to specify number of items to generate
  int repeat_count;

  // mailboxes
  mailbox gen2driv[4];

  integer sanity, min_payload, max_payload;

  //constructor
  function new(mailbox gen2driv[4], integer sanity, integer max_payload, integer min_payload);
    this.gen2driv[0] = gen2driv[0];
    this.gen2driv[1] = gen2driv[1];
    this.gen2driv[2] = gen2driv[2];
    this.gen2driv[3] = gen2driv[3];
    cov = new();

    this.sanity = sanity;
    this.min_payload = min_payload;
    this.max_payload = max_payload;
  endfunction

  task sanity_check();
    if(sanity) begin
      trans.addr_in_rand.constraint_mode(1);
      trans.port_in_rand.constraint_mode(1);
    end
    else if (max_payload) begin
      trans.data_size_max.constraint_mode(1);
      trans.data_size_min.constraint_mode(0);
    end
    else if (min_payload) begin
      trans.data_size_max.constraint_mode(0);
      trans.data_size_min.constraint_mode(1);
    end
  endtask

  //main task, generates (creates and randomizes) transaction packets
  task main();
    trans = new();
    repeat(repeat_count) begin
      sanity_check();
      if( !trans.randomize() ) $fatal("Gen:: trans randomization failed");
      no_transactions++;
      driv_trans = new();
      driv_trans.data_in = trans.data_in;
      driv_trans.addr_in = trans.addr_in;
      driv_trans.port_in = trans.port_in;
      //trans.display("[ Generator ]");
      gen2driv[driv_trans.port_in].put(driv_trans);
      // code coverage
      cov.sample_trans(driv_trans);
    end
  endtask

endclass

`endif
