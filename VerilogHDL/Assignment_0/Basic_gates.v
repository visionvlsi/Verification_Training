//Design and implement all basic gates in data-flow and behavioral modeling.

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

// Code your testbench here

`timescale 1ns/1ps
module test;

reg a,b;
wire ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor;
integer i;

data_flow ins1(a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);

initial
for(i=0;i<=3;i=i+1)
begin
{a,b}=i;
#5;
end
initial
$monitor("simtime=%0g, a=%b, b=%b, ynota=%b,ynotb=%b,yand=%b,ynand=%b,yor=%b,ynor=%b,yxor=%b,yxnor=%b",$time,a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);
initial
#80 $finish;
endmodule


//EDAPlayground link

https://www.edaplayground.com/x/SH5G

// Behavioural modeling of Basic gates
module beha_model(a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);
input a,b;
output reg ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor;
always@*
begin
ynota=~a;
ynotb=~b;
yand=a&b;
ynand=~(a&b);
yor=a|b;
ynor=~(a|b);
yxor=a^b;
yxnor= a~^b;
end
endmodule

// Code your testbench here
`timescale 1ns/1ps
module test;
reg a,b;
wire ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor;
integer i;

beha_model ins1(a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);

initial
for(i=0;i<=3;i=i+1)
begin
{a,b}=i;
#5;
end
initial
$monitor("simtime=%0g, a=%b, b=%b, ynota=%b,ynotb=%b,yand=%b,ynand=%b,yor=%b,ynor=%b,yxor=%b,yxnor=%b",$time,a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);
initial
#80 $finish;
endmodule

//EDAPlayground link

https://www.edaplayground.com/x/wQdm
