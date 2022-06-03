module jkff_using_dff(input clk,rst,
 input j,k,
output reg q);

wire w1,w2,w4;

and a1(w1,j,~q);
and a2(w2,~k,q);
 
or o1(w4,w1,w2);
 
dff d1(.clk(clk),.rst(rst),.
       .din(w4),.dout(q));



endmodule  