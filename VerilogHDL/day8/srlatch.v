module srlatch(s,r,en ,q);
 input s,r,en;
 output reg q;
//behvioral
always @(s,r,en)
// all inputs should be in sesitvity list
begin
 if(en==0) q<=0;
 else
  begin
   case({s,r})
    2'b00 : q<=q;
    2'b01 : q<=1'b0 ;
    2'b10 : q<=1'b1 ;
    2'b11 : q<=1'bx ;
   endcase
  end
  
 

end


endmodule