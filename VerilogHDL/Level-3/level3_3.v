/*
7. write a program for synchronous fifo for 32 locations depth and 16 bit data size?

8. design and implement asynchronous fifo with write clock 512 mhz and read clock 64 mhz?(hint: calculate the fifo depth and proceed)

*/

//7. write a program for synchronous fifo for 32 locations depth and 16 bit data size?

//Empty and Full block
module fifo(input [15:0] data_in,
			input clk,rst,
			input rd,wr,
            output reg [5:0]fifo_cnt,
            output reg [15:0]data_out);
			
      reg [15:0] fifo_ram[0:31];
      reg [4:0] rd_ptr, wr_ptr;
			
	assign empty = (fifo_cnt==0);
  assign full = (fifo_cnt==32);
	
	//write and read block
	
	always@(posedge clk) begin: write
	if(wr && !full)
		fifo_ram[wr_ptr]<=data_in;
		else if(wr && rd)
		fifo_ram[wr_ptr]<=data_in;
		end
		
	always@(posedge clk) begin:read
	if(rd && !empty)
		data_out<=fifo_ram[rd_ptr];
	else if(rd && wr)
		data_out<=fifo_ram[rd_ptr];
	end
	
	//pointer block
	
	always@(posedge clk) begin: pointer
	if(rst) begin
	wr_ptr<=0;
	rd_ptr<=0;
	end
	else begin
	wr_ptr<=((wr && !full) || (wr && rd))? wr_ptr+1:wr_ptr;
	rd_ptr<=( (rd && !empty) || (wr && rd))? rd_ptr+1:rd_ptr;
	end
	end
	
	//counter block
	
	always@(posedge clk) begin: count
	if(rst) fifo_cnt<=0;
	else
	begin
	case({wr,rd})
	2'b00: fifo_cnt<=fifo_cnt;
	2'b01: fifo_cnt<=(fifo_cnt==0)? 0: fifo_cnt-1;
        2'b10: fifo_cnt<=(fifo_cnt==32)? 0: fifo_cnt+1;
	2'b11: fifo_cnt<=fifo_cnt;
	default: fifo_cnt<=fifo_cnt;
	endcase
	end
	end
	endmodule


// testbench

module test;

	// Inputs
	reg [15:0] data_in;
	reg clk;
	reg rst;
	reg rd;
	reg wr;

	// Outputs
	wire [5:0] fifo_cnt;
	wire [15:0] data_out;
	
	integer i,j,k;
  
	reg [15:0]ref_data[0:31];
	reg [15:0]rcvd_data[0:31];

	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.data_in(data_in), 
		.clk(clk), 
		.rst(rst), 
		.rd(rd), 
		.wr(wr), 
		.fifo_cnt(fifo_cnt), 
		.data_out(data_out)
	);

  	// Initialize Inputs
	initial 
      begin
		clk = 0;
       	forever #5 clk=~clk;
	  end
      
	
       // write activity
 
  
         initial 
         begin
           @(negedge clk) rst=0;
           @(posedge clk) rst=0;
           @(negedge clk) rst=1;
           @(posedge clk) rst=1;
           
           
      
		for(i=0; i<=7; i=i+1) 
          begin
            @(negedge clk) rst=0; wr=1; rd=0;data_in=i*5; ref_data[i]=i*5;  
            @(posedge clk) rst=0; wr=1; rd=0;data_in=i*5; ref_data[i]=i*5;
          end
                 
          //read activity 
           @(negedge clk) wr=0; rd=1;
           @(posedge clk) wr=0; rd=1;
          
		for(j=0; j<=7; j=j+1) 
          begin
            @(negedge clk) wr=0; rd=1; rcvd_data[j]=data_out; 
            @(posedge clk) wr=0; rd=1; rcvd_data[j]=data_out; 
           end
           
    	          
  for(k=0; k<=7; k=k+1)
    begin
      if(ref_data[k]==rcvd_data[k])
        $display($time, "Data pass  %d received data=%d \t refdata=%d ",k,rcvd_data[k], ref_data[k]);
      else
        $display($time, "Data wrong  %d received data=%d \t refdata=%d ",k,rcvd_data[k],ref_data[k]);
     end
		$finish;
        end
  
  initial begin $dumpfile("dump.vcd"); $dumpvars(1); end
 

endmodule


//https://www.edaplayground.com/x/niwe
