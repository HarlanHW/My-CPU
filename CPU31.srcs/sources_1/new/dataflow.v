`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/13 21:58:15
// Design Name: 
// Module Name: dataflow
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


module sccu(
    input [5:0] op,//前六位
    input [5:0] func,//后六位
    input zero,
    output [3:0] aluc,//alu控制信号
    output m1,
    output m2,
    output m3,
    output m4,
    output m5,
    output m6,
    output m7,
    output jal_ena,
    output DMEM_r,
    output DMEM_w,
    output DMEM_ena,
    output IMEM_r,
    output Ext16,
    output wreg,
    output [1:0]pcsource,
    //***************************************
    input [4:0]op1,//rs
    input [4:0]op2,//rt
    input [4:0]rd,//rd
    output [31:0]sta,
    output exc,
    output wsta,
    output wcau,            
    output wepc,
    output mtc0,
    output [1:0]mfc0,
    output [1:0]selpc,
    output [31:0]cause,
    output [1:0]Rd_in,
    output jalr_ena,
    output clz_ena,
    output lb_s,
    output lh_s,
    output [1:0]load_s,
    output [1:0]DMEM_sel,
    output [1:0]Sel_Lo_0,
    output [1:0]Sel_Hi_0,
    output Sel_Lo,
    output Sel_Hi,
    output whi,
    output wlo,
    output bgez,
    output div_e,
    output divu_e,
    output sel_rd2,
    output [1:0]store_s
    );
    //R-type
    wire r_type=(~op[5]&~op[4])&(~op[3]&~op[2])&(~op[1]&~op[0]);
    wire i_add  = (r_type & func[5]) & (~func[4] &~func[3]) & (~func[2] &~func[1]) &~func[0];//FUNC=100000
    wire i_addu = (r_type & func[5]) & (~func[4] &~func[3]) & (~func[2] &~func[1]) & func[0];//FUNC=100001;
    wire i_sub  = (r_type & func[5]) & (~func[4] &~func[3]) & (~func[2] & func[1]) &~func[0];//FUNC=100010;
    wire i_subu = (r_type & func[5]) & (~func[4] &~func[3]) & (~func[2] & func[1]) & func[0];//FUNC=100011;
    wire i_and  = (r_type & func[5]) & (~func[4] &~func[3]) & ( func[2] &~func[1]) &~func[0];//FUNC=100100
    wire i_or   = (r_type & func[5]) & (~func[4] &~func[3]) & ( func[2] &~func[1]) & func[0];//FUNC=100101
    wire i_xor  = (r_type & func[5]) & (~func[4] &~func[3]) & ( func[2] & func[1]) &~func[0];//FUNC=100110
    wire i_nor  = (r_type & func[5]) & (~func[4] &~func[3]) & ( func[2] & func[1]) & func[0];//FUNC=100111
    wire i_slt  = (r_type & func[5]) & (~func[4] & func[3]) & (~func[2] & func[1]) &~func[0];//FUNC=101010
    wire i_sltu = (r_type & func[5]) & (~func[4] & func[3]) & (~func[2] & func[1]) & func[0];//FUNC=101011
    wire i_sll  = (r_type &~func[5]) & (~func[4] &~func[3]) & (~func[2] &~func[1]) &~func[0];//FUNC=000000
    wire i_srl  = (r_type &~func[5]) & (~func[4] &~func[3]) & (~func[2] & func[1]) &~func[0];//FUNC=000010
    wire i_sra  = (r_type &~func[5]) & (~func[4] &~func[3]) & (~func[2] & func[1]) & func[0];//FUNC=000011
    wire i_sllv = (r_type &~func[5]) & (~func[4] &~func[3]) & ( func[2] &~func[1]) &~func[0];//FUNC=000100
    wire i_srlv = (r_type &~func[5]) & (~func[4] &~func[3]) & ( func[2] & func[1]) &~func[0];//FUNC=000110
    wire i_srav = (r_type &~func[5]) & (~func[4] &~func[3]) & ( func[2] & func[1]) & func[0];//FUNC=000111
    wire i_jr   = (r_type &~func[5]) & (~func[4] & func[3]) & (~func[2] &~func[1]) &~func[0];//FUNC=001000
    //I-type
    wire i_addi =(~op[5] &~op[4]) & ( op[3] &~op[2]) & (~op[1] &~op[0]);//OP=001000
    wire i_addiu=(~op[5] &~op[4]) & ( op[3] &~op[2]) & (~op[1] & op[0]);//OP=001001
    wire i_andi =(~op[5] &~op[4]) & ( op[3] & op[2]) & (~op[1] &~op[0]);//OP=001100
    wire i_ori  =(~op[5] &~op[4]) & ( op[3] & op[2]) & (~op[1] & op[0]);//OP=001101
    wire i_xori =(~op[5] &~op[4]) & ( op[3] & op[2]) & ( op[1] &~op[0]);//OP=001110 
    wire i_lw   =( op[5] &~op[4]) & (~op[3] &~op[2]) & ( op[1] & op[0]);//OP=100011
    wire i_sw   =( op[5] &~op[4]) & ( op[3] &~op[2]) & ( op[1] & op[0]);//OP=101011
    wire i_beq  =(~op[5] &~op[4]) & (~op[3] & op[2]) & (~op[1] &~op[0]);//OP=000100
    wire i_bne  =(~op[5] &~op[4]) & (~op[3] & op[2]) & (~op[1] & op[0]);//OP=000101
    wire i_slti =(~op[5] &~op[4]) & ( op[3] &~op[2]) & ( op[1] &~op[0]);//OP=001010
    wire i_sltiu=(~op[5] &~op[4]) & ( op[3] &~op[2]) & ( op[1] & op[0]);//OP=001011
    wire i_lui  =(~op[5] &~op[4]) & ( op[3] & op[2]) & ( op[1] & op[0]);//OP=001111
    //J-type
    wire i_j    =(~op[5] &~op[4]) & (~op[3] &~op[2]) & ( op[1] &~op[0]);//OP=000010
    wire i_jal  =(~op[5] &~op[4]) & (~op[3] &~op[2]) & ( op[1] & op[0]);//OP=000011
    //*****************************************************************************
    wire c0_type  = ~op[5] &  op[4] & ~op[3] & ~op[2] & ~op[1] & ~op[0];
    wire i_mfc0   = c0_type&~op1[4]&~op1[3] &~op1[2]&~op1[1]&~op1[0];
    wire i_mtc0   = c0_type&~op1[4]&~op1[3] & op1[2]&~op1[1]&~op1[0];
    wire i_eret   = c0_type& op1[4]&~op1[3] &~op1[2]&~op1[1]&~op1[0]&~func[5]& func[4] & func[3]&~func[2] & ~func[1] & ~func[0];
    wire i_syscall= r_type & ~func[5] & ~func[4] &  func[3] & func[2] & ~func[1] & ~func[0];
    wire i_break  = r_type & ~func[5] & ~func[4] &  func[3] & func[2] & ~func[1] &  func[0];
    wire i_teq    = r_type &  func[5] &  func[4] & ~func[3] & func[2] & ~func[1] & ~func[0];
    wire i_jalr   = r_type & ~func[5] & ~func[4] &  func[3] &~func[2] & ~func[1] &  func[0]; 
    wire i_divu     = r_type & ~func[5] &  func[4] &  func[3] &~func[2] &  func[1] &  func[0];
    wire i_div      = r_type & ~func[5] &  func[4] &  func[3] &~func[2] &  func[1] & ~func[0];  
    wire i_multu    = r_type & ~func[5] &  func[4] &  func[3] &~func[2] & ~func[1] &  func[0];
    wire i_mfhi     = r_type & ~func[5] &  func[4] & ~func[3] &~func[2] & ~func[1] & ~func[0];
    wire i_mflo     = r_type & ~func[5] &  func[4] & ~func[3] &~func[2] &  func[1] & ~func[0];
    wire i_mthi     = r_type & ~func[5] &  func[4] & ~func[3] &~func[2] & ~func[1] &  func[0];
    wire i_mtlo     = r_type & ~func[5] &  func[4] & ~func[3] &~func[2] &  func[1] &  func[0]; 
    wire i_clz      =~op[5] &  op[4] &  op[3] &  op[2] & ~op[1] & ~op[0]&  func[5] & ~func[4] & ~func[3] &~func[2] & ~func[1] & ~func[0];
    wire i_mul      =~op[5] &  op[4] &  op[3] &  op[2] & ~op[1] & ~op[0]& ~func[5] & ~func[4] & ~func[3] &~func[2] &  func[1] & ~func[0];
    wire i_bgez     =~op[5] & ~op[4] & ~op[3] & ~op[2] & ~op[1] &  op[0]&  ~op2[4] & ~op2[3]  & ~op2[2]  &~op2[1]  & op2[0];
    wire i_lb       = op[5] & ~op[4] & ~op[3] & ~op[2] & ~op[1] & ~op[0];
    wire i_lbu      = op[5] & ~op[4] & ~op[3] &  op[2] & ~op[1] & ~op[0];
    wire i_lh       = op[5] & ~op[4] & ~op[3] & ~op[2] & ~op[1] &  op[0];
    wire i_lhu      = op[5] & ~op[4] & ~op[3] &  op[2] & ~op[1] &  op[0];
    wire i_sb       = op[5] & ~op[4] &  op[3] & ~op[2] & ~op[1] & ~op[0];
    wire i_sh       = op[5] & ~op[4] &  op[3] & ~op[2] & ~op[1] &  op[0];

    assign aluc[0]=((( i_sub|i_or) |(i_subu|i_nor))
                    |((i_slt|i_srl)|(i_srlv|i_ori)))
                    |((i_beq|i_bne)|i_slti);
    assign aluc[1]=((((i_add|i_sub)|(i_xor|i_nor))
                   |((i_slt|i_sltu)|(i_sll|i_sllv)))
                   |(((i_jr|i_addi)|(i_xori|i_lw))
                   |((i_sw |i_beq) |(i_bne|i_slti))))
                   |((i_sltiu|i_j) |i_jal);
    assign aluc[2]=(((i_and|i_or)  |(i_xor|i_nor))
                    |((i_sll|i_srl)|(i_sra|i_sllv)))
                 |(((i_srlv|i_srav)|(i_andi|i_ori))|i_xori);
    assign aluc[3]=(((i_slt|i_sltu)|(i_sll|i_srl))
                   |((i_sra|i_sllv)|(i_srlv|i_srav)))
                 |((i_slti|i_sltiu)|i_lui);
    assign jal_ena=i_jal;    
    assign jalr_ena=i_jalr;    
    assign m1=i_j||i_jal;
    assign m2=i_lw|i_lh|i_lhu|i_lb|i_lbu;
    assign m3=i_sra|i_srl|i_sll;
    assign m4=(((i_addi|i_addiu)|(i_andi|i_ori))|((i_xori|i_lw)|(i_sw|i_slti)))
                |(i_sltiu|i_lui)|i_lh|i_lhu|i_lb|i_lbu|i_sh|i_sb|i_bgez;
    assign m6=(((i_addi|i_addiu)|(i_andi|i_ori))|((i_xori|i_lw)|(i_sw|i_beq)))|((i_bne|i_slti)|(i_sltiu|i_lui))|i_lh|i_lhu|i_lb|i_lbu|i_sh|i_sb|i_mfc0;
    assign m7=i_jr;
    assign DMEM_r=i_lw|i_lh|i_lhu|i_lb|i_lbu;
    assign DMEM_w=i_sw|i_sh|i_sb;
    assign DMEM_ena=i_lw|i_sw|i_lh|i_lhu|i_lb|i_lbu|i_sh|i_sb;
    assign IMEM_r=1'b1;
    assign wreg=((((i_add|i_addu)|(i_sub|i_subu))|((i_or|i_xor)|(i_nor|i_and)))
                |(((i_slt|i_sltu)|(i_sll|i_srl))|((i_sra|i_sllv)|(i_srlv|i_srav))))
                |((((i_addi|i_addiu)|(i_andi|i_ori))|((i_xori|i_slti)|(i_sltiu|i_lui)))
                |(((i_jal|i_lw))|(i_jalr|i_clz))|((i_lb|i_lbu)|(i_lh|i_lhu)))
                |i_mfhi|i_mflo|i_mfc0|i_mul;
    assign Ext16=((i_addi|i_addiu)|(i_slti|i_sltiu))|((i_lui|i_lw)|i_sw)|i_lh|i_lb|i_sh|i_sb|i_lbu|i_lhu;
    assign pcsource[1]=i_jr|i_j|i_jal|i_jalr;
    assign pcsource[0]=(i_beq&zero)|(i_bne&~zero)|i_j|i_jal;
    //**************************************************************************************
    assign sta[0]=1'b1;
    assign sta[1]=~i_syscall;
    assign sta[2]=~i_break;
    assign sta[3]=~i_teq;
    assign sta[31:4]=28'b0;
  //  assign exc =int_int|exc_sys|exc_bre|exc_teq;
   assign exc=i_syscall|i_break|i_teq;
    wire ExcCode4=1'b0;
    wire ExcCode3=i_syscall|i_break|i_teq;
    wire ExcCode2=i_teq;
    wire ExcCode1=1'b0;
    wire ExcCode0=i_break|i_teq;
    assign cause={25'h0,ExcCode4,ExcCode3,ExcCode2,ExcCode1,ExcCode0,2'b00};
    
    wire rd_is_status=(rd==5'd12);
    wire rd_is_cause=(rd==5'd13);
    wire rd_is_epc=(rd==5'd14);
    assign mtc0=i_mtc0;
    assign wsta=exc|(mtc0&rd_is_status);
    assign wcau=exc|(mtc0&rd_is_cause);
    assign wepc=exc|(mtc0&rd_is_epc);
    
    assign mfc0[0]=i_mfc0&rd_is_status|i_mfc0&rd_is_epc;
    assign mfc0[1]=i_mfc0&rd_is_cause|i_mfc0&rd_is_epc;

    assign selpc[0]=i_eret;
    assign selpc[1]=exc;
    
    assign Rd_in[0]=i_mflo|i_jalr;
    assign Rd_in[1]=i_mfhi|i_jalr;
    
    assign clz_ena=i_clz;
    
    assign DMEM_sel[0]=i_sh;
    assign DMEM_sel[1]=i_sb;

    assign lb_s=i_lb;
    assign lh_s=i_lh;
    assign load_s[0]=i_lb|i_lbu;
    assign load_s[1]=i_lh|i_lhu;
    
    assign store_s[0]=i_sb;
    assign store_s[1]=i_sh;
    
    assign Sel_Lo=i_multu|i_div|i_divu;
    assign Sel_Hi=i_multu|i_div|i_divu;
    
    assign Sel_Lo_0[0]=i_multu|i_divu;
    assign Sel_Lo_0[1]=i_div|i_divu;
    assign Sel_Hi_0[0]=i_multu|i_divu;
    assign Sel_Hi_0[1]=i_div|i_divu;
    
    assign whi=i_mthi|i_multu|i_div|i_divu;
    assign wlo=i_mtlo|i_multu|i_div|i_divu;
    
    assign bgez=i_bgez;
    assign div_e=i_div;
    assign divu_e=i_divu;
    
    assign sel_rd2=i_clz|i_mul;
    
    
endmodule
