`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 19:06:50
// Design Name: 
// Module Name: mux2x5
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


module mux2x5(
    input [4:0]a,
    input [4:0]b,
    input ena,
    output [4:0]o
    );
    assign o=ena?a:b;
endmodule
