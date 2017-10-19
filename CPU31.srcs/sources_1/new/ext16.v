`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 16:48:37
// Design Name: 
// Module Name: ext16
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



module ext16x32(
    input [15:0]in,
    input ena,//有效时符号扩展
    output[31:0]out
    );
    wire t=ena&in[15];
    wire [15:0]imm={16{t}};
    assign out={imm,in};
endmodule

