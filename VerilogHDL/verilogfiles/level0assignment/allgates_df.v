//1. Basic gates - NOT, AND, NAND, OR, NOR, XOR, XNOR
// Dataflow modeling of Basic gates
module data_flow(a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);
input a,b;
output ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor;

assign ynota=~a,
ynotb=~b,
yand=a&b,
ynand=~(a&b),
yor=a|b,
ynor=~(a|b),
yxor=a^b,
yxnor= a~^b;
endmodule

