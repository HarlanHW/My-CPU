`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/30 15:29:24
// Design Name: 
// Module Name: clz_count
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


module clz_count(
    input [31:0]A,
    output [31:0] clz_num
);
assign clz_num=(A==32'b0)?32'd32:
                        (A[31])?32'h0:(A[30])?32'h1:(A[29])?32'h2:(A[28])?32'h3:                
                        (A[27])?32'h4:(A[26])?32'h5:(A[25])?32'h6:(A[24])?32'h7:
                        (A[23])?32'h8:(A[22])?32'h9:(A[21])?32'ha:(A[20])?32'hb:
                        (A[19])?32'hc:(A[18])?32'hd: (A[17])?32'he:(A[16])?32'hf:
                        (A[15])?32'h10:(A[14])?32'h11:(A[13])?32'h12:(A[12])?32'h13:
                        (A[11])?32'h14:(A[10])?32'h15:(A[9])?32'h16: (A[8])?32'h17:
                        (A[7])?32'h18:(A[6])?32'h19:(A[5])?32'h1a:(A[4])?32'h1b:
                        (A[3])?32'h1c:(A[2])?32'h1d: (A[1])?32'h1e:32'h1f;
endmodule
