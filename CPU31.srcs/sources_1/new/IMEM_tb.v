`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/17 12:40:39
// Design Name: 
// Module Name: IMEM_tb
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


module IMEM_tb;
   reg [31:0]pc;
   wire [31:0] inst;
   initial
   begin
   pc<=0;
   forever
      begin
      #40 pc<=pc+32'h4;
      end
   end
   IMEM test0(.a(pc/4),.spo(inst));
   
endmodule
