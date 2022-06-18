module tb;

 reg [2:0]a,b,c;
 
 initial
  begin
    /*#4 a=5; //inter delay
	   $display($time,a);
	   a<=6;  
	   $monitor($time,a); */

      b=1; c=2;
     a = #2 b+c;
	 $display($time, a, b ,c);
	 
	
  end

endmodule

module tb;

 reg [2:0]a,b,c;
 
 initial
  begin
    /*#4 a=5; //inter delay
	   $display($time,a);
	   a<=6;  
	   $monitor($time,a); */
    $monitor("M",$time, a);

      b=1; c=2;
     a <= #2 b+c;
	 $display($time, a, b ,c);
	 
	
  end

endmodule