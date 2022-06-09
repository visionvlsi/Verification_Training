module tb;

	reg a;
	reg b;
	wire [1:0]c;
	
	dut uut(.a(a),.b(b),.c(c));
	
	initial begin
	
	a = 0;
	b = 0;
	
	#10;
	
	a = 0;
	b = 1;
	
	#10;
	
	a = 1;
	b = 0;
	
	#10;
	
	a = 1;
	b = 1;
	
	
	end
	
	endmodule