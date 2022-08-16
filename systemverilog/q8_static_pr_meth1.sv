// Code your testbench here
// or browse Examples
/*

Write a program consists of

a. One string static variable and int static variable and static method.
b. Perform operation of int variable inside static method and display the result of
static string and string properties inside method using scope resolution.

*/

class staticex;

static string dialog = "Hello!"; 
static int a=34;

static function void count(string dialog, int a);

  $display("The static string is=%s, and the static int after increment by one=%0d",dialog,a+1);

endfunction

endclass

module tb;


initial begin
  staticex::count("India",56);
end

endmodule
