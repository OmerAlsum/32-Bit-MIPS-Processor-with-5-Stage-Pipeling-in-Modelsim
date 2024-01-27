module Top_Level_Module( input clk);
	//
	wire [31:0] Adder_Input;
	
	// Add jump opcode
	assign Adder_Input = 32'd4;
	
	wire [31:0] w1,w2,w7,w11,w12,w39,w40,w41,w44,w47,w46,w102,w105;
	wire [5:0] w3;
	wire w4,w16, w17,w18,w19,w20,w21,w22,w23,w24,w25,w45,w104;
	wire w48,w49,w99;
	wire [25:0] w100;
	wire [27:0] w101;
	
	wire [1:0] w26,w34;
	wire [4:0] w5,w6,w8,w9,w98;
	wire [15:0] w10;
	wire [4:0] w13,w14,w15,w37;
	wire w27,w28,w29,w30, w31,w32,w38,w36,w42;
	
	wire A1,A2,A3,A4,A5,A20;
	wire [1:0] A6,A13,A14;
	wire [4:0]A7,A8,A18,A19,A21;
	wire [3:0] A9;
	wire [31:0] A10,A12,A15,A16,A17;
	wire [31:0] A11;
	
	wire l0,l1,l2,l5,l6,l7,l8,l11,l16;
	wire [4:0] l9,l15;
	wire [31:0] l3,l4,l10,l12,l13,l14,l17;
	
	
	Program_Counter_Module Program_Counter_Module1 // done
	(.address_Out(w1),
	.enable(w38), 
	.address_In(w105), // needs to come from the output of the MUX; 
	.clk(clk)
	);
	
	
	Mux_2_to_1 MUX_For_PC_2nd_to_Last( // leftmost mux
	.out(w39), 
	.a(w12),
	.b(w40),
	.control(l16) // Control Input for PC counter input
	); 
	
	
	 Instruction_Mem_Module InstructionMem // done 
	(.address_In(w1), 
	 .Instruction(w2), // output
	.clk(clk)
	);
	
	IF_ID_Pipeline_Module IF_ID_Pipeline // done 
	(// need to add teh 26 bits for Jump
	.IF_ID_RS_Hazard(w5), 
	.IF_ID_RT_Hazard(w6),
	.PC_Counter_Output(w7), 
	.Op_Code(w3), 
	.Read_Register_1(w8), 
	.Read_Register_2(w9), 
	.IF_ID_Rs(w13), 
	.IF_ID_Rt(w14), 
	.IF_ID_Rd(w15),
	.Sign_Extend_Input(w10), 
	.Enable(w4), 
	.Instruction(w2),
	.clk(clk), 
	.Flush_Branch(l16),
	.Flush_Jump(w104),
	.Jump_Offset(w100),
	.PC_Counter_Input(w12) // 32 bit adder
	);

	Shift_Left_Input_26 Shift_Left_Jump_26(

	.out(w101) , 
	.in(w100)
);//
	Concatenation_28_32 Concatenation_26_32_Jump(
	.out(w102), 
	.a(w101) ,
	.b(w7)// b should be w7

	);

	Mux_Last MUX_For_PC_Last(

	.out(w105) , 
	.a(w102) ,
	.b(w39), 
	.control(w104)

	);
	
	Sign_Extend_Module Sign_Extend ( // done

		.Input_(w10),
		.Output_(w11)

					        );
							  
	Shift_Left_2 Shift_Left_ 
	(.in(w11), 
	.out(w41));
	
	Adder_32_bit Adder_32_bit1 // the one in between the IFID and IDEX top upper
	(
	.out(w40), 
	.a(w7),
	.b(w41)//look at Block diagram, needs to be shifted left by2 
	);
	Adder_32_bit  Adder_Before_IF_ID
	
	(
	.out(w12),
	.a(w1), // two w1 wires are connected
	.b(Adder_Input) // the value 4 should be passed in
	); 


	Main_Control_Module Main_ControlM1 
	(
		// need to add a Jump signal
		. Instruction_Op_Code(w3),
		// all outputs go into a MUX
		. RegDst(w17),
		. Branch(w18), // will need to go the and gate with the compartor
		. MemRead(w19),
		. MemtoReg(w20),
		. MemWrite(w21),
		. RegWrite(w23),
		. ALUOp(w26),
		. ALUSrc(w45), // need to add a wire connecting to the MUX
		. Jump_Signal(w104)
		);
Mux_Control_Module Mux_Control_Module1(
.ALUOP_Out(w34), 
.RegDst_Out(w32), 
.MemWrite_Out(w31), 
.MemRead_Out(w30), 
.MemtoReg_Out(w28), 
.RegWrite_Out(w27), 
.ALU_Src_Out(w48),

.ALUOP_In(w26), 
.RegDst_In(w17), 
.MemWrite_In(w21), 
.MemRead_In(w19), 
.MemtoReg_In(w20),
.RegWrite_In(w23),
.ALU_Src_In(w45),

.Input_Hazard(w16)
);


ID_EX_Pipeline_Module ID_EX_Module1 (
		. Regwrite_Input(w27),
		. MemtoReg_Input(w28),
		. MemRead_Input(w30),
		. MemWrite_Input(w31),
		. RegDst_Input(w32),
		. ALUOp_Input(w34),
		. Sign_Extend_Input (w11) , 
		. IF_ID_Rs (w13),
		. IF_ID_Rt (w14),
		. IF_ID_Rd (w15),
		. Read_Data_1_Input (w46),
		.Read_Data_2_Input (w47),
		.clk(clk),
		. ALU_Src_In(w48),
		
		
		// Aryan is going all the outputs // done but one ALUSrc
		.Regwrite_Output (A1),
		. MemtoReg_Output (A2),
		. MemRead_Output (A4),
		. MemWrite_Output (A5),
		. RegDst_Output(A20),
		. ALUOp_Output(A6),
		. Sign_Extend_Output(A11), 
		. ID_EX_Rs_Fowarding (A7),
		. ID_EX_Rt_Fowarding (A8),
		. ID_EX_Rt_MUX(A18),
		. ID_EX_Rd_MUX(A19),
		. Read_Data_1_Output(A12),
		. Read_Data_2_Output(A17),
		. ALU_Src_Out(w49)

						   );


Register_Module Register1 (
		. read_reg_1 (w8) ,
		.read_reg_2 (w9) ,
		.write_reg (w37),
		.write_data (l12),
		.regwrite(w36),
		.clk(clk),

		.read_data_1 (w46),
		.read_data_2 (w47)
			);

Comparator Comparator_for_register_Module( 
	.out (w99),
	. a(w46) , 
	.b(w47)
);
//
AND_Gate And_Gate_Branch(

.out(l16) , 
.a(w18) ,
.b(w99)
);
	
Hazard_Unit_Module Hazard_module1 (

		. IF_ID_RS(w5),
		. IF_ID_RT(w6),
		. ID_EX_RT(A8),
		. ID_EX_Mem_Read(A4),
		. IF_ID_Enable(w4),
		. PC_Write_Enable(w38), // need to create enable in Program counter
		. Mux_Output(w16)
						);

						
// Aryan Part 



mux_1_module Forward_A_Mux (
		.a(A12),
		. b(l12),
		.c(l3),
		. control(A13),
		.out(A15)

				);
mux_1_module Forward_B_Mux (
		.a(A17),
		. b(l12),
		.c(l3),
		. control(A14),
		.out(A16)

				);
				
// Adding the ALU Src MUX

Mux_2_to_1 MUX_ALU_Src(
.out(w44), // goes out to ALU
.a(A16), // fowarding unit B
.b(A11), // sign extend input
.control(w49) // ALU Src Signal
);

/* This mux was replaced by Mux_2_to_1_5_bit

mux_3_module Bottom_Mux_After_ID_EX (
		. ID_EX_RT(A18),
		. ID_EX_RD(A19),
		.RegDst_Output(A20),
		. Mux3_output(A21)

				);
*/
Mux_2_to_1_5_bit Bottom_Mux_After_ID_EX(

	.out(A21), 
	.a (A18), 
	.b (A19), 
	.control(A20)
	);

Forward_Unit_Module Forward_Module1 (

		. ID_EX_RS (A7),
		. ID_EX_RT (A8),
		. EX_MEM_RD (l9), // Outputs from Luigi
		. MEM_WB_RD (l15),
		. EX_MEM_Reg_Write(l5),
		. MEM_WB_Reg_Write(w36),
		. forward_A(A13),
		. forward_B(A14)
						  );




ALU_Module ALU1 (
		
		.input_1(A15),
		.input_2(w44), 
		.control_input(A9),
		.output_ (A10)
		   );


ALU_Control_Module ALU_ControlM1 (

		. Function_Code(A11),
		. ALU_Op_Input(A6),
		. ALU_Op_Output(A9)
					        );
			

EX_MEM_Pipeline_Module EX_MEM_Module1 (
				
		. RegWrite_Input (A1),
		. MemtoReg_Input (A2),
		. MemRead_Input (A4),
		. MemWrite_Input (A5),
		. ID_EX_MUX(A21),
		. ALU_Result_Input (A10), 
		// this needs to be taken out
		.RT_32_Bit_Input(A17),
		.clk(clk),
		
		// outputs from Luigi
		.RT_32_Bit_Output(l17),
		. RegWrite_Output (l5),
		. MemtoReg_Output (l6),
		. MemRead_Output(l1),
		. MemWrite_Output(l2),
		. EX_MEM_RD_Fowarding (l9), // check why these are the same wire
		. EX_MEM_RD_Next_Pipeline(w98),
		. ALU_Result_Output(l3)
		 // this is going to be taken out

							  );


						
						
// Lugui part


/// AND Gate will be taken out



Mux_Last Mux_Last1(
.out(l12), 
.a(l13), 
.b(l14), 
.control(l11)
);

Data_Memory_Module Data1(
  .data_output(l10),
  .address_input(l3), 
  .write_data(l17), // needs to be connected from exmeme result forward of rt contents
  .memWrite(l2), 
  .memRead(l1),
  .clk(clk)
);

MEM_WB_Pipeline_Module MEM_WB_Module1 ( 

    .Regwrite_Input(l5), 
    .MemtoReg_Input(l6),
    .EX_MEM_RD(w98),
    .Data_Memory_Output_IN(l10),
    .ALU_Output_IN(l3),
    .clk(clk),


    .MEM_WB_Fowarding(l15), 
    .MEM_WB_Rd_Register_Module(w37),
    .Regwrite_Output(w36), 
    .MemtoReg_Output(l11),
    .Data_Memory_Output_to_MUX(l13), 
    .ALU_Output_to_MUX(l14)
); 


endmodule 