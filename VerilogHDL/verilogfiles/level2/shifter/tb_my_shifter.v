`timescale 1ns / 1ps

module tb;

	// Inputs
	reg [3:0] data_in;
	reg [1:0] control;

	// Outputs
	wire [3:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	my_shifter uut (
		.data_in(data_in), 
		.control(control), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		data_in = 4'b1010;
		#5 control = 0;
		#5 control = 1;
        #5 control = 2;
        #5 control = 3;
		#5 control = 0;
        #5 $finish;

	end
      
endmodule