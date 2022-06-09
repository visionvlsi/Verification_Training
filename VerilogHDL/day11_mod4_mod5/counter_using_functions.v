
module mod4_mod5(clk,rst,count);

  input clk,rst;
  output reg [2:0]count;
  
  parameter mod4=0 , mod5=1;
  
  reg state;
  reg [2:0]temp;
  always @(posedge clk or posedge rst)
  begin
   if(rst) state <=0;//5ns nba 
   else
    case(state)
	  mod4 : if(count == 3)  state <= mod5;
	         else     state<=mod4;
	  mod5 : if(count == 4) state <= mod4;
	        else  state <= mod5;
    endcase
  
  
  end
  
  always @(posedge clk or posedge rst)
  begin
   if(rst) begin 
            count <=0;
            temp <= count;
		 end 
   else 
    begin
	 case(state)
	  mod4 :  count <= counter(temp);
	  mod5 :  count <= counter(temp);
	endcase
	end
  end
 
  function reg [2:0]counter(input [2:0]pcount);
   begin
   counter = pcount + 3'd1;
   temp = counter;
   end
  endfunction
  
  
  

endmodule

//https://www.edaplayground.com/x/cKQ5
