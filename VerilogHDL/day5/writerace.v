module tb;

 reg [1:0]a,b;
 //two diff values to same signal and same time.
 //this is known as write race.
 initial a=1;//thread1 //t0
 
 initial a=3;//thread2 //t0
 
 initial #1 display(a);//t1


endmodule