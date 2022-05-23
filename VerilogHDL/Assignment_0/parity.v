//Design and implement Even Parity & Odd parity generator

// Even Parity Code 
module even_parity(a,paritybit);
  parameter N=5;
  input [N-1:0]a;
  output reg paritybit;
  integer i,count;
  
  always@*
    begin
      count=0;
      for(i=0; i<=N-1; i=i+1)
        begin
          if(a[i])
            count=count+1'b1;
        end
      if(count%2==1'b0)
        paritybit=1'b0;
      else
        paritybit=1'b1;
        
    end
endmodule

//testbench 
`timescale 1ns/1ns
module test;
   parameter N=5;
  reg [N-1:0]a;
  wire paritybit;
  
  even_parity ins1(a,paritybit);
  
  initial begin 
       a=3;
    #5 a=9;
    #5 a=7;
    #5 a=17;
    #5 a=19;
  
  end
  
  initial 
    $monitor("a=%b,paritybit=%b",a,paritybit);
endmodule
          
//EDAPlayground link https://www.edaplayground.com/x/p94C


      
