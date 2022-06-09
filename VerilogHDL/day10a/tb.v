module tb;

reg [7:0] ip;
reg clk,rst,en;
reg [1:0]d;
wire [7:0] y;

uni_shift  shift(y,clk,rst, en,d,ip);

 initial begin
 rst=1; #10; rst=0; en=1; #10;en=0;
 end
 initial begin clk=0; 
 end 
 always #10 clk=~clk;
 
initial
   begin
     d[0]=0;d[1]=0;ip=11001110;#100;$displayb(d,":",ip,":",y); 
     d[0]=0;d[1]=1;ip=11001110;#100;$displayb(d,":",ip,":",y);
     d[0]=1;d[1]=0;ip=11001110;#100;$displayb(d,":",ip,":",y);
     d[0]=1;d[1]=1;ip=11001110;#100;$displayb(d,":",ip,":",y);
	 
	 end
	  initial #100 $finish;
	 endmodule