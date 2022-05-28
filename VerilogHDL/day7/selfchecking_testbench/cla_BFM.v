module cla_BFM(a,b,cin,sum,co);
input [3:0]a,b;
input cin;
output [3:0]sum;
output co;
assign {co,sum}=a+b+cin;
endmodule