// testbench
`timescale 1ns/1ps
module tb;
 reg t;
 reg clk,rst;
 wire q,qbar;
 dff ins1(clk,rst,t,q,qbar);
 
  
  initial begin 
    $monitor($time, " clk=%b,rst=%b,t=%b,q=%b,qbar=%b",clk,rst,t,q,qbar);
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
     @(negedge clk) rst=0; t=0;
     @(posedge clk);
     @(negedge clk)  t=1;
     @(posedge clk);
     @(posedge clk);
    #10;
    $finish;
  end
endmodule

//https://www.edaplayground.com/x/r_RM
