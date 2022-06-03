// Code your design here
// FA
module fa(a,b,cin,sum,co);
  input a,b,cin;
  output sum,co;
  assign sum=a^b^cin;
  assign co=(a&b)|(a&cin)|(b&cin);
endmodule

//XOR gate

module xorgate(y,a,b);
  input a,b;
  output y;
  assign y=a^b;
endmodule

module adderCUMsub4bit(a,b,control,sumDiff,carry_borrow);
  input [3:0]a,b;
  input control;
  output [3:0]sumDiff;
  output carry_borrow;
  wire [3:0]bcomp;
  
  
  xorgate ins1(bcomp[0],control,b[0]);
  xorgate ins2(bcomp[1],control,b[1]);
  xorgate ins3(bcomp[2],control,b[2]);
  xorgate ins4(bcomp[3],control,b[3]);
  
  fa fa1(a[0],bcomp[0],control,sumDiff[0],c1);
  fa fa2(a[1],bcomp[1],c1,sumDiff[1],c2);
  fa fa3(a[2],bcomp[2],c2,sumDiff[2],c3);
  fa fa4(a[3],bcomp[3],c3,sumDiff[3],carry_borrow);
endmodule

module addcumsub_BFM(a,b,control,sumdiff,carryborrow);
  
  input [3:0]a,b;
  input control;
  output [3:0]sumdiff;
  output carryborrow;
   wire [3:0]bcomp;
   xorgate ins1(bcomp[0],control,b[0]);
  xorgate ins2(bcomp[1],control,b[1]);
  xorgate ins3(bcomp[2],control,b[2]);
  xorgate ins4(bcomp[3],control,b[3]);
  
  fa fa1(a[0],bcomp[0],control,sumdiff[0],c1);
  fa fa2(a[1],bcomp[1],c1,sumdiff[1],c2);
  fa fa3(a[2],bcomp[2],c2,sumdiff[2],c3);
  fa fa4(a[3],bcomp[3],c3,sumdiff[3],carryborrow);
endmodule
 
  
  //TB

// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
module test;
  reg [3:0]a,b;
  reg control;
  wire [3:0]sumDiff,sd_ref;
  wire carry_borrow,cb_ref;
  
  adderCUMsub4bit ins1(a,b,control,sumDiff,carry_borrow);
  addcumsub_BFM ins2(.a(a),.b(b),.control(control),.sumdiff(sd_ref),.carryborrow(cb_ref));
  
  initial 
    repeat(20)
   begin
     addcumsumtask($random,$random,$random);
  
end


task  addcumsumtask;
  input [3:0]a_t,so_t;
  input s1_t;
begin
   a=a_t;
   b=so_t;
   control=s1_t;

 #10;
  if( (sumDiff==sd_ref) &&   (carry_borrow==cb_ref))
        
    $display("Results are correct: a=%b, b=%b, control=%b,sumDiff=%b,sd_ref=%b,carry_borrow=%b,cb_ref=%b",a,b,control,sumDiff,sd_ref,carry_borrow,cb_ref);
         else
           $display("Results are incorrect: a=%b, b=%b, control=%b,sumDiff=%b,sd_ref=%b,carry_borrow=%b,cb_ref=%b",a,b,control,sumDiff,sd_ref,carry_borrow,cb_ref);
end
endtask
endmodule
  


//EDAPlayground https://www.edaplayground.com/x/jKWC
