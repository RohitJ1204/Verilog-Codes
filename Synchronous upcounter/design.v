module scc(input clk,rst,
                 output reg[3:0]count);
always@(negedge clk)
begin
	if(rst==1'b0000)
	count<=4'b0000;
	else
	count<=count+1;
end 
endmodule
