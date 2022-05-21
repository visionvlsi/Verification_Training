//xor using mux

module xor_using_mux(
input a,b,
output y);

//structural

mux21 m1(.i0(b),.i1(~b),.sel(a),.y(y));


endmodule

//HW CHECK THIS DESIGN USING DIRECTED TB.