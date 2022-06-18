module addN (s,a,b);
parameter N=3;
input [N-1:0]a,b;
output [N:0]s;


//wire c0,c1,c2,c3,c4;
wire [N-1:0]c;

//fa  f1  (  c[0],s[0],a[0],b[0],1'b0 );
//fa  f2  (  c[1],s[1],a[1],b[1],c[0]  );
//fa  f3  (  c[2],s[2],a[2],b[2],c[1] );

genvar i;

generate
begin 
          
   for(i=0;i<=N-1; i=i+1)
     begin
	   if(i==0)
	           fa  f1  (  c[i],s[i],a[i],b[0],1'b0 );
	   else
              fa  f  (  c[i],s[i],a[i],b[i],c[i-1]  );
	 
	 end


end
endgenerate


assign s[N] = c[N-1];

/* fa  f1  (  c[0],s[0],a[0],b[0],1'b0 );


fa  f2  (  c[1],s[1],a[1],b[1],c[0]  );
fa  f3  (  c[2],s[2],a[2],b[2],c[1] );
fa  f4  (  c[3],s[3],a[3],b[3],c[2] );
fa  f5  (  c[4],s[4],a[4],b[4],c[3] ); */


endmodule