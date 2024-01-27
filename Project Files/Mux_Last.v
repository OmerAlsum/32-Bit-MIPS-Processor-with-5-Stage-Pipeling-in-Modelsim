module Mux_Last(out , a , b, control);
//
output reg [31:0] out;

input [31:0] a , b;

input control;


always@(*)

begin
	
	if(control == 1)
	
	begin
	
		out = a;
	end
	
	else 
		begin
			out = b;
		end


end

endmodule
