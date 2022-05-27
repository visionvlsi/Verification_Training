module mul(input [1:0]a,b,
 output [3:0]y);


 //assign y = a * b;
 wire w1,w2,w3,w4,w5,w6,w7,w8;
 
 and a1(w1,a[0],b[0]);
 and a1(w2,a[0],b[1]);
 and a1(w3,a[1],b[0]);
 and a1(w4,a[1],b[1]);
 ha h1(w2,w3,w5,w6);
 ha h2(w4,w6,w7,w8);
 
 assign y = { w7,w5,w1} 

endmodule

/*10  - 2
11  - 3
     1x1 1x0   	 w21   w10
1x1 1x0      w41  w30
             1 1  0*/