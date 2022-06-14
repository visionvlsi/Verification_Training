// T FF

module dff(clk,rst,t,q,qbar);
input clk,rst;
input t;
output reg q, qbar;
always@(posedge clk)
begin
if(rst)
begin 
q<=0;
qbar<=1;
end
else
case(t)
0: begin q<=q; qbar<=qbar; end
1: begin q<=~q; qbar<=~qbar; end
endcase
end
endmodule

