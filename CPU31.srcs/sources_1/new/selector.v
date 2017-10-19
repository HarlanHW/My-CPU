`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/11 14:19:19
// Design Name: 
// Module Name: selector
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


module selector(
    input clk,
    input [1023:0]idata,
    input [4:0]raddr,//5位地址选择线
    output [31:0] rdata//读出31位数据
    );
    assign rdata=idata[raddr*32+:32];
  
endmodule
