`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 17:15:32
// Design Name: 
// Module Name: vgastripestop
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


module vgastripestop(
input wire CLK100MHZ,
    input wire BTNC,
    output wire VGA_HS, VGA_VS,
    output wire [3:0] VGA_R, VGA_G,
    output wire [3:0] VGA_B
    );
    
    wire clk65, clr, vidon;
    wire [10:0] hc, vc;
    
    assign clr = BTNC;
    
    clk_65mhz U1 (.clk_in1(CLK100MHZ), .reset(clr), .clk_out1(clk65));
    vga_1024x768 U2 (.clk(clk65), .clr(clr), .hsync(VGA_HS), .vsync(VGA_VS), .hc(hc), .vc(vc), .vidon(vidon));
    vgastripes U3 (.vidon(vidon), .hc(hc), .vc(vc), .red(VGA_R), .green(VGA_G), .blue(VGA_B));
   
endmodule
