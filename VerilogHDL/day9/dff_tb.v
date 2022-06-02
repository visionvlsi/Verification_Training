module tb;

 reg clk,rst;//x compile time
 reg  din;
 wire dout;


dff d1(clk,rst,din,dout); //elaboration time.
 
always #5 clk = ~clk; // clock generation
 
initial //runtime
 begin
  clk=0;
  rst=1;

  #6 rst=0;din=0;
  #1 din=1;
  #1 din=0;
  #1 din=1;
  #1 din=0;
  #1 din=1;
  #1 din=0;
  #3 din=1;

 
 end
// initial #100 $finish;
endmodule