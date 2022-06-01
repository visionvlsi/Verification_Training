//

// Code your design here
module cb(switch, en, name, cb);
  
  input switch,en;
  input [63:0]name;
  output reg cb;
  
  /*
  Functionality  : LIST = { ROCK, PAPER , SCISSORS}
  cb will be 1 if switch is high and en is high and name falls from above list.
       cb will be 0 in below scenarios
            if switch is low or en is high and name appears from above list.
            if switch is low or en is low and name appears from above list.
            if switch is high or en is low and name appears from above list.
            if switch is low or en is high and name doesn't appear from above list.
*/
  always@(switch,en,name)
    begin
      if( ( switch && en))
        begin
        if(( name=="ROCK" || name=="PAPER" || name=="SCISSORS"))
        cb=1;
        else
        cb=0;
        end
    end
endmodule

//TB

// Code your testbench here
// or browse Examples
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

//EDAPlayground https://www.edaplayground.com/x/Edkz
