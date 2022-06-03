//orgate testbench
`timescale 1ns/1ps
module tb;
reg a,b;
wire y;
integer i;
orgate ins1(a,b,y);
initial begin 
for(i=0;i<4;i=i+1)
begin 
{a,b}=i;
end
end
endmodule