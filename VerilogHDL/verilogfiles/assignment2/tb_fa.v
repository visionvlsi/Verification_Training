//FA Testbench 
`timescale 1ns/1ps
module tb;
reg a,b,cin;
wire sum,co;
integer i;
fa ins1(a,b,cin,sum,co);
initial begin 
  $monitor("simtime=%0g,a=%b,b=%b,cin=%b,sum=%b,co=%b",$time,a,b,cin,sum,co);
for(i=0;i<8;i=i+1) begin 
{a,b,cin}=i;
#5;
end
end
endmodule