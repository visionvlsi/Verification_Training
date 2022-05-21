module mux81(
  input [7:0]i,
  input [2:0]sel,
  output y
);

wire [5:0]w;

mux21 m1(.i0(i[0]),.i1(i[1]),.sel(sel[0]),.y(w[0]));
mux21 m2(i[2],i[3],sel[0],w[1]);
mux21 m3(i[4],i[5],sel[0],w[2]);
mux21 m4(i[6],i[7],sel[0],w[3]);
mux21 m5(w[0],w[1],sel[1],w[4]);
mux21 m6(w[2],w[3],sel[1],w[5]);
mux21 m7(w[4],w[5],sel[2],y);

endmodule