module tb;

reg [1:0]a,b;
 wire [3:0]y;

mul m1(a,b,y);
initial
 begin
  a=2'h0;b=2'h0;#1; $display($time,a,b,y);
  a=2'h0;b=2'h1;
  a=0;b=2;
  a=0;b=3;
  a=1;b=0;
  a=1;b=1;
  a=1;b=2;
  a=1;b=3;
  a=2;b=0;
  a=2;b=1;
  a=2;b=2;
  a=2;b=3;
  a=3;b=0;
  a=3;b=1;
  a=3;b=2;
  a=3;b=3;

 
 end
 
 endmodule