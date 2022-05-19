`timescale 1ns / 1ps

//tb
module tb_and;
  reg   tb_a,tb_b;//x,x
  wire  tb_y;//z
  
  andgate a1(.a(tb_a),.b(tb_b),.y(tb_y));//copy of dut - instantiation
  //andgate a2(.a(1'b0),.b(1'b1).y(tb_y));//copy of dut - instantiation
  //andgate a3(.a(1'b1),.b(1'b0));//copy of dut - instantiation
  //andgate a4(.a(1'b1),.b(1'b1));//copy of dut - instantiation
  
  initial
   begin // stimulus 
    tb_a=0;tb_b=0; #1 $display($time, "a=%0h,b=%0h,y=%0h",tb_a,tb_b,tb_y);
    tb_a=0;tb_b=1; #1 $display($time, "a=%0h,b=%h,y=%h",tb_a,tb_b,tb_y);
    tb_a=1;tb_b=0; #1 $display($time, "a=%0h,b=%h,y=%h",tb_a,tb_b,tb_y);
    tb_a=1;tb_b=1; #1 $display($time, "a=%0h,b=%h,y=%h", tb_a,tb_b,tb_y);
  end

endmodule






