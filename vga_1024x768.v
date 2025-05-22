`timescale 1ns / 1ps
// Example 35
// VGA - Csíkok


module vga_1024x768(
    input wire clk,
    input wire clr,
    output reg hsync,
    output reg vsync,
    output reg [10:0] hc,
    output reg [10:0] vc,
    output reg vidon
    );
    
// Pixelek értéke egy vízszintes vonalban = 800///1278!
    parameter hpixels = 11'b10011111110;
    
// Vízszintes vonalak száma a kijelz?ben = 521////847!!!
    parameter hlines = 11'b01101001111;

// Back porch: kitölt? üres sorok a képerny? el?tt
// Front porch: kitölt? üres sorok a képerny? után    
// Horizontal back porch = 144 (128+16)//229
    parameter hbp = 11'b00011110101;
    
// Horizontal front porch = 784 (128+16+640)//1268
    parameter hfp = 11'b10011110100;
    
// Vertical back porch = 31 (2+29)
    parameter vbp = 11'b00000110010;
    
// Vertical front porch = 511 (2+29+480)
    parameter vfp = 11'b01100111111;
    
// Függ?leges számláló engedélyezése
    reg vsenable;
    
// Vízszintes szinkronizáló jel számlálója
    always@(posedge clk or posedge clr)
        begin
            if (clr == 1)
                hc <= 0;
            else
                begin
                    if (hc == hpixels-1)
                        begin
                            // A számláló elérte a pixelszámot
                            hc <= 0;    // számláló reset
                            vsenable <= 1;  // függ?leges számláló növelésének engedélyzése
                        end
                    else
                        begin
                            hc <= hc+1; // Vízszintes számláló növelése
                            vsenable <= 0;  // vsenable off
                        end
                end
        end
    
// hsync impulzus generálása
// Alacsony szint? 0-127 intervallumon
    always@(*)
        begin
            if (hc < 204)
                hsync = 0;
            else
                hsync = 1;
        end
        
// Függ?leges szinkronizáló jel számlálója
    always@(posedge clk or posedge clr)
        begin
            if (clr == 1)
                vc <= 0;
            else
                if (vsenable == 1)
                    begin
                        if (vc == hlines-1)
                            // Reset, ha elértük a sorok számát
                            vc <= 0;
                        else
                            // Függ?leges számláló növelése
                            vc <= vc+1;
                    end
        end
        
// vsync impulzus generálása
// Alacsony szint? 0 és 1 érték esetén
    always@(*)
        begin
            if (vc < 3)
                vsync = 0;
            else
                vsync = 1;
        end
        
// Video out engedélyezése porch-okon belül
    always@(*)
        begin
            if ((hc < hfp) && (hc >= hbp) && (vc < vfp) && (vc >= vbp))
                vidon = 1;
            else
                vidon = 0;
        end
        
    
endmodule