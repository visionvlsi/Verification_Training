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


