module TB_File();
//
reg clk;

Top_Level_Module Top_Level( 
 .clk(clk)
);

initial 
begin
clk = 0;



end 


always 
#100 clk = ~clk;


endmodule 
