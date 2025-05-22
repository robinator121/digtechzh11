//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Thu Apr 24 15:27:21 2025
//Host        : IK321007 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (AN,
    a_to_g,
    clk,
    rst);
  output [6:0]AN;
  output [6:0]a_to_g;
  input clk;
  input rst;

  wire clk_1;
  wire clock_divider_0_clk_out;
  wire [3:0]count_sec_0_q;
  wire [6:0]hex7seg_0_a_to_g;
  wire rst_1;
  wire [6:0]xlconstant_0_dout;

  assign AN[6:0] = xlconstant_0_dout;
  assign a_to_g[6:0] = hex7seg_0_a_to_g;
  assign clk_1 = clk;
  assign rst_1 = rst;
  design_1_clock_divider_0_0 clock_divider_0
       (.clk(clk_1),
        .clk_out(clock_divider_0_clk_out));
  design_1_count_sec_0_0 count_sec_0
       (.clk(clock_divider_0_clk_out),
        .clr(rst_1),
        .q(count_sec_0_q));
  design_1_hex7seg_0_0 hex7seg_0
       (.a_to_g(hex7seg_0_a_to_g),
        .x(count_sec_0_q));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
