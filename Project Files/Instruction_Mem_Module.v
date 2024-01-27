module Instruction_Mem_Module(address_In, Instruction,clk);
// 
input [31:0] address_In;
input clk;
output reg [31:0] Instruction;


reg[7:0] memfile[0:255];


initial 

begin 
//

// Add instruction
/*

 {memfile[3 ],memfile[2 ],memfile[1 ],memfile[0 ]}  =   32'h8C080000; 
 {memfile[7 ],memfile[6 ],memfile[5 ],memfile[4 ]}  =   32'h21020004; //AND
{memfile[11],memfile[10 ],memfile[9 ],memfile[8]}  =   32'h10000001;
{memfile[15],memfile[14 ],memfile[13 ],memfile[12]}  =   32'h00481020;
{memfile[19],memfile[18 ],memfile[17 ],memfile[16]}  =   32'h08000004;
*/
//{memfile[23],memfile[22],memfile[21 ],memfile[20]}  = 32'h08000003;



// Find Remainder Long Division

/*
{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'h0211001A;
{memfile[7],memfile[6 ],memfile[5 ],memfile[4]}  =   32'h00004012;
{memfile[11],memfile[10 ],memfile[9 ],memfile[8]}  =   32'h01110018;
{memfile[15],memfile[14],memfile[13 ],memfile[12]}  =   32'h00004012;
{memfile[19],memfile[18 ],memfile[17 ],memfile[16]}  =   32'h02081022;
*/

// ADD $1, $7 $8 
{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'h00E80820;

// ADDI $1, $8, 4
//{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'h21010004;

//AND $1, $7, $8
//{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'h00E80824;

/*
DIV $8, $7
MFLO $1
MFHI $2
*/
/*
{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'h0107001A;
{memfile[7],memfile[6 ],memfile[5 ],memfile[4]}  =   32'h00000812;
{memfile[11],memfile[10 ],memfile[9 ],memfile[8]}  = 32'h00001010;

*/

/*
MULT $8, $7
MFLO $1
MFHI $2

*/

/*
{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'h01070018;
{memfile[7],memfile[6 ],memfile[5 ],memfile[4]}  =   32'h00000812;
{memfile[11],memfile[10 ],memfile[9 ],memfile[8]}  = 32'h00001010;
*/


//NOR $1, $7, $8
//{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'h01070827;

//OR $1, $7, $8
//{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'h01070825;

//SLT $1, $8, $7
//{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'h0107082A;
// run two tests

// SUB $1, $8, $7
//{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'h01070822;

//LW $1, 0($0)
// unblock data memory and register module initial
//{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'h8C200000;

//SW $8, 0($0)
//{memfile[3],memfile[2 ],memfile[1 ],memfile[0]}  =   32'hAC080000;

/*
//Branch if Equal 
Program:					//  HEX
0 ADD $8, $2, $1				//00414020
4 ADD $2, $8, $11 			//01681020		
8 Beq $0, $0, 1				//10000001
12 ADD $3 , $9 , $10			//012A1820		
16 $3 , $zero , $10			000A1820

*/


/*
{memfile[3 ],memfile[2 ],memfile[1 ],memfile[0 ]}  =   32'h00414020; 
{memfile[7 ],memfile[6 ],memfile[5 ],memfile[4 ]}  =   32'h01681020; 
{memfile[11],memfile[10 ],memfile[9 ],memfile[8]}  =   32'h10000001;
{memfile[15],memfile[14 ],memfile[13 ],memfile[12]}  = 32'h012A1820;
{memfile[19],memfile[18 ],memfile[17 ],memfile[16]}  = 32'h000A1820;

*/

/*
	HEX 	 	Instrution

0	80000003 Jump , 3      // This instruction should jump to address 12
4	00E80820 ADD $1, $7, $8
8	00430824 AND $1, $2, $3
12	00E80822 SUB $1, $7, $8

*/

/*
{memfile[3 ],memfile[2 ],memfile[1 ],memfile[0 ]}  =   32'h8000003; 
{memfile[7 ],memfile[6 ],memfile[5 ],memfile[4 ]}  =   32'h00E80820; 
{memfile[11],memfile[10 ],memfile[9 ],memfile[8]}  =   32'h00430824;
{memfile[15],memfile[14 ],memfile[13 ],memfile[12]}  = 32'h00E80822;
*///
// jump add 

end 

always@(posedge clk)

begin
	
	Instruction = {memfile[address_In+3], memfile[address_In+2], memfile[address_In+1] , memfile[address_In]};
	
end


endmodule 

