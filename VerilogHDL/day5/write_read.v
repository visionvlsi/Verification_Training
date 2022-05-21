module tb;

 reg [1:0]a,b;
 
 initial
  begin
    a=2;//t0
	#1 $display(a);
  end

 initial #1 a=1;
endmodule

//WR - 1
//RW - 2
//SAME SIGNAL SAME TIME.
//IT CAN EXECUTE AS WRITE READ ORDER OR READ WRITE ORDER
