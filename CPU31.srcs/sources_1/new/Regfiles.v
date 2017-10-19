`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/11 13:46:34
// Design Name: 
// Module Name: Regfiles
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


module Regfiles(
    input clk,//下降沿写入数据
    input rst,//高电平全部寄存器置零
    input we,//高电平可以写，低电平可以读
    input [4:0] raddr1,//读的地址
    input [4:0] raddr2,
    input [4:0] waddr,//写的地址
    input [31:0] wdata,//写的数据，下降沿写入
    output [31:0] rdata1,
    output [31:0] rdata2
    );
    wire [31:0] select;
    (* KEEP = "TRUE" *)wire [1023:0]data;
    decoder d(waddr,we,select);//选择
 //   assign data[0+:32]=0;
    pcreg u0 (clk,rst||(!waddr),select[0]&&waddr&&we,wdata,data[0*32+:32]);
    pcreg u1 (clk,rst,select[1]&&we,wdata,data[1*32+:32]);
    pcreg u2 (clk,rst,select[2]&&we,wdata,data[2*32+:32]);
    pcreg u3 (clk,rst,select[3]&&we,wdata,data[3*32+:32]);
    pcreg u4 (clk,rst,select[4]&&we,wdata,data[4*32+:32]);
    pcreg u5 (clk,rst,select[5]&&we,wdata,data[5*32+:32]);
    pcreg u6 (clk,rst,select[6]&&we,wdata,data[6*32+:32]);
    pcreg u7 (clk,rst,select[7]&&we,wdata,data[7*32+:32]);
    
    pcreg u8 (clk,rst,select[8]&&we,wdata,data[8*32+:32]);
    pcreg u9 (clk,rst,select[9]&&we,wdata,data[9*32+:32]);
    pcreg u10(clk,rst,select[10]&&we,wdata,data[10*32+:32]);
    pcreg u11(clk,rst,select[11]&&we,wdata,data[11*32+:32]);
    pcreg u12(clk,rst,select[12]&&we,wdata,data[12*32+:32]);
    pcreg u13(clk,rst,select[13]&&we,wdata,data[13*32+:32]);
    pcreg u14(clk,rst,select[14]&&we,wdata,data[14*32+:32]);
    pcreg u15(clk,rst,select[15]&&we,wdata,data[15*32+:32]);
    
    pcreg u16(clk,rst,select[16]&&we,wdata,data[16*32+:32]);
    pcreg u17(clk,rst,select[17]&&we,wdata,data[17*32+:32]);
    pcreg u18(clk,rst,select[18]&&we,wdata,data[18*32+:32]);
  
    pcreg u19(clk,rst,select[19]&&we,wdata,data[19*32+:32]);
    pcreg u20(clk,rst,select[20]&&we,wdata,data[20*32+:32]);
    pcreg u21(clk,rst,select[21]&&we,wdata,data[21*32+:32]);
    pcreg u22(clk,rst,select[22]&&we,wdata,data[22*32+:32]);
    pcreg u23(clk,rst,select[23]&&we,wdata,data[23*32+:32]);
    
    pcreg u24(clk,rst,select[24]&&we,wdata,data[24*32+:32]);
    pcreg u25(clk,rst,select[25]&&we,wdata,data[25*32+:32]);
    pcreg u26(clk,rst,select[26]&&we,wdata,data[26*32+:32]);
    pcreg u27(clk,rst,select[27]&&we,wdata,data[27*32+:32]);
    pcreg u28(clk,rst,select[28]&&we,wdata,data[28*32+:32]);
//    pcreg u28_1(clk,rst,select[28]&&we,wdata,reg_28);
    pcreg u29(clk,rst,select[29]&&we,wdata,data[29*32+:32]);
    pcreg u30(clk,rst,select[30]&&we,wdata,data[30*32+:32]);
    pcreg u31(clk,rst,select[31]&&we,wdata,data[31*32+:32]);
    selector s1(clk,data,raddr1,rdata1);
    selector s2(clk,data,raddr2,rdata2);
    //cla32 r_28(data[28*32+:32],32'b0,1'b1,reg_28);
   
  //  assign reg_28=data[28*32+:16];      
endmodule
