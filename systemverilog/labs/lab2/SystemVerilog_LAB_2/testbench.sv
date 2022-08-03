module testbench;
//Section1: Declare the variables for DUT port connections
//TODO
reg       clk,rst,wr;
reg       [2:0]addr;
reg       [7:0]wdata;
wire	  [7:0]rdata;

reg[7:0]exp_q[$];
//Section2:  DUT instantiation
//TODO ram_dut dut_inst(.clk(clk),.rst(rst),..........);

ram_dut dut_inst(.clk(clk),.rst(rst),.wdata(wdata),.rdata(rdata),.addr(addr),.wr(wr));
//Section3: Clock initiliazation and Generation
//TODO
initial clk=0;
always #5 clk=~clk;

//Section 4: Define functions/tasks below
//TODO 
task reset_stimulus();
 $display("[Testbench] Reset applied to DUT");
 rst<=1;
 @(posedge clk);
 rst<=0;
 $display("[Testbench] Reset completed");
endtask

task write_stimulus(input reg[2:0]addr_t,reg[7:0]wdata_t);
	wr<=0;
	wdata<=wdata_t;
	exp_q.push_back(wdata_t);
	addr<=addr_t;
	@(posedge clk);
endtask


task read_stimulus(input reg[2:0]addr_t);
	wr<=1;
	addr<=addr_t;
	@(posedge clk);
endtask
initial begin
// Section 5: Start the verification flow by calling the necessary functions/tasks
// TODO
reset_stimulus();

//write task(address,wdata)
write_stimulus(0,10);
write_stimulus(1,20);
write_stimulus(3,30);
write_stimulus(4,40);

//Read task(address)
read_stimulus(0);
read_stimulus(1);
read_stimulus(3);
read_stimulus(4);

// Wait for the DUT to process the last transaction
@(posedge clk);

// Section 6:
$display("[Golden Values]Data=%0p",exp_q);
$finish;
end 
// Section 7:


// Section 8:


endmodule

