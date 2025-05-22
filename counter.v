`timescale 1ns / 1ps


module counter(input wire clk, input wire clr, output reg [3:0] cont);

always@ (posedge clk or posedge clr)
  begin
    if(clr)
      cont <= 4'b0000; // Reset do endere�o
    else
      cont <= cont + 1; // Incremento do endere�o
   end 
    
endmodule
