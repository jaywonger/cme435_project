`ifndef TEST_ACK_SV
`define TEST_ACK_SV

integer acknowledged, ack_errors;

task test_ack();
  forever
  begin
    repeat(2) @(posedge $root.tbench_top.i_intf.bnd_plse);

    ack_errors = 0;
    acknowledged = 0;
    for(int i=0; i<4; i++) begin
      @($root.tbench_top.i_intf.clk);
      if ($root.tbench_top.i_intf.ack) acknowledged = 1;
    end

    if (acknowledged == 0)
    begin
      $display("%s\n", "ACK not received within 1 to 4 cycles of the rising edge of packet-terminating assertion of BND_PLSE");
      ack_errors++;
    end
  end
endtask

`endif
