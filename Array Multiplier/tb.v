module multiplier_clk_tb;
  reg[3:0]inp1;
  reg[3:0]inp2;
  reg  clk,rst;
  wire [7:0]product;
  multiplier_clk m1(product,inp1,inp2,clk,rst);
  initial
    begin
     clk=1'b0;
     rst<=1'b1;
     inp1=10;
     inp2=12;
 #10
     rst<=1'b0;
     inp1=13;
     inp2=12;
#100
     inp1=13;
     inp2=12;
 $finish;
 end
 always #5
 clk=~clk;
 endmodule

