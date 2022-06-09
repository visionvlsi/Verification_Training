module tb;

reg [11*8:1]a;

function [11*8:1] name(input [5*8:1]str1,str2);//formal arguments

	begin
	
		$display("str1 = %s str2 = %s",str1,str2);
		name = {str1,str2};
		
	end
	
endfunction

initial begin

	a = name("hello","world");//actual arguments
	$display("a = %s",a);
	
end

endmodule