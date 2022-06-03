// Code your testbench here

`timescale 1ns/1ps
module tb;
  
reg [7:0]i;
reg [2:0]s;
wire y;
  integer j;
mux8x1 ins1(i,s,y);
  
  initial begin 
    $monitor("simtime=%0g, i=%b, s=%b, y=%b", $time, i, s, y);
    i=8'b1010_1010;
    for(j=0;j<=7;j=j+1) begin 
      s=j;
      #5;
    end
    end
endmodule