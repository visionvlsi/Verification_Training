module tb;

  reg clk,rst;
  reg [3:0]coinprice;
  wire  melay;
  wire moore;

fsm f1(clk,rst,coinprice,melay,moore);

always #5 clk=~clk;

initial
 begin
  clk=0;rst=1;
  #6 rst=0;
  
 @(posedge clk) sce1(coinprice);
 @(posedge clk) sce1(coinprice);
 @(posedge clk) sce1(coinprice);
  
  
 @(posedge clk) sce2(coinprice);
 @(posedge clk) sce2(coinprice);
  
  
  
 @(posedge clk) sce1(coinprice);
 @(posedge clk) sce1(coinprice);
 @(posedge clk) sce2(coinprice);
 


 @(posedge clk) sce1(coinprice);
 @(posedge clk) sce2(coinprice);
  
  
  
 @(posedge clk) sce1(coinprice);
 @(posedge clk) sce1(coinprice);
  
  

  
 end
 
initial #500 $stop;


task sce1(output [3:0]z);
 begin
  z=5;
 end
endtask

task sce2(output [3:0]z);
 begin
  z=10;
 end
endtask

endmodule