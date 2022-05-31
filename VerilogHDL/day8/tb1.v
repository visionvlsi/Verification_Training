module tb;
  reg s,r,en;
  wire q;

srlatch s1(s,r,en ,q);

initial
 begin
  $monitor($time,s,r,en,q);
   en=0;s=0;r=0;
 #5 en=0;s=0;r=1;
 #5 en=0;s=1;r=0;
 #5 en=0;s=1;r=1;
 #5 en=1;s=0;r=0;
 #5 en=1;s=0;r=1;
 #5 en=1;s=1;r=0;
 #5 en=1;s=1;r=1;
 
 end
 
 
endmodule