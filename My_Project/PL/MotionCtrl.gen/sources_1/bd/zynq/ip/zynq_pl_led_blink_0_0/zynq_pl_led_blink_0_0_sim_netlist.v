// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1.1 (win64) Build 6233196 Thu Sep 11 21:27:30 MDT 2025
// Date        : Tue Nov  3 09:09:16 2026
// Host        : DESKTOP-NUN3FF0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Data/FPGA/ZYNQ_XC7Z010_Practice/My_Project/PL/MotionCtrl.gen/sources_1/bd/zynq/ip/zynq_pl_led_blink_0_0/zynq_pl_led_blink_0_0_sim_netlist.v
// Design      : zynq_pl_led_blink_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "zynq_pl_led_blink_0_0,pl_led_blink,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "pl_led_blink,Vivado 2025.1.1" *) 
(* NotValidForBitStream *)
module zynq_pl_led_blink_0_0
   (sys_clk,
    key_stop,
    led_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 sys_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sys_clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN zynq_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input sys_clk;
  input key_stop;
  output led_out;

  wire key_stop;
  wire led_out;
  wire sys_clk;

  zynq_pl_led_blink_0_0_pl_led_blink inst
       (.key_stop(key_stop),
        .led_out(led_out),
        .sys_clk(sys_clk));
endmodule

(* ORIG_REF_NAME = "pl_led_blink" *) 
module zynq_pl_led_blink_0_0_pl_led_blink
   (led_out,
    sys_clk,
    key_stop);
  output led_out;
  input sys_clk;
  input key_stop;

  wire [24:0]cnt;
  wire cnt0_carry__0_n_0;
  wire cnt0_carry__0_n_1;
  wire cnt0_carry__0_n_2;
  wire cnt0_carry__0_n_3;
  wire cnt0_carry__1_n_0;
  wire cnt0_carry__1_n_1;
  wire cnt0_carry__1_n_2;
  wire cnt0_carry__1_n_3;
  wire cnt0_carry__2_n_0;
  wire cnt0_carry__2_n_1;
  wire cnt0_carry__2_n_2;
  wire cnt0_carry__2_n_3;
  wire cnt0_carry__3_n_0;
  wire cnt0_carry__3_n_1;
  wire cnt0_carry__3_n_2;
  wire cnt0_carry__3_n_3;
  wire cnt0_carry__4_n_1;
  wire cnt0_carry__4_n_2;
  wire cnt0_carry__4_n_3;
  wire cnt0_carry_n_0;
  wire cnt0_carry_n_1;
  wire cnt0_carry_n_2;
  wire cnt0_carry_n_3;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[24]_i_1_n_0 ;
  wire [24:1]data0;
  wire key_stop;
  wire \key_sync_reg_n_0_[0] ;
  wire led_out;
  wire led_out_i_1_n_0;
  wire led_out_i_2_n_0;
  wire led_out_i_3_n_0;
  wire led_out_i_4_n_0;
  wire led_out_i_5_n_0;
  wire led_out_i_6_n_0;
  wire led_out_i_7_n_0;
  wire p_0_in;
  wire sys_clk;
  wire [3:3]NLW_cnt0_carry__4_CO_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry
       (.CI(1'b0),
        .CO({cnt0_carry_n_0,cnt0_carry_n_1,cnt0_carry_n_2,cnt0_carry_n_3}),
        .CYINIT(cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(cnt[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry__0
       (.CI(cnt0_carry_n_0),
        .CO({cnt0_carry__0_n_0,cnt0_carry__0_n_1,cnt0_carry__0_n_2,cnt0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(cnt[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry__1
       (.CI(cnt0_carry__0_n_0),
        .CO({cnt0_carry__1_n_0,cnt0_carry__1_n_1,cnt0_carry__1_n_2,cnt0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(cnt[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry__2
       (.CI(cnt0_carry__1_n_0),
        .CO({cnt0_carry__2_n_0,cnt0_carry__2_n_1,cnt0_carry__2_n_2,cnt0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(cnt[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry__3
       (.CI(cnt0_carry__2_n_0),
        .CO({cnt0_carry__3_n_0,cnt0_carry__3_n_1,cnt0_carry__3_n_2,cnt0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(cnt[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry__4
       (.CI(cnt0_carry__3_n_0),
        .CO({NLW_cnt0_carry__4_CO_UNCONNECTED[3],cnt0_carry__4_n_1,cnt0_carry__4_n_2,cnt0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(cnt[24:21]));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[0]_i_1 
       (.I0(p_0_in),
        .I1(cnt[0]),
        .O(\cnt[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \cnt[24]_i_1 
       (.I0(p_0_in),
        .I1(led_out_i_4_n_0),
        .I2(led_out_i_3_n_0),
        .I3(led_out_i_2_n_0),
        .O(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(\cnt[0]_i_1_n_0 ),
        .Q(cnt[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[10] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[10]),
        .Q(cnt[10]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[11] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[11]),
        .Q(cnt[11]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[12] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[12]),
        .Q(cnt[12]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[13] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[13]),
        .Q(cnt[13]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[14] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[14]),
        .Q(cnt[14]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[15] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[15]),
        .Q(cnt[15]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[16] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[16]),
        .Q(cnt[16]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[17] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[17]),
        .Q(cnt[17]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[18] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[18]),
        .Q(cnt[18]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[19] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[19]),
        .Q(cnt[19]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[1]),
        .Q(cnt[1]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[20] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[20]),
        .Q(cnt[20]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[21] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[21]),
        .Q(cnt[21]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[22] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[22]),
        .Q(cnt[22]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[23] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[23]),
        .Q(cnt[23]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[24] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[24]),
        .Q(cnt[24]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[2]),
        .Q(cnt[2]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[3]),
        .Q(cnt[3]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[4]),
        .Q(cnt[4]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[5]),
        .Q(cnt[5]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[6] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[6]),
        .Q(cnt[6]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[7] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[7]),
        .Q(cnt[7]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[8] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[8]),
        .Q(cnt[8]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[9] 
       (.C(sys_clk),
        .CE(p_0_in),
        .D(data0[9]),
        .Q(cnt[9]),
        .R(\cnt[24]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \key_sync_reg[0] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(key_stop),
        .Q(\key_sync_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \key_sync_reg[1] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(\key_sync_reg_n_0_[0] ),
        .Q(p_0_in),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFEFF0100)) 
    led_out_i_1
       (.I0(led_out_i_2_n_0),
        .I1(led_out_i_3_n_0),
        .I2(led_out_i_4_n_0),
        .I3(p_0_in),
        .I4(led_out),
        .O(led_out_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFBFF)) 
    led_out_i_2
       (.I0(cnt[17]),
        .I1(cnt[18]),
        .I2(cnt[15]),
        .I3(cnt[16]),
        .I4(led_out_i_5_n_0),
        .O(led_out_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    led_out_i_3
       (.I0(cnt[9]),
        .I1(cnt[10]),
        .I2(cnt[7]),
        .I3(cnt[8]),
        .I4(led_out_i_6_n_0),
        .O(led_out_i_3_n_0));
  LUT5 #(
    .INIT(32'hEFFFFFFF)) 
    led_out_i_4
       (.I0(led_out_i_7_n_0),
        .I1(cnt[6]),
        .I2(cnt[5]),
        .I3(cnt[3]),
        .I4(cnt[4]),
        .O(led_out_i_4_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    led_out_i_5
       (.I0(cnt[20]),
        .I1(cnt[19]),
        .I2(cnt[22]),
        .I3(cnt[21]),
        .O(led_out_i_5_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    led_out_i_6
       (.I0(cnt[12]),
        .I1(cnt[11]),
        .I2(cnt[14]),
        .I3(cnt[13]),
        .O(led_out_i_6_n_0));
  LUT5 #(
    .INIT(32'hDFFFFFFF)) 
    led_out_i_7
       (.I0(cnt[0]),
        .I1(cnt[23]),
        .I2(cnt[24]),
        .I3(cnt[2]),
        .I4(cnt[1]),
        .O(led_out_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    led_out_reg
       (.C(sys_clk),
        .CE(1'b1),
        .D(led_out_i_1_n_0),
        .Q(led_out),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
