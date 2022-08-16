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


function PrintSpec(string CompanyName);

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

module tb;
  
  mobile_parent companyA, companyB, companyC;
  /*
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
  
  */
  
  initial begin
    companyA=new();
    companyB=new();
    companyC=new();
    
    
    
    companyA.MobileSpec("Dual","5G","Intel","3GHz","32GB","256GB","5000mAh","16.6Inches", "128Mp","30Mp","Expandable upto 64GB");
    companyA.PrintSpec("Realme");
    
    companyB.MobileSpec("Dual","4G","Snapdragon","4GHz","12GB","512GB","7000mAh","18Inches", "50Mp","30Mp","Expandable upto 1TB");
    companyB.PrintSpec("Redmi");
    
    companyC.MobileSpec("Dual","3G","Ryzen","3.5GHz","16GB","512GB","6000mAh","15.6Inches", "50Mp","50Mp","Expandable upto 128GB");
    companyC.PrintSpec("Redmi Pro");
  end

endmodule

//https://www.edaplayground.com/x/FcAX
