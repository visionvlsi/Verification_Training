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
             $display(this.result);
            end
        1: begin 
            this.result= this.operand1 - this.operand2; // sub
            $display(this.result);
            end
        2: begin 
            this.result= this.operand1 * this.operand2; // mul
            $display(this.result);
            end
        3: begin 
            this.result= this.operand1 / this.operand2; // div
            $display(this.result);
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
      
      al=new(10,5,0,result);
      
    end
  
endmodule

//https://www.edaplayground.com/x/v5XM
