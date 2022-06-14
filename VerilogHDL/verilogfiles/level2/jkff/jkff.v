// JK - Flipflop

module jkff(j,k,clk,rst,q,qbar);
input j,k;
input clk,rst;
output reg q,qbar;
always@(posedge clk)
begin
if(rst)
begin
q<=0;
qbar<=1;
end
else
case({j,k})
2'b00: begin q<=q; qbar<=qbar; end
2'b01: begin q<=0; qbar<=1; end
2'b10: begin q<=1; qbar<=0; end
2'b11: begin q<=~q; qbar<=~qbar; end
endcase
end
endmodule

