`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2024 16:41:26
// Design Name: 
// Module Name: vga_initials
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


module vga_initials(
    input wire vidon,
    input wire [9:0] hc, vc,
    input wire [0:31] M,
    input wire [7:0] sw,
    output wire [3:0] rom_addr4,
    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue
    );
    
    parameter hbp=10'b0010010000;
    parameter vbp=10'b0000011111;
    parameter W=32;
    parameter H=16;
    wire [10:0] C1, R1, rom_addr, rom_pix;
    reg spriteon, R, G, B;
    
    assign C1={2'b00, sw[3:0], 5'b00001};
    assign R1={2'b00, sw[7:4], 5'b00001};
    assign rom_addr=vc-vbp-R1;
    assign rom_pix=hc-hbp-C1;
    assign rom_addr4=rom_addr[3:0];
    
    always@(*)
        begin
            if((hc>=C1+hbp) && (hc<C1+hbp+W) && (vc >=R1+vbp) && (vc<R1+vbp+H))
                spriteon=1;
            else
                spriteon=0;
        end
    
    always@(*)
        begin
            red=0;
            green=0;
            blue=0;
            
            if((spriteon==1) && (vidon==1))
                begin
                    R=M[rom_pix];
                    G=M[rom_pix];
                    B=M[rom_pix];
                    red={R,R,R,R};
                    green={G,G,G,G};
                    blue={B,B,B,B};
                end
        end
endmodule
