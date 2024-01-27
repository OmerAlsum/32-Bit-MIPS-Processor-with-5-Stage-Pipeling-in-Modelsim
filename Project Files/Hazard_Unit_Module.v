module Hazard_Unit_Module (PC_Write_Enable,IF_ID_Enable, Mux_Output, ID_EX_Mem_Read , IF_ID_RS, IF_ID_RT, ID_EX_RT);

input [4:0] IF_ID_RS, IF_ID_RT, ID_EX_RT;
input ID_EX_Mem_Read;
output reg IF_ID_Enable;
output reg PC_Write_Enable; 
output reg Mux_Output;

//

initial 

begin 
	IF_ID_Enable = 1;
	PC_Write_Enable =1;

end


always@(*)
begin
	if( ( (ID_EX_Mem_Read==1) & ((ID_EX_RT == IF_ID_RT) | (ID_EX_RT == IF_ID_RS) ) ) )
		begin
			Mux_Output = 0;
			IF_ID_Enable= 0; 
			PC_Write_Enable = 0; 
			
		end
	else
		begin
			Mux_Output = 1;
			IF_ID_Enable = 1; 
			PC_Write_Enable = 1; 
		
		end

end

endmodule