`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/11 14:03:35
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [4:0] iData,//5位地址可以有32种
    input iEna,//使能信号就是we
    output  [31:0] oData//出来的结果作为寄存器使能信号，所以高电平
    );   
  reg [31:0]tData=32'h00000000;
always@(*) 
begin
    if(iEna)
    begin
        tData<=0;
        tData[iData]<=1'b1;
    end
end   
assign oData=tData;
endmodule