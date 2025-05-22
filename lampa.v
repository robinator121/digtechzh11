`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2024 16:29:27
// Design Name: 
// Module Name: lampa
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


module TL(
     input clk,rst, ce,
     output reg [2:0] led,
     output reg [3:0] timer
    );
    
    //allapot kodolas
    parameter PIROS =2'b00;
    parameter PS =2'b01;
    parameter ZOLD=2'b10;
    parameter SARGA=2'b11;
    
    reg [28:0] timer;
    reg [1:0] state_reg;
    reg [1:0] next_state;
    
    //allapotregiszter leirasa
    
    always @(posedge clk)
       begin
            if(rst)
                state_reg<=PIROS;
             else
                if(ce)
                    state_reg<=next_state;
        end
      always @(*)
      if(ce)
          case(state_reg)
               PIROS:begin
                if (timer==0)
                    next_state<=PS;
                 else
                    next_state<=PIROS;
                 end
                PS: begin
                if (timer == 0)
                    next_state <= ZOLD;
                else
                    next_state <= PS;
                end
               SARGA: begin
                if (timer == 0)
                    next_state <= PIROS;
                else
                    next_state <= SARGA;
                end
               ZOLD: begin
                if (timer == 0)
                    next_state <= SARGA;
                else
                    next_state <= ZOLD;
                end
                default:
                    next_state <= 3'bxxx;
            endcase
            
            
            //idozites
            always @ (posedge clk)
            case(state_reg)
            PIROS: begin
                if (timer == 0)
                    timer <= 2;
                else
                    timer <= timer - 1;
            end
            PS: begin
                if (timer == 0)
                    timer <= 5;
                 else
                    timer <= timer - 1;
            end
            SARGA: begin
                if (timer == 0)
                    timer <= 4;
                else
                    timer <= timer - 1;
            end
            ZOLD: begin
                if (timer == 0)
                    timer <= 2;
                else
                    timer <= timer - 1;
            end
            endcase
//next_state <= PS;
//next_state <= ZOLD;
//next_state <= PIROS;
//next_state <= SARGA;

// kimeneti dekoder
always @ (*)
case (state_reg)
    PS: led <= 3'b110;
    PIROS: led <= 3'b100;
    SARGA: led <= 3'b010;
    ZOLD: led <= 3'b001;
    endcase
endmodule
