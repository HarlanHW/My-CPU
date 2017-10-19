`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 16:37:53
// Design Name: 
// Module Name: ext5
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


module ext5x32(
    input [4:0]in,
    output[31:0]out
    );
    assign out={27'b0000_0000_0000_0000_0000_0000_000,in};
endmodule
