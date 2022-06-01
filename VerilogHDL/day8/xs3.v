// Code your design here
module xs3(din,dout);
  input [3:0]din;
  output reg [3:0]dout;
  always@*
    case(din)
        0: dout=3;
        1: dout=4;
        2: dout=5;
        3: dout=6;
        4: dout=7;
        5: dout=8;
        6: dout=9;
        7: dout=10;
        8: dout=11;
        9: dout=12;
       default: dout=4'bx;
    endcase
endmodule
        
 // Code your testbench here

`timescale 1ns/1ns
module tb;
  reg [3:0]din;
  wire [3:0]dout;
  integer i;
  xs3 ins1(din,dout);
 initial begin
   $monitor("simtime=%0g,din=%d,dout=%d",$time,din,dout);
   for(i=0;i<=15;i=i+1)
     begin
       din=i;
       #5;
     end
   
 end
endmodule

//EDAPlayground https://www.edaplayground.com/x/hGEz
