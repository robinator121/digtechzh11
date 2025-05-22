`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2024 17:20:04
// Design Name: 
// Module Name: traffic
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

module traffic(
    input wire clk, clr, output reg[6:0] lights);
    reg[2:0] state;
    reg[6:0] count;
    
    parameter S0 = 3'b000, S1=3'b001, S2 = 3'b010, S3=3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;
    parameter SEC5 = 7'b0001111, SEC1 = 7'b0000011;
    
    always @(posedge clk or posedge clr) begin
        if(clr==1)begin
            state <= S0;
            count <=0;
        end
        else case(state)
            S0:if(count < SEC5) begin
                state<=S0;
                count<=count+1;
            end
            else begin
                state <=S1;
                count<=0;
            end
            S1:if(count < SEC1) begin
                state<=S1;
                count<=count+1;
            end
            else begin
                state <=S2;
                count<=0;
            end
            S2:if(count < SEC1) begin
                state<=S2;
                count<=count+1;
            end
            else begin
                state <=S3;
                count<=0;
            end
            S3:if(count < SEC5) begin
                state<=S3;
                count<=count+1;
            end
            else begin
                state <=S4;
                count<=0;
            end
            S4:if(count < SEC1) begin
                state<=S4;
                count<=count+1;
            end
            else begin
                state <=S5;
                count<=0;
            end
            S5:if(count < SEC1) begin
                state<=S5;
                count<=count+1;
            end
            else begin
                state <=S6;
                count<=0;
            end
            S6:if(count<SEC1)begin
                state <=S6;
                count<=count+1;
             end
             else begin
                if(count > 90) begin
                    state <=S0;
                    count<=0;
                end
                else begin
                    state<=S7;
                end
               end
            S7:if(count<SEC1)begin
                state<=S7;
                count<=count+1;
            end
            else begin
                if(count > 90)begin
                    state <= S0;
                    count <=0;
                end
                else begin
                state<=S6;
            end
            end
        default state <=S0;
       endcase
      end
   always @(*) begin
    case(state) 
        S0:lights = 6'b010100;
        S1:lights = 6'b110100;
        S2:lights = 6'b100100;
        S3:lights = 6'b100010;
        S4:lights = 6'b100110;
        S5:lights = 6'b100100;
        S6:lights = 6'b110110;
        S7:lights = 6'b000000;
        default lights = 6'b100001;
        endcase
        end         
endmodule

