`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:11:27 04/16/2015
// Design Name:   EX30_top
// Module Name:   D:/hallgato/RAMROM/EX30___/EX30_teszt.v
// Project Name:  EX30___
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EX30_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EX30_teszt;

	// Inputs
	reg mclk;
	reg [3:0] btn;

	// Outputs
	wire [15:0] spo;

	// Instantiate the Unit Under Test (UUT)
	EX30_top uut (
		.clk(mclk), 
		.addr(btn), 
		.spo(spo)
	);

	initial begin
		// Initialize Inputs
		mclk = 0;
		btn = -1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always@(*)
      begin
			#50
			mclk <= ~mclk;
		end
   
	always@(mclk)
      begin
			btn = btn + 1;
		end
      
endmodule

