module jk(input j,k,input clk,rst, output req );
 always @(posedge clk)
 begin
   if(rst) q<=0;
   else
     case({j,k})
	  2'b00 : q<=q;
	  2'b01 : q<=1'b0; //reset
	  2'b10 : q<=1'b1;
	  2'b11 : q<=~q;
	 endcase

	  
     
 
 end

endmodule