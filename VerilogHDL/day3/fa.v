module fa(
 input a,b,cin,
 output sum,carry
 );
 
 wire w1,w2,w3;
 
 // to pass the output values from one gate output to other gate input.

 
  assign sum = a ^ b ^ cin;
  
  assign w1 = a &b;
  assign w2 = b & cin;
  assign w3 = cin & a;
  
  assign carry = w1 | w2 | w3;
  
  //assign carry = a&b |  b & cin | cin & a;
 
endmodule


 
 