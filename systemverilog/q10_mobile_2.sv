// Code your testbench here
// or browse Examples
/*
Polymorphism:
Take a Parent class with 2 functions
1. Mobile Specification 2. Print specifications.
a. Take 3 child classes of different mobile company.
b. Print Specs of respective child[mobile company].

*/

class mobile_parent;

string CompanyName;
string sim;
string network_support_type;
string processor_name;
string processor_speed;
string ram_size;
string rom_size;
string battery_capacity;
string screen_size;
string front_camera_pixels;
string back_camera_pixels;
string memory_card_support;

function MobileSpec(string sim, string network_support_type, string processor_name, string processor_speed, 
                    string ram_size, string rom_size, string battery_capacity, string screen_size,
					string front_camera_pixels, string back_camera_pixels, string memory_card_support);

this.sim=sim;
this.network_support_type=network_support_type;
this.processor_name=processor_name;
this.processor_speed=processor_speed;
this.ram_size=ram_size;
this.rom_size=rom_size;
this.battery_capacity=battery_capacity;
this.screen_size=screen_size;
this.front_camera_pixels=front_camera_pixels;
this.back_camera_pixels=back_camera_pixels;
this.memory_card_support=memory_card_support;

endfunction


virtual function void PrintSpec(string CompanyName);

  this.CompanyName=CompanyName;
  $display("--------------------------------------------------------------------");
  $display("The following are the specifications of %s Company LTD.", CompanyName);
  $display("--------------------------------------------------------------------");
  $display("SIM support:%s",sim);
  $display("Type of Network support:%s",network_support_type);
  $display("Processor name:%s",processor_name);
  $display("Processor speed:%s",processor_speed);
  $display("RAM size:%s",ram_size);
  $display("ROM size:%s",rom_size);
  $display("Battery capacity:%s",battery_capacity);
  $display("Scree size:%s",screen_size);
  $display("front_camera_pixels:%s",front_camera_pixels);
  $display("back_camera_pixels:%s",back_camera_pixels);
  $display("memory_card_support:%s",memory_card_support);
  $display("********************************************************************");

endfunction

endclass


class companyA extends mobile_parent;
  
  string CompanyName="Motorola";
string sim="Dual";
string network_support_type="5G";
string processor_name="Snapdragon 1";
string processor_speed="3GHz";
string ram_size="3GB";
string rom_size="256GB";
string battery_capacity="5000mAh";
string screen_size="16 inches";
string front_camera_pixels="128Mp";
string back_camera_pixels="256Mp";
string memory_card_support="Expandable upto 64GB";
  
  function void PrintSpec(string CompanyName);

  this.CompanyName=CompanyName;
  $display("--------------------------------------------------------------------");
  $display("The following are the specifications of %s Company LTD.", CompanyName);
  $display("--------------------------------------------------------------------");
  $display("SIM support:%s",sim);
  $display("Type of Network support:%s",network_support_type);
  $display("Processor name:%s",processor_name);
  $display("Processor speed:%s",processor_speed);
  $display("RAM size:%s",ram_size);
  $display("ROM size:%s",rom_size);
  $display("Battery capacity:%s",battery_capacity);
  $display("Scree size:%s",screen_size);
  $display("front_camera_pixels:%s",front_camera_pixels);
  $display("back_camera_pixels:%s",back_camera_pixels);
  $display("memory_card_support:%s",memory_card_support);
  $display("********************************************************************");

endfunction
  
endclass

class companyB extends mobile_parent;
  
   
  string CompanyName="Nokia";
string sim="Dual";
string network_support_type="7G";
string processor_name="Snapdragon 15";
string processor_speed="13GHz";
string ram_size="30GB";
string rom_size="2560GB";
string battery_capacity="6000mAh";
string screen_size="26 inches";
string front_camera_pixels="28Mp";
string back_camera_pixels="256Mp";
string memory_card_support="Expandable upto 164GB";
  
  function void PrintSpec(string CompanyName);

  this.CompanyName=CompanyName;
  $display("--------------------------------------------------------------------");
  $display("The following are the specifications of %s Company LTD.", CompanyName);
  $display("--------------------------------------------------------------------");
  $display("SIM support:%s",sim);
  $display("Type of Network support:%s",network_support_type);
  $display("Processor name:%s",processor_name);
  $display("Processor speed:%s",processor_speed);
  $display("RAM size:%s",ram_size);
  $display("ROM size:%s",rom_size);
  $display("Battery capacity:%s",battery_capacity);
  $display("Scree size:%s",screen_size);
  $display("front_camera_pixels:%s",front_camera_pixels);
  $display("back_camera_pixels:%s",back_camera_pixels);
  $display("memory_card_support:%s",memory_card_support);
  $display("********************************************************************");

endfunction
  
  
endclass

class companyC extends mobile_parent;
   
  string CompanyName="Apple";
string sim="Quad";
string network_support_type="15G";
string processor_name="Snapdragon 189";
string processor_speed="35GHz";
string ram_size="333GB";
string rom_size="2560GB";
string battery_capacity="9000mAh";
string screen_size="88 inches";
string front_camera_pixels="1280Mp";
string back_camera_pixels="2560Mp";
string memory_card_support="Expandable upto 664GB";
  
  function void PrintSpec(string CompanyName);

  this.CompanyName=CompanyName;
  $display("--------------------------------------------------------------------");
  $display("The following are the specifications of %s Company LTD.", CompanyName);
  $display("--------------------------------------------------------------------");
  $display("SIM support:%s",sim);
  $display("Type of Network support:%s",network_support_type);
  $display("Processor name:%s",processor_name);
  $display("Processor speed:%s",processor_speed);
  $display("RAM size:%s",ram_size);
  $display("ROM size:%s",rom_size);
  $display("Battery capacity:%s",battery_capacity);
  $display("Scree size:%s",screen_size);
  $display("front_camera_pixels:%s",front_camera_pixels);
  $display("back_camera_pixels:%s",back_camera_pixels);
  $display("memory_card_support:%s",memory_card_support);
  $display("********************************************************************");

endfunction
  
  
endclass


module class_polymorphism;
 
  initial begin
     
    //declare and create extended class
    companyA cA = new();
    companyB cB = new();
    companyC cC = new();
     
    //base class handle
    mobile_parent b_c[3];
     
    //assigning extended class to base class
    b_c[0] = cA;
    b_c[1] = cB;
    b_c[2] = cC;
     
    //accessing extended class methods using base class handle
    b_c[0].PrintSpec("Motorola");
    b_c[1].PrintSpec("Nokia");
    b_c[2].PrintSpec("Apple");
  end
 
endmodule

//https://www.edaplayground.com/x/T4hU
