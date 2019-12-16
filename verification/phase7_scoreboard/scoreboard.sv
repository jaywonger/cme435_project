`ifndef SCOREBOARD_SV
`define SCOREBOARD_SV

`include "transaction.sv"

class scoreboard;
  //creating mailbox handle
  mailbox mon2scb[4], driv2scb[4];

  //count the number of transactions
  int no_transactions[4] = {0, 0, 0, 0};

  // error counter
  integer scb_errors[4] = {0,0,0,0};

  //constructor
  function new(mailbox mon2scb[4], mailbox driv2scb[4]);
    //getting the mailbox handles from environment
    this.mon2scb = mon2scb;
    this.driv2scb = driv2scb;
  endfunction

  task port_check(int port);
    transaction trans_mon, trans_driv;
    forever begin
      mon2scb[port].get(trans_mon);
      driv2scb[trans_mon.addr_out].get(trans_driv);
      scb_errors[port]++;
      no_transactions[port]++;
      trans_driv.display("[ Scoreboard - Driver ]");
      trans_mon.display("[ Scoreboard - Monitor ]");
    end
  endtask

  task main;
    fork
      port_check(0);
      port_check(1);
      port_check(2);
      port_check(3);
    join_none
  endtask

endclass

`endif
