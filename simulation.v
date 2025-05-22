`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2024 16:17:52
// Design Name: 
// Module Name: simulation
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


module simulation();
    reg [3:0] a;
    reg [3:0] b;
    reg s;
    wire [3:0] y;
    
    mux2tol mux(.a(a),.b(b),.s(s),.y(y));
    initial begin
        a <= 4'd5;
        b <= 4'd10;
        s <= 1'd0;
    end
    always #5 s <= ~s;
endmodule
