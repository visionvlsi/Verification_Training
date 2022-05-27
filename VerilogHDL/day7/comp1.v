module comp1;
 input a,b;
 output reg gt,eq,lt;
 
 //behaviroal modelling
 //procedural blocks
  //always : both design and tb  initial  :tb
 always @(a,b)//sensitivity list
 begin
   if(a>b)//
     begin 
	   gt <= 1; //<= nonblocking assignment.
	   lt <= 0;
	   eq <=0;
	 end
   else if(a<b) 
     begin
	   lt <=1;
       gt <=0;
	   eq <=0;
	 end
	else
	  begin
	   lt <=0;
	   gt <=0;
	   eq <=1;
	  
	  
	  end
 
 
 end
 

endmodule

