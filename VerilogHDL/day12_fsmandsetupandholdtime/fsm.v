module fsm(clk,rst,coinprice,melay,moore);

  input clk,rst;
  input [3:0]coinprice;
  output reg melay;
  output moore;
  
  
  reg [1:0]state;
 parameter IDLE=2'b00,
           s1=2'b01,
		   s2=2'b10,
		   s3=2'b11;
		   
 always @(posedge clk or posedge rst)
 begin
  if(rst) state<=IDLE;
   else
     case(state)
	  IDLE : if(coinprice == 4'd5)
	            state <= s1;
		     else if(coinprice == 4'd10)
			    state <= s2;
			 else
			    state <= IDLE;
	 s1 : if(coinprice == 4'd5)
	            state <= s2;
		     else if(coinprice == 4'd10)
			    state <= s3;
			 else
			    state <= s1;
	 s2 : if(coinprice == 4'd5)
	            state <= s3;
		     else if(coinprice == 4'd10)
			    state <= s3;
			 else
			    state <= s2;
	s3 : state <= IDLE;
			
   endcase
 end

  assign moore = state == s3;
  
  
  always @ (state,coinprice)
  begin
   case(state)
    s2 : melay =  (coinprice == 4'd5 || coinprice ==4'd10) ? 1 : 0;
	s1 : melay = coinprice == 4'd10 ? 1: 0;
	default : melay =0;
	endcase
  
  end


endmodule


