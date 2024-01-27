module ALU_Module(input_1, input_2, output_, control_input,flag);

input [31:0] input_1, input_2;
input [3:0] control_input;



output reg [31:0] output_;
output reg flag;



reg [31:0] HI, LO; 


always@( input_1, input_2,control_input)

begin 


case(control_input)

0 :
	output_ = input_1 & input_2;
1: 
output_ = input_1 | input_2;
2: output_ = input_1 + input_2;
6: output_ = input_1 - input_2;
7 : output_ = (input_1 < input_2 ? 1 : 0);
8:
	begin
	
	{HI, LO} = input_1 * input_2;

	end

9: 
	begin
	if( ~(input_2 == 32'd0) )
	begin
	HI = input_1 % input_2;
	LO =  input_1 / input_2;
	end

	end
10 : output_ = ~(input_1 | input_2);

11: output_ = HI;

12: output_ = LO; 
default : output_ = 0;

endcase

if (output_ == 0)
    begin
        flag = 1;
    end
else
	begin
    flag = 0;
	end
	

end


endmodule