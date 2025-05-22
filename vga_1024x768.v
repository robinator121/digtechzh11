`timescale 1ns / 1ps
// Example 35
// VGA - Cs�kok


module vga_1024x768(
    input wire clk,
    input wire clr,
    output reg hsync,
    output reg vsync,
    output reg [10:0] hc,
    output reg [10:0] vc,
    output reg vidon
    );
    
// Pixelek �rt�ke egy v�zszintes vonalban = 800///1278!
    parameter hpixels = 11'b10011111110;
    
// V�zszintes vonalak sz�ma a kijelz?ben = 521////847!!!
    parameter hlines = 11'b01101001111;

// Back porch: kit�lt? �res sorok a k�perny? el?tt
// Front porch: kit�lt? �res sorok a k�perny? ut�n    
// Horizontal back porch = 144 (128+16)//229
    parameter hbp = 11'b00011110101;
    
// Horizontal front porch = 784 (128+16+640)//1268
    parameter hfp = 11'b10011110100;
    
// Vertical back porch = 31 (2+29)
    parameter vbp = 11'b00000110010;
    
// Vertical front porch = 511 (2+29+480)
    parameter vfp = 11'b01100111111;
    
// F�gg?leges sz�ml�l� enged�lyez�se
    reg vsenable;
    
// V�zszintes szinkroniz�l� jel sz�ml�l�ja
    always@(posedge clk or posedge clr)
        begin
            if (clr == 1)
                hc <= 0;
            else
                begin
                    if (hc == hpixels-1)
                        begin
                            // A sz�ml�l� el�rte a pixelsz�mot
                            hc <= 0;    // sz�ml�l� reset
                            vsenable <= 1;  // f�gg?leges sz�ml�l� n�vel�s�nek enged�lyz�se
                        end
                    else
                        begin
                            hc <= hc+1; // V�zszintes sz�ml�l� n�vel�se
                            vsenable <= 0;  // vsenable off
                        end
                end
        end
    
// hsync impulzus gener�l�sa
// Alacsony szint? 0-127 intervallumon
    always@(*)
        begin
            if (hc < 204)
                hsync = 0;
            else
                hsync = 1;
        end
        
// F�gg?leges szinkroniz�l� jel sz�ml�l�ja
    always@(posedge clk or posedge clr)
        begin
            if (clr == 1)
                vc <= 0;
            else
                if (vsenable == 1)
                    begin
                        if (vc == hlines-1)
                            // Reset, ha el�rt�k a sorok sz�m�t
                            vc <= 0;
                        else
                            // F�gg?leges sz�ml�l� n�vel�se
                            vc <= vc+1;
                    end
        end
        
// vsync impulzus gener�l�sa
// Alacsony szint? 0 �s 1 �rt�k eset�n
    always@(*)
        begin
            if (vc < 3)
                vsync = 0;
            else
                vsync = 1;
        end
        
// Video out enged�lyez�se porch-okon bel�l
    always@(*)
        begin
            if ((hc < hfp) && (hc >= hbp) && (vc < vfp) && (vc >= vbp))
                vidon = 1;
            else
                vidon = 0;
        end
        
    
endmodule