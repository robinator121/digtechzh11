`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2024 16:16:19
// Design Name: 
// Module Name: traffic_lights_top
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


module traffic_lights_top(
input wire CLK100MHZ, BTNC,
output wire [5:0] LED
    );
    wire clk3;
    clkdiv U1 (.clk(CLK100MHZ), .clr(BTNC), .clk3(clk3));
    traffic U2 (.clk(clk3), .clr(BTNC), .lights(LED));
endmodule
