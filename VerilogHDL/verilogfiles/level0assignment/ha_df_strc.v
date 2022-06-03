
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