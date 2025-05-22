//
// 4-bit up counter with an asynchronous clear.
//
module counter_1 (input C, CLR, output reg
[3:0] Q);
always @(posedge C or posedge CLR)
begin
if (CLR)
Q <= 4'b0000;
else
Q <= Q + 1'b1;
end
endmodule
