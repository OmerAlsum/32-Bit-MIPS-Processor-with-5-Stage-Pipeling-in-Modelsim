module Concatenation_28_32(out, a , b);

output reg [31:0] out;

input [27:0] a;

input [31:0] b;

always@(*) 

begin

	 out[31: 28] =  b [31: 28];
	out [27:0]   = a ;

end


endmodule 
