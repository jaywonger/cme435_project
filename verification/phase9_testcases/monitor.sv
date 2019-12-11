`ifndef MONITOR_SV
`define MONITOR_SV

`include "verification/phase9_testcases/transaction.sv"

class monitor;
  // class instances
  transaction trans;
  int port;
  int no_transactions;

  // mailbox handles
  mailbox mon2scb;

  //creating virtual interface handle
  virtual upstream vif;

  //constructor
  function new(virtual upstream vif, int port, mailbox mon2scb);
    //getting the interface
    this.vif = vif;
    this.port = port;
    this.mon2scb = mon2scb;
  endfunction

  task main();
    forever begin
      @vif.cb_up;
      if(vif.cb_up.valid_out) begin
        trans = new();
        vif.cb_up.data_rd <= 1'b1;
        trans.port_out = port;
        trans.data_out = vif.cb_up.data_out;
        trans.addr_out = vif.cb_up.addr_out;
        trans.display("[ Monitor ]");
        mon2scb.put(trans);
        no_transactions++;
      end
      else
        vif.cb_up.data_rd <= 1'b0;
    end
  endtask

endclass

`endif
