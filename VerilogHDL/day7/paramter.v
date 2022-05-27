module adder2(a,b,sum);
parameter N=10;
input [N-1:0]a,b;
output [N-1:0]sum;


assign sum = a+b;

endmodule

module counter;

adder2 #(10) (inputs , outputs);//parameter overide

endmodule