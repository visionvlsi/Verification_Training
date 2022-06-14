`timescale 1ns/1ps
module test;
reg clk,rst;
wire [3:0]count4bit;
counter4bit ins1(clk,rst,count4bit);
initial begin 
rst=0;
clk=0;
forever #5 clk=~clk;
end
initial
begin 
@(posedge clk);
@(negedge clk) rst=1;
@(posedge clk);
@(negedge clk) rst=0;
@(posedge clk);

end


