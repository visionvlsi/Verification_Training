module tb_ha;
  //convert inputs to reg
  //convert outputs to wire
  
  reg tb_a,tb_b;
  wire tb_sum,tb_carry;
  //ordered mapping 
  ha h1(tb_a,tb_b,tb_carry,tb_sum); // instantiation
  
  //to generate stimulus inside procedural blocks
  // all lhs signals should be declared as reg 
 
 initial
  begin
    tb_a=0;tb_b=0; #1 $display($time, tb_a,tb_b,tb_sum,tb_carry);
    tb_a=0;tb_b=1; #1 $display($time, tb_a,tb_b,tb_sum,tb_carry);
    tb_a=1;tb_b=0; #1 $display($time, tb_a,tb_b,tb_sum,tb_carry);
    tb_a=1;tb_b=1; #1 $display($time, tb_a,tb_b,tb_sum,tb_carry);

  end 
  

   
endmodule
