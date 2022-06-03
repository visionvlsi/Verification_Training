module tb;

reg j,k;
reg clk,rst;
wire q;

jk j1(j,k,clk,rst,q );

always #5 clk=~clk;
initial
 begin
 $monitor($time, j ,k ,q); 
  clk=0;rst=1;j=0;k=0;
   
   #6 rst=0;
   
   #4 j=0;k=1;
   #4 j=1;k=0;
   #4 j=1;k=1;//18
     
   
   
   
 
 
 end
 
endmodule
