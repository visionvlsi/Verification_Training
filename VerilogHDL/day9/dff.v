module dff(clk,rst,din,dout);
 input clk,rst;
 input  din;
 output reg dout;
 
 //behaviroal modelling
 //we use procedural blocks
 //always , initial
 //always - design initial - tb
 
 /*
 1. synchronous : they are always dependent only on clock.
 2. asynchrnous : they are dependent either clock or any other signal
 */
 
 //sync dff
 //rst 1 active high reset
 //rst 0 active low reset
 always @(posedge clk)
 begin
  if(rst==1) dout<=0; //<= NBA 
  else       dout<=din;
 
 end
 



endmodule 