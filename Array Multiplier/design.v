module multiplier_clk(product,inp1,inp2,clk,rst);
 output [7:0]product;
 input [3:0]inp1;
 input [3:0]inp2;
 input clk,rst;
 wire cin;
 assign product[0] =(inp1[0]&inp2[0]);
 assign cin=1'b0;
 wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,
       s2,s3,s4,s6,s7,s8,
       y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15;
  and_i a1(inp1[0],inp2[1],y1);
  and_i a2(inp1[0],inp2[2],y2);
  and_i a3(inp1[0],inp2[3],y3);
  and_i a4(inp1[1],inp2[0],y4);
  and_i a5(inp1[1],inp2[1],y5);
  and_i a6(inp1[1],inp2[2],y6);
  and_i a7(inp1[1],inp2[3],y7);
  and_i a8(inp1[2],inp2[0],y8);
  and_i a9(inp1[2],inp2[1],y9);
  and_i a10(inp1[2],inp2[2],y10);
  and_i a11(inp1[2],inp2[3],y11);
  and_i a12(inp1[3],inp2[0],y12);
  and_i a13(inp1[3],inp2[1],y13);
  and_i a14(inp1[3],inp2[2],y14);
  and_i a15(inp1[3],inp2[3],y15);

  FA fa1(product[1],c1,y1,y4,cin,clk,rst);
  FA fa2(s2,c2,y2,y5,c1,clk,rst);
  FA fa3(s3,c3,y3,y6,c2,clk,rst);
  FA fa4(s4,c4,cin,y7,c3,clk,rst);
  FA fa5(product[2],c5,s2,y8,cin,clk,rst);
  FA fa6(s6,c6,s3,y9,c5,clk,rst);
  FA fa7(s7,c7,s4,y10,c6,clk,rst);
  FA fa8(s8,c8,c4,y11,c7,clk,rst);
  FA fa9(product[3],c9,s6,y12,cin,clk,rst);
  FA fa10(product[4],c10,s7,y13,c9,clk,rst);
  FA fa11(product[5],c11,s8,y14,c10,clk,rst);
  FA fa12(product[6],product[7],c8,y15,c11,clk,rst);
  endmodule
  module FA(sum,cout,a,b,cin,clk,rst);
  output reg sum,cout;
  input a,b,cin,clk,rst;
  always@(posedge clk)
    begin
     if(rst) 
    begin
      sum<=1'b0;
      cout<=1'b0;
     end
  else
     begin
      sum<= (a^b^cin);
      cout<= ((a&b)|(a&cin)|(b&cin));
    end
   end
 endmodule   
 
 
module and_i (a,b,y);
  input a,b;
  output y;
  assign y= a&b;
endmodule  
  
  
  

