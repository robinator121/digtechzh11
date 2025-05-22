`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 16:34:52
// Design Name: 
// Module Name: Top_Module
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


module Top_Module(  input wire mclk, 
                    input wire[3:0] btn, 
                    input wire[7:0] sw, 
                    output wire TxD, 
                    output wire[6:0] a_to_g, 
                    output wire dp, 
                    output wire[3:0] an             
                    );
                    
   wire clk25, clk190, clr, tdre, ready;
   wire [15:0] x;
   wire [3:0] btnd;
   
   assign clr = btn[3];
   assign x = {8'b00000000, sw};
   
   clkdiv U1(.clk(mclk), .clr(clr), .clk190(clk190), .clk25(clk25) );
   debounce4 U2 (.inp(btn), .cclk(clk190), .clr(clr), .outp(btnd) );
   uart_tx U3( .clk(clk25), .clr(clr), .tx_data(sw), .ready(ready), .tdre(tdre), .TxD(TxD) );
   test_tx_ctrl U4 ( .clk(clk25), .clr(clr), .go(btnd[0]), .tdre(tdre), .ready(ready) );
   x7segb U5 ( .x(x), .cclk(clk190), .clr(clr), .a_to_g(a_to_g), .an(an), .dp(dp) );
         
endmodule
