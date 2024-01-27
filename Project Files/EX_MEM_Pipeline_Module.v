module EX_MEM_Pipeline_Module ( RT_32_Bit_Output, RegWrite_Output, MemtoReg_Output, MemRead_Output, MemWrite_Output, EX_MEM_RD_Fowarding, EX_MEM_RD_Next_Pipeline,ALU_Result_Output,RegWrite_Input, MemtoReg_Input, MemRead_Input, MemWrite_Input, ID_EX_MUX, ALU_Result_Input, clk, RT_32_Bit_Input );

//
output reg RegWrite_Output, MemtoReg_Output, MemRead_Output, MemWrite_Output;

output reg [4:0] EX_MEM_RD_Fowarding, EX_MEM_RD_Next_Pipeline;

output reg [31:0] ALU_Result_Output;

output reg [31:0] RT_32_Bit_Output;

input RegWrite_Input, MemtoReg_Input, MemRead_Input, MemWrite_Input;

input [4:0] ID_EX_MUX;

input [31:0] ALU_Result_Input;

input [31:0] RT_32_Bit_Input;

input clk;

always@(posedge clk)

begin

	RegWrite_Output = RegWrite_Input;
	MemtoReg_Output = MemtoReg_Input;
	MemRead_Output = MemRead_Input;
	MemWrite_Output = MemWrite_Input;
	EX_MEM_RD_Fowarding = ID_EX_MUX;
	EX_MEM_RD_Next_Pipeline = ID_EX_MUX;
	ALU_Result_Output = ALU_Result_Input;
	RT_32_Bit_Output = RT_32_Bit_Input;



end

endmodule