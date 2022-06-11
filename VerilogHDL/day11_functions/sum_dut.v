module dut(a,b,c);

	input a,b;
	output [1:0]c;
	
	function [1:0]sum(input a,b);
	
		 sum = a+b;
		 
	endfunction
	
	assign c = sum(a,b);
	
endmodule


/*
function [1:0]sum;
	
	input a,b;
	
		 sum = a+b;
		 
	endfunction
*/
