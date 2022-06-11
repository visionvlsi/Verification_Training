module dff (clk,rst,d,q);
input d,clk,rst;
output reg q;

always @(posedge clk or posedge rst)
begin
 if(rst) q<=0;
 else    q<=d;


end

 specify
   $setup(d,posedge clk,2);
   $hold(posedge clk,d,1);
 endspecify


endmodule