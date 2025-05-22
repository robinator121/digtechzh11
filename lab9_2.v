module clkdiv ( input clk, clr, output clk1, clk2, clk3 );
reg [26:0] q;
// 27-bit counter
always @(posedge clk or posedge clr)
begin
if(clr == 1)
q <= 0;
else
q <= q + 1;
end
assign clk1 = q[18]; // ~0.75 Hz
assign clk2 = q[25]; // ~1.5
assign clk3 = q[25]; // ~3 Hz
endmodule