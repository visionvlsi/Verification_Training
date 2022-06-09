module tb;

 reg [1:0]a;
 
 initial
  begin
    
	 a=1;
	$display("D", a);
	 a<=3;
	 $strobe("S",a);
	 #1 $display("D", a);
  
  end

endmodule