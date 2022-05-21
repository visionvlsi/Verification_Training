module rca(
  input [2:0]a,b,
  input cin,
  output [3:0]sum
);

 fa f1(a[0],b[0],cin, sum[0],w0);// named mapping
 fa f2(a[1],b[1],w0, sum[1],w1);
 fa f3(a[2],b[2],w1, sum[2],sum[3]);
 
   


endmodule




