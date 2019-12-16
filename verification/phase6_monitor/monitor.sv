`ifndef MONITOR_SV
`define MONITOR_SV

`include "transaction.sv"

class monitor;
  // class instances
  transaction trans;
  int port;
  int no_transactions;

  //creating virtual interface handle
  virtual upstream vif;

  //constructor
  function new(virtual upstream vif, int port);
    //getting the interface
    this.vif = vif;
    this.port = port;
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
      end
      else begin
        vif.cb_up.data_rd <= 1'b0;
      end
      no_transactions++;
    end
  endtask

endclass

`endif
