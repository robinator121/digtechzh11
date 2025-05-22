//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Thu Apr 24 15:27:21 2025
//Host        : IK321007 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (AN,
    a_to_g,
    clk,
    rst);
  output [6:0]AN;
  output [6:0]a_to_g;
  input clk;
  input rst;

  wire [6:0]AN;
  wire [6:0]a_to_g;
  wire clk;
  wire rst;

  design_1 design_1_i
       (.AN(AN),
        .a_to_g(a_to_g),
        .clk(clk),
        .rst(rst));
endmodule
