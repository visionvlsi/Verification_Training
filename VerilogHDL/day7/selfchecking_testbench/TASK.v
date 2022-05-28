// 6. Binary to Grey 
module b_to_g(a,o);
  input [3:0]a;
   output [3:0]o;
assign o={a[3],{a[3]^a[2]},{a[2]^a[1]},{a[1]^a[0]}};
endmodule

module b_to_g_tb;
	reg [3:0]a_i;
        wire [3:0]o_o;
b_to_g b1(.a(a_i),.o(o_o));
initial 
begin
  bg_gen(4'b1100,4'b1010);
  bg_gen(4'b1010,4'b1111);
  bg_gen(4'b1011,4'b1111);
end
task bg_gen;
 input [3:0]a_t,o_t;
begin
   a_i=a_t;
  #5 if(o_o==o_t)
     $display("Data matched, a_i is %b, a_t is %b, o_o is %b, o_t is %b",a_i,a_t,o_o,o_t);
   else
       $display("Data not matched, a_i is %b, a_t is %b, o_o is %b, o_t is %b",a_i,a_t,o_o,o_t);
end
endtask
endmodule
