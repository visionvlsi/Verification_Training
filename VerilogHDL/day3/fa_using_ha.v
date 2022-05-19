module fa_using_ha(

 input a,b,cin,
 output sum,carry
 );
 
 wire w1,w2,w3;
 
 //strucutural modelling
 ha h1(.a(b),.b(cin),.sum(w1),.carry(w2));


 ha h2(.a(a),.b(w1),.sum(sum),.carry(w3));
 
 or o1(carry,w2,w3);
 
 
 
endmodule


