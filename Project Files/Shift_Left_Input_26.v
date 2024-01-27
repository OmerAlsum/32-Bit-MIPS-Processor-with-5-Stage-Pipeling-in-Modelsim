module Shift_Left_Input_26(out , in);

output reg [27:0] out; 

input [25:0] in;


always@(*)

begin

out = in << 2;

end 

endmodule 
