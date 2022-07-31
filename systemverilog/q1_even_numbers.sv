//1. Write a program to enter even numbers with array size 30 elements using functions inside a class and display the result.

class evennumbers;
  int en[30];
  function new(int en[30]);
    this.en=en;
  for(int i=0; i<=29; i++)
    begin
      if(en[i]%2==0)
        $display($time, "The even number is en[%0d]=%0d", i, en[i]);
    end
  endfunction
endclass

module tb;
  evennumbers evennum;
  int en[30];
  initial
    begin
      en='{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30};
      evennum=new(en);
    end
endmodule

//https://www.edaplayground.com/x/jZWc
