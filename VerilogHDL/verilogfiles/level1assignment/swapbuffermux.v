//Swap / Buffer Circuit

//Swap / Buffer circuit can be implemented by using a simple 2X1 Multiplexer.


// Code your design here
module swap_buffer(a,b,s,aout,bout);
input a,b,s;
output aout,bout;
  mux2x1 m1(.in1(a),.in2(b),.sel(s),.y(aout));
  mux2x1 m2(.in1(b),.in2(a),.sel(s),.y(bout));
endmodule

//mux2x1
module mux2x1(in1,in2,sel,y);
  input in1,in2,sel;
  output y;
  assign y=sel?in2:in1;
endmodule


//tb

// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module tb;
  reg a,b,s;
  wire aout,bout;
  integer i;
  swap_buffer ins1(a,b,s,aout,bout);
  
  initial
    begin
      $monitor("simtime=%0g,a=%b,b=%b,s=%b,aout=%b,bout=%b",$time,a,b,s,aout,bout);
      for(i=0;i<=7;i=i+1)
        begin
          {a,b,s}=$random;
          #5;
        end
      #5;
      $finish;
    end
endmodule

// EDAPlayground https://www.edaplayground.com/x/Tscf
