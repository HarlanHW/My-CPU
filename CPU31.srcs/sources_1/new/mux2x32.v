`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 16:25:56
// Design Name: 
// Module Name: mux2x32
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


module mux2x32 (a0,a1,s,y);
	input [31:0] a0,a1; // a0,a1: 32-bit
	input s; // s: 1-bit
	output [31:0] y; // y: 32-bit
	assign y = s ? a0 : a1; // like C
endmodule 
