module ram_dut(clk,rst,wdata,rdata,addr,wr);
input            clk,rst,wr;
input       [2:0]addr;
input       [7:0]wdata;
output reg  [7:0]rdata;
// wr=0 <- Write Operation
// wr=1 <- Read Operation

reg [7:0]memory[0:7]; 

always @(posedge clk or posedge rst)
begin
	if(rst)
	   for(int i =0;i<8;i++)
		   memory[i] <= 8'b0;
	    
	else
	begin
		if(wr==0)
		  memory[addr] <= wdata;
      else if(wr==1)
		  rdata <= memory[addr];	
	end
end

endmodule
