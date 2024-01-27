module Register_Module(read_data_1, read_data_2, read_reg_1, read_reg_2, write_reg, write_data, regwrite, clk);

output reg [31:0] read_data_1, read_data_2;

//
input regwrite;

input [31:0] write_data;
input[4:0] read_reg_1, read_reg_2, write_reg;

input clk;

reg [31:0] regfile[0:31]; 

initial 

begin 

		//Register file for branch if equal
/*
	regfile[32'd8] = 32'd0;
	regfile[32'd0] = 32'd0;
	regfile[32'd2] = 32'd3;
	regfile[32'd1] = 32'd3;
	regfile[32'd9] = 32'd10;
	regfile[32'd10] = 32'd10;
	regfile[32'd11] = 32'd4;

*/

/*
		// Register file for finding the remainder of long division
	regfile[32'd16] = 32'd10;
	regfile[32'd17] = 32'd3;
*/

//ADD $1, $7 $8 
regfile[32'd7] = 32'd2;
regfile[32'd8] = 32'd2;

//ADDI $1, $8, 4
//regfile[32'd8] = 32'd6;

// AND $1, $7, $8
//regfile[32'd7] = 32'd13;
//regfile[32'd8] = 32'd4;

/*
DIV $8, $7
MFLO $1
MFHI $2
*/

//regfile[32'd7] = 32'd3;
//regfile[32'd8] = 32'd10;

/*
MULT $8, $7
MFLO $1
MFHI $2
*/

//regfile[32'd7] = 32'd5;
//regfile[32'd8] = 32'd2;

//NOR $1, $7, $8
//regfile[32'd7] = 32'd10;
//regfile[32'd8] = 32'd1;

//OR $1, $7, $8
//regfile[32'd7] = 32'd10;
//regfile[32'd8] = 32'd1;

//SLT $1, $8, $7
// should have output 1
//regfile[32'd7] = 32'd9;
//regfile[32'd8] = 32'd4;
//
// should have output 0
//regfile[32'd7] = 32'd1;
//regfile[32'd8] = 32'd10;

//SUB $1, $8, $7
//regfile[32'd7] = 32'd6;
//regfile[32'd8] = 32'd10;

//LW $1, 0($0)
regfile[32'd0] = 32'd0;
//regfile[32'd1] = 32'd0;

//SW $8, 0($0)
//regfile[32'd8] = 32'd10;
//regfile[32'd0] = 32'd0;

/*
	HEX 	 	Instrution

0	00E80820 ADD $1, $7, $8
4	114B0001 BEQ $10, $11, 1
8	00430824 AND $1, $2, $3
12	00E80822 SUB $1, $7, $8

*/

/*
regfile[32'd7] = 32'd2;
regfile[32'd8] = 32'd2;
regfile[32'd2] = 32'd2;
regfile[32'd3] = 32'd3;
regfile[32'd10] = 32'd10;
regfile[32'd11] = 32'd11;
*/


		//Register file for branch if equal
/*
	regfile[32'd8] = 32'd0;
	regfile[32'd0] = 32'd0;
	regfile[32'd2] = 32'd3;
	regfile[32'd1] = 32'd3;
	regfile[32'd9] = 32'd10;
	regfile[32'd10] = 32'd10;
	regfile[32'd11] = 32'd4;
*/



end 


always@(negedge clk)

begin 

// add  &~(write_reg == 32'd0)
if (regwrite == 1  &~(write_reg == 32'd0))
	begin

		 regfile[write_reg] = write_data;
	end 



end

always@(read_reg_1, read_reg_2)
begin

	 read_data_1 = regfile[read_reg_1];
	 read_data_2 = regfile[read_reg_2];
end
endmodule