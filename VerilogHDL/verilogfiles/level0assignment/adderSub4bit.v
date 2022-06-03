//FA Code your design here

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

// Adder cum subtract 4-bit

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


// Code your testbench here

`timescale 1ns/1ns
module test;
  reg [3:0]a,b;
  reg control;
  wire [3:0]sumDiff;
  wire carry_borrow;
  
  adderCUMsub4bit ins1(a,b,control,sumDiff,carry_borrow);
  
  initial begin 
  a=8; b=7;control=0;
  #10 control=1;
  #5 a=7; b=8;control=0;
    #10 control=1;
  
  end
  
  initial
    $monitor("a=%b, b=%b, control=%b,sumDiff=%b,carry_borrow=%b",a,b,control,sumDiff,carry_borrow);
endmodule
