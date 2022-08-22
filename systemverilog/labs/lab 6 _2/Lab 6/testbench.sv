// Section 1: 
program testbench(simple_bus vif);

reg [7:0] exp_q[$];
int matched ,mis_matched;

//Section 2: Define functions/tasks below
task reset_stimulus();
$display("[Testbench] Reset applied to DUT");
vif.rst <= 1;
@(posedge vif.clk);
vif.rst <= 0;
$display("[Testbench] Reset completed");
endtask

task write_stimulus(input reg[2:0] addr_t,reg [7:0] wdata_t);
vif.wr<=0;
vif.wdata<=wdata_t; exp_q.push_back(wdata_t);
vif.addr<=addr_t;
@(posedge vif.clk);
endtask

task read_stimulus(input reg[2:0] addr_t);
vif.wr<=1;
vif.addr<=addr_t;
@(posedge vif.clk);
endtask 

initial begin

reset_stimulus();

// Write task (address,wdata)
write_stimulus(0,10);
write_stimulus(1,20);
write_stimulus(3,30);
write_stimulus(4,40);

read_stimulus(0);
read_stimulus(1);
read_stimulus(3);
read_stimulus(4);


// Wait for the DUT to process the last transaction
@(posedge vif.clk);

// Section 5:
result();

$finish;
end 
// Section 3: Collecting DUT output
reg [7:0] dut_out;

initial begin 
forever begin 
// Self-Checking mechanism
@(vif.rdata);
dut_out=exp_q.pop_front();
if(dut_out==vif.rdata) begin
matched++;
$display("[Info] Rdata = %0d at mem address=%0d",vif.rdata,vif.addr);
end
else
begin
mis_matched++;
$display("[Error] Exp Rdata = %0d Actual Rdata=%0d",dut_out,vif.rdata);
end
end 
end

// Section 4:
function void result();
	// Results
	$display("\n***********************************");
	if(mis_matched==0)
	$display("************Test Passed**************");
	else
	$display("************Test Failed**************");
	
endfunction

endprogram

