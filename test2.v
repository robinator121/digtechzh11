`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 16:32:28
// Design Name: 
// Module Name: test2
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


module test2();
reg [2:0] addr;
reg clk;
wire [15:0] spo;

EX30_top EX28(.clk(clk), .addr(addr), .spo(spo));

initial begin
    clk = 0;
    addr = 0;
    #100;
end

always@(*)
    begin
        #50;
        clk <= ~clk;
    end
    
always@(posedge clk)
    begin
        addr = addr + 1;
    end
endmodule
