`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 16:00:23
// Design Name: 
// Module Name: Adder
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


module Adder(
    input [3:0]iSA,//��λ
    input [31:0] iData_a,
    input [31:0] iData_b,
    output [31:0] oData,//���λΪ����λ
    output reg carry,
    output reg negative,
    output reg overflow
    );
    reg signed [31:0] tData=32'h0000_0000;
    reg signed [31:0] ta=32'h0000_0000;
    reg signed [31:0] tb=32'h0000_0000;
     reg signed [31:0] na=32'h0000_0000;
     reg signed [31:0] nb=32'h0000_0000;
    reg t1=1'b0;//���λ��λ
    reg t2=1'b0;//�θ�λ��λ
    reg tC=1'b0;
    reg [31:0] sb=32'h0000_0000;
    always@(*)
    begin
        if(iSA[1]==1'b0)//��λΪ0����ʾ�޷��ż���
        begin
            if(iSA[0]==1'b0)//�޷��ż�
            begin
                 tData=iData_a+iData_b;
                 carry=(tData<iData_a||tData<iData_b)?1'b1:1'b0;
            end
            else if(iSA[0]==1'b1)//�޷��ż�
            begin
                  tData=iData_a-iData_b;
                  carry=(iData_a<iData_b)?1'b1:1'b0;
            end
        end   
        else if(iSA[1]==1'b1)//��λΪ1����ʾ�з��ż���
        begin
            ta=$signed(iData_a);
            tb=$signed(iData_b);        
            if(iSA[0]==1'b0)//�з��ż�
            begin
                tData=ta+tb;
                overflow=(ta>0&&tb>0&&tData<=0)||(ta<0&&tb<0&&tData>=0)?1'b1:1'b0;
                negative=tData[31];
            end
            else
            begin
                tData=ta-tb;
                overflow=(ta>0&&tb<0&&tData<=0)||(ta<0&&tb>0&&tData>=0)?1'b1:1'b0;          
                 negative=tData[31];  
            end
        end
    end
 assign oData=tData;
endmodule
