module tb;

//Verilog
//TWO TYPES OF EXECUTION
//1.SEQUENTIAL EXECUTION  BEGIN END
//2.PARALLEL EXECUTION FORK JOIN
 
  reg [1:0]a,b,c;//
 
 initial
  fork
    $monitor($time,"a=%d,b=%d,c=%d",a,b,c);
	
	 a=1;
	 
	 #5 b=2;
	 
	 #2 c=3;
  
  
  join


endmodule