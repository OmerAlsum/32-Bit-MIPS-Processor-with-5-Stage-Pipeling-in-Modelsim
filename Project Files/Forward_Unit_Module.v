module Forward_Unit_Module(forward_A ,forward_B, ID_EX_RS, ID_EX_RT, EX_MEM_RD , MEM_WB_RD, EX_MEM_Reg_Write, MEM_WB_Reg_Write);

input [4:0] ID_EX_RS, ID_EX_RT , EX_MEM_RD, MEM_WB_RD;
input EX_MEM_Reg_Write, MEM_WB_Reg_Write;
output reg [1:0] forward_A, forward_B;

//
always@(ID_EX_RS, EX_MEM_RD, MEM_WB_RD) // always block for the fowarding unit A

begin 
	if( ((ID_EX_RS == EX_MEM_RD) & (EX_MEM_Reg_Write == 1))| ((ID_EX_RS == EX_MEM_RD)& (ID_EX_RS == MEM_WB_RD) & (EX_MEM_Reg_Write == 1)) )
		begin 
			forward_A = 2'b10;
		end
	else if( (ID_EX_RS == MEM_WB_RD) & (MEM_WB_Reg_Write == 1) )
		begin
			forward_A = 2'b01;
		end

	else
			forward_A = 2'b00;

end 


always@(ID_EX_RT, EX_MEM_RD , MEM_WB_RD) // always block for fowarding unit B

begin 
	if( ((ID_EX_RT == EX_MEM_RD) & (EX_MEM_Reg_Write == 1)) | ( (ID_EX_RT==EX_MEM_RD) & (ID_EX_RT == MEM_WB_RD) & (EX_MEM_Reg_Write == 1) ))
		begin 
			forward_B = 2'b10;
		end
	else if( (ID_EX_RT == MEM_WB_RD)  & (MEM_WB_Reg_Write == 1))
		begin
			forward_B = 2'b01;
		end

	else
			forward_B = 2'b00;

end 

endmodule