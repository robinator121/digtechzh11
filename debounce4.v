`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2024 17:07:30
// Design Name: 
// Module Name: debounce4
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


module debounce4(   input wire [3:0] inp,
                    input wire cclk,
                    input wire clr,
                    output wire[3:0] outp);
 reg [3:0] delay1;
 reg [3:0] delay2;
 reg [3:0] delay3;
 
 always @(posedge cclk or posedge clr)
 begin
    if(clr == 1)
        begin
            delay1 <= 4'b0000;
            delay2 <= 4'b0000;
            delay3 <= 4'b0000;
        end
   else
        begin
            delay1 <= inp;
            delay2 <= delay1;
            delay3 <= delay2;
        end
end

assign outp = delay1 & delay2 & delay3;
endmodule
