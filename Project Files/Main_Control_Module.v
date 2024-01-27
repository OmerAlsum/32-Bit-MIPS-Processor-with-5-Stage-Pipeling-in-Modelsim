module Main_Control_Module(Jump_Signal, RegDst, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, Instruction_Op_Code);


output reg RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump_Signal;

output reg [1:0] ALUOp; // keep a 6 bit input for all registers

input [5:0] Instruction_Op_Code;

//

always@( Instruction_Op_Code)
begin
	if(Instruction_Op_Code == 0) 
// controls for r type instructions

		begin
			RegDst = 1;
			Branch = 0;
			MemRead = 0;
			MemtoReg = 0;
			ALUOp = 2'b10;
			MemWrite = 0;
			ALUSrc = 0;
			RegWrite = 1;
			Jump_Signal=0;
		end 

	else if( Instruction_Op_Code == 6'b100011) 
//controls for load word instruction

		begin
			RegDst = 0;
			Branch = 0;
			MemRead = 1;
			MemtoReg = 1;
			ALUOp = 2'b00; // from book page 579 Figure 4.18
			MemWrite = 0;
			ALUSrc = 1;
			RegWrite = 1;
			Jump_Signal=0;
		end

	else if ( Instruction_Op_Code == 6'b101011) 
//controls for store word instructions

		begin

			RegDst = 1'bx;
			Branch = 0;
			MemRead = 0;
			MemtoReg = 1'bx;
			ALUOp = 2'b00; //from book page 579 Figure 4.18
			MemWrite =1;
			ALUSrc = 1;
			RegWrite = 0;
			Jump_Signal=0;
		end

else if ( Instruction_Op_Code == 6'b000100)
//controls for branch on equal instruction
 
		begin

			RegDst = 1'bx;
			Branch = 1;
			MemRead = 0;
			MemtoReg = 0;
			ALUOp = 2'b01;  //from book page 579 Figure 4.18
			MemWrite = 0;
			ALUSrc = 0;
			RegWrite = 0;
			Jump_Signal=0;
			
		end

else if ( Instruction_Op_Code == 6'b001000)
// controls for addi instruction

		begin

			RegDst = 1'bx;
			Branch = 0;
			MemRead = 1'bx;
			MemtoReg = 0;
			ALUOp = 2'b00; //from book page 579 Figure 4.18, copied from lw and sw since they are using add
			MemWrite = 0;
			ALUSrc = 1;
			RegWrite = 1;
			Jump_Signal=0;

		end
else if ( Instruction_Op_Code == 6'b000010)
// controls for jump instruction

		begin

			RegDst = 1'bx;
			Branch = 0;
			MemRead = 1'bx;
			MemtoReg = 0;
			ALUOp = 2'b00; //from book page 579 Figure 4.18, copied from lw and sw since they are using add
			MemWrite = 0;
			ALUSrc = 1;
			RegWrite = 1;
			Jump_Signal=1;

		end
 

end

endmodule 