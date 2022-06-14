// testbench
`timescale 1ns/1ps
module tb;
 reg d;
 reg clk,rst;
 wire q,qbar;
 dff ins1(clk,rst,d,q,qbar);
 
  
  initial begin 
    $monitor($time, " clk=%b,rst=%b,d=%b,q=%b,qbar=%b",clk,rst,d,q,qbar);
       clk=0;
       rst=0;
       forever
         #5 clk=~clk;
  end
  initial
    begin
     @(posedge clk);
     @(negedge clk) rst=1;
     @(posedge clk);
     @(negedge clk) rst=0; d=0;
     @(posedge clk);
     @(negedge clk)  d=1;
     @(posedge clk);
     @(posedge clk);
    #10;
    $finish;
  end
endmodule
