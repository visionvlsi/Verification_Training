// Code your design here
`define DFLOW

module mux(
 input i0,i1,sel,
 output y
 );
 
 //wire w1,w2,sbar; 
  //y = sbar*i0 + s *i1
  
  
 `ifdef DFLOW
  assign y =  (~(sel) & i0) | sel &i1;
 `endif
  
 `ifdef GFLOW
 not n1(sbar,sel);
  and a1(w1,sbar, i0);
  and a2(w2,sel, i1);
  or  a3(y , w1, w2);
 `endif
  
 
endmodule

//Code your testbench here
`timescale 1ns/1ps
module test;
  reg i0,i1,sel;
  wire y;
  
  mux  ins1(i0,i1,sel,y);
  
  initial
    begin
      i0=0; i1=1;
      #5 sel=0;
      #5 sel=1;
      #5 sel=0;
      #5 sel=1;
    end
  initial
    $monitor("i0=%b, i1=%b, sel=%b, y=%b",i0,i1,sel,y);
endmodule


https://www.edaplayground.com/x/qCzt
