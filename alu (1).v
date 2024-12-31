module alu(out,ack,en,a,b,sel);
input [31:0]a,b;
input [3:0]sel;
input en;
output [63:0]out;
output ack;
reg [63:0]out;
reg ack;
always@(en,sel,a,b)
begin
if (en == 0)
out <= 0;
else
case(sel)
4'b0000 : out <= a + b;
4'b0001 : out <= a - b;
4'b0010 : out <= a * b;
4'b0011 : out <= a / b;
4'b0100 : out <= a % b;
4'b0101 : out <= a & b;
4'b0110 : out <= a | b;
4'b0111 : out <= ~a;
4'b1000 : out <= ~b;
4'b1001 : out <= ~(a & b);
4'b1010 : out <= ~(a | b);
4'b1011 : out <= a ^ b;
4'b1100 : out <= ~(a ^ b);
default : out <= 4'bz;
endcase
ack <= 1;
end
endmodule

module alu_tb;
reg [31:0]a,b;
reg [3:0]sel;
reg en;
wire [63:0]out;
wire ack;

alu n1(out,ack,en,a,b,sel);

initial begin
en <= 1'b0;
#10 en <= 1'b1;

a <= 32'h94;
b <= 32'h61;
sel <= 4'b0000;
#10 sel <= 4'b0001;
#10 sel <= 4'b0010;
#10 sel <= 4'b0011;
#10 sel <= 4'b0100;
#10 sel <= 4'b0101;
#10 sel <= 4'b0110;
#10 sel <= 4'b0111;
#10 sel <= 4'b1000;
#10 sel <= 4'b1001;
#10 sel <= 4'b1010;
#10 sel <= 4'b1011;
#10 sel <= 4'b1100;
end
endmodule
