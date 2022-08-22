
module top;
  
bit clk;
always #5 clk = ~clk;

// Section 1:
simple_bus intf_inst(clk);

//Section 2:  DUT instantiation
ram_dut dut_inst(.clk(clk),.rst(intf_inst.rst), .wdata(intf_inst.wdata), .rdata(intf_inst.rdata),.addr(intf_inst.addr),.wr(intf_inst.wr));

//Section 3:  Program Block (TB) instantiation

 testbench tb_inst(intf_inst);

endmodule