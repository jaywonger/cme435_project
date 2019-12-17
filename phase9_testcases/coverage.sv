`ifndef COVERAGE_SV
`define COVERAGE_SV

`include "transaction.sv"

class coverage;
  // declaring classes
  transaction trans;

  covergroup trans_cg;
    data_in : coverpoint trans.data_in {
      bins low = {0};
      bins med = {[1:254]};
      bins high = {255};
    }
    // what address it is coming out o
    // read up on covergroup
    addr_in : coverpoint trans.addr_in {
      bins port0 = {0};
      bins port1 = {1};
      bins port2 = {2};
      bins port3 = {3};
    }
    valid_in : coverpoint trans.valid_in {
      bins valid_in_low = {0};
      bins valid_in_high = {1};
    }
    cross data_in, addr_in, valid_in;
  endgroup

  function void sample_trans(transaction trans);
    this.trans = trans;
    trans_cg.sample();
  endfunction

  function new();
    trans_cg = new();
  endfunction

endclass

`endif
