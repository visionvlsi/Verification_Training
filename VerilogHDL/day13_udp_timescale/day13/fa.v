module fa(cout,sum,a,b,cin);
input a,b,cin;
output sum,cout;

assign sum = a^b^cin; // SYMBOLS  | OPERATORS ^
assign cout =  a&b | b &cin  | cin &a;

endmodule 