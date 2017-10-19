`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/23 19:59:16
// Design Name: 
// Module Name: clk_tb
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


module clk_tb;
reg in;
wire locked;
wire out;
initial
   begin
   in=0;
   forever
    begin
    #40 in=~in;
    end
   end
 clk_wiz_0 v(.clk_in1(in),.clk_out1(out),.locked(locked));
endmodule
