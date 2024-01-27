module AND_Gate(out , a ,b);
//
output reg out;

input a, b;


always@(*)

begin

	out = a &b;
end

endmodule