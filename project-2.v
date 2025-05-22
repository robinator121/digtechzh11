`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2024 16:14:53
// Design Name: 
// Module Name: mux2tol
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


module mux2tol#(parameter N=4)(
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire s,
    output wire [N-1:0] y
);
    assign y = (s==0) ? a : b;
endmodule
