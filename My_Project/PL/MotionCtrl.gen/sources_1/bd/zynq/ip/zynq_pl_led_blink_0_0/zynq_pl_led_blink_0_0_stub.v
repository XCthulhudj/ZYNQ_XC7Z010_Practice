// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1.1 (win64) Build 6233196 Thu Sep 11 21:27:30 MDT 2025
// Date        : Tue Nov  3 09:09:16 2026
// Host        : DESKTOP-NUN3FF0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Data/FPGA/ZYNQ_XC7Z010_Practice/My_Project/PL/MotionCtrl.gen/sources_1/bd/zynq/ip/zynq_pl_led_blink_0_0/zynq_pl_led_blink_0_0_stub.v
// Design      : zynq_pl_led_blink_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "zynq_pl_led_blink_0_0,pl_led_blink,{}" *) (* CORE_GENERATION_INFO = "zynq_pl_led_blink_0_0,pl_led_blink,{x_ipProduct=Vivado 2025.1.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=pl_led_blink,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,CNT_MAX=1011111010111100000111111}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "pl_led_blink,Vivado 2025.1.1" *) 
module zynq_pl_led_blink_0_0(sys_clk, key_stop, led_out)
/* synthesis syn_black_box black_box_pad_pin="key_stop,led_out" */
/* synthesis syn_force_seq_prim="sys_clk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 sys_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sys_clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN zynq_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input sys_clk /* synthesis syn_isclock = 1 */;
  input key_stop;
  output led_out;
endmodule
