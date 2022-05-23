module mux21(
 input [1:0]i0,i1,
 input sel,
 output [1:0]y
 );
 

 
  assign y =  (~(sel) & i0) | sel &i1;

  

  
 
endmodule
 
