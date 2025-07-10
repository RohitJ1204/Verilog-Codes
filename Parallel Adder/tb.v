module paralleladder_tb;
wire[3:0]sum;
wire carry;
reg[3:0]a,b;
reg cin,clk,reset;
wire x1,x2,x3;

pa pa1(a,b,cin,clk,reset,sum,carry);

initial
	begin
		clk<=1'b0; 
		reset<=1'b1;
		#10 
		reset<=1'b0;
		a<=4'b0000;
		b<=4'b0001;
		cin<=1'b0;
		#10
		 a<=4'b0010; 
		 b<=4'b0011; 
		 cin<=1'b0;
		#200 
		$stop;
	end
always #5 clk=~clk;
endmodule

