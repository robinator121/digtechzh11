module count_sec
(input clr , clk ,
output reg [3:0] q );
// 4-bit counter
always @(posedge clk or posedge clr)
begin
if(clr == 1 | q == 9)
q <= 0;
else
q <= q + 1;
end
endmodule