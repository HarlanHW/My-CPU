`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/01 14:53:38
// Design Name: 
// Module Name: dff1
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


module dff1 (d,clk,clrn,q);
	input  d;
	input clk,clrn;
	output reg  q;

	always@(posedge clrn or posedge clk)
	begin
		if (clrn == 1) 
			q<=32'h00000000;
        else 
			q<=d;
	end
endmodule	
