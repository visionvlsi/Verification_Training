// Code your testbench here

`timescale 1ns/1ps
module tb;
  
reg [2:0]d;
wire [7:0]y;
  integer i;
  decoder3x8 ins1(d,y);
  
  initial begin 
    $monitor("simtime=%0g,d=%b,y=%b", $time,d,y);
    for(i=0;i<8;i=i+1) begin 
    d=i;
      #5;
    
    end
  
  end
endmodule