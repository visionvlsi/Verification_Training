/* Write a program
a. Take 2 arrays of different size.
b. Enter the values to both the arrays using single function
c. Compare both the array values at each index
d. Display the values present at index of both array.
e. Display the number of elements matched in the array [count].*/

class two_arrays;
 int array1[10];
 int array2[20];
  int count;
  
  function new(int array1[10], int array2[20]);
        
    foreach(this.array1[i]) begin
      this.array1[i]=array1[i];
      $display("The Values present in array1 are array1[%0d]=%0d",i,this.array1[i]);
    end
    
    foreach(this.array2[j]) begin
      this.array2[j]=array2[j];
      $display("The Values present in array2 are array2[%0d]=%0d",j,this.array2[j]);
    end
    
    foreach(this.array1[i]) 
      if (this.array1[i] == this.array2[i]) 
        count++;
    $display("The Values matched count are=%0d", count);
                
  endfunction
endclass
  
  module tb;
    two_arrays ta;
    initial
      ta=new('{1,2,3,4,5,6,7,8,9,10},'{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20});
  endmodule

//https://www.edaplayground.com/x/mr6a
