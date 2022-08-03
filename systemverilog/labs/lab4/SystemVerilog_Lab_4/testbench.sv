module testbench;
//Section1: Declare the variables for DUT port connections
//TODO
reg       clk,rst,wr;
reg       [2:0]addr;
reg       [7:0]wdata;
wire	  [7:0]rdata;

int matched, mis_matched;
reg[7:0]exp_q[$];
reg [7:0]dut_out[$];
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

function void compare();
foreach(exp_q[i]) begin
if(exp_q[i]==dut_out[i])
matched++;
else begin
mis_matched++;
$display("[Error]Expected=%0d and Received=%0d",exp_q[i],dut_out[i]);
end
end
endfunction
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
$display("[DUT values]Data=%0p",dut_out);
compare();
if(mis_matched==0) begin
$display("*************************");
$display("******Test Passed********");
$display("Matched=%0d Mis_matched=%0d", matched, mis_matched);
$display("*************************");
end
else begin
$display("*************************");
$display("******Test Failed********");
$display("Matched=%0d Mis_matched=%0d", matched, mis_matched);
$display("*************************");



end
$finish;
end 
// Section 7:
initial begin
forever begin
@(rdata);
dut_out.push_back(rdata);
$display("[Rdata]Rdata=%0d at mem address=%0d", rdata,addr);
end
end

// Section 8:


endmodule

