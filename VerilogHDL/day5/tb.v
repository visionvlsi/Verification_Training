module tb;

  reg [7:0]i;//0-255
  reg [2:0]sel;//
  wire y;


mux81 m1(i,sel,y );
integer z,j;
 initial
  begin
   z=0;
     while(z<8)
	  begin
	    sel = z;
		j=0;
	  while(j<256)
	     begin
             i=j;
			 j=j+1;
            #1;
			$display($time,"sel=%5b i=%5b  y=%b",sel,i, y);
         end		 
	      z=z+1;
	  end
    $finish;
  end



endmodule