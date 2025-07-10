module fa(input clk, reset,a,b,cin,output reg sum, carry);
always@(posedge clk)
begin
	if(reset)
		begin
		sum<=1'b0;
		carry<=1'b0;
		end
	
	else
		begin
		sum<=a^b^cin;
		carry<=(a&b)|(b&cin)|(a&cin);
		end
end
endmodule

module pa(input [3:0]a,b,input cin, clk, reset, output [3:0]sum,output carry);
wire x1, x2, x3;

fa fa_1(clk,reset,a[0],b[0],cin,sum[0],x1);
fa fa_2(clk,reset,a[1],b[1],x1,sum[1],x2);
fa fa_3(clk,reset,a[2],b[2],x2,sum[2],x3);
fa fa_4(clk,reset,a[3],b[3],x3,sum[3],carry);
endmodule



