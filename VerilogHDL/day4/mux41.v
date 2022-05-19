module mux41(
 input [3:0]i,
 input [1:0]sel,
 output wor y
 );
 
 wire w1,w2,w3,w4;  

	`ifdef DFLOW
    assign w1 = ~sel[1] & ~sel[0] & i[0];
    assign w2 = ~sel[1] & sel[0] & i[1];
    assign w3 = sel[1] & ~sel[0] & i[2];
    assign w4 = sel[1] & sel[0] & i[3];
	
   assign  y = w1 | w2 | w3 | w4;
   `endif
   
   `ifdef GFLOW 
   wire sel1bar,sel0bar;
   
   not n1(sel1bar,sel[1]);
   not n2(sel0bar,sel[0]);
   
   and a1(w1,sel1bar,sel0bar,i[0]);
   and a2(w2,sel1bar,sel[0],i[1]);
   and a3(w3,sel[1],sel0bar,i[2]);
   and a4(w4,sel[1],sel[0],i[3]);
   
   or a5(y, w1,w2,w3,w4);
   `endif
 
 
endmodule
