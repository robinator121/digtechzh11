`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 17:14:11
// Design Name: 
// Module Name: vgastripes
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

module vgastripes(
    input wire vidon,
    input wire [10:0] hc, vc,
    output reg [3:0] red, green,
    output reg [3:0] blue
    );
    
    always @(*)
        begin
            red = 0;
            green = 0;
            blue = 0;
            if(vidon == 1)
                begin
                    red = {vc[4],vc[4],vc[4],vc[4]};
                    green = {vc[4],vc[4],vc[4],vc[4]};
                end
        end
    
endmodule
