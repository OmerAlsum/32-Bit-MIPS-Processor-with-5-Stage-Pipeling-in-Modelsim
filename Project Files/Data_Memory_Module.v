module Data_Memory_Module(
  output reg [31:0] data_output,
  input [31:0] address_input, 
  input [31:0] write_data, 
  input memWrite, 
  input memRead,
  input clk
);
//
  reg [31:0] memfile[0:31]; 

initial 

begin 

//LW $1, 0($0)
memfile [32'd0] = 32'd10;

//SW $8, 0($0)
//memfile [32'd0] = 32'd0;
end

always@(negedge clk)
	begin
		if (memWrite == 1)
			begin
				memfile[address_input] = write_data;
		end 
  end 
// should be posedge clk
  always@(negedge clk)
  begin
		if( memRead == 1)
		begin 
				data_output = memfile[address_input];
		end 
  end 
  
endmodule