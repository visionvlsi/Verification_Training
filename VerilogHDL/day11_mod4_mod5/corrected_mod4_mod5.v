// Code your design here
module mod4_mod5(clk,rst,count);

  input clk,rst;
  output reg [2:0]count;
  
  parameter mod4=0 , mod5=1;
  
  reg state;
  reg [2:0]temp;
  always @(posedge clk or posedge rst)
  begin
    if(rst) begin state <=0; count<=0; end//5ns nba 
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
   	 case(state)
       mod4 : if(count ==3) count <=0; else count <= counter(count);
    mod5 : if(count ==4) count <=0; else count <= counter(count);
     //  mod4 :  count <= counter(count);
   //    mod5 :  count <= counter(count);
	endcase
	end
 
 
  function reg [2:0]counter(input [2:0]count);
   begin
   count = count + 3'd1;
     counter=count;
     end
  endfunction

endmodule

// testbench 

module tb;

reg clk,rst;
wire [2:0]count;

mod4_mod5 m1(clk,rst,count);

always #5 clk=~clk;

initial
 begin
  clk=0;rst=1;
  #6 rst=0;
 
 end
 
 initial #100 $stop;
  
  initial begin $dumpfile("dump.vcd"); $dumpvars(1);end
endmodule

// https://www.edaplayground.com/x/cKQ5
