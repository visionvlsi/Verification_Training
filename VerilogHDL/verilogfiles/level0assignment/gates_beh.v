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

