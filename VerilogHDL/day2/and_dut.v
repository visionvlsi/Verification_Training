module andgate(a,b,y);//signal list // verilog 1995 style
//direction of signals
  input a,b;
  output y;
  
  //body
    //dataflow modelling style
	
	 assign  y = a & b; //continous assignment.
  
endmodule


