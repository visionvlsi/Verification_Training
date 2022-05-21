module tb;

 reg [2:0]a,b;
  reg cin;
  wire [3:0]sum;


rca r1(a,b,cin, sum);
integer i,j;
initial
 begin
   cin=0;
   /* do
	 a=0;   b=0;
	 do 
	  #1;
	   $display($time, a, b ,  sum);
        b=b+1;
     while(b<8);
      a=a+1;
    while(a<8);*/
	for(i=0;i<8;i=i+1)
	 begin
	  a=i;
	  for(j=0;j<8;j=j+1)
	   begin
	     b=j;
		 #1;
		 $display($time, a, b , sum);
	    end
		 
	 end
	 
    $finish;
 end
  
endmodule