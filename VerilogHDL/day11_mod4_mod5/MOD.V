//MODN COUNTERS
//MOD4 01230123
//MOD4-MOD5
//012301234 012301234 012301234 012301234

module mod4_mod5(clk,rst,count);

  input clk,rst;
  output reg [2:0]count;
  
  parameter mod4=0 , mod5=1;
  
  reg state;
  
  always @(posedge clk or posedge rst)
  begin
	  if(rst) begin state <=0; count=0; end
   else
    case(state)
	  mod4 : if(count == 3)  state <= mod5;
	         else     state<=mod4;
	  mod5 : if(count == 4) state <= mod4;
	        else  state <= mod5;
    endcase
  
  
  end
  
  
  always @(posedge clk)
  begin
   case(state)
    mod4 : if(count ==3) count <=0; else count <= count + 3'd1;
    mod5 : if(count ==4) count <=0; else count <= count + 3'd1;
  end
  

endmodule



// https://www.edaplayground.com/x/f2J_
    
