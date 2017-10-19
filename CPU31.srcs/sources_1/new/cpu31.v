`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/16 10:56:14
// Design Name: 
// Module Name: cpu31
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


module cpu31(
    input clk,//时钟信号
    input resten,//复位信号aaa
    input [15:0]sw,
    output [7:0]o_seg,
    output [7:0]o_sel
);
    wire clock;
    wire locked;
    wire wmem;
    wire D_e;
    wire [1:0]store_s;
    wire [31:0] mem;
    wire [31:0] rt;
   (* KEEP = "TRUE" *) wire [31:0]inst;
   (* KEEP = "TRUE" *) wire [31:0]pc;
    wire [31:0]alu;
    wire [31:0]rdata;
    wire seg7_cs;
    wire switch_cs;
    clk_wiz_1 c(.clk_in1(clk),.clk_out1(clock),.locked(locked),.reset(resten));
    DMEM d(.clock(clock),.D_e(D_e),.wena(wmem),.addr(alu-32'h10010000),
           .data_in(rt),.data_out(mem),.data0(dmem_0),.store_s(store_s));     
    sccpu s(.clock(clock),.resten(resten&~locked),.inst(inst),.mem(rdata),.pc(pc),
            .alu(alu),.rt(rt),.wmem(wmem),.D_e(D_e),.store_s(store_s));
    IMEM i(.a(pc/4),.spo(inst));
    
    seg7x16 seg7(.clk(clock),.reset(resten&~locked),.cs(seg7_cs),
                 .i_data(rt),.o_seg(o_seg),.o_sel(o_sel));
    sw_mem_sel sw_mem(.switch_cs(switch_cs),.sw(sw),
                      .data(mem),.data_sel(rdata));
    io_sel io_mem(.addr(alu),.cs(D_e),.sig_w(wmem),.sig_r(D_e&~wmem),
                  .seg7_cs(seg7_cs),.switch_cs(switch_cs));
               
endmodule
