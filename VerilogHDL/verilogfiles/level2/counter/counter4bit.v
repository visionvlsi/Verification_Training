//Design and implement a 4-bit Counter

module counter4bit(clk,rst,count4bit);
input clk,rst;
output reg [3:0]count4bit;

always@(posedge clk)
begin
if(rst)
count4bit<=0;
else
count4bit<=count4bit+1'b1;
endmodule