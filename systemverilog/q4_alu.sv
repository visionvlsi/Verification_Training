/*
Design a ALU inside a class.
a. Write program to perform operations [+,-,*,/]
and display result using Scope Resolution Operator.*/

class alu;
  bit [7:0]operand1, operand2;
  bit [1:0]sel;
  bit [8:0]result;
  
  function new(input bit[7:0]operand1, operand2,input bit[1:0]sel,output bit [8:0]result);
    
    this.operand1=operand1;
    this.operand2=operand2;
    this.sel=sel;
    this.result=result;
    
    case(sel)
        0: begin 
              this.result= this.operand1 + this.operand2; // add
          $display(" For the operands %0d, %0d and for the sel=%0d,The value of addition is : %0d",this.operand1, this.operand2, this.sel,this.result);
            end
        1: begin 
            this.result= this.operand1 - this.operand2; // sub
          $display(" For the operands %0d, %0d and for the sel=%0d,The value of subtraction is %0d",this.operand1, this.operand2, this.sel,this.result);
            end
        2: begin 
            this.result= this.operand1 * this.operand2; // mul
          $display(" For the operands %0d, %0d and for the sel=%0d,The value of multiplication is : %0d",this.operand1, this.operand2, this.sel,this.result);
            end
        3: begin 
            this.result= this.operand1 / this.operand2; // div
          $display(" For the operands %0d, %0d and for the sel=%0d,The value of division is: %0d",this.operand1, this.operand2, this.sel,this.result);
            end
    endcase
    
    
  endfunction
  
  
endclass
module tb;
  bit [7:0]operand1, operand2;
  bit [1:0]sel;
  bit [8:0]result;
  alu al;
    initial begin
      operand1=10;
      operand2=5;
      
      for(int i=0; i<4; i++) begin
        sel=i;      
        al=new(operand1,operand2,sel,result);
        #5;      
    end
    end
  
endmodule

//https://www.edaplayground.com/x/r99t
