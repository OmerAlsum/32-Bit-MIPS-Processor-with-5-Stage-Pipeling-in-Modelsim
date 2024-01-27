module ALU_Control_Module(ALU_Op_Output, Function_Code, ALU_Op_Input);
// need to add multiply,divide, and nor somehow 
output reg [3:0] ALU_Op_Output;


input [31:0] Function_Code;
input [1:0] ALU_Op_Input;
//
// changed the function_code input to 32 bits so a wire can be connected directly from the ID_EX_Pipeline module to the ALU_Control_Module
always@(*)
begin

	case(ALU_Op_Input)

		2'b00 : ALU_Op_Output = 4'b0010; // add for the lw and sw
		2'b01 : ALU_Op_Output = 4'b0110; // subtract for branch on equal

		2'b10 : if (Function_Code[5:0] == 6'b100000)
				// function code for add
				begin
			
					ALU_Op_Output = 4'b0010;
					

				end

				else if (Function_Code[5:0] == 6'b100010)
				// function code for subtract
				begin 

				ALU_Op_Output = 4'b0110;
				
				end

				else if (Function_Code[5:0] == 6'b101010)
				// function code for Set-on-less-than
				begin

				ALU_Op_Output = 4'b0111;
				
				end

				else if (Function_Code[5:0] == 6'b100101)
				// function code for Or
				begin 

				ALU_Op_Output = 4'b0001;
				
				end

				else if (Function_Code[5:0] == 6'b100100)
				// function code for AND
				begin

				ALU_Op_Output = 4'b0000;
				
				end
				
				else if (Function_Code[5:0] == 6'b011000)
				// function code for multiply
				begin

				ALU_Op_Output = 4'b1000; // 8
				

				end
				
				else if (Function_Code[5:0] == 6'b011010)
				// function code for divide
				begin

				ALU_Op_Output = 4'b1001;  // 9
				
				end

				else if (Function_Code[5:0] == 6'b100111)
				// function code for NOR
				begin

				ALU_Op_Output = 4'b1010; // 10
				
				end

				
				else if (Function_Code[5:0] == 6'b010000)
				// function code for move from hi 
				begin

				ALU_Op_Output = 4'b1011; // 11
				
				end
				
				else if (Function_Code[5:0] == 6'b010010)
				// function code for move from low 
				begin

				ALU_Op_Output = 4'b1100; // 12
				
				end

				else 
begin
				ALU_Op_Output = 4'bx; // 12
	
				
	end			

	endcase

end
	
		// inside the ALU have a multixplexer to seperate the higher bits and lower bits



endmodule 