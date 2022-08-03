module top();
logic        clk,rst,wr;
logic       [2:0]addr;
logic       [7:0]wdata;
logic  [7:0]rdata;


initial clk=0;
always #5 clk=~clk;

ram_dut dut_inst(.clk(clk),.rst(rst),.wdata(wdata),.rdata(rdata),.addr(addr),.wr(wr));
testbench tb_inst(.clk(clk),.rst(rst),.wdata(wdata),.rdata(rdata),.addr(addr),.wr(wr));

endmodule