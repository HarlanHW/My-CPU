`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/15 16:03:32
// Design Name: 
// Module Name: sucpu
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


module sccpu(
    input clock,//ʱ���ź�
    input resten,//��λ�ź�
    input [31:0]inst,//ָ��
    input [31:0]mem,//�Ӵ洢�����������
    output[31:0]pc,//�������
    output[31:0]alu,//alu���������
    output[31:0]rt,//Ҫд�������
    output wmem,//���ݼĴ����Ŀ����ź�
    output D_e,
    output [1:0]store_s
    );
    wire [31:0] npc,adr,p4,next_pc,alu_mem_c0;//pc+4
    wire [3:0] aluc;//alu�����ź�
    wire m1,m2,m3,m4,m5,m6,m7,jal_ena,D_r,D_w,I_r,E16,zero;
    wire we;
    wire [4:0]rsc,rtc,rdc,rdc_t,rtc_t;
    wire [31:0] data_in,A,B,data_in_0,data_in_1;//�Ĵ������������
    wire [1:0]pcsource,selpc,mfc0,Rd_in;
    
    wire [31:0]alua;wire [31:0]alub;//wire[31:0]alu;
    wire [31:0]alu_mem;//Ҫ��alu��������
    wire [31:0] ext5;
    wire [31:0] ext16;
    wire [31:0] ext18;
    wire [31:0]jpc={p4[31:28],inst[25:0],2'b00};//j��jalʱʹ��
    
     wire exc,wsta,wcau,wepc,mtc0;
     wire [31:0]sta,cau,epc,sta_in,cau_in,epc_in,cause;
     wire [31:0]sta_a0,epc_a0;
     
     wire [63:0] mul_s_out,mul_u_out;
     wire [31:0]Hi_in,Lo_in;
     wire [31:0] Lo_in_muldiv,Hi_in_muldiv,div_q,div_r,div_u_q,div_u_r;
     wire busy_div,busy_divu;
     wire [31:0]Lo_out,Hi_out;
     wire clz_ena;
     wire [31:0]lb_s0,lh_s0,mem_s0;
     wire [1:0]DMEM_sel,Sel_Lo_0,Sel_Hi_0,Rd_from_hilo;
     wire lb_s,lh_s,whi,wlo;
     wire [1:0]load_s;
     wire bgez,div_e,divu_e;
     wire sel_rd2;
     ext5x32 e5(.in(inst[10:6]),.out(ext5));//��λָ����Ҫ
     ext16x32 e16(.in(inst[15:0]),.ena(E16),.out(ext16));//����������
     ext18x32 e18(.in(inst[15:0]),.out(ext18));//beq,bne        
     cla32 br_adr(.a(p4),.b(ext18),.sub(1'b0),.s(adr));//beq��bne��bgez����ת��ַ
     cla32 pcplus4(.a(pc),.b(32'h00000004),.sub(1'b0),.s(p4));//ִ��pc+4
     dff32 ip(.d(next_pc),.clk(clock),.clrn(resten),.q(pc));//дnppc+4���д�������½���
     //**********************************************************************************************
     //���ƣ�����������˵��
     //op,func:�ԣ�zero��alu����0��Чλ��aluc(4λ����alu����ѡ���ź�
     //jal_ena:jalָ����Ч�źţ�����ַ����$31�Ĵ���
     //DMEM_r:���ݴ洢������Ч��DMEM_w:���ݴ洢��д��Ч��DMEM_ena:���ݴ洢��ʹ���źţ�
     //IMEM_r:ָ��洢������Ч�źţ�Ext16:,wreg:�Ĵ���д��Ч�ź�,pcsource
     //op1:,op2:,rd:,intr:,sta:,inta:,exc:,
     //wsta:,wcau,wepc,mtc0,mfc0(),selpc,cause
     //����ʱ��:20170529
     //**********************************************************************************************
        sccu cu(.op(inst[31:26]),.func(inst[5:0]),.zero(zero),.aluc(aluc),
                .m1(m1),.m2(m2),.m3(m3),.m4(m4),.m5(m5),.m6(m6),.m7(m7),
                .jal_ena(jal_ena),
                .DMEM_r(D_r),.DMEM_w(D_w),.DMEM_ena(D_e),.IMEM_r(I_r),.Ext16(E16),.wreg(we),.pcsource(pcsource),
                .op1(inst[25:21]),.op2(inst[20:16]),.rd(inst[15:11]),.sta(sta),
                .exc(exc),.wsta(wsta),.wcau(wcau),.wepc(wepc),.mtc0(mtc0),.mfc0(mfc0),.selpc(selpc),.cause(cause),
                .Rd_in(Rd_in),.jalr_ena(jalr_ena),.clz_ena(clz_ena),.lb_s(lb_s),.lh_s(lh_s),.load_s(load_s),.DMEM_sel(DMEM_sel),
                .Sel_Lo_0(Sel_Lo_0),.Sel_Hi_0(Sel_Hi_0),.Sel_Hi(Sel_Hi),.Sel_Lo(Sel_Lo),
                .whi(whi),.wlo(wlo),.bgez(bgez),.div_e(div_e),.divu_e(divu_e),.sel_rd2(sel_rd2),
                .store_s(store_s));
                
        wire [31:0]alua_0;
        wire [31:0]clz_num;
        
        //**********************************************************************************************
        //���ƣ�clzǰ���������
        //˵��������Ϊrs�����ݣ����ǰ����ĸ���
        //**********************************************************************************************
        clz_count clz_(.A(A),.clz_num(clz_num));
        //**********************************************************************************************
        //���ƣ�loadѡ��
        //˵����lb_sel:ѡ��lb��lbu��lb_s��Чѡlb������lbu�����lb_s0��load�ĵ�01������
        //      lb_sel:ѡ��lh��lhu��lh_s��Чѡlh������lhu�����lh_s0��load�ĵ�10������
        //      load_sel:a�Ǵ�DMEM�еõ���32λ��b��ib_s0,c��lh_s0,d�����������mem_s0
        //**********************************************************************************************
        wire [31:0] lbu_s0,lhu_s0,lb_s1,lh_s1;
        mux4x32 lb_site(.a({{24{mem[7]}},mem[7:0]}),
                        .b({{{24{mem[15]}},mem[15:8]}}),
                        .c({{{24{mem[23]}},mem[23:16]}}),
                        .d({{{24{mem[31]}},mem[31:24]}}),
                        .pcsource(alu[1:0]),
                        .y(lb_s0));
        mux4x32 lbu_site(.a({24'b0,mem[7:0]}),
                         .b({24'b0,mem[15:8]}),
                         .c({24'b0,mem[23:16]}),
                         .d({24'b0,mem[31:24]}),
                         .pcsource(alu[1:0]),
                         .y(lbu_s0));

        mux2x32 lb_0(.a0(lb_s0),.a1(lbu_s0),.s(lb_s),.y(lb_s1));
        

      //  mux4x32 lh_0(.a(),.b(),.c(),.d(),.pcsource(),.y());
        mux4x32 lh_site(.a({{16{mem[15]}},mem[15:0]}),
                        .b({{{16{mem[23]}},mem[23:8]}}),
                        .c({{{16{mem[31]}},mem[31:16]}}),
                        .d(24'bz),
                        .pcsource(alu[1:0]),
                        .y(lh_s0));
         mux4x32 lhu_site(.a({16'b0,mem[15:0]}),
                         .b({16'b0,mem[23:8]}),
                         .c({16'b0,mem[31:16]}),
                         .d(32'b0),
                         .pcsource(alu[1:0]),
                         .y(lhu_s0));
        mux2x32 lh_0(.a0(lh_s0),.a1(lhu_s0),.s(lh_s),.y(lh_s1));
      //  mux2x32 lb_sel(.a0({{24{mem[7]}},mem[7:0]}),.a1({24'b0,mem[7:0]}),.s(lb_s),.y(lb_s0));
      //  mux2x32 lh_sel(.a0({{16{mem[15]}},mem[15:0]}),.a1({16'b0,mem[15:0]}),.s(lh_s),.y(lh_s0));
        
        mux4x32 load_sel(.a(mem),.b(lb_s1),.c(lh_s1),.d(32'bz),.pcsource(load_s),.y(mem_s0));
        mux2x32 _rd(.a0(mem_s0),.a1(alu),.s(m2),.y(alu_mem));//��rd
        
        
        mux2x32 alu_a(.a0(ext5),.a1(A),.s(m3),.y(alua));//m3��Чʱ��5λ��չ����Чʱrs��
        mux2x32 alu_b(.a0(ext16),.a1(B),.s(m4),.y(alub));//m4��Чʱ��16λ��չ����Чʱrt��
        
        mux2x32 link(.a0(p4+32'h00400000),.a1(alu_mem_c0),.s(jal_ena|jalr_ena),.y(data_in_0));
        wire [31:0]data_in_2;
        mux2x32 rd_clzmul(.a0(clz_num),.a1(mul_s_out[31:0]),.s(clz_ena),.y(data_in_2));
        mux2x32 clz_data1(.a0(data_in_2),.a1(data_in_1),.s(sel_rd2),.y(data_in));
        
        mux4x32 rd_mf_hilo(.a(data_in_0),.b(Lo_out),.c(Hi_out),.d(pc+32'h00400004),.pcsource(Rd_in),.y(data_in_1));
        
        mux2x5 rtcrdc(.a(inst[20:16]),.b(inst[15:11]),.ena(m6),.o(rdc_t));//ѡ��rdc
        assign rdc=rdc_t|{5{jal_ena}};//ȷ����rdc��������jalָ��

        mux4x32 next(.a(p4),.b(adr),.c(A-32'h00400000),.d(jpc-32'h00400000),.pcsource({pcsource[1],pcsource[0]|(bgez&~A[31])}),.y(npc));
        
        Regfiles rf(.clk(clock),.rst(resten),.we(we),.raddr1(inst[25:21]),.raddr2(inst[20:16]),
                    .waddr(rdc),.wdata(data_in),.rdata1(A),.rdata2(B));
        ALU al_unit (.a(alua),.b(alub),.aluc(aluc),.r(alu),.zero(zero),.carry(carry),.negative(negtive),.overflow(overflow));
        
        
              
        //mux4x32 rt_sel(.a(B),.b({{{16{B[15]}},B[15:0]}}),.c({{{24{B[7]}},B[7:0]}}),.d(32'bz),.pcsource(DMEM_sel),.y(rt));
        //mux4x32 rt_sel(.a(B),.b(rt_lb),.c(rt_lh),.d(32'bz),.pcsource(DMEM_sel),.y(rt));
        assign rt=B;
        assign wmem=D_e&D_w;
       //**********************************************************************************************
       //���ƣ�CP0
       //�Ĵ�����Status��Cause��EPC
       //���ʱ��:20170526
       //**********************************************************************************************
        
        pcreg Status(.data_in(sta_in),.clk(~clock),.rst(resten),.ena(wsta),.data_out(sta_out));
        pcreg Cause(.data_in(cau_in),.clk(~clock),.rst(resten),.ena(wcau),.data_out(cau));
        pcreg EPC(.data_in(epc_in),.clk(~clock),.rst(resten),.ena(wepc),.data_out(epc));
        
        mux2x32 sta_move(.a1(sta),.a0({sta[27:0],4'b0}),.s(exc),.y(sta_a0));
        mux2x32 sta_(.a1(sta_a0),.a0(data_in),.s(mtc0),.y(sta_in));//ѡ��sta_in
        mux2x32 cau_(.a1(cause),.a0(data_in),.s(mtc0),.y(cau_in));//ѡ��cau_in
        mux2x32 epc_(.a1(npc-32'h4),.a0(data_in),.s(mtc0),.y(epc_in));//ѡ��sta_in  
        
        mux4x32 irq_pc(.a(npc),.b(epc),.c(32'h00000004),.d(32'hz),.pcsource(selpc),.y(next_pc));
        mux4x32 fromc0(.a(alu_mem),.b(sta_out),.c(cau),.d(epc),.pcsource(mfc0),.y(alu_mem_c0));
       //**********************************************************************************************
       //���ƣ��˷�����������
       //������_mul�з��ų˷�����_multu�޷��ų˷������з��ţ��޷��ų�����
       //�Ĵ�����Hi��Lo
       //��Դ��Hi��_mul��32λ��_mult��32λ���з��ţ��޷��ŵ�r
       //���ʱ��:20170528
       //**********************************************************************************************
       wire div_s_e,div_u_e;
       mult_gen_0 mul_s(.A(A),.B(B),
                       // .CLK(~clock),
                        //.SCLR(resten),
                        .P(mul_s_out));
       mult_gen_1 mul_u(.A(A),.B(B),
                        //.CLK(~clock),
                       // .SCLR(resten),
                        .P(mul_u_out));
       div_gen_0 div_s(//.aclk(~clock),
                       .s_axis_divisor_tvalid(div_e),.s_axis_divisor_tdata(B),
                       .s_axis_dividend_tvalid(div_e),.s_axis_dividend_tdata(A),
                       .m_axis_dout_tvalid(div_s_e),.m_axis_dout_tdata({div_q,div_r}));
       div_gen_1 div_u(//.aclk(~clock),
                        .s_axis_divisor_tvalid(divu_e),.s_axis_divisor_tdata(B),
                        .s_axis_dividend_tvalid(divu_e),.s_axis_dividend_tdata(A),
                        .m_axis_dout_tvalid(div_u_e),.m_axis_dout_tdata({div_u_q,div_u_r}));

       mux4x32 Lo_sel_1(.a(mul_s_out[31:0]),.b(mul_u_out[31:0]),.c(div_q),.d(div_u_q),.pcsource(Sel_Lo_0),.y(Lo_in_muldiv));
       mux4x32 Hi_sel_1(.a(mul_s_out[63:32]),.b(mul_u_out[63:32]),.c(div_r),.d(div_u_r),.pcsource(Sel_Hi_0),.y(Hi_in_muldiv));
       mux2x32 Lo_sel_2(.a0(Lo_in_muldiv),.a1(data_in),.s(Sel_Lo),.y(Lo_in));
       mux2x32 Hi_sel_2(.a0(Hi_in_muldiv),.a1(data_in),.s(Sel_Hi),.y(Hi_in));
       pcreg Lo(.data_in(Lo_in),.clk(~clock),.rst(resten),.ena(wlo|div_s_e|div_u_e),.data_out(Lo_out));
       pcreg Hi(.data_in(Hi_in),.clk(~clock),.rst(resten),.ena(whi|div_s_e|div_u_e),.data_out(Hi_out));
endmodule

