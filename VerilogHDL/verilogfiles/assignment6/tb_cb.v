// Code your testbench here

`timescale 1ns/1ns
module tb;
  
  reg switch,en;
  reg [63:0]name;
  wire cb;
  // Functionality  : LIST = { ROCK, PAPER , SCISSORS}
  cb ins1(switch, en, name, cb);
  
  initial 
    begin
      switch=0;
      en=0;
      name=0;
      #5;
      switch=1;
      en=1;
      name="ROCK";
     // $display("switch=%b, en=%b, name=%s, cb=%b",switch, en, name, cb);
    end
  initial
   $monitor("switch=%b, en=%b, name=%0s, cb=%b",switch, en, name, cb);
  initial
    #200 $finish;
endmodule
