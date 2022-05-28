/// 1:4 Demux//////////////////
module demux_r(input a,input s0,s1,output y0,y1,y2,y3);
    wire w1,w2;
     not n1(w1,s0);
     not n2(w2,s1);
      and a1(y0,w1,w2,a);
      and a2(y1,w1,s1,a);
      and a3(y2,s0,w2,a);
      and a4(y3,s0,s1,a);
  
endmodule

module demux_BFM(input i,s0,s1,output reg [3:0]y);
       always @(*)
          begin
          case({s0,s1})

              2'b00:y={3'b0,i};
               2'b01:y={2'b0,i,1'b0};
               2'b10:y={1'b0,i,2'b0};
               2'b11:y={i,3'b0};
          endcase
     end
  endmodule


module demux_rand_tb;
 reg  a_i;
  reg so_i,s1_i;
  wire [3:0]y_o,y_ref;

demux_r d11(.a(a_i),.s0(so_i),.s1(s1_i),.y0(y_o[0]),.y1(y_o[1]),.y2(y_o[2]),.y3(y_o[3]));
demux_BFM d2(.i(a_i),.s0(so_i),.s1(s1_i),.y(y_ref));

initial 
repeat(20)
   begin
  demux_rand_gen($random,$random,$random);
  
end


task demux_rand_gen;
input a_t,so_t,s1_t;
begin
  a_i=a_t;
   so_i=so_t;
   s1_i=s1_t;

 #10;
  if( (y_o[0]==y_ref[0]) &&    (y_o[1]==y_ref[1])  &&    (y_o[2]==y_ref[2]) &&  (y_o[3]==y_ref[3])  )
        
            $display($time,"Demux  matched ,a_i=%b,so_i=%b,s1_i is %b, y_ref is %b",a_i,so_i,s1_i,y_ref);
         else
       $display($time,"Demux  not  matched ,a_i=%b,so_i=%b,s1_i is %b, y_ref is %b",a_i,so_i,s1_i,y_ref);
end
endtask
endmodule