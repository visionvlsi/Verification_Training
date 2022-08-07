/*
Write a Program for Hierarchical class .
a. Take 2 Properties and Methods in each class.
b. Structure
c. Access all the methods and properties using class D handle.
*/
class classA;
  int a1;
  int b1;
  int sum;
  
  function new(int a1,int b1);
    this.a1=a1;
    this.b1=b1;
    
    sum=this.a1 + this.b1;
    
  endfunction
  
  function void displayA();
    $display("This is from classA: sum operation:: operand1=%0d and operand2=%0d and The sum is=%0d", this.a1, this.b1, sum);
  endfunction
  
  
endclass


class classB extends classA;
  int a2;
  int b2;
  int diff;
  
  function new(int a2,int b2);
   //classA=new(10,5);
    super.new(10,5);
    this.a2=a2;
    this.b2=b2;
    
    diff=this.a2 - this.b2;
    
  endfunction
  
  function void displayB();
    $display("This is from classB: subtraction operation:: operand1=%0d and operand2=%0d and The diff=%0d",this.a2, this.b2, diff);
  endfunction
  
endclass


class classC extends classB;
  int a3;
  int b3;
  int mult;
  
  function new(int a3,int b3);
  //  classB=new(10,5);
     super.new(10,5);
    this.a3=a3;
    this.b3=b3;
    
    mult=this.a3 * this.b3;
    
  endfunction
  
  function void displayC();
    $display("This is from classC: Multiplication operation:: operand1=%0d and operand2=%0d and The mult=%0d", this.a3, this.b3,mult);
  endfunction
  
endclass

class classD extends classC;
  int a4;
  int b4;
  int div;
  
  function new(int a4,int b4);
  //  classC=new(10,5);
     super.new(10,5);
    this.a4=a4;
    this.b4=b4;
    
    div=this.a4 / this.b4;
    
  endfunction
  
  function void displayD();
    $display("This is from classD: Division operation:: operand1=%0d and operand2=%0d and The div=%0d", this.a4, this.b4,div);
  endfunction
  
endclass




module tb;
  
  classD classd_h;
  
  initial begin
    
    classd_h=new(10,5);
    classd_h.displayD();
    classd_h.displayC();
    classd_h.displayB();
    classd_h.displayA();
    
    
  end
  
  
  
  
endmodule

//https://www.edaplayground.com/x/Zs7k
