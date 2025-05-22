`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 17:04:29
// Design Name: 
// Module Name: Main_Module
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


module Main_Module(
    input wire btn[3],
    input wire mclk,
    input wire RxD,
    output wire a_to_g[6:0],
    output wire an[3:0],
    output wire FE,
    output TxD
    );
    
    wire clk190;
    wire clk25;
    wire rdrf;
    wire rdrf_clr;
    wire tdre;
    wire [7:0] rx_data;
    wire ready;
        
    clkdiv U1(.clr(btn[3]),.clk(mclk),.clk25(clk25),.clk190(clk190));
    test_rx_ctrl U2(.clr(btn[3]),.clk(clk25),.rdrf(rdrf),.rdrf_clr(rdrf_clr));
    test_tx_ctrl U3(.go(rdrf_clr),.tdre(tdre),.clr(button[3]),.clk(clk25),.ready(ready));
    uart_rx U4(.RxD(RxD),.rdrf(rdrf),.clr(button[3]),.rdrf_clr(rdrf_clr),.clk(clk25),.FE(FE),.rx_data(rx_data));
    uart_tx U5(.tx_data(rx_data),.tdre(tdre),.clr(button[3]),.ready(ready),.clk(clk25),.TxD(TxD));
    x7segb U6(.x(rx_data), .cclk(clk25),.clr(btn[3]),.a_to_g(a_to_g),.an(an));
