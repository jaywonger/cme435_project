`ifndef DRIVER_SV
`define DRIVER_SV

`include "verification/phase6_monitor/transaction.sv"

class driver;
  //used to count the number of transactions
  int no_transactions;

  //creating virtual interface handle
  virtual downstream vif;

  //creating mailbox handle
  mailbox gen2driv;

  //constructor
  function new(virtual downstream vif, mailbox gen2driv);
    //getting the interface
    this.vif = vif;
    //getting the mailbox handles from environment
    this.gen2driv = gen2driv;
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
        no_transactions++;
    end
  endtask

endclass

`endif
