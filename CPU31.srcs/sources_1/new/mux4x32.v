`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/16 18:28:43
// Design Name: 
// Module Name: mux4x32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 

// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux4x32 (a,b,c,d,pcsource,y);
	input [31:0] a,b,c,d; // a0,a1: 32-bit
	input [1:0]pcsource; // s: 1-bit
	output [31:0] y; // y: 32-bit
	assign y = pcsource==2'b00 ? a :
	           pcsource==2'b01 ? b :
	           pcsource==2'b10 ? c :
	           pcsource==2'b11 ? d :0; // like C
endmodule 
