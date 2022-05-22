//2. Design and implement FA, HA in data-flow and structural modeling.

//Half Adder in data-flow and structural modeling Code your design here
// `define DF
`define STRUCTURAL
module ha_df_struc(a,b,sum,co);

input a,b;
output sum,co;

`ifdef DF
assign sum=a^b,
co=a&b;
`endif

`ifdef STRUCTURAL

xor(sum,a,b);
and(co,a,b);

`endif

endmodule

// Code your testbench here

`timescale 1ns/1ns
module test;
reg a,b;
wire sum,co;

ha_df_struc ins1(a,b,sum,co);

initial begin
{a,b}=2'b00;
#5 {a,b}=2'b01;
#5 {a,b}=2'b10;
#5 {a,b}=2'b11;
#5 $finish;

end

initial begin
$monitor("simtime=%0g, a=%b, b=%b, sum=%b, co=%b",$time, a, b, sum, co);

end

endmodule

//EDAPlayground link https://www.edaplayground.com/x/f5qk
