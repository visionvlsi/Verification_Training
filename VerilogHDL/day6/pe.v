module pe(
 input  [3:0]i,
output [1:0]y);
 );
 
 wire [1:0]w1,w2;
 
 mux21 m1(.i0(w1),.i1(2'b11),.sel(i[3]),.y(y) );
 mux21 m2(.i0(w2),.i1(2'b10),.sel(i[2]),.y(w1) );
 mux21 m3(.i0(2'b00),.i1(2'b01),.sel(i[1]),.y(w2) );
 
endmodule

module tb;
reg  [3:0]i;
wire [1:0]y;

pe e1(i,y);
integer z;
initial
 begin
     for(z=0;z<16;z=z+1)
	  begin
	        i = z;
           #1;
		   $display($time, i , y);	 
	  end
 
 end
endmodule