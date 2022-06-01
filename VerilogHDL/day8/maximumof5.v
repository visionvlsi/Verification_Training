//Write Verilog Code with bfm  to find the max of 5 numbers.

// Code your design here
module findmaximum(input clk,rst,input [3:0]number_in[0:4],output [3:0]max);
    integer i;
    
  reg [3:0]greater;
    
    always@(posedge clk or posedge rst)  
      
      begin
        if(rst)
          begin
            greater=4'b0000;
          end
        else
          begin
            for(i=0;i<=4;i=i+1)
              begin
                if(number_in[i]>greater)
                  greater=number_in[i];
                  end
          end
    end
  assign max=greater;
endmodule
   
/// Testbench

`timescale 1ns/1ns
module tb;
  
  reg clk,rst;
  reg [3:0]number_in[0:4];
  wire [3:0]max;
  
  
  
  findmaximum ins1(clk,rst,number_in,max);
  
  initial
    begin
      clk=0;
      number_in[0]=15;
      number_in[1]=6;
      number_in[2]=5;
      number_in[3]=11;
      number_in[4]=10;
      rst=0;
      #5 rst=1;
      #5 rst=0;      
    end
  
  always #5 clk=~clk;
  
  initial 
    $monitor("simtime=%0g,clk=%b,rst=%b,number_in[0]=%d,number_in[1]=%d,number_in[2]=%d,number_in[3]=%d,number_in[4]=%d,max=%d",$time,clk,rst,number_in[0],number_in[1],number_in[2],number_in[3],number_in[4],max);
  initial
    #20 $finish;
endmodule
  
/// EDAPlayground link https://www.edaplayground.com/x/NxXk
