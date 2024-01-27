module Mux_2_to_1_5_bit(out , a , b , control);

output reg [4:0] out;

input [4:0] a, b;

input control;

always@(*)

begin
	if(control == 1)
	begin
	
	out = b;

	end

	else

	begin
	out = a;

	end



end

endmodule 


