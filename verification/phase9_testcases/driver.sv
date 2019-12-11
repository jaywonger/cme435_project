`ifndef DRIVER_SV
`define DRIVER_SV

`include "verification/phase9_testcases/transaction.sv"

class driver;
  //used to count the number of transactions
  int no_transactions;

  //creating virtual interface handle
  virtual downstream vif;

  //creating mailbox handle
  mailbox gen2driv, driv2scb;

  //constructor
  function new(virtual downstream vif, mailbox gen2driv, mailbox driv2scb);
    //getting the interface
    this.vif = vif;
    //getting the mailbox handles from environment
    this.gen2driv = gen2driv;
    this.driv2scb = driv2scb;
  endfunction

  //drive the transaction items to interface signals
  task main();
    transaction trans;
    forever begin
      @vif.cb_down;
        gen2driv.get(trans);
        vif.cb_down.valid_in <= 1'b1;
        vif.cb_down.data_in <= trans.data_in;
        vif.cb_down.addr_in <= trans.addr_in;
        trans.display("[ Driver ]");
        driv2scb.put(trans);
        no_transactions++;
    end
  endtask

endclass

`endif
