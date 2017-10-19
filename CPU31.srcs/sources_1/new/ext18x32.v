`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 19:01:19
// Design Name: 
// Module Name: ext18x32
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


module ext18x32(
    input [15:0]in,
    output[31:0]out
    );
   wire t=in[15];
   wire [13:0]imm={14{t}};
   assign out={imm,in,2'b00};
endmodule
