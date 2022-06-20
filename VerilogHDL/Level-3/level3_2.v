/*
4. write a program for universal synchronous counter which includes up , down and updown counter?

5. write a program for universal asynchronous counter which includes up , down and updown counter?

6. Write the hardware description of a 4-bit mod-13 counter and test it.?

7. write a program for synchronous fifo for 32 locations depth and 16 bit data size?

8. design and implement asynchronous fifo with write clock 512 mhz and read clock 64 mhz?(hint: calculate the fifo depth and proceed) */

//4. write a program for universal synchronous counter which includes up , down and updown counter?

// Code your design here
//4. write a program for universal synchronous counter which includes up , down and updown counter?

module synccounter(clk,rst,updown,count);
  input clk,rst;
  input updown; 
  output reg [3:0]count;
  
  always@(posedge clk) begin
    if(rst)
      count<=0;
    else if(updown)
      count<=count+1'b1;
    else
      count<=count-1'b1;  
  end
    
endmodule

// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb;
  
  reg clk,rst;
  reg updown; 
  wire [3:0]count;
  
   synccounter ins(clk,rst,updown,count);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  
  initial begin
    @(negedge clk) rst=1;
    @(posedge clk) rst=1;
    repeat(16) begin
    @(negedge clk) rst=0;updown=1;
    @(posedge clk) updown=1;
    end
     repeat(16) begin
       @(negedge clk) updown=0;
       @(posedge clk) updown=0;
    end
    @(posedge clk);
    $finish;
  end
  initial begin $dumpfile("dump.vcd"); $dumpvars(1); end
endmodule


//https://www.edaplayground.com/x/Ndqz


5. write a program for universal asynchronous counter which includes up , down and updown counter?
  
  // Code your design here
//5. write a program for universal asynchronous counter which includes up , down and updown counter?

module asynccounter(clk,rst,updown,count);
  input clk,rst;
  input updown; 
  output reg [3:0]count;
  
  always@(posedge clk,posedge rst) begin
    if(rst)
      count<=0;
    else if(updown)
      count<=count+1'b1;
    else
      count<=count-1'b1;  
  end
    
endmodule
  
  // Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb;
  
  reg clk,rst;
  reg updown; 
  wire [3:0]count;
  
   asynccounter ins(clk,rst,updown,count);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  
  initial begin
    @(negedge clk);
    rst=1;
    rst=1;
    repeat(16) begin
    @(negedge clk) rst=0;updown=1;
    @(posedge clk) updown=1;
    end
     repeat(16) begin
       @(negedge clk) updown=0;
       @(posedge clk) updown=0;
    end
    @(posedge clk);
    $finish;
  end
  initial begin $dumpfile("dump.vcd"); $dumpvars(1); end
endmodule
  
  //https://www.edaplayground.com/x/rdmH
  
  6. Write the hardware description of a 4-bit mod-13 counter and test it.?
  
  // Code your design here
//6. Write the hardware description of a 4-bit mod-13 counter and test it.?
module mod13(clk,rst,count);
  input clk,rst;
  output reg [3:0]count;
  
  always@(posedge clk) begin
    if(rst)
      count<=0;
    else if(count!=13)
      count<=count+1'b1;
    else
      count<=0;    
  end
endmodule
  
  // Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb;
 
  reg clk,rst;
  wire [3:0]count;
  
   mod13 ins(clk,rst,count);
  
  initial begin 
  clk=0;
    forever #5 clk=~clk;  
  end
  
  initial begin
    @(negedge clk) rst=1;
    @(posedge clk) rst=1;
    repeat(20) begin
      @(negedge clk) rst=0;
      @(posedge clk) rst=0;
    end
     @(posedge clk);
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(1);
    
  end
endmodule
  
  // https://www.edaplayground.com/x/fNyx
