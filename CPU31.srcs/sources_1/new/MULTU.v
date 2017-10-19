`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/13 20:51:36
// Design Name: 
// Module Name: MULTU
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


module MULTU(
    input clk,
    input reset,
    input [31:0] a,
    input [31:0] b,
    output [63:0] z
    );
    reg [62:0] temp0;reg [61:0] temp1;reg [60:0] temp2;reg [59:0] temp3;
    reg [58:0] temp4;reg [57:0] temp5;reg [56:0] temp6;reg [55:0] temp7;
    reg [54:0] temp8;reg [53:0] temp9;reg [52:0] temp10;reg [51:0] temp11;
    reg [50:0] temp12;reg [49:0] temp13;reg [48:0] temp14;reg [47:0] temp15;
    reg [46:0] temp16;reg [45:0] temp17;reg [44:0] temp18;reg [43:0] temp19;
    reg [42:0] temp20;reg [41:0] temp21;reg [40:0] temp22;reg [39:0] temp23;
    reg [38:0] temp24;reg [37:0] temp25;reg [36:0] temp26;reg [35:0] temp27;
    reg [34:0] temp28;reg [33:0] temp29;reg [32:0] temp30;reg [31:0] temp31;
    wire [63:0] out1; wire [61:0] out2; wire [59:0] out3; wire [57:0] out4;
    wire [55:0] out5; wire [53:0] out6; wire [51:0] out7; wire [49:0] out8;
    wire [47:0] out9; wire [45:0] out10;wire [43:0] out11;wire [41:0] out12;
    wire [39:0] out13;wire [37:0] out14;wire [35:0] out15;wire [33:0] out16;
    wire [63:0] c1;wire [60:0] c2;wire [56:0] c3;wire [52:0] c4;
    wire [48:0] c5;wire [44:0] c6;wire [40:0] c7;wire [36:0] c8;
    wire [63:0] add8x4_1;wire [57:0] add8x4_2;wire [49:0] add8x4_3;wire [45:0] add8x4_4;
    wire [63:0] add4x2_1;wire [50:0] add4x2_2;
function [31:0] mult31; 
    input [31:0] operand; 
    input sel; 
    begin   
        mult31=(sel)?(operand):31'b0; 
    end  
endfunction 
    always@(posedge clk or negedge reset)
    begin
        if(reset)
        begin
        temp31<=64'b0;temp30<=64'b0;temp29<=64'b0;temp28<=64'b0;
        temp27<=64'b0;temp26<=64'b0;temp25<=64'b0;temp24<=64'b0;
        temp23<=64'b0;temp22<=64'b0;temp21<=64'b0;temp20<=64'b0;
        temp19<=64'b0;temp18<=64'b0;temp17<=64'b0;temp16<=64'b0;
        temp15<=64'b0;temp14<=64'b0;temp13<=64'b0;temp12<=64'b0;
        temp11<=64'b0;temp10<=64'b0;temp9<=64'b0;temp8<=64'b0;
        temp7<=64'b0;temp6<=64'b0;temp5<=64'b0;temp4<=64'b0;
        temp3<=64'b0;temp2<=64'b0;temp1<=64'b0;temp0<=64'b0;
        end
        else
        begin
            temp31<=((mult31(a,b[0]))<<0);
            temp30<=((mult31(a,b[1]))<<1);
            temp29<=((mult31(a,b[2]))<<2);
            temp28<=((mult31(a,b[3]))<<3);
            temp27<=((mult31(a,b[4]))<<4);
            temp26<=((mult31(a,b[5]))<<5);
            temp25<=((mult31(a,b[6]))<<6);
            temp24<=((mult31(a,b[7]))<<7);
            temp23<=((mult31(a,b[8]))<<8);
            temp22<=((mult31(a,b[9]))<<9);
            temp21<=((mult31(a,b[10]))<<10);
            temp20<=((mult31(a,b[11]))<<11);
            temp19<=((mult31(a,b[12]))<<12);
            temp18<=((mult31(a,b[13]))<<13);
            temp17<=((mult31(a,b[14]))<<14);
            temp16<=((mult31(a,b[15]))<<15);
            temp15<=((mult31(a,b[16]))<<16);
            temp14<=((mult31(a,b[17]))<<17);
            temp13<=((mult31(a,b[18]))<<18);
            temp12<=((mult31(a,b[19]))<<19);
            temp11<=((mult31(a,b[20]))<<20);
            temp10<=((mult31(a,b[21]))<<21);
            temp9 <=((mult31(a,b[22]))<<22);
            temp8 <=((mult31(a,b[23]))<<23);
            temp7 <=((mult31(a,b[24]))<<24);
            temp6 <=((mult31(a,b[25]))<<25);
            temp5 <=((mult31(a,b[26]))<<26);
            temp4 <=((mult31(a,b[27]))<<27);
            temp3 <=((mult31(a,b[28]))<<28);
            temp2 <=((mult31(a,b[29]))<<29);
            temp1 <=((mult31(a,b[30]))<<30);
            temp0 <=((mult31(a,b[31]))<<31); 
        end
    end
assign out1=temp0+temp1;
assign out2=temp2+temp3;
assign out3=temp4+temp5;
assign out4=temp6+temp7;
assign out5=temp8+temp9;
assign out6=temp10+temp11;
assign out7=temp12+temp13;
assign out8=temp14+temp15;
assign out9=temp16+temp17;
assign out10=temp18+temp19;
assign out11=temp20+temp21;
assign out12=temp22+temp23;
assign out13=temp24+temp25;
assign out14=temp26+temp27;
assign out15=temp28+temp29;
assign out16=temp30+temp31;
assign c1=out1+out2;
assign c2=out3+out4;
assign c3=out5+out6;
assign c4=out7+out8;
assign c5=out9+out10;
assign c6=out11+out12;
assign c7=out13+out14;
assign c8=out15+out16;
assign add8x4_1=c1+c2;
assign add8x4_2=c3+c4;
assign add8x4_3=c5+c6;
assign add8x4_4=c7+c8;
assign add4x2_1=add8x4_1+add8x4_2;
assign add4x2_2=add8x4_3+add8x4_4;
assign z=add4x2_1+add4x2_2;
endmodule