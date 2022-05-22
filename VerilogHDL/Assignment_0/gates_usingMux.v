//Design and implement Or, And, Xor gate using Multiplexer (2×1).

//or gate using mux
/*
   | A | B | Y |
   ______________
   | 0 | 0 | 0 |
   ______________
   | 0 | 1 | 1 |
   ______________
   | 1 | 0 | 1 |
    ______________
   | 1 | 1 | 1 |
   ______________

*/

//design code
module orgate_UsingMUx(a,b,y);
   input a,b;
   output y;
   assign y=b?1'b1:a;
endmodule

// testbench

`timescale 1ns/1ns
module test;
   reg a,b;
   wire y;
   orgate_UsingMUx ins1(a,b,y);
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
   
// EDAPlayground link https://www.edaplayground.com/x/fX5M

//_______________________________________________________________
//______________________________AND Gate using Mux21______________
//_________________________________________________________________
   
//AND gate using mux
/*
   | A | B | Y |
   ______________
   | 0 | 0 | 0 |
   ______________
   | 0 | 1 | 0 |
   ______________
   | 1 | 0 | 0 |
    ______________
   | 1 | 1 | 1 |
   ______________

*/

//design code
module andgate_UsingMUx(a,b,y);
   input a,b;
   output y;
  assign y=b?(a?1'b1:1'b0):1'b0;
endmodule


`timescale 1ns/1ns
module test;
   reg a,b;
   wire y;
   andgate_UsingMUx ins1(a,b,y);
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

