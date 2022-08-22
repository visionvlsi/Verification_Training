// Interface
interface simple_bus(input clk);
// Section 1
	logic rst;
	logic wr;
	logic [2:0]addr;
	logic       [7:0]wdata;
    logic  [7:0]rdata;
endinterface