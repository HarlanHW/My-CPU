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
    input clk,//1λ���룬�½�����д��
    input rst,//1λ���룬�첽�����źţ��ߵ�ƽ����
    input ena,//ʹ���ź��ǵ�ַѡ�����������ź�
    input [31:0] data_in,//�������ݱ����ڼĴ����ڲ�
    output   [31:0] data_out//32λ���������ʱʼ�����pc�Ĵ����ڲ���ֵ
    );
    reg [31:0] data_temp;
   
   always@(negedge clk or posedge rst)
       begin
       if(rst==1)
           data_temp<=32'h00000000;
       else
       begin
           if(ena)//�ߵ�ƽд
           data_temp<=data_in;
       end
        
       end
        assign data_out=data_temp;
endmodule

