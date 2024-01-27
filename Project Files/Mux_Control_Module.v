module Mux_Control_Module( ALU_Src_Out, ALUOP_Out, RegDst_Out, MemWrite_Out, MemRead_Out, MemtoReg_Out, RegWrite_Out, ALUOP_In, RegDst_In, MemWrite_In, MemRead_In, MemtoReg_In, RegWrite_In, Input_Hazard, ALU_Src_In);


output reg RegDst_Out, MemWrite_Out, MemRead_Out, MemtoReg_Out, RegWrite_Out,ALU_Src_Out;

output reg [1:0] ALUOP_Out;

input RegDst_In, MemWrite_In, MemRead_In, MemtoReg_In, RegWrite_In, ALU_Src_In;

input [1:0] ALUOP_In;

input  Input_Hazard;


//
always@(*)

	begin
	
		if(Input_Hazard == 0)
		begin
		RegDst_Out = 0;
		MemWrite_Out =0; 
		MemRead_Out = 0;
		MemtoReg_Out = 0; 
		RegWrite_Out = 0;
		ALUOP_Out = 0;
		ALU_Src_Out = 0;
		end 
		else 
		begin
		
		RegDst_Out = RegDst_In;
		MemWrite_Out = MemWrite_In;
		MemRead_Out = MemRead_In;
		MemtoReg_Out =  MemtoReg_In;
		RegWrite_Out = RegWrite_In;
		ALUOP_Out = ALUOP_In;
		ALU_Src_Out = ALU_Src_In;
		end
		
		
	
		
		
		
		
		
		end
	
endmodule 