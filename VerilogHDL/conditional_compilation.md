<p>// Code your design here<br/>
`define DFLOW<br/>

module mux(<br/>
 input i0,i1,sel,<br/>
 output y<br/>
 );<br/>
 
 //wire w1,w2,sbar; <br/>
  //y = sbar*i0 + s *i1<br/>
  <br/>  
 `ifdef DFLOW<br/>
  assign y =  (~(sel) & i0) | sel &i1;<br/>
 `endif<br/>
  <br/>
 `ifdef GFLOW<br/>
 not n1(sbar,sel);<br/>
  and a1(w1,sbar, i0);<br/>
  and a2(w2,sel, i1);<br/>
  or  a3(y , w1, w2);<br/>
 `endif<br/>
  
endmodule<br/></p>

<p>//Code your testbench here<br/>
`timescale 1ns/1ps<br/>
module test;<br/>
  reg i0,i1,sel;<br/>
  wire y;<br/>
  <br/>
  mux  ins1(i0,i1,sel,y);<br/>
  <br/>
  initial<br/>
    begin<br/>
      i0=0; i1=1;<br/>
      #5 sel=0;<br/>
      #5 sel=1;<br/>
      #5 sel=0;<br/>
      #5 sel=1;<br/>
    end<br/>
  initial<br/>
    $monitor("i0=%b, i1=%b, sel=%b, y=%b",i0,i1,sel,y);<br/>
endmodule<br/></p>


https://www.edaplayground.com/x/qCzt
