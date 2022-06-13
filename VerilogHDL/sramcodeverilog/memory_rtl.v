module memory_rtl (clk,reset,wr,rd,addr,wdata,rdata,response);

//Synchronous write read memory
parameter reg [15:0] ADDR_WIDTH=3;
parameter reg [15:0] DATA_WIDTH=8;
parameter reg [15:0] MEM_SIZE=2**ADDR_WIDTH;

input   clk,reset;
input   wr;// for write wr=1;
input   rd;// for read  rd=1;
input   [ADDR_WIDTH-1:0] addr;
input   [DATA_WIDTH-1:0] wdata;
output  [DATA_WIDTH-1:0] rdata;
output response;//1 when we are sure there is successful write operation

wire    [DATA_WIDTH-1:0] rdata;
reg     [DATA_WIDTH-1:0] mem [0:MEM_SIZE-1];
reg     [DATA_WIDTH-1:0] data_out;
integer i;
reg response ;//Provides response to master on successful write
reg out_enable;//controls when to pass read data on rdata pin

//if rd=0 rdata should be in high impedance state
//if rd=1 rdata should be content of memory with given address


assign rdata = out_enable  ? data_out : 'bz;

//asynchronous reset and synchronous write
always @(posedge clk or posedge reset)
begin
    if (reset) begin //Sampling the values
        for( i=0;i<MEM_SIZE;i=i+1)
            mem[i] <= 'b0;
	end
    else if(wr ) begin
	          if(addr==5) begin 
                              mem[5] <= 32'habcd_efab;//this is like one of the new feature for your sram.
                               response <=1'b1; 
                           end
			  else begin
					mem[addr] <= wdata ; //Sampling the values
					response <=1'b1;
			  end
		  end
      else
            response <=1'b0;
end//end_of_write


//Synchronous Read
always @(posedge clk )
begin
  if(rd==1) begin
	  data_out <= mem[addr] ;
      out_enable <= 1'b1;
   end
   else 
      out_enable <=1'b0;

end//end_of_read

endmodule
/*
Write Verilog Self-Checking Testbench .
        Write a task to apply reset to DUT.
        Write a task to Write to all 16 locations
        Write a task to Read from all 16 locations.
        Write comparison task to compare write data and read data.
        Print Test PASS or FAIL with the help of result from compare method.

For example : 
WRITE  :  wr=1, addr=3, wdata=50 
READ   :  rd=1, addr=3 then you should see value 50 on rdata;
*/