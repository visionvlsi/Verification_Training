//MUX8x1 using gatelevel

module mux8x1(i,s,y);
input [7:0]i;
input [2:0]s;
output y;

not(s0bar,s[0]);
not(s1bar,s[1]);
not(s2bar,s[2]);
and(y1, s2bar,s1bar,s0bar,i[0]);
and(y2, s2bar,s1bar,s[0],i[1]);
and(y3, s2bar,s[1],s0bar,i[2]);
and(y4, s2bar,s[1],s[0],i[3]);
and(y5, s[2],s1bar,s0bar,i[4]);
and(y6, s[2],s1bar,s[0],i[5]);
and(y7, s[2],s[1],s0bar,i[6]);
and(y8, s[2],s[1],s[0],i[7]);

or(y,y1,y2,y3,y4,y5,y6,y7,y8);
endmodule