module Comparator( out , a , b);

output reg out;

input [31:0] a , b;


always@(*)

begin

	if( a == b)
	begin
	out = 1;

	end

	else 

	begin

	out = 0;
	end

end

endmodule 
