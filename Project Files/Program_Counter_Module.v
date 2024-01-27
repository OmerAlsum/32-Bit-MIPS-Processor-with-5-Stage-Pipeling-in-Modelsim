module Program_Counter_Module(address_Out, enable, address_In,clk);
// 

output reg [31:0] address_Out;
input [31:0] address_In;
input clk;
input enable;

initial 

begin

address_Out = 0;


end

always@(posedge clk)
	begin
		if(enable == 0)
		begin 
		address_Out = address_Out;
		end
		
		else
		begin 
		address_Out = address_In;
		end
	end 


endmodule 