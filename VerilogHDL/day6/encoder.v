module encoder4_2(
input  [3:0]i,
output [1:0]y);

assign  y = {i[3] | i[1], i[3] | i[2] };

 /*a b c d x y
 8 1 0 0 0   1 1
15 1 1 1 1   1 1
 
 0 1 0 0   1 0
 0 1 0 1   1 0
 0 1 1 0   1 0
 0 1 1 1   1 0
 
 0 0 1 0   0 1
 0 0 0 1   0 0*/
   
 //HW : CONVER TO GATE LEVEL
 
endmodule

module tb;
reg  [3:0]i;
wire [1:0]y;

encoder4_2 e1(i,y);
integer z;
initial
 begin
     for(z=0;z<16;z=z+1)
	  begin
	     if(z == 4'h0 || z==4'h3 || z==4'h5|| z==4'h6 || z==4'h7 ||
            z ==4'h9 ||  z==4'hA || z==4'hB || z==4'hC ||
            z==4'hD || z==4'hE || z==4'hF  ) 
          begin
		   continue;
		  end
        else
		 begin
            i = z;
           #1;
		   $display($time, i , y);	 
	     end
	  end
 
 end
endmodule


//EDAPlayground https://www.edaplayground.com/x/Ymxc
