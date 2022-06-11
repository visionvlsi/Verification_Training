module tb;

reg d;
reg clk=0;always #5 clk = !clk;
reg rst=1; initial  #2 rst=0;

wire q;

dff d1(clk,rst,d,q);

//always @(d) dinNBA <= d;
initial 
 begin
  d=0;
  
  #6 d=1;
  #6 d=0;
  #6 d=1;
  #6 d=0;
  
 
 end
initial #200 $finish;

endmodule
