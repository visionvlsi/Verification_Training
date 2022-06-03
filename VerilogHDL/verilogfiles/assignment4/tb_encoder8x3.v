// Code your testbench here

`timescale 1ns/1ps
module tb;
  
reg [7:0]d;
wire [2:0]y;
  integer i;
encoder8x3 ins1(d,y);
  initial begin 
    $monitor("simtime=%0g,d=%b,y=%b",$time,d,y);
    for(i=0;i<=255;i=i+1) begin 
      if(i==8'h01 || i==8'h02 || i==8'h04 || i==8'h08 || i==8'h10 || i==8'h20 || i==8'h40 || i==8'h80) begin
      d=i;
      #5;
      
      end
      else begin
      continue;
      end
    end
    end
endmodule
