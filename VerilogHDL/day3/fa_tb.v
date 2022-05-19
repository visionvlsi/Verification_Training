module tb_fa;
  reg a,b,cin;
  wire sum,carry;
  
fa f1(a,b,cin,sum,carry);

 initial
  begin
    {a,b,cin} = 3'b000; #1; $displayb(a,b,cin,sum,carry);
    {a,b,cin} = 3'b001; #1; $displayb(a,b,cin,sum,carry);
    {a,b,cin} = 3'b010; #1; $displayb(a,b,cin,sum,carry);
    {a,b,cin} = 3'b011; #1; $displayb(a,b,cin,sum,carry);
    {a,b,cin} = 3'b100; #1; $displayb(a,b,cin,sum,carry);
    {a,b,cin} = 3'b101; #1; $displayb(a,b,cin,sum,carry);
    {a,b,cin} = 3'b110; #1; $displayb(a,b,cin,sum,carry);
    {a,b,cin} = 3'b111; #1; $displayb(a,b,cin,sum,carry);
	
  
  end
  
endmodule
