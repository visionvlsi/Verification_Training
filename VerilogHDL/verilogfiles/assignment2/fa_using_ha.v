// Code your design here HA design
module ha(a,b,sum,co);
input a,b;
output sum,co;
assign sum=a^b;
assign co=a&b;
endmodule

// FA design

module fa(a,b,cin,sum,co);
input a,b,cin;
output sum,co;
ha ins1(a,b,s1,c1);
ha ins2(cin,s1,sum,c2);
or(co,c1,c2);
endmodule