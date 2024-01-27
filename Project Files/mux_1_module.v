module mux_1_module (out , a , b , c , control);


output reg [31:0] out;

input [31:0] a,b,c;

input [1:0] control;

//
always@(*)

begin

	if(control == 0)
		begin
		
			out = a;
		end
		
	else if (control == 2'b01)
	
		begin 
		
		out  = b;
		
		end
		
	else
	
		begin
		
			out = c;
		
		end

end
endmodule