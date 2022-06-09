module tb;
reg clk, rst, d, sl, sr;
wire [7:0] q;
shift slsr1(sl, sr, d, clk, rst, q);

initial begin
  
 rst=1; #10; rst=0; 
 end
 initial begin clk=0; 
 end 
 always #10 clk=~clk;
 

 
 initial begin
 sl = 1; sr = 0; #100;//left shift
 sl = 0;  sr = 1; #100;//right shift
end
initial begin
 forever begin
 d = 0;
 #10
 d = 1;
 #20
 d = 0;
 end
end

 initial #100 $finish;
 
 
 endmodule