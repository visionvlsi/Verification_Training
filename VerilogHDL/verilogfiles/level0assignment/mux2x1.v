//Design and implement Multiplexer using conditional statement.

// design code for mux21

module mux21(a,b,sel,y);
  input a,b,sel;
  output y;
  assign y=sel?b:a;
endmodule
