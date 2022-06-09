module uni_shift(y,clk,rst, en,d,ip);

  output reg [7:0] y;
  input en;
  input [1:0] d;
  input [7:0] ip;
  input clk, rst;


  reg [7:0]temp;

  always @(posedge clk or posedge rst)
   begin
     if (rst)
       y <= 0;
     else  
       case(en)
         1'b1:
          begin                            
            temp <= ip;
          end
         1'b0:                              
           case (d)
            2'b00: y = {temp[6:0],1'b0};     //Left Shift //temp<<1;
            2'b01: y = {1'b0,temp[7:1]};    //Right Shift //temp>>1; 
            2'b10: y = {temp[6:0],temp[7]}; //Rotate Left
            2'b11: y = {temp[0],temp[7:1]};  //Rotate Right
           
          endcase              
		
		
		
		
   
      
       endcase
    end
endmodule