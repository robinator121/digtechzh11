`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2024 16:48:19
// Design Name: 
// Module Name: simulation_2
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


module simulation_2();
    reg clk;
    reg clr;
    reg clk190;
    reg clk25m;
    reg clk3;
    
    
    clkdiv clkdiv(.clk(clk),.clr(clr),.clk190(clk190),.clk25m(clk25m),.clk3(clk3));
    initial begin
        clk = 0;
        clr = 0;
    end
    
    always #1 clk = ~clk;
    always #10 clr = ~clr;
endmodule
