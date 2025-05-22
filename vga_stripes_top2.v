`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2024 17:00:18
// Design Name: 
// Module Name: vga_stripes_top2
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


module vga_stripes_top2(
    input wire CLK100MHU,
       input wire BTNC,
       input wire [7:0] SW,
       output wire VGA_HS, VGA_VS,
       output wire [3:0] VGA_R, VGA_G,
       output wire [3:0] VGA_B
    );
    
    wire clk65, clr, vidon;
    wire [9:0] hc, vc;
    wire [0:31] M;
    wire [3:0] rom_addr4;
    
    assign clr=BTNC;
    
    clkdiv U1 (.clk(CLK100MHZ), .clr(clr), .clk25(clk25));
    vga_640x480 U2 (.clk(clk65), .clr(clr), .hsync(VGA_HS), .vsync(VGA_VS), .hc(hc), .vc(vc), .vidon(vidon));
    vga_initials U3 (.vidon(vidon), .hc(hc), .vc(vc), .red(VGA_R), .green(VGA_G), .blue(VGA_B), .M(M), .sw(SW), .rom_addr4(rom_addr4));
    prom_DMH U4 (.addr(rom_addr4), .M(M));
endmodule
