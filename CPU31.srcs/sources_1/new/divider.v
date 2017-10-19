`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/21 23:18:36
// Design Name: 
// Module Name: divider
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


module divider(
    input clk_in,
    input rst,
    output  clk_out
    );
   /* parameter n=2;
    integer count1=0;
    integer count2=0;
 //   reg T_CLK=1;
    always@(posedge clk_in)
    begin
        if(count1<n)
  //   if(count1==0)
        begin
            count1=count1+1;
            clk_out<=0;
        end
    //    else if(count1==1)
        else if(count1>=n&&count1<2*n-1)
        begin
            count1=count1+1;
            clk_out<=1; 
        end
       else
           count1<=0;
    end*/
    wire q1;
   // dff1 d1(.d(~q1),.clk(clk_in),.clrn(rst),.q(q1));
    dff1 d2(.d(~clk_out),.clk(clk_in),.clrn(rst),.q(clk_out));
endmodule