`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 17:02:10
// Design Name: 
// Module Name: dff32
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


module dff32 (d,clk,clrn,q);
	input [31:0] d;
	input clk,clrn;
	output reg [31:0] q;

	always@(posedge clrn or posedge clk)
	begin
		if (clrn == 1) 
			q<=32'h00000000;
        else 
			q<=d;
	end
endmodule		