//Design and implement Multiplexer using conditional statement.

// design code for mux21

module mux21(a,b,sel,y);
  input a,b,sel;
  output y;
  assign y=sel?b:a;
endmodule

//testbench code for mux21

`timescale 1ns/1ns
module test;
  reg a,b,sel;
  wire y;
  nteger i;
  mux21 ins1(a,b,sel,y);
  
  initial begin 
    for(i=0; i<=7; i=i+1)
      begin
        {a,b,sel}=i;
        #5;
      end
    end
  initial
    $monitor("simtime=%t,a=%b,b=%b,sel=%b,y=%b",$time,a,b,sel,y);
endmodule

//EDAPlayground link https://www.edaplayground.com/x/Bz48
