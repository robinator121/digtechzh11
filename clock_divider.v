module clock_divider (
input wire clk, // Clock 100 MHz
output reg clk_out // Clock 1 Hz
);
reg [25:0] counter = 0; // 26 bits (2^26 > 50M)
always @(posedge clk)
if (counter == 50000000 - 1) begin //
counter <= 0;
clk_out <= ~clk_out; // Toggle output
end
else
counter <= counter + 1;
endmodule
