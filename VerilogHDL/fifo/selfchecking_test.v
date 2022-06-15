`timescale 1ns / 1ps

module test;

	// Inputs
	reg [7:0] data_in;
	reg clk;
	reg rst;
	reg rd;
	reg wr;

	// Outputs
	wire [3:0] fifo_cnt;
	wire [7:0] data_out;
	
	integer i,j,k;
  
   reg [7:0]ref_data[0:7];
   reg [7:0]rcvd_data[0:7];

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

	initial begin
		// Initialize Inputs
		clk = 0;
		forever #5 clk=~clk;
		end
      
		initial begin
		rst = 0;
		@(negedge clk)
		rst=1;
		@(posedge clk)
		rst=1;
				
		for(i=0; i<=7; i=i+1) begin
		@(negedge clk)
	    rst=0; wr=1; rd=0;data_in=i*5; ref_data[i]=i*5;   // write activity
		 @(posedge clk)
		 rst=0; wr=1; rd=0;data_in=i*5; ref_data[i]=i*5;  
		 end
		 @(negedge clk);  rst=0; wr=0; rd=0;
		 @(posedge clk);
		
							//read activity 
		for(j=0; j<=7; j=j+1) begin
          @(negedge clk) wr=0; rd=1;	 rcvd_data[j]=data_out;
          @(posedge clk) wr=0; rd=1;	 rcvd_data[j]=data_out; 
		end
		@(posedge clk); rst=0; wr=0; rd=0;
		@(posedge clk);
		
        end
  
  always@(rcvd_data)
  begin
		for(k=0; k<=7; k=k+1) 
          begin
            if(ref_data[k]==rcvd_data[k+1])
		        #4 $display($time, " Data matches");
		  else
		        #4 $display($time, "Data wrong");
		  end
 end
  initial begin $dumpfile("dump.vcd"); $dumpvars(1); end
  initial begin 
    #2000;
    $finish;
  end
  
endmodule
