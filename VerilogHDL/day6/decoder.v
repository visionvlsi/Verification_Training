module decoder(input [1:0]a,
output [3:0]y);

 assign y[0] = (a[1] ==0 && a[0] == 0);
 assign y[1] = (a[1] ==0 && a[0] == 1);
 assign y[2] = (a[1] ==1 && a[0] == 0);
 assign y[3] = (a[1] ==1 && a[0] == 1);
 
endmodule

// = assignment operator
//== logical equality operator
/* a == b
it can return 3 possible values 0,1,x
 whether a is equal to b 
 true : 1  : both the bit values of a and b are equal
 false : 0
 a=4'b1010
 b=4'b101x
 if any is bit is x in any input output will be always x.
 
 */
 
 
 
/*a1 a0 y3y2y1y0
0 0   0001 
0 1   0010
1 0   0100
1 1   1000*/