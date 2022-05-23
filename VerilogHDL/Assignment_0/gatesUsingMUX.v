// Code your design here
module orgate_usingmux21(a,b,y);
input a,b;
output y;
  mux21 m1(y,b,a,1'b1);
endmodule

module mux21(y,sel,a,b);
input sel,a,b;
output y;
assign y=sel?b:a;
endmodule

// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module test;
   reg a,b;
   wire y;
   orgate_usingmux21 ins1(a,b,y);
   initial begin
      a=0; b=0;
      #5 b=1;
      #5 a=1;
      #5 b=0;
      #5 $finish;
   end
   
   initial
      $monitor("simtime=%t,a=%b,b=%b,y=%b",$time,a,b,y);
endmodule

//EDAPlayground https://www.edaplayground.com/x/EXBu


//AND Gate

// Code your design here
module andgateMUX21(a,b,y);
  input a,b;
  output y;
  mux21 m1(y1,a,1'b0,1'b1);
  mux21 m2(y,b,1'b0,y1);
endmodule

module mux21(y,sel,a,b);
input sel,a,b;
output y;
assign y=sel?b:a;
endmodule

// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module test;
   reg a,b;
   wire y;
   andgateMUX21 ins1(a,b,y);
   initial begin
      a=0; b=0;
      #5 b=1;
      #5 a=1;
      #5 b=0;
      #5 $finish;
   end
   
   initial
      $monitor("simtime=%t,a=%b,b=%b,y=%b",$time,a,b,y);
endmodule

//EDAPlayground https://www.edaplayground.com/x/Utix
