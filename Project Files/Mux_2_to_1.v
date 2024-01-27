module Mux_2_to_1(out, a,b,control);
//
output reg [31:0]out;

input [31:0] a,b ;

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