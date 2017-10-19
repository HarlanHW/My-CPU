`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/04 22:45:52
// Design Name: 
// Module Name: div_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module div_tb;
   reg clock;// ±÷”–≈∫≈
   reg [31:0]A;
   reg [31:0]B;
   reg out_e;
   reg in_e;
   wire [63:0]C;
   wire [31:0]q;
   wire [31:0]r;
   initial
   begin
   clock=0;
   in_e=0;
   #15 in_e=1'b1;
   A=32'h0fffffff;
   B=32'h4;
   end

   initial
   begin
   forever
   begin
   #5 clock=~clock;
   end
   end
   _div div_s(.clock(~clock),.in_e(in_e),.A(A),.B(B),.out_e(out_e),.q(q),.r(r));
                          
endmodule
