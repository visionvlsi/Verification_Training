module tb;
parameter Q=1000;

reg [Q-1:0]a,b;
wire [Q:0]s; //5 bit 31  



//addN  addN_inst(s,a,b);


addN #(Q)  addN_inst(s,a,b);

//addN #(100) addN_inst(z,x,y);


initial
  begin
   repeat(10)
   begin
		{ a,b} = $random;
		#1;
		$display("%0d+%0d = %0d",a,b,s);
  end
  
  
  end
  
endmodule