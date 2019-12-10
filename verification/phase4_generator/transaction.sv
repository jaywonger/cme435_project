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

  $display("- data_in = %d, addr_in = %d, port_in = %d", data_in, addr_in, port_in);
  $display("data_out = %d, addr_out = %d, port_out = %d", data_out, addr_out, port_out);

  $display("");
  $display("-------------------------");
endfunction

endclass

`endif
