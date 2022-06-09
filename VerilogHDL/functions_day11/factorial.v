module tb;

	function automatic [15:0] factorial;
	
		input [15:0] num;
			
			begin
			
				if(num == 1)
					factorial = 1;
					
				else 
					factorial = num * factorial(num - 1);// 4* factorial(4-1)
					
			end
	
	endfunction
	
	initial begin 
		
		$display("fact of 1 = %d ",factorial(1));//1
		$display("fact of 4 = %d ",factorial(4));//24
		$display("fact of 7 = %d ",factorial(7));//5040
	
	end
	
endmodule