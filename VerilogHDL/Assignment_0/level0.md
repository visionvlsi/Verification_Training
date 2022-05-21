# LEVEL-0:

<ol>
<li>Design and implement all basic gates in data-flow and behavioral modeling.</li>
<li>Design and implement FA, HA in data-flow and structural modeling.</li>
<li>Design and implement Multiplexer using conditional statement.</li>
<li>Design and implement Or, And, Xor gate using Multiplexer (2×1).</li>
<li>Design and implement 4-bit adder/sub using structural.</li>
<li>Design and implement Even Parity & Odd parity generator.</li>
</ol>

//Design and implement all basic gates in data-flow and behavioral modeling.<br />

# Basic gates - NOT, AND, NAND, OR, NOR, XOR, XNOR<br />

// Code your design here<br />
module data_flow(a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);<br>
input a,b;<br>
output ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor;<br>
<p>assign ynota=~a, <br>
       ynotb=~b, <br>
       yand=a&b, <br>
       ynand=~(a&b), <br>
       yor=a|b, <br>
       ynor=~(a|b), <br>
       yxor=a^b, <br>
       yxnor= a~^b; <br>
endmodule<br></p>

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


<p>// Code your design here<br />
module beha_model(a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);<br />
input a,b;<br />
output reg ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor;<br />
always@*<br />
  begin<br />
ynota=~a;<br />
ynotb=~b;<br />
yand=a&b;<br />
    ynand=~(a&b);<br />
yor=a|b;<br />
    ynor=~(a|b);<br />
yxor=a^b;<br />
yxnor= a~^b;<br />
  end<br />
endmodule<br /></p>


<p>// Code your testbench here<br />
`timescale 1ns/1ps<br />
module test;<br />

reg a,b;<br />
wire ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor;<br />
integer i;<br />

beha_model ins1(a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);<br />

initial<br />
for(i=0;i<=3;i=i+1)<br />
begin<br />
{a,b}=i;<br />
#5;<br />
end<br />
initial<br />
$monitor("simtime=%0g, a=%b, b=%b, ynota=%b,ynotb=%b,yand=%b,ynand=%b,yor=%b,ynor=%b,yxor=%b,yxnor=%b",$time,a,b,ynota,ynotb,yand,ynand,yor,ynor,yxor,yxnor);<br />
initial<br />
#80 $finish;<br />
endmodule<br /></p>


https://www.edaplayground.com/x/wQdm

# 2. Design and implement FA, HA in data-flow and structural modeling.

<p> Half adder in data-flow and structural modeling<br/>
       
// Code your design here<br/>
//`define DF<br/>
`define STRUCTURAL<br/>
module ha_df_struc(a,b,sum,co);<br/>
  input a,b;<br/>
  output sum,co;<br/>
  
  `ifdef DF<br/>
  
  	assign 	sum=a^b,<br/>
         	       co=a&b;<br/>
  
  `endif<br/>
  
    `ifdef STRUCTURAL<br/>
  
  	xor(sum,a,b);<br/>
  	and(co,a,b);<br/>
  
   `endif<br/>
    
endmodule<br/></p>
       
  <p>// Code your testbench here<br/>
`timescale 1ns/1ns<br/>
module test;<br/>
  
  reg a,b;<br/>
  wire sum,co;<br/>
  
   ha_df_struc ins1(a,b,sum,co);<br/>
  
  initial begin<br/>
       {a,b}=2'b00;<br/>
    #5 {a,b}=2'b01;<br/>
    #5 {a,b}=2'b10;<br/>
    #5 {a,b}=2'b11;<br/>
    #5 $finish;<br/>
    
  end<br/>
  
  initial begin<br/>
    $monitor("simtime=%0g, a=%b, b=%b, sum=%b, co=%b",$time, a, b, sum, co);<br/>
    
  end<br/>
  
endmodule<br/></p>

https://www.edaplayground.com/x/f5qk
