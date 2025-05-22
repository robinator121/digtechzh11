`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 16:31:34
// Design Name: 
// Module Name: test_tx_ctrl
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


module test_tx_ctrl(input wire clk, 
                    input wire clr, 
                    input wire go, 
                                   
                    input wire tdre, 
                    output reg ready 
                   );
                    
    reg[1:0] state; 
                    

    parameter wtgo = 2'b00, wttdre = 2'b01, load = 2'b10, wtngo = 2'b11;
     
    always @(posedge clk or posedge clr)
        begin
            if(clr == 1)
                begin
                    state <= wtgo;
                    ready <= 0;
                end
            else
                case(state)
                    wtgo:
                        if(go == 0)
                            begin
                                state <= wtgo;
                                ready <= 0;
                            end
                        else
                            begin
                                ready <= 0;
                                state <= wttdre;
                            end
                    wttdre:
                        if(tdre == 0)
                            begin
                                state <= wttdre;
                                ready <= 0;
                            end
                        else
                            begin
                                state <= load;
                                ready <= 0;
                            end
                    load:
                        begin
                            ready <= 1;
                            state <= wtngo;
                        end
                    wtngo:
                        if(go == 1)
                            begin
                                state <= wtngo;
                                ready <= 0;
                            end
                        else
                            begin
                                ready <= 0;
                                state <= wtgo;
                            end
                endcase
        end                
endmodule