module Sign_Extend_Module(Input_, Output_);
//
output reg [31:0] Output_;

input [15:0] Input_;


always@(*)
begin

		Output_[31:16] = 0;
		Output_[15:0] = Input_;

end



endmodule