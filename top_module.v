`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2024 16:58:20
// Design Name: 
// Module Name: top_module
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


module top_module(
input clk, rst,
output wire [2:0] led,
output wire [6:0] a_to_g,
output dp,
output wire [7:0] an
    );

wire cy;
wire [3:0] timewire;   
rategen U1 (.clk(clk), .rst(rst), .cy(cy));
TL U2(.clk(clk), .ce(cy), .rst(rst), .led(led), .timer(timewire));
hex7seg U3(.x(timewire), .a_to_g(a_to_g), .dp(dp), .an(an));
endmodule
