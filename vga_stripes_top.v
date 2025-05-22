`timescale 1ns / 1ps


module vga_stripes_top(
    input wire CLK100MHZ,
    input wire BTNC,
    output wire VGA_HS, VGA_VS,
    output wire [3:0] VGA_R, VGA_G,
    output wire [3:0] VGA_B
    );
    
    wire clk25, clr, vidon;
    wire [10:0] hc, vc;
    
    assign clr = BTNC;
    
    /*clkdiv U1 (
        .clk(CLK100MHZ),
        .clr(clr),
        .clk25(clk25)
    );
    */
    clk_generator CLK(.clk_in1(CLK100MHZ),
                      .reset(clr),
                      .clk_out1(clk25));
    
    vga_640x480 U2 (
        .clk(clk25),
        .clr(clr),
        .hsync(VGA_HS),
        .vsync(VGA_VS),
        .hc(hc),
        .vc(vc),
        .vidon(vidon)
    );
    
    vga_stripes U3 (
        .vidon(vidon),
        .hc(hc),
        .vc(vc),
        .red(VGA_R),
        .green(VGA_G),
        .blue(VGA_B)
    );
    
endmodule
