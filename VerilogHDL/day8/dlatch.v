module dlatch(din,en,q);
 
 input din,en;
 output reg q;
 
 always @(din,en)
 begin
  if(en)
    q<=din;
  //else
    //q<=q;
 
 end

endmodule



