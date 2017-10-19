`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/11 13:52:51
// Design Name: 
// Module Name: pcreg
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


module pcreg(
    input clk,//1位输入，下降沿沿写入
    input rst,//1位输入，异步重置信号，高电平清零
    input ena,//使能信号是地址选择器出来的信号
    input [31:0] data_in,//输入数据被存在寄存器内部
    output   [31:0] data_out//32位输出，工作时始终输出pc寄存器内部的值
    );
    reg [31:0] data_temp;
   
   always@(negedge clk or posedge rst)
       begin
       if(rst==1)
           data_temp<=32'h00000000;
       else
       begin
           if(ena)//高电平写
           data_temp<=data_in;
       end
        
       end
        assign data_out=data_temp;
endmodule

