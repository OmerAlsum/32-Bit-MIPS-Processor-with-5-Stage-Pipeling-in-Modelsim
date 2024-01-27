module ID_EX_Pipeline_Module(ALU_Src_Out, Regwrite_Output, MemtoReg_Output,  MemRead_Output, MemWrite_Output, RegDst_Output, ALUOp_Output,Sign_Extend_Output, ID_EX_Rs_Fowarding, ID_EX_Rt_Fowarding, ID_EX_Rt_MUX,ID_EX_Rd_MUX, Read_Data_1_Output, Read_Data_2_Output, Regwrite_Input, MemtoReg_Input, MemRead_Input, MemWrite_Input, RegDst_Input, ALUOp_Input, Sign_Extend_Input, IF_ID_Rs, IF_ID_Rt,IF_ID_Rd, Read_Data_1_Input, Read_Data_2_Input,clk , ALU_Src_In);

// changed from function_code_input to sign_extend_output 6 bits to 32 bits
output reg Regwrite_Output, MemtoReg_Output, MemRead_Output, MemWrite_Output, RegDst_Output,ALU_Src_Out;
//
output reg [1:0] ALUOp_Output;

output reg [31:0] Sign_Extend_Output;

output reg [4:0] ID_EX_Rs_Fowarding, ID_EX_Rt_Fowarding, ID_EX_Rt_MUX,ID_EX_Rd_MUX;

output reg [31:0] Read_Data_1_Output, Read_Data_2_Output;

input Regwrite_Input, MemtoReg_Input,  MemRead_Input, MemWrite_Input, RegDst_Input, ALU_Src_In;

input [1:0] ALUOp_Input; 

input [31:0] Sign_Extend_Input;

input [4:0] IF_ID_Rs, IF_ID_Rt,IF_ID_Rd;

input [31:0] Read_Data_1_Input, Read_Data_2_Input;

input clk;

always@(posedge clk)

begin 

	Regwrite_Output = Regwrite_Input;
	MemtoReg_Output = MemtoReg_Input;
	MemRead_Output = MemRead_Input;
	MemWrite_Output = MemWrite_Input;
	RegDst_Output = RegDst_Input;
	ALUOp_Output = ALUOp_Input;
	Sign_Extend_Output = Sign_Extend_Input;
	ID_EX_Rs_Fowarding = IF_ID_Rs;
	ID_EX_Rt_Fowarding = IF_ID_Rt;
	ID_EX_Rt_MUX = IF_ID_Rt;
	ID_EX_Rd_MUX = IF_ID_Rd;
	Read_Data_1_Output = Read_Data_1_Input;
	Read_Data_2_Output = Read_Data_2_Input;
	ALU_Src_Out = ALU_Src_In;
	
end


endmodule