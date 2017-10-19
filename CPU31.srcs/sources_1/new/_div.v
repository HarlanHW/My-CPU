`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/04 23:09:22
// Design Name: 
// Module Name: _div
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


module _div(
   input clock,// ±÷”–≈∫≈
   input [31:0]A,
   input [31:0]B,
   input out_e,
   input in_e,
   input [31:0]q,
   input [31:0]r
    );
    div_gen_0 div_s(.aclk(~clock),
                            .s_axis_divisor_tvalid(in_e),.s_axis_divisor_tdata(B),
                            .s_axis_dividend_tvalid(in_e),.s_axis_dividend_tdata(A),
                            .m_axis_dout_tvalid(out_e),.m_axis_dout_tdata({q,r}));
endmodule
