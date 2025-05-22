`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2024 16:35:19
// Design Name: 
// Module Name: EX28_top
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


module EX28_top(
    input clk,
    input [3:0] addr,
    output [7:0] spo
    );
    dist_rom16 MEM(.a(addr), .spo(spo));
endmodule
