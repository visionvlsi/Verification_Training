// testbench
`timescale 1ns/1ps
module tb;
 reg j,k;
 reg clk,rst;
 wire q,qbar;
 jkff ins1(j,k,clk,rst,q,qbar);
 
  
  initial begin 
    $monitor($time, " clk=%b,rst=%b,j=%b,k=%b,q=%b,qbar=%b",clk,rst,j,k,q,qbar);
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
    @(negedge clk) rst=0; j=0; k=0;
     @(posedge clk);
    @(negedge clk)  j=0; k=1;
     @(posedge clk);
    @(negedge clk) j=1; k=0;
     @(posedge clk);
    @(negedge clk)  j=1; k=1;
     @(posedge clk);
    #10;
    $finish;
  end
endmodule
