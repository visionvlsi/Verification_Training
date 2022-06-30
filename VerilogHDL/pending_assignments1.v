// ANALYSE THE DFF WAVEFORMS FOR BOTH SYNCHRONOUS AND ASYNCHRONOUS CIRCUITS.
// SYNCHRONOUS 
module dff(clk,rst,d,q);
 input clk,rst;
 input d;
 output reg q;
 
 always@(posedge clk)
  begin
   if(rst)
    q<=0;
   else
    q<=d;  
  end
endmodule

//testbench

`timescale 1ns/1ps
module dff_test;
 reg clk,rst;
 reg d;
 wire q;
  dff cut(clk,rst,d,q);
 initial begin
  clk=0;
  forever #5 clk=~clk;
 end
 
 initial begin
  @(negedge clk) rst=1;
  @(posedge clk);
  @(negedge clk) rst=0; d=1;
  @(posedge clk) ;
  @(negedge clk) d=0;
  @(posedge clk) ;
  @(negedge clk) d=1;
  @(posedge clk) ;
  #20 $finish;
  end
 initial begin 
  $dumpfile("dff.vcd");
  $dumpvars(1);
 end
endmodule

//https://www.edaplayground.com/x/irN_

//ASYNCHRONOUS
module dff_async(clk,rst,d,q);
 input clk,rst;
 input d;
 output reg q;
 
 always@(posedge clk, posedge rst)
  begin
   if(rst)
    q<=0;
   else
    q<=d;  
  end
endmodule

//testbench

`timescale 1ns/1ps
module dff_async_test;
 reg clk,rst;
 reg d;
 wire q;
  dff cut(clk,rst,d,q);
 initial begin
  clk=0; 
  forever #5 clk=~clk;
 end

 always
  begin
   #20;
   rst=0;
   #60;
   rst=1;
   #45;
  end
   
 initial begin
  
  @(negedge clk)  d=1;
  @(posedge clk) ;
  @(negedge clk) d=0;
  @(posedge clk) ;
  @(negedge clk) d=1;
  @(posedge clk) ;
  #20 $finish;
  end
 initial begin 
  $dumpfile("dff.vcd");
  $dumpvars(1);
 end
endmodule

//https://www.edaplayground.com/x/cxtC

// 1. Synchronous Counters : Based on clock
 









//2. Asynchronous Counters: May be clock or more than signal other than clock


//3. Structural or Behavioral Counters Count 0-10 : Async 4 FF


// 4. Up and Down Counter - 0 1 2 3 2 1 0 1 2 3 2 1 0  .....
   

// 5. 0123454323456789876 - TRY


//6. FSM TYPE COUNTERS 1. ModN Counter 2.   Mixed Mod 3.Fancy


//TRY TO DESIGN MEALY AND MOORE STATEMACHINE FOR SEQUENCE DETECTOR 1010,1011

