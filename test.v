`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2024 16:46:09
// Design Name: 
// Module Name: test
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


module test;
    reg [3:0] addr;
    reg clk;
    wire [7:0] spo;
    
    EX28_top EX28(.clk(clk),.addr(addr),.spo(spo));
    initial begin
        clk = 0;
        addr = 0;
        #100;
    end
    
    always @(*)
        begin
            #50;
            clk <= ~clk;
        end
    
    always @(clk)
        begin
            addr = addr + 1;
        end   
 endmodule
