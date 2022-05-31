module tb;
 reg din,en;
 wire q;
 
 //integer i;
 
 dlatch d1(din,en,q);
 
 initial
  begin
   //$monitor($time,"din=%b , en=%b q=%b",din, en,q);
  // for(i=0;i<8;i=i+1)
 
   repeat(8)
	begin
	 din=$random;
	 en=$random;
	
	 $display($time,"din=%b , en=%b q=%b",din, en, q);
	#5;
	end
  
  end

endmodule