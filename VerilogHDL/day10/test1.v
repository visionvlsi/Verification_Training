module tb;
 integer a,b,c;
 initial
  begin
    a=2;b=1;c=3;
	
    a=b+c; //b+c isevalued in active
	   // in nba a value is updated
	$display($time,"D",a);
  
  
	$monitor($time,"M",a);
	
	#5;
	   a<=b+c; //b+c isevalued in active
	
	    a=2;b=1;c=3;
	$display($time,"D",a);
  
     // in nba a value is updated
	
  
	$monitor($time,"M",a);
	
  end

endmodule


/*int main()
{c=2;
a=3;

}*/