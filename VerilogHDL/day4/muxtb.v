module mux_tb;

reg i0,i1,sel;
wire y;

mux m1(i0,i1,sel,y);

reg [3:0]i; //

initial
 begin
   for(i=0;i<8;i=i+1)
    begin // compulsory
	   {i0,i1,sel} = i;
	   #1;
	   $display($time, i0,   i1  ,  sel , y);
	
	end
 
 end
 
endmodule
