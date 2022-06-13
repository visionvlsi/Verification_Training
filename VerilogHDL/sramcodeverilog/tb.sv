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

//CONVERT ALL INPUTS TO REG TO GENERATE STIMULUS WHICH IS DONE IN PROCEDURAL CLOCK
// ALL THE OUTPUT SHOULD BE DRIVEN OUT FROM DUT SO IT IS WIRE which is captured for comparison

module tb;
  parameter reg [15:0] ADDR_WIDTH=5;
  parameter reg [15:0] DATA_WIDTH=32;
  parameter reg [15:0] MEM_SIZE=32;
  
  reg clk,tb_reset;
  reg tb_wr; // for write wr=1
  reg tb_rd; // for read rd=1
  reg [ADDR_WIDTH-1:0] tb_addr;
  reg [DATA_WIDTH-1:0] tb_wdata;
  wire [DATA_WIDTH-1:0] tb_rdata;
  wire tb_response;
  
  reg [DATA_WIDTH-1:0]ref_arr[MEM_SIZE];
  //STIMULUS(DATA) DRIVEN INTO DUT , EXPECTED DATA/REFERENCE DATA/GOLDEN DATA
  
  reg [DATA_WIDTH-1:0]got_arr[MEM_SIZE];
  //RESPONSE  from DUT , ACTUAL DATA/RESPONSE 
  
  //Below two variables maintaines count of how many write/read
  //operations matched and mismatched.
  
  //bit [4:0]mismatched,matched;
  bit [ADDR_WIDTH:0]mismatched,matched;
  
  
  memory_rtl #(ADDR_WIDTH,DATA_WIDTH,MEM_SIZE) dut_inst (.clk(clk),
												.reset(tb_reset),
												.wr(tb_wr),
												.rd(tb_rd),
												.addr(tb_addr),
												.wdata(tb_wdata),
												.rdata(tb_rdata),
												.response(tb_response)
												);
												
											
 always #5 clk = !clk;
 
// initial #600 $finish;
 
 initial  begin
   $display("[tb] simulation started at time=%0t",$time);
   clk=0;tb_reset=0;
   reset();
   write();
   repeat(2) @(posedge clk);
   
   read();
   repeat(2) @(posedge clk);
   compare();
   result();
   
   #1 $display("[tb] Simulation Ended at time=%0t ",$time);
   $finish;
  end
  
  
  /* initial begin 
      $dumpfile("dump.vcd");
	  $dumpvars(0,tb.dut_inst);
	 end*/
	 
	 
	task reset();
      #1
      $display("[tb] Applying reset at time=%0t",$time);
       tb_reset=1;
      #3
        tb_reset=0;
    	$display("[tb] DUT IS run out of  reset at time=%0t",$time);
     endtask
	 
	 
	 
	task write();
	 reg [31:0] wdata;
	 //reg [4:0] i; // verilog
	 tb_wr<=1; //WRITE_MODE
	   for(int i=0;i<MEM_SIZE;i++)  begin
	    @(posedge clk);
		  tb_addr <= i; //GENERATION AND DRIVING STIMULUS HAPPENS AT SAME TIME
		  wdata = $urandom_range(10,999);
		  tb_wdata <= wdata;
		  $display("[tb] WRITE addr=%0d wdata=%0h at time=%0t",i,wdata,$time);
		  ref_arr[i] = wdata; // store the reference data
	end
	
	   @(posedge clk);
	     tb_wr <= 1'b0;
    endtask
	 
	 
	task read ();
	 reg [ADDR_WIDTH:0] i;
	 
	 for(i=0;i<MEM_SIZE;i=i+1) begin
	  @(posedge clk);
       tb_rd <= 1; //READ_MODE
       tb_addr <= i;
       @(tb_rdata);//WAIT FOR THE RDATA TO CHANGE BEFORE COLLECTING THE OUTPUT DATA.
       got_arr[tb_addr] = tb_rdata; //STORE  DATA RECIEVED FROM DUT. (ACTUAL DATA)
      $display("[tb] READ addr=%0d rdata=%0h at time=%0t",tb_addr,tb_rdata,$time);
    	  
	 end
	 tb_rd <=1'b0;
	
	endtask
	 
	task compare();
	 for(int i=0;i<MEM_SIZE;i++) begin
	  if(ref_arr[i] == got_arr [i])
	      matched++;
	  else  begin 
	    mismatched++;
		$display("[ERROR] *** Data Mismatch addr = %0d  expected = %0h received =%0h ****",
		                                        i,        ref_arr[i],   got_arr[i]);
		end
	 
	 end
	endtask
	 
	 task result() ;
	  $display("\n *********** Results ***************");
	   if(matched==MEM_SIZE && mismatched==0) begin
	   
	    $display("[INFO] Matched=%0d Mismatch=%0d", matched,mismatched);
		
		$display("[INFO] ******* TEST PASSED ********* \n");
	   end
       else
         $display("[FATAL] ***** TEST FAILED Matched=%0d Mismatch=%0d", matched,mismatched);

      	 $display(" *********** Results *************** \n");
		 
		
	 endtask
	 
	 
endmodule