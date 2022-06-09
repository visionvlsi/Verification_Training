module tb;

reg clk,rst;
wire [2:0]count;

mod4_mod5 m1(clk,rst,count);

always #5 clk=~clk;

initial
 begin
  clk=0;rst=1;
  #6 rst=0;
 
 end
 
 initial #100 $stop;
endmodule

  