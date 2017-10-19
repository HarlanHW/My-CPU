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
    input [4:0] iData,//5λ��ַ������32��
    input iEna,//ʹ���źž���we
    output  [31:0] oData//�����Ľ����Ϊ�Ĵ���ʹ���źţ����Ըߵ�ƽ
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