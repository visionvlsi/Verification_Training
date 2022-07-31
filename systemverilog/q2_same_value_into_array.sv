//Write a program to enter same value into array size 10 elements using functions inside a class and display the result.

class samevalue_array;
  int values[10];
  function new(int values[10]);
    this.values=values;
    foreach (values[i])
      $display ("values[%0d] = %0d", i, values[i]);
  endfunction
endclass

module tb;
  int values[10];
  samevalue_array sva;
   initial begin
          sva=new('{10{9}});
     
   end
endmodule

//https://www.edaplayground.com/x/TREU
