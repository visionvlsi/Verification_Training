/*LEVEL-3:

1. Write the hardware description of a 4-bit PRBS (pseudo-random Binary sequence) generator using a linear feedback shift register and test it.?

2. Write the hardware description of a 8-bit register with shift left and shift right modes of operation based on selection line and  write its test operation?

3. Write a program for universal shift register?

4. write a program for universal synchronous counter which includes up , down and updown counter?

5. write a program for universal asynchronous counter which includes up , down and updown counter?

6. Write the hardware description of a 4-bit mod-13 counter and test it.?

7. write a program for synchronous fifo for 32 locations depth and 16 bit data size?

8. design and implement asynchronous fifo with write clock 512 mhz and read clock 64 mhz?(hint: calculate the fifo depth and proceed) */

////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

//1. Write the hardware description of a 4-bit PRBS (pseudo-random Binary sequence) generator using a linear feedback shift register and test it.?

/* PRBS or Pseudo Random Binary Sequence is essentially a random sequence of binary numbers. It is random in a sense that the value of an element of the 
sequence is independent of the values of any of the other elements. It is 'pseudo' because it is deterministic and after N elements it starts to repeat itself, 
unlike real random sequences.. */

module dff(clk,rst,d,q);
  input clk,rst,d;
  output reg q;
  always@(posedge clk)
    if(rst)
      q<=1;
  else
    q<=d;
endmodule

module lfsr4bit(clk,rst,data_out);
  input clk,rst;
  output [3:0]data_out;
  
  wire [3:0]data_int;
  wire tap;
  
  assign tap=data_int[3]^data_int[0];
  
  dff ins1(clk,rst,tap,data_int[0]);
  dff ins2(clk,rst,data_int[0],data_int[1]);
  dff ins3(clk,rst,data_int[1],data_int[2]);
  dff ins4(clk,rst,data_int[2],data_int[3]);
  
  assign data_out=data_int;
endmodule
  
     
//testbench 

`timescale 1ns/1ps
module tb;
  reg clk,rst;
  wire [3:0]data_out;
  
  lfsr4bit ins22(clk,rst,data_out);
  
  initial 
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      rst=0;
      #5 rst=1;
      #2 rst=0;
    end
  
  initial
    $monitor($time, "clk=%b,rst=%b,data_out=%0d",clk,rst,data_out);
  initial
    #2000 $finish;
endmodule

///https://www.edaplayground.com/x/H5WG
