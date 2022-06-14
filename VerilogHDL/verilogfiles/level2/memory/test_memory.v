// Testbench

`timescale 1ns/1ps
module test_memory;
   
reg [7:0]data_in;
reg [3:0]address;
reg clk, rst;
reg wr,rd;
wire [7:0]data_out;
integer i,j;
 
  memory ins1(data_in, address, wr, rd, clk, rst, data_out);
  
  initial begin
    rst=0; clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    $monitor($time, "data_in=%0d, address=%0d, wr=%b, rd=%b, clk=%b, rst=%b, data_out=%0d",data_in, address, wr, rd, clk, rst, data_out);
    @(negedge clk) rst=1;
    @(posedge clk) rst=1;
    @(posedge clk) rst=0;
    for(i=0;i<=15; i=i+1)
      begin
        @(negedge clk) wr=1;rd=0; data_in=i*5; address=i;
        @(posedge clk) wr=1;rd=0; data_in=i*5; address=i;
      end
    for(j=0;j<=15; j=j+1)
      begin
        @(negedge clk) wr=0;rd=1; address=j;
        @(posedge clk) wr=0;rd=1; address=j;
      end
    @(negedge clk) wr=0;rd=0;
    @(posedge clk) wr=0;rd=0;
    @(negedge clk) wr=0;rd=0;
    @(posedge clk) wr=0;rd=0;
    
     $finish;
  end
endmodule
