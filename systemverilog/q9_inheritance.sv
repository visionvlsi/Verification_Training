/*
Inheritance:
1. Take a scenario of some properties in 1 parent class ,2 child class.
2. Take new function in both parent and child.
3. Try to access new function of parent inside function of both childs.
*/

class class_parent;

int a;

function new(int a);
this.a=a;
  $display("[From parent class] :: The value of a is=%0d", a);
endfunction


endclass


class class_child1 extends class_parent;

int b;

function new(int b);
  super.new(b);
this.b=b;
  $display("[From child1 class] :: The value of b is=%0d", b);
endfunction

endclass

class class_child2 extends class_parent;

int c;

function new(int c);
  super.new(c);
this.c=c;
  $display("[From child2 class] :: The value of c is=%0d", c);
endfunction

endclass



module tb;
  
  class_child1 ch1;
  class_child2 ch2;
  
  initial begin
    ch1=new(67);
    ch2=new(84);    
  end
  
endmodule

//https://www.edaplayground.com/x/mjLg
