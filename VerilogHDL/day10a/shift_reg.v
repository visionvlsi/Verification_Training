module shift(sl, sr, d, clk, rst,q);
input sl, sr, d, clk, rst;
output [7:0] q;
reg [7:0] q;

always @ (posedge rst) begin

 q <= 8'b00000000;
 
end

always @ (posedge clk)
 begin
 if (rst==0) 
   begin
     if (sl) begin
        q <=  {q[6:0],d};
 end
    
	else if (sr) begin
        q <=  {d, q[7:1]};
   end
       end
           end


endmodule 