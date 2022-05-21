# LEVEL-0:

<ul>
<li>Design and implement all basic gates in data-flow and behavioral modeling.</li>
<li>Design and implement F.A, HA in data-flow and structural modeling.</li>
<li>Design and implement Multiplexer using conditional statement.</li>
<li>Design and implement Or, And, Xor gate using Multiplexer (2×1).</li>
<li>Design and implement 4-bit adder/sub using structural.</li>
<li>Design and implement Even Parity & Odd parity generator.</li>
</ul>

//Design and implement all basic gates in data-flow and behavioral modeling.<br />

# Basic gates - NOT, AND, NAND, OR, NOR, XOR, XNOR<br />

// Code your design here<br />
module data_flow(a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);<br>
input a,b;<br>
output ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor;<br>
assign ynota=~a, <br>
       ynotb=~b, <br>
       yand=a&b, <br>
       ynand=~(a&b), <br>
       yor=a|b, <br>
       ynor=~(a|b), <br>
       yxor=a^b, <br>
       yxnor= a~^b; <br>
endmodule<br>

// Code your testbench here<br />

`timescale 1ns/1ps<br />
module test;<br />
  
  reg a,b;<br />
  wire ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor;<br />
  integer i;<br />
  
  data_flow  ins1(a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);<br />
  <br />
  initial <br />
  for(i=0;i<=3;i=i+1)<br />
    begin<br />
      {a,b}=i;<br />
      #5;<br />
    end<br />
  initial<br />
    $monitor("simtime=%0g, a=%b, b=%b, ynota=%b,ynotb=%b,yand=%b,ynand=%b,yor=%b,ynor=%b,yxor=%b,yxnor=%b",$time,a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);<br />
  initial<br />
  #80 $finish;<br />
endmodule<br />


https://www.edaplayground.com/x/SH5G
