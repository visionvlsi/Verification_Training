//Swap / Buffer Circuit

//Swap / Buffer circuit can be implemented by using a simple 2X1 Multiplexer.


module swap_buffer(a,b,s,aout,bout);
input a,b,s;
output aout,bout;
  mux2x1 m1(.in1(a),.in2(b),.sel(s),.y(aout));
  mux2x1 m2(.in1(b),.in2(a),.sel(s),.y(bout));
endmodule

//mux2x1
module mux2x1(a,b,s,y);
  input a,b,s;
  output y;
  assign y=s?b:a;
endmodule
