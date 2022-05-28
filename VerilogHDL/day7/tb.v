module tb;

reg [3:0] a;
reg [3:0] b;
reg cin;

wire [3:0] sum;
wire cout;


cla_adder uut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
initial begin

a = 0; b = 0; cin = 0; #100; $display(a,b,cin,":",sum,cout);
a = 2; b = 3; cin = 1; #100; $display(a,b,cin,":",sum,cout);
a = 1; b = 4; cin = 2; #100; $display(a,b,cin,":",sum,cout);
a = 5; b = 6; cin = 1; #100; $display(a,b,cin,":",sum,cout);
end
endmodule