`timescale 1ns / 1ps

module test;

	// Inputs
	reg [7:0] data_in;
	reg clk;
	reg rst;
	reg rd;
	reg wr;

	// Outputs
	wire [3:0] fifo_cnt;
	wire [7:0] data_out;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.data_in(data_in), 
		.clk(clk), 
		.rst(rst), 
		.rd(rd), 
		.wr(wr), 
		.fifo_cnt(fifo_cnt), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		forever #5 clk=~clk;
		end
      
		initial begin
		@(negedge clk);
		rst=1;
		@(posedge clk);
		rst=1;
		@(negedge clk);
		rst=0; wr=1; 
		for(i=0; i<=7; i=i+1) begin
		@(negedge clk);
	    data_in<=i*5;
		 @(posedge clk);
		 data_in<=i*5;
		 end
		 @(negedge clk);
		rd=1; 
		for(i=0; i<=7; i=i+1) begin
		@(negedge clk);
	   	rd=1; 
		 @(posedge clk);
			rd=1; 
		 end
		 end
endmodule

