module andgate(a,b,y);//signal list
//direction of signals
  input a,b;
  output y;
  
  //body
    //dataflow modelling style
	
	 assign  y = a & b; //continous assignment.
  
endmodule

//tb
module tb_and;
  reg   tb_a,tb_b;
  wire  tb_y;
  
  andgate a1(.a(tb_a),.b(tb_b).y(tb_y));//copy of dut - instantiation
  //andgate a2(.a(1'b0),.b(1'b1).y(tb_y));//copy of dut - instantiation
  //andgate a3(.a(1'b1),.b(1'b0));//copy of dut - instantiation
  //andgate a4(.a(1'b1),.b(1'b1));//copy of dut - instantiation
  
  initial
   begin // stimulus 
    tb_a=0;tb_b=0; #1 $display($time, "a=%0h,b=%h,y=%h"a,b,y);
    tb_a=0;tb_b=1; #1 $display($time, "a=%0h,b=%h,y=%h"a,b,y);
    tb_a=1;tb_b=0; #1 $display($time, "a=%0h,b=%h,y=%h"a,b,y);
    tb_a=1;tb_b=1; #1 $display($time, "a=%0h,b=%h,y=%h"a,b,y);
  end

endmodule
