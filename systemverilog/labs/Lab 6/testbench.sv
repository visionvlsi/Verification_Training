program testbench(simple_bus vif);

//Section1: Declaration of input/output ports
/*
input     clk;
output reg  rst,wr;
output reg   [2:0]addr;
output   reg [7:0]wdata;
input	  [7:0]rdata;
*/
int matched, mis_matched;
reg[7:0]exp_q[$];
reg [7:0]dut_out[$];
//Section 4: Define functions/tasks below
//TODO 
task reset_stimulus();
 $display("[Testbench] Reset applied to DUT");
 vif.rst<=1;
 @(posedge vif.clk);
 vif.rst<=0;
 $display("[Testbench] Reset completed");
endtask

task write_stimulus(input reg[2:0]addr_t,reg[7:0]wdata_t);
	vif.wr<=0;
	vif.wdata<=wdata_t;
	exp_q.push_back(wdata_t);
	vif.addr<=addr_t;
	@(posedge vif.clk);
endtask


task read_stimulus(input reg[2:0]addr_t);
	vif.wr<=1;
	vif.addr<=addr_t;
	@(posedge vif.clk);
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
forever begin
@(vif.rdata);
dut_out.push_back(vif.rdata);
$display("[Rdata]Rdata=%0d at mem address=%0d", vif.rdata,vif.addr);
end
end

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
@(posedge vif.clk);

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

endprogram