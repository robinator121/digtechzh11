`timescale 1ns / 1ps


module vga_stripes(
    input wire vidon,
    input wire [10:0] hc, vc,
    output reg [3:0] red, green,
    output reg [3:0] blue
    );
    
// Piros és zöld csíkok megjelenítése 16 sor szélesen
    always@(*)
        begin
            red = 0;
            green = 0;
            blue = 0;
            if (vidon == 1)
                begin
                    red = {vc[4], vc[4], vc[4], vc[4]};
                    green = {vc[4], vc[4], vc[4], vc[4]};
                end
        end
    
endmodule
