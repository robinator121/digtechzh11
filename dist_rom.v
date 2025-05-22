`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2024 16:21:53
// Design Name: 
// Module Name: dist_rom
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


module dist_rom(
input clk,
input [3:0] addr,
output [7:0] spo

    );
    
    dist_rom16 MEM(.a(addr), .spo(spo));
endmodule
