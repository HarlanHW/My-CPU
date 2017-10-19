`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/16 10:37:30
// Design Name: 
// Module Name: instmem
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


module instmem(
    input [31:0] pc,
    output [31:0] inst
    );
  reg [32:0]ins[0:1023];
  assign inst=inst[pc];
endmodule
