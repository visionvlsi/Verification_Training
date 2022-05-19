module mux(
 input i0,i1,sel,
 output y
 );
 
 //wire w1,w2,sbar; 
  //y = sbar*i0 + s *i1
  
  
 // `ifdef DFLOW
  assign y =  (~(sel) & i0) | sel &i1;
 // `endif
  
 // `ifdef GFLOW
 /* not n1(sbar,sel);
  and a1(w1,sbar, i0);
  and a2(w2,sel, i1);
  or  a3(y , w1, w2);*/
 // `endif
  
 
endmodule
 
