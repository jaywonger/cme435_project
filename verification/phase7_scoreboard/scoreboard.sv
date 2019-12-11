`ifndef SCOREBOARD_SV
`define SCOREBOARD_SV

`include "verification/phase7_scoreboard/transaction.sv"

class scoreboard;
  //creating mailbox handle
  mailbox mon2scb[4], driv2scb[4];

  //count the number of transactions
  int no_transactions[4] = {0, 0, 0, 0};

  //virtual interface
  virtual downstream vif;

  // error counter
  integer scb_errors[4] = {0,0,0,0};

  //constructor
  function new(virtual downstream vif, mailbox mon2scb[4], mailbox driv2scb[4]);
    this.vif = vif;
    //getting the mailbox handles from environment
    this.mon2scb = mon2scb;
    this.driv2scb = driv2scb;
  endfunction

  task boxes(int port);
    transaction trans_mon, trans_driv;
    while(1) begin
      mon2scb[port].get(trans_mon);
      if (driv2scb[trans_mon.addr_out].num() > 0) begin
        driv2scb[trans_mon.addr_out].get(trans_driv);
        end
      else begin
        scb_errors[port]++;
      end

      no_transactions[port]++;
      trans_driv.display("[ Scoreboard - Driver ]");
      trans_mon.display("[ Scoreboard - Monitor ]");
    end
  endtask

  task main;
    forever begin
      boxes(0);
      boxes(1);
      boxes(2);
      boxes(3);
    end
  endtask

endclass

`endif
