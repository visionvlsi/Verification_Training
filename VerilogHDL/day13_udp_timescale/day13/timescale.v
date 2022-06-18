//`timescale timeunit/timeprecision
`timescale 1ns/100ps
module tb;
 reg [1:0]a,b;
 
 
 initial
  begin
   #3.8123 a= 2;
   $display($realtime, a);
  
  end


endmodule


