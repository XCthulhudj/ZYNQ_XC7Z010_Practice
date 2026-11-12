// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1.1 (win64) Build 6233196 Thu Sep 11 21:27:30 MDT 2025
// Date        : Sat Oct 31 11:53:18 2026
// Host        : DESKTOP-NUN3FF0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Data/FPGA/ZYNQ_XC7Z010_Practice/PL/IP_ps_configuration/IP_ps_configuration.gen/sources_1/bd/zynq7/ip/zynq7_counter_0_0/zynq7_counter_0_0_sim_netlist.v
// Design      : zynq7_counter_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "zynq7_counter_0_0,counter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "counter,Vivado 2025.1.1" *) 
(* NotValidForBitStream *)
module zynq7_counter_0_0
   (sys_clk,
    led_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 sys_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sys_clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN zynq7_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input sys_clk;
  output led_out;

  wire led_out;
  wire sys_clk;

  zynq7_counter_0_0_counter inst
       (.led_out(led_out),
        .sys_clk(sys_clk));
endmodule

(* ORIG_REF_NAME = "counter" *) 
module zynq7_counter_0_0_counter
   (led_out,
    sys_clk);
  output led_out;
  input sys_clk;

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
  wire \cnt[24]_i_2_n_0 ;
  wire \cnt[24]_i_3_n_0 ;
  wire \cnt[24]_i_4_n_0 ;
  wire \cnt[24]_i_5_n_0 ;
  wire \cnt[24]_i_6_n_0 ;
  wire \cnt[24]_i_7_n_0 ;
  wire led_out;
  wire led_out_0;
  wire led_out_i_1_n_0;
  wire [24:0]p_1_in;
  wire sys_clk;
  wire [3:3]NLW_cnt0_carry__4_CO_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry
       (.CI(1'b0),
        .CO({cnt0_carry_n_0,cnt0_carry_n_1,cnt0_carry_n_2,cnt0_carry_n_3}),
        .CYINIT(cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[4:1]),
        .S(cnt[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry__0
       (.CI(cnt0_carry_n_0),
        .CO({cnt0_carry__0_n_0,cnt0_carry__0_n_1,cnt0_carry__0_n_2,cnt0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[8:5]),
        .S(cnt[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry__1
       (.CI(cnt0_carry__0_n_0),
        .CO({cnt0_carry__1_n_0,cnt0_carry__1_n_1,cnt0_carry__1_n_2,cnt0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[12:9]),
        .S(cnt[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry__2
       (.CI(cnt0_carry__1_n_0),
        .CO({cnt0_carry__2_n_0,cnt0_carry__2_n_1,cnt0_carry__2_n_2,cnt0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[16:13]),
        .S(cnt[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry__3
       (.CI(cnt0_carry__2_n_0),
        .CO({cnt0_carry__3_n_0,cnt0_carry__3_n_1,cnt0_carry__3_n_2,cnt0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[20:17]),
        .S(cnt[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 cnt0_carry__4
       (.CI(cnt0_carry__3_n_0),
        .CO({NLW_cnt0_carry__4_CO_UNCONNECTED[3],cnt0_carry__4_n_1,cnt0_carry__4_n_2,cnt0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[24:21]),
        .S(cnt[24:21]));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt[0]),
        .O(p_1_in[0]));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \cnt[24]_i_1 
       (.I0(\cnt[24]_i_2_n_0 ),
        .I1(\cnt[24]_i_3_n_0 ),
        .I2(\cnt[24]_i_4_n_0 ),
        .I3(\cnt[24]_i_5_n_0 ),
        .I4(\cnt[24]_i_6_n_0 ),
        .I5(\cnt[24]_i_7_n_0 ),
        .O(led_out_0));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \cnt[24]_i_2 
       (.I0(cnt[17]),
        .I1(cnt[10]),
        .I2(cnt[11]),
        .I3(cnt[14]),
        .O(\cnt[24]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \cnt[24]_i_3 
       (.I0(cnt[21]),
        .I1(cnt[3]),
        .I2(cnt[1]),
        .I3(cnt[23]),
        .O(\cnt[24]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \cnt[24]_i_4 
       (.I0(cnt[22]),
        .I1(cnt[20]),
        .I2(cnt[19]),
        .O(\cnt[24]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \cnt[24]_i_5 
       (.I0(cnt[12]),
        .I1(cnt[13]),
        .I2(cnt[18]),
        .I3(cnt[9]),
        .O(\cnt[24]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \cnt[24]_i_6 
       (.I0(cnt[24]),
        .I1(cnt[5]),
        .I2(cnt[16]),
        .I3(cnt[6]),
        .O(\cnt[24]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFDFFFFFFFFFF)) 
    \cnt[24]_i_7 
       (.I0(cnt[4]),
        .I1(cnt[15]),
        .I2(cnt[8]),
        .I3(cnt[0]),
        .I4(cnt[7]),
        .I5(cnt[2]),
        .O(\cnt[24]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[0]),
        .Q(cnt[0]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[10] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[10]),
        .Q(cnt[10]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[11] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[11]),
        .Q(cnt[11]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[12] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[12]),
        .Q(cnt[12]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[13] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[13]),
        .Q(cnt[13]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[14] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[14]),
        .Q(cnt[14]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[15] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[15]),
        .Q(cnt[15]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[16] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[16]),
        .Q(cnt[16]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[17] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[17]),
        .Q(cnt[17]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[18] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[18]),
        .Q(cnt[18]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[19] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[19]),
        .Q(cnt[19]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[1]),
        .Q(cnt[1]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[20] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[20]),
        .Q(cnt[20]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[21] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[21]),
        .Q(cnt[21]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[22] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[22]),
        .Q(cnt[22]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[23] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[23]),
        .Q(cnt[23]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[24] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[24]),
        .Q(cnt[24]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[2]),
        .Q(cnt[2]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[3]),
        .Q(cnt[3]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[4]),
        .Q(cnt[4]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[5]),
        .Q(cnt[5]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[6] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[6]),
        .Q(cnt[6]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[7] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[7]),
        .Q(cnt[7]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[8] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[8]),
        .Q(cnt[8]),
        .R(led_out_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[9] 
       (.C(sys_clk),
        .CE(1'b1),
        .D(p_1_in[9]),
        .Q(cnt[9]),
        .R(led_out_0));
  LUT2 #(
    .INIT(4'h6)) 
    led_out_i_1
       (.I0(led_out_0),
        .I1(led_out),
        .O(led_out_i_1_n_0));
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
