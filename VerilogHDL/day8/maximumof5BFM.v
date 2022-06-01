// Code your design here
module findmaximum(input clk,rst,input [3:0]number_in[0:4],output [3:0]max);
    integer i;
    
  reg [3:0]greater;
    
    always@(posedge clk)  
      
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
   
///TB
`timescale 1ns/1ns
module tb;
  
  reg clk,rst;
  reg [3:0]number_in[0:4];
  wire [3:0]max;
  
  findmaximum ins1(clk,rst,number_in,max);
  
  
  initial 
begin
   clk=0;
  end
  initial
    begin
      @(negedge clk); rst=1;
      @(posedge clk); rst=1;
      @(negedge clk); rst=0;
    
      
      big_num(15,8,3,2,1,15);
      
      @(negedge clk); rst=1;
      @(posedge clk); rst=1;
      @(negedge clk); rst=0;
     
      
      big_num(11,8,3,2,1,11);
      
   //   @(negedge clk); rst=1;
      @(posedge clk); rst=1;
      @(negedge clk); rst=0;
     
      
      big_num(0,8,3,2,1,8);
    end
task big_num;
  input [3:0]number_in1,number_in2,number_in3,number_in4,number_in5,maxn;
begin
      number_in[0]=number_in1;
      number_in[1]=number_in2;
      number_in[2]=number_in3;
      number_in[3]=number_in4;
      number_in[4]=number_in5;
   @(posedge clk);
   @(posedge clk);

   if(max==maxn)
   $display("simtime=%0g,clk=%b,rst=%b,number_in[0]=%d,number_in[1]=%d,number_in[2]=%d,number_in[3]=%d,number_in[4]=%d,max=%d",$time,clk,rst,number_in[0],number_in[1],number_in[2],number_in[3],number_in[4],max);
  
  end
endtask
  
  
     
  always #5 clk=~clk;
  
  initial
    #400 $finish;
endmodule

//EDAPlayground https://www.edaplayground.com/x/qq9P
  
