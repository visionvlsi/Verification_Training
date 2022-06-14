module my_shifter(data_in, control, data_out);
input [3:0]data_in;
input [1:0]control;  // {control[1],control[0]}= 2'b01 left shift; =2'b10 right shift; 
                     //                        =2'b11 data pass; =2'b00 no changes
output [3:0]data_out;
assign data_out = (control==2'b00) ? data_out : (control==2'b01) ? data_in<<1 : (control==2'b10) ? data_in >> 1 : data_in;
endmodule

