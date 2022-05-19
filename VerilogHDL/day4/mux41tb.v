module tb;

 reg [3:0]i;
 reg [1:0]sel;//0123
 wire y;

mux41 m1(i,sel,y);

integer z,j;

 initial
  begin
    for(z=0;z<4;z=z+1)
	 begin
	   sel = z;
	   for(j=0;j<16;j=j+1)
	    begin
		  i=j;
		  #1;
		  $display($time, "sel=%b ,  i=%b , y=%b",sel, i,  y);
		end
	 
	 end
  
  end
  
 endmodule