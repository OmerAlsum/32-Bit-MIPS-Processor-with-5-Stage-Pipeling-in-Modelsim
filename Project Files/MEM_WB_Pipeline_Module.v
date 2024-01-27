module MEM_WB_Pipeline_Module (MemtoReg_Output, Data_Memory_Output_to_MUX, ALU_Output_to_MUX, Regwrite_Output, MEM_WB_Fowarding, MEM_WB_Rd_Register_Module,Regwrite_Input, MemtoReg_Input,EX_MEM_RD, clk, Data_Memory_Output_IN,ALU_Output_IN);
//
output reg [4:0] MEM_WB_Fowarding, MEM_WB_Rd_Register_Module;
output reg Regwrite_Output, MemtoReg_Output;
output reg [31:0] Data_Memory_Output_to_MUX; // add bottom two to module ports
output reg [31:0] ALU_Output_to_MUX;

input Regwrite_Input, MemtoReg_Input; // verified
input [4:0] EX_MEM_RD; // verified
input [31:0] Data_Memory_Output_IN; // add bottom two to module ports
input [31:0] ALU_Output_IN;
input clk;


always@(posedge clk) 

begin

	Regwrite_Output = Regwrite_Input;
	MemtoReg_Output =MemtoReg_Input; 
	MEM_WB_Fowarding = EX_MEM_RD;
	Data_Memory_Output_to_MUX = Data_Memory_Output_IN;
	ALU_Output_to_MUX = ALU_Output_IN;
	MEM_WB_Rd_Register_Module = EX_MEM_RD;
	
	
end

endmodule