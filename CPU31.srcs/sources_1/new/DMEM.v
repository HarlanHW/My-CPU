`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/22 21:02:34
// Design Name: 
// Module Name: DMEM
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


module DMEM(
    input clock,
    input D_e,
    input wena,
    input [1:0]store_s,
    input [31:0]addr,
    input [31:0] data_in,
    output [31:0] data_out,
    output [31:0]data0
    );
    wire [31:0] addr_0;
    assign addr_0={2'b00,addr[31:2]};
    reg [31:0]mem[0:150];
    always@(negedge clock)
    begin
        if(D_e&&wena)
        begin
            if(store_s==2'b00)
                mem[addr_0]<=data_in;
            else if(store_s==2'b01)
            begin
                if(addr[1:0]==2'b00)
                    mem[addr_0][7:0]<=data_in[7:0];
                else if(addr[1:0]==2'b01)
                    mem[addr_0][15:8]<=data_in[7:0];
                else if(addr[1:0]==2'b10)
                    mem[addr_0][23:16]<=data_in[7:0];
                else
                    mem[addr_0][31:24]<=data_in[7:0];
            end
            else if(store_s==2'b10)
            begin
                 if(addr[1:0]==2'b00)
                     mem[addr_0][15:0]<=data_in[15:0];
                 else if(addr[1:0]==2'b01)
                     mem[addr_0][23:8]<=data_in[15:0];
                 else if(addr[1:0]==2'b10)
                     mem[addr_0][31:16]<=data_in[15:0];
                 
            end
        end
    end
    assign data_out=mem[addr_0];
    assign data0=mem[0]; 
endmodule
