module Shift_Left_2(in , out);


output reg [31:0] out;

input [31:0] in;

always@(*)

begin// 

out = in << 2;

end 

endmodule 