module  tb;
  reg clk=0;
  
  function reg finish;
  input i;
  begin
    $finish;
  end
  endfunction
  
  always #5 clk= $time==100 ?  finish(1) : !clk;
  
  
  always @(clk)  $display($time ,"::", clk);
  
  
 // initial #100 $finish;
  
  
endmodule