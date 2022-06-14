//Design and implement a system which takes 8-bit data and stores in memory and based on request it should send data ROM/ RAM.


// Code your design here
module memory(data_in, address, wr, rd, clk, rst, data_out);
input [7:0]data_in;
input [3:0]address;
input clk, rst;
input wr,rd;
output reg [7:0]data_out;

reg [7:0]mem[0:15];
integer i;
always@(posedge clk)
begin
if(rst)
begin
for(i=0;i<=15;i=i+1)
mem[i]<=0;
end
else if(wr)
 begin
 mem[address]<=data_in;
 end
 else if(rd)
 begin
 data_out<=mem[address];
 end
 else begin
 data_out<=data_out;
 end
end
endmodule
