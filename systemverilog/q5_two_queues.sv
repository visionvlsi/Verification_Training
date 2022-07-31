/*
5. Write a Program and Display
a. Take 2 Queues in a class
b. Enter the values into 2 Queues using “THIS” operator.
c. Print both Queues.
d. Do Push front and pushback value operation using FUNCTION and THIS
operator.


*/
class A;

  int q1[$];
  int q2[$];
  
  function new(int q1[$],int q2[$]);
        this.q1=q1;
       $display("value of the  q1=%p",this.q1);
        this.q2=q2;
       $display("value of the  q2=%p",this.q2);
  
  endfunction
  
endclass

module tb;
  A A_h;
  int q1[$];
  int q2[$];
  
initial 
begin
  q1={0,1,2,3,4,5,6,7,8};
  q2={10,11,12,13,14,15,16,17,18};
  A_h=new(q1,q2);
  q1.push_front(299);
  q2.push_front(399);
  $display("Values of queues after push_front");
  A_h=new(q1,q2);
  q1.push_back(499);
  q2.push_back(599);
  $display("Values of queues after push_back");
  A_h=new(q1,q2);
end
endmodule
