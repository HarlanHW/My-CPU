`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/23 19:45:51
// Design Name: 
// Module Name: DIV
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

module DIV(
    input [31:0] dividend,
    input [31:0] divisor,
    input start,
    input clock,
    input reset,
    output [31:0] q,
    output [31:0] r,
    output  busy
    );
    wire [31:0] a;
    wire [31:0] b;
    wire [31:0] qq;
    wire [31:0]rr;
    wire busy1;
    assign a=dividend[31]?~dividend+1:dividend;
    assign b=divisor[31]?~divisor+1:divisor;
    DIVU div(a,b,start,clock,reset,qq,rr,busy1);
    assign q=dividend[31]^divisor[31]?~qq+1:qq;
    assign r=dividend[31]?~rr+1:rr;
    assign busy =busy1;
endmodule
