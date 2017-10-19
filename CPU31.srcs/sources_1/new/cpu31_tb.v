`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/17 12:05:03
// Design Name: 
// Module Name: cpu31_tb
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


module cpu31_tb;
   reg clock;//时钟信号
   reg resten;//复位信号
  
   integer  fp_w, cnt;
   initial
   begin
   cnt=0;
  // fp_w = $fopen("test_result_my_lbu.txt", "w");  
   clock=0;
   resten=1;
   #16
    resten=0;
   end
   
   initial
   begin
   forever
   begin
   #5 clock=~clock;
   end
   end
 /*  always@(posedge cpu31_tb.test.c.clk_out1)
  //   always@(posedge clock)
   begin
      if(cnt==150)
           $fclose(fp_w);
      if(!cpu31_tb.test._cpu.s.resten) 
      begin
          cnt=cnt+1;   
             
          $fdisplay(fp_w, "%s %h", "pc:",cpu31_tb.test._cpu.s.pc);
          $fdisplay(fp_w, "%s %h", "instr:",cpu31_tb.test._cpu.s.inst);  
              $fdisplay(fp_w, "%s %h","regfile0 : ",cpu31_tb.test._cpu.s.rf.data[0*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile1 : ",cpu31_tb.test._cpu.s.rf.data[1*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile2 : ",cpu31_tb.test._cpu.s.rf.data[2*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile3 : ",cpu31_tb.test._cpu.s.rf.data[3*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile4 : ",cpu31_tb.test._cpu.s.rf.data[4*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile5 : ",cpu31_tb.test._cpu.s.rf.data[5*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile6 : ",cpu31_tb.test._cpu.s.rf.data[6*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile7 : ",cpu31_tb.test._cpu.s.rf.data[7*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile8 : ",cpu31_tb.test._cpu.s.rf.data[8*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile9 : ",cpu31_tb.test._cpu.s.rf.data[9*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile10 : ",cpu31_tb.test._cpu.s.rf.data[10*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile11 : ",cpu31_tb.test._cpu.s.rf.data[11*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile12 : ",cpu31_tb.test._cpu.s.rf.data[12*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile13 : ",cpu31_tb.test._cpu.s.rf.data[13*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile14 : ",cpu31_tb.test._cpu.s.rf.data[14*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile15 : ",cpu31_tb.test._cpu.s.rf.data[15*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile16 : ",cpu31_tb.test._cpu.s.rf.data[16*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile17 : ",cpu31_tb.test._cpu.s.rf.data[17*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile18 : ",cpu31_tb.test._cpu.s.rf.data[18*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile19 : ",cpu31_tb.test._cpu.s.rf.data[19*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile20 : ",cpu31_tb.test._cpu.s.rf.data[20*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile21 : ",cpu31_tb.test._cpu.s.rf.data[21*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile22 : ",cpu31_tb.test._cpu.s.rf.data[22*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile23 : ",cpu31_tb.test._cpu.s.rf.data[23*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile24 : ",cpu31_tb.test._cpu.s.rf.data[24*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile25 : ",cpu31_tb.test._cpu.s.rf.data[25*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile26 : ",cpu31_tb.test._cpu.s.rf.data[26*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile27 : ",cpu31_tb.test._cpu.s.rf.data[27*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile28 : ",cpu31_tb.test._cpu.s.rf.data[28*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile29 : ",cpu31_tb.test._cpu.s.rf.data[29*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile30 : ",cpu31_tb.test._cpu.s.rf.data[30*32+:32]);
              $fdisplay(fp_w, "%s %h","regfile31 : ",cpu31_tb.test._cpu.s.rf.data[31*32+:32]);
       end
  end
 */
  wire [31:0]dmem_0;
 
       wire [7:0] o_seg;
       wire [7:0] o_sel;
  seg7x16 test(.clk(clock),.reset(resten),.o_seg(o_seg),.o_sel(o_sel));//.inst(inst),.pc(pc),.alu(alu));
  
endmodule
