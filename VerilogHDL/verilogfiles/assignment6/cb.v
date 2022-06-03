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