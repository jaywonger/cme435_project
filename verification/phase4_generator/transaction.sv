`ifndef TRANSACTION
`define TRANSACTION

class transaction;
// inputs
rand bit [7:0] data_in;
randc bit [7:0] addr_in;
randc bit [7:0] port_in;

bit [7:0] data_out;
bit [7:0] addr_out;
bit [7:0] port_out;

/*------------Constraints------------*/
// address 0 to 3
constraint addr_in_rand {
  soft addr_in inside {[0:3]};
}

// ports 0 to 3
constraint port_in_rand {
  soft port_in inside {[0:3]};
}
/*-----------------------------------*/

function void display(string name);
  $display("- %s ", name);
  $display("-------------------------");

  $display("%0d : data_in = %0d, addr_in = %0d, port_in = %0d", $time, data_in, addr_in, port_in);

  $display("");
  $display("-------------------------");
endfunction

endclass

`endif
