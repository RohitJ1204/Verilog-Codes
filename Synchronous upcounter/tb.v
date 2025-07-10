module synchcount_tb;
wire [3:0]count;
reg clk,rst;
synchcount c1 (clk,rst,count);
initial 
begin
clk <=1'b0;
rst<=1'b0;
#10
rst<=1'b1;
#200
$stop;
end
always #5 clk<=~clk;
endmodule 

