module tb_cla;
reg [3:0]tb_a,tb_b;
reg tb_cin;
wire [3:0]exp_sum,ref_sum;
wire exp_co, ref_co;

cla_adder ins1(.a(tb_a),.b(tb_b),.cin(tb_cin),.sum(exp_sum),.cout(exp_co));
cla_BFM ins2(.a(tb_a),.b(tb_b),.cin(tb_cin),.sum(ref_sum),.co(ref_co));

initial
repeat(20)
begin
cla_random($random,$random,$random);
end

task cla_random;
input [3:0]a,b;
input c;

begin 
tb_a=a;
tb_b=b;
tb_cin=c;

#5;
if( (exp_sum==ref_sum) && (exp_co==ref_co))
$display("Result is correct :: simtime=%0g,a=%b, b=%b, cin=%b, EXP_SUM=%b, REF_SUM=%b, EXP_CO=%b, REF_CO=%b", $time,tb_a,tb_b,tb_cin,exp_sum, ref_sum, exp_co, ref_co);
else
$display("Result is Incorrect :: simtime=%0g,a=%b, b=%b, cin=%b, EXP_SUM=%b, REF_SUM=%b, EXP_CO=%b, REF_CO=%b", $time,tb_a,tb_b,tb_cin,exp_sum, ref_sum, exp_co, ref_co);
end
endtask
endmodule