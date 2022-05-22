
 Full Adder
// Code your design here
 `define DF
//`define STRUCTURAL
module fa_df_struc(a,b,cin,sum,co);

input a,b,cin;
output sum,co;

`ifdef DF
assign sum=a^b^cin,
  co=(a&b)|(a&cin)|(b&cin);
`endif

`ifdef STRUCTURAL

  xor ins1(sum1,a,b),
      ins2(sum,sum1,cin);
  and a1(c1,a,b), a2(c2,a,cin), a3(c3,b,cin);
  or (co,c1,c2,c3);

`endif

endmodule

// Code your testbench here
`timescale 1ns/1ns
module test;
  reg a,b,cin;
  wire sum,co;
  
  integer i;
  integer seed;
  
  fa_df_struc ins1(a,b,cin,sum,co);
  
  initial begin 
    seed=10;
    for(i=0;i<=7;i=i+1)
      begin
        {a,b,cin}=$random(seed);
        #5;
      end
      
  end
  initial
    #80  $finish;
  initial 
    $monitor("simtime=%0t,a=%b,b=%b,cin=%b,sum=%b,cin=%b",$time,a,b,cin,sum,co);
endmodule
                  
https://www.edaplayground.com/x/Zj8L

