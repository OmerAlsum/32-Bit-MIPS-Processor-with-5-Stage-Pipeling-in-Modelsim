module IF_ID_Pipeline_Module(Jump_Offset, IF_ID_RS_Hazard, IF_ID_RT_Hazard, PC_Counter_Output, Op_Code, Read_Register_1, Read_Register_2, IF_ID_Rs, IF_ID_Rt, IF_ID_Rd ,Sign_Extend_Input, Enable, Instruction, clk, PC_Counter_Input, Flush_Jump, Flush_Branch);
// add flush input from control module
//
//

output reg [4:0] Read_Register_1, Read_Register_2, IF_ID_Rs, IF_ID_Rt, IF_ID_Rd;

output reg [5:0] Op_Code;

output reg [31:0] PC_Counter_Output;

output reg [15:0] Sign_Extend_Input;

output reg [4:0] IF_ID_RS_Hazard, IF_ID_RT_Hazard;

output reg [25:0] Jump_Offset;

input [31:0] Instruction;

input Enable, clk , Flush_Branch, Flush_Jump;

input [31:0] PC_Counter_Input;




always@(posedge clk)
begin

	if(Flush_Branch == 1 | Flush_Jump == 1)
	begin

	Op_Code = 0;
	Read_Register_1 =  0;
	Read_Register_2 =  0;
	IF_ID_RS_Hazard = 0;
	IF_ID_RT_Hazard = 0;
	IF_ID_Rs = 0;
	IF_ID_Rt = 0;// two go into the ID_EX Pipeline module 
	IF_ID_Rd = 0;
	Sign_Extend_Input = 0;
	PC_Counter_Output = 0;
	Jump_Offset= 0;
	end 
	
	else if( Enable == 0)

	begin

	Op_Code = Op_Code;
	Read_Register_1 =  Read_Register_1;
	Read_Register_2 =  Read_Register_2;
	IF_ID_RS_Hazard = IF_ID_RS_Hazard;
	IF_ID_RT_Hazard = IF_ID_RT_Hazard;
	IF_ID_Rs = IF_ID_Rs;
	IF_ID_Rt =IF_ID_Rt;// two go into the ID_EX Pipeline module 
	IF_ID_Rd = IF_ID_Rd;
	Sign_Extend_Input =Sign_Extend_Input;
	PC_Counter_Output = PC_Counter_Output;
	Jump_Offset=Jump_Offset;
	end 

	else 
	begin

	Op_Code = Instruction[31:26];
	Read_Register_1 =  Instruction[25:21];
	Read_Register_2 =  Instruction[20:16];
	IF_ID_RS_Hazard = Instruction[25:21];
	IF_ID_RT_Hazard =Instruction[20:16]; 
	IF_ID_Rs = Instruction[25:21];
	IF_ID_Rt = Instruction[20:16]; // two go into the ID_EX Pipeline module 
	IF_ID_Rd = Instruction[15:11];
	Sign_Extend_Input = Instruction[15:0];
	PC_Counter_Output = PC_Counter_Input;
	Jump_Offset = Instruction[25:0]; 
	end 

end


endmodule