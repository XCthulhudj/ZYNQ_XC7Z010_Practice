// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1.1 (win64) Build 6233196 Thu Sep 11 21:27:30 MDT 2025
// Date        : Wed Nov 18 14:47:09 2026
// Host        : DESKTOP-NUN3FF0 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Data/FPGA/ZYNQ_XC7Z010_Practice/My_Project/PL/MotionCtrl.gen/sources_1/bd/zynq/ip/zynq_breath_led_0_0/zynq_breath_led_0_0_sim_netlist.v
// Design      : zynq_breath_led_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "zynq_breath_led_0_0,breath_led,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "breath_led,Vivado 2025.1.1" *) 
(* NotValidForBitStream *)
module zynq_breath_led_0_0
   (led,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  output led;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN zynq_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN zynq_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) input s00_axi_rready;

  wire \<const0> ;
  wire led;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  zynq_breath_led_0_0_breath_led inst
       (.axi_arready_reg(s00_axi_arready),
        .axi_awready_reg(s00_axi_awready),
        .axi_rvalid_reg(s00_axi_rvalid),
        .led(led),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "breath_led" *) 
module zynq_breath_led_0_0_breath_led
   (axi_awready_reg,
    axi_arready_reg,
    axi_rvalid_reg,
    led,
    s00_axi_rdata,
    s00_axi_bvalid,
    s00_axi_wready,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_aclk,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_wdata,
    s00_axi_awaddr,
    s00_axi_araddr,
    s00_axi_aresetn,
    s00_axi_wstrb,
    s00_axi_bready);
  output axi_awready_reg;
  output axi_arready_reg;
  output axi_rvalid_reg;
  output led;
  output [31:0]s00_axi_rdata;
  output s00_axi_bvalid;
  output s00_axi_wready;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_aclk;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_awaddr;
  input [1:0]s00_axi_araddr;
  input s00_axi_aresetn;
  input [3:0]s00_axi_wstrb;
  input s00_axi_bready;

  wire axi_arready_reg;
  wire axi_awready_reg;
  wire axi_rvalid_reg;
  wire led;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  zynq_breath_led_0_0_breath_led_slave_lite_v1_0_S00_AXI breath_led_slave_lite_v1_0_S00_AXI_inst
       (.axi_arready_reg_0(axi_arready_reg),
        .axi_awready_reg_0(axi_awready_reg),
        .axi_rvalid_reg_0(axi_rvalid_reg),
        .led(led),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "breath_led_slave_lite_v1_0_S00_AXI" *) 
module zynq_breath_led_0_0_breath_led_slave_lite_v1_0_S00_AXI
   (axi_awready_reg_0,
    axi_arready_reg_0,
    axi_rvalid_reg_0,
    led,
    s00_axi_rdata,
    s00_axi_bvalid,
    s00_axi_wready,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_aclk,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_wdata,
    s00_axi_awaddr,
    s00_axi_araddr,
    s00_axi_aresetn,
    s00_axi_wstrb,
    s00_axi_bready);
  output axi_awready_reg_0;
  output axi_arready_reg_0;
  output axi_rvalid_reg_0;
  output led;
  output [31:0]s00_axi_rdata;
  output s00_axi_bvalid;
  output s00_axi_wready;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_aclk;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_awaddr;
  input [1:0]s00_axi_araddr;
  input s00_axi_aresetn;
  input [3:0]s00_axi_wstrb;
  input s00_axi_bready;

  wire \FSM_sequential_state_read[0]_i_1_n_0 ;
  wire \FSM_sequential_state_read[1]_i_1_n_0 ;
  wire \FSM_sequential_state_write[0]_i_1_n_0 ;
  wire \FSM_sequential_state_write[1]_i_1_n_0 ;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire axi_arready_i_1_n_0;
  wire axi_arready_reg_0;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire \axi_awaddr_reg_n_0_[2] ;
  wire \axi_awaddr_reg_n_0_[3] ;
  wire axi_awready0__0;
  wire axi_awready_i_2_n_0;
  wire axi_awready_reg_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_rvalid_reg_0;
  wire axi_wready_i_1_n_0;
  wire led;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [0:0]slv_reg0;
  wire \slv_reg0[15]_i_1_n_0 ;
  wire \slv_reg0[23]_i_1_n_0 ;
  wire \slv_reg0[31]_i_1_n_0 ;
  wire \slv_reg0[7]_i_1_n_0 ;
  wire \slv_reg0_reg_n_0_[10] ;
  wire \slv_reg0_reg_n_0_[11] ;
  wire \slv_reg0_reg_n_0_[12] ;
  wire \slv_reg0_reg_n_0_[13] ;
  wire \slv_reg0_reg_n_0_[14] ;
  wire \slv_reg0_reg_n_0_[15] ;
  wire \slv_reg0_reg_n_0_[16] ;
  wire \slv_reg0_reg_n_0_[17] ;
  wire \slv_reg0_reg_n_0_[18] ;
  wire \slv_reg0_reg_n_0_[19] ;
  wire \slv_reg0_reg_n_0_[1] ;
  wire \slv_reg0_reg_n_0_[20] ;
  wire \slv_reg0_reg_n_0_[21] ;
  wire \slv_reg0_reg_n_0_[22] ;
  wire \slv_reg0_reg_n_0_[23] ;
  wire \slv_reg0_reg_n_0_[24] ;
  wire \slv_reg0_reg_n_0_[25] ;
  wire \slv_reg0_reg_n_0_[26] ;
  wire \slv_reg0_reg_n_0_[27] ;
  wire \slv_reg0_reg_n_0_[28] ;
  wire \slv_reg0_reg_n_0_[29] ;
  wire \slv_reg0_reg_n_0_[2] ;
  wire \slv_reg0_reg_n_0_[30] ;
  wire \slv_reg0_reg_n_0_[31] ;
  wire \slv_reg0_reg_n_0_[3] ;
  wire \slv_reg0_reg_n_0_[4] ;
  wire \slv_reg0_reg_n_0_[5] ;
  wire \slv_reg0_reg_n_0_[6] ;
  wire \slv_reg0_reg_n_0_[7] ;
  wire \slv_reg0_reg_n_0_[8] ;
  wire \slv_reg0_reg_n_0_[9] ;
  wire [31:0]slv_reg1;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[31]_i_2_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire [31:0]slv_reg2;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire [31:0]slv_reg3;
  wire \slv_reg3[15]_i_1_n_0 ;
  wire \slv_reg3[23]_i_1_n_0 ;
  wire \slv_reg3[31]_i_1_n_0 ;
  wire \slv_reg3[7]_i_1_n_0 ;
  wire [1:0]state_read;
  wire [1:0]state_write;
  wire u_breath_led_top_n_0;

  LUT6 #(
    .INIT(64'hFFFFF0007777FFFF)) 
    \FSM_sequential_state_read[0]_i_1 
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .I2(s00_axi_rready),
        .I3(axi_rvalid_reg_0),
        .I4(state_read[0]),
        .I5(state_read[1]),
        .O(\FSM_sequential_state_read[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0FFF88880000)) 
    \FSM_sequential_state_read[1]_i_1 
       (.I0(axi_arready_reg_0),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rready),
        .I3(axi_rvalid_reg_0),
        .I4(state_read[0]),
        .I5(state_read[1]),
        .O(\FSM_sequential_state_read[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "Idle:00,Rdata:10,Raddr:01" *) 
  FDRE \FSM_sequential_state_read_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state_read[0]_i_1_n_0 ),
        .Q(state_read[0]),
        .R(u_breath_led_top_n_0));
  (* FSM_ENCODED_STATES = "Idle:00,Rdata:10,Raddr:01" *) 
  FDRE \FSM_sequential_state_read_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state_read[1]_i_1_n_0 ),
        .Q(state_read[1]),
        .R(u_breath_led_top_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFF0F7FF)) 
    \FSM_sequential_state_write[0]_i_1 
       (.I0(axi_awready_reg_0),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_wvalid),
        .I3(state_write[0]),
        .I4(state_write[1]),
        .O(\FSM_sequential_state_write[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFF0F0800)) 
    \FSM_sequential_state_write[1]_i_1 
       (.I0(s00_axi_awvalid),
        .I1(axi_awready_reg_0),
        .I2(s00_axi_wvalid),
        .I3(state_write[0]),
        .I4(state_write[1]),
        .O(\FSM_sequential_state_write[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "Idle:00,Wdata:10,Waddr:01" *) 
  FDRE \FSM_sequential_state_write_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state_write[0]_i_1_n_0 ),
        .Q(state_write[0]),
        .R(u_breath_led_top_n_0));
  (* FSM_ENCODED_STATES = "Idle:00,Wdata:10,Waddr:01" *) 
  FDRE \FSM_sequential_state_write_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state_write[1]_i_1_n_0 ),
        .Q(state_write[1]),
        .R(u_breath_led_top_n_0));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_aresetn),
        .I2(axi_arready0),
        .I3(state_read[0]),
        .I4(state_read[1]),
        .I5(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_aresetn),
        .I2(axi_arready0),
        .I3(state_read[0]),
        .I4(state_read[1]),
        .I5(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \axi_araddr[3]_i_2 
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .O(axi_arready0));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(1'b0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hC4C4C4C4FFCFCFCF)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .I2(state_read[1]),
        .I3(s00_axi_rready),
        .I4(axi_rvalid_reg_0),
        .I5(state_read[0]),
        .O(axi_arready_i_1_n_0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready_i_1_n_0),
        .Q(axi_arready_reg_0),
        .R(u_breath_led_top_n_0));
  LUT6 #(
    .INIT(64'hEFFFFFFF20000000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(state_write[1]),
        .I2(state_write[0]),
        .I3(s00_axi_awvalid),
        .I4(axi_awready_reg_0),
        .I5(\axi_awaddr_reg_n_0_[2] ),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFFFFF20000000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(state_write[1]),
        .I2(state_write[0]),
        .I3(s00_axi_awvalid),
        .I4(axi_awready_reg_0),
        .I5(\axi_awaddr_reg_n_0_[3] ),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(\axi_awaddr_reg_n_0_[2] ),
        .R(u_breath_led_top_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(\axi_awaddr_reg_n_0_[3] ),
        .R(u_breath_led_top_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hCCC4FFCF)) 
    axi_awready_i_2
       (.I0(s00_axi_awvalid),
        .I1(axi_awready_reg_0),
        .I2(state_write[1]),
        .I3(s00_axi_wvalid),
        .I4(state_write[0]),
        .O(axi_awready_i_2_n_0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready_i_2_n_0),
        .Q(axi_awready_reg_0),
        .R(u_breath_led_top_n_0));
  LUT6 #(
    .INIT(64'hFBFF3838C3FF0000)) 
    axi_bvalid_i_1
       (.I0(axi_awready0__0),
        .I1(state_write[0]),
        .I2(state_write[1]),
        .I3(s00_axi_bready),
        .I4(s00_axi_bvalid),
        .I5(s00_axi_wvalid),
        .O(axi_bvalid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    axi_bvalid_i_2
       (.I0(s00_axi_awvalid),
        .I1(axi_awready_reg_0),
        .O(axi_awready0__0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(u_breath_led_top_n_0));
  LUT6 #(
    .INIT(64'hF0FFFFFF00800080)) 
    axi_rvalid_i_1
       (.I0(axi_arready_reg_0),
        .I1(s00_axi_arvalid),
        .I2(state_read[0]),
        .I3(state_read[1]),
        .I4(s00_axi_rready),
        .I5(axi_rvalid_reg_0),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(axi_rvalid_reg_0),
        .R(u_breath_led_top_n_0));
  LUT3 #(
    .INIT(8'hF1)) 
    axi_wready_i_1
       (.I0(state_write[1]),
        .I1(state_write[0]),
        .I2(s00_axi_wready),
        .O(axi_wready_i_1_n_0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready_i_1_n_0),
        .Q(s00_axi_wready),
        .R(u_breath_led_top_n_0));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \s00_axi_rdata[0]_INST_0 
       (.I0(slv_reg2[0]),
        .I1(slv_reg3[0]),
        .I2(slv_reg1[0]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(slv_reg0),
        .O(s00_axi_rdata[0]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[10]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[10] ),
        .I1(slv_reg1[10]),
        .I2(slv_reg2[10]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[10]),
        .O(s00_axi_rdata[10]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[11]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[11] ),
        .I1(slv_reg1[11]),
        .I2(slv_reg2[11]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[11]),
        .O(s00_axi_rdata[11]));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \s00_axi_rdata[12]_INST_0 
       (.I0(slv_reg2[12]),
        .I1(slv_reg3[12]),
        .I2(slv_reg1[12]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(\slv_reg0_reg_n_0_[12] ),
        .O(s00_axi_rdata[12]));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \s00_axi_rdata[13]_INST_0 
       (.I0(slv_reg2[13]),
        .I1(slv_reg3[13]),
        .I2(\slv_reg0_reg_n_0_[13] ),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(slv_reg1[13]),
        .O(s00_axi_rdata[13]));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \s00_axi_rdata[14]_INST_0 
       (.I0(slv_reg2[14]),
        .I1(slv_reg3[14]),
        .I2(\slv_reg0_reg_n_0_[14] ),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(slv_reg1[14]),
        .O(s00_axi_rdata[14]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[15]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[15] ),
        .I1(slv_reg1[15]),
        .I2(slv_reg2[15]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[15]),
        .O(s00_axi_rdata[15]));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \s00_axi_rdata[16]_INST_0 
       (.I0(slv_reg2[16]),
        .I1(slv_reg3[16]),
        .I2(slv_reg1[16]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(\slv_reg0_reg_n_0_[16] ),
        .O(s00_axi_rdata[16]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[17]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[17] ),
        .I1(slv_reg1[17]),
        .I2(slv_reg2[17]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[17]),
        .O(s00_axi_rdata[17]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[18]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[18] ),
        .I1(slv_reg1[18]),
        .I2(slv_reg2[18]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[18]),
        .O(s00_axi_rdata[18]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[19]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[19] ),
        .I1(slv_reg1[19]),
        .I2(slv_reg2[19]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[19]),
        .O(s00_axi_rdata[19]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[1]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[1] ),
        .I1(slv_reg1[1]),
        .I2(slv_reg2[1]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[1]),
        .O(s00_axi_rdata[1]));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \s00_axi_rdata[20]_INST_0 
       (.I0(slv_reg2[20]),
        .I1(slv_reg3[20]),
        .I2(slv_reg1[20]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(\slv_reg0_reg_n_0_[20] ),
        .O(s00_axi_rdata[20]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[21]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[21] ),
        .I1(slv_reg1[21]),
        .I2(slv_reg2[21]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[21]),
        .O(s00_axi_rdata[21]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[22]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[22] ),
        .I1(slv_reg1[22]),
        .I2(slv_reg2[22]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[22]),
        .O(s00_axi_rdata[22]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[23]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[23] ),
        .I1(slv_reg1[23]),
        .I2(slv_reg2[23]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[23]),
        .O(s00_axi_rdata[23]));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \s00_axi_rdata[24]_INST_0 
       (.I0(slv_reg2[24]),
        .I1(slv_reg3[24]),
        .I2(\slv_reg0_reg_n_0_[24] ),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(slv_reg1[24]),
        .O(s00_axi_rdata[24]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[25]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[25] ),
        .I1(slv_reg1[25]),
        .I2(slv_reg2[25]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[25]),
        .O(s00_axi_rdata[25]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[26]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[26] ),
        .I1(slv_reg1[26]),
        .I2(slv_reg2[26]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[26]),
        .O(s00_axi_rdata[26]));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \s00_axi_rdata[27]_INST_0 
       (.I0(slv_reg2[27]),
        .I1(slv_reg3[27]),
        .I2(slv_reg1[27]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(\slv_reg0_reg_n_0_[27] ),
        .O(s00_axi_rdata[27]));
  LUT6 #(
    .INIT(64'hCCAAFFF0CCAA00F0)) 
    \s00_axi_rdata[28]_INST_0 
       (.I0(slv_reg2[28]),
        .I1(slv_reg3[28]),
        .I2(\slv_reg0_reg_n_0_[28] ),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(slv_reg1[28]),
        .O(s00_axi_rdata[28]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[29]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[29] ),
        .I1(slv_reg1[29]),
        .I2(slv_reg2[29]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[29]),
        .O(s00_axi_rdata[29]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[2]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[2] ),
        .I1(slv_reg1[2]),
        .I2(slv_reg2[2]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[2]),
        .O(s00_axi_rdata[2]));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \s00_axi_rdata[30]_INST_0 
       (.I0(slv_reg2[30]),
        .I1(slv_reg3[30]),
        .I2(slv_reg1[30]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(\slv_reg0_reg_n_0_[30] ),
        .O(s00_axi_rdata[30]));
  LUT6 #(
    .INIT(64'hFFAAF0CC00AAF0CC)) 
    \s00_axi_rdata[31]_INST_0 
       (.I0(slv_reg1[31]),
        .I1(\slv_reg0_reg_n_0_[31] ),
        .I2(slv_reg2[31]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[31]),
        .O(s00_axi_rdata[31]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[3]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[3] ),
        .I1(slv_reg1[3]),
        .I2(slv_reg2[3]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[3]),
        .O(s00_axi_rdata[3]));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \s00_axi_rdata[4]_INST_0 
       (.I0(slv_reg2[4]),
        .I1(slv_reg3[4]),
        .I2(slv_reg1[4]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(\slv_reg0_reg_n_0_[4] ),
        .O(s00_axi_rdata[4]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[5]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[5] ),
        .I1(slv_reg1[5]),
        .I2(slv_reg2[5]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[5]),
        .O(s00_axi_rdata[5]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[6]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[6] ),
        .I1(slv_reg1[6]),
        .I2(slv_reg2[6]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[6]),
        .O(s00_axi_rdata[6]));
  LUT6 #(
    .INIT(64'hFFCCF0AA00CCF0AA)) 
    \s00_axi_rdata[7]_INST_0 
       (.I0(\slv_reg0_reg_n_0_[7] ),
        .I1(slv_reg1[7]),
        .I2(slv_reg2[7]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[7]),
        .O(s00_axi_rdata[7]));
  LUT6 #(
    .INIT(64'hCCAAF0FFCCAAF000)) 
    \s00_axi_rdata[8]_INST_0 
       (.I0(slv_reg2[8]),
        .I1(slv_reg3[8]),
        .I2(slv_reg1[8]),
        .I3(axi_araddr[2]),
        .I4(axi_araddr[3]),
        .I5(\slv_reg0_reg_n_0_[8] ),
        .O(s00_axi_rdata[8]));
  LUT6 #(
    .INIT(64'hFFAAF0CC00AAF0CC)) 
    \s00_axi_rdata[9]_INST_0 
       (.I0(slv_reg1[9]),
        .I1(\slv_reg0_reg_n_0_[9] ),
        .I2(slv_reg2[9]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg3[9]),
        .O(s00_axi_rdata[9]));
  LUT6 #(
    .INIT(64'h0002220200000000)) 
    \slv_reg0[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[0]),
        .I5(s00_axi_wstrb[1]),
        .O(\slv_reg0[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002220200000000)) 
    \slv_reg0[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[0]),
        .I5(s00_axi_wstrb[2]),
        .O(\slv_reg0[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002220200000000)) 
    \slv_reg0[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[0]),
        .I5(s00_axi_wstrb[3]),
        .O(\slv_reg0[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002220200000000)) 
    \slv_reg0[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[0]),
        .I5(s00_axi_wstrb[0]),
        .O(\slv_reg0[7]_i_1_n_0 ));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg0),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg0_reg_n_0_[10] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg0_reg_n_0_[11] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg0_reg_n_0_[12] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg0_reg_n_0_[13] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg0_reg_n_0_[14] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg0_reg_n_0_[15] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg0_reg_n_0_[16] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg0_reg_n_0_[17] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg0_reg_n_0_[18] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg0_reg_n_0_[19] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg0_reg_n_0_[1] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg0_reg_n_0_[20] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg0_reg_n_0_[21] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg0_reg_n_0_[22] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg0_reg_n_0_[23] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg0_reg_n_0_[24] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg0_reg_n_0_[25] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg0_reg_n_0_[26] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg0_reg_n_0_[27] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg0_reg_n_0_[28] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg0_reg_n_0_[29] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg0_reg_n_0_[2] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg0_reg_n_0_[30] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg0_reg_n_0_[31] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg0_reg_n_0_[3] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg0_reg_n_0_[4] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg0_reg_n_0_[5] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg0_reg_n_0_[6] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg0_reg_n_0_[7] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg0_reg_n_0_[8] ),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg0_reg_n_0_[9] ),
        .R(u_breath_led_top_n_0));
  LUT6 #(
    .INIT(64'h2020200000002000)) 
    \slv_reg1[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(s00_axi_wstrb[1]),
        .I3(\axi_awaddr_reg_n_0_[2] ),
        .I4(s00_axi_awvalid),
        .I5(s00_axi_awaddr[0]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2020200000002000)) 
    \slv_reg1[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(s00_axi_wstrb[2]),
        .I3(\axi_awaddr_reg_n_0_[2] ),
        .I4(s00_axi_awvalid),
        .I5(s00_axi_awaddr[0]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2020200000002000)) 
    \slv_reg1[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(s00_axi_wstrb[3]),
        .I3(\axi_awaddr_reg_n_0_[2] ),
        .I4(s00_axi_awvalid),
        .I5(s00_axi_awaddr[0]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \slv_reg1[31]_i_2 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_awvalid),
        .I2(\axi_awaddr_reg_n_0_[3] ),
        .O(\slv_reg1[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2020200000002000)) 
    \slv_reg1[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(s00_axi_wstrb[0]),
        .I3(\axi_awaddr_reg_n_0_[2] ),
        .I4(s00_axi_awvalid),
        .I5(s00_axi_awaddr[0]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg1[0]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg1[10]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg1[11]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg1[12]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg1[13]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg1[14]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg1[15]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg1[16]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg1[17]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg1[18]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg1[19]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg1[1]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg1[20]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg1[21]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg1[22]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg1[23]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg1[24]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg1[25]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg1[26]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg1[27]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg1[28]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg1[29]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg1[2]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg1[30]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg1[31]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg1[3]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg1[4]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg1[5]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg1[6]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg1[7]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg1[8]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg1[9]),
        .R(u_breath_led_top_n_0));
  LUT6 #(
    .INIT(64'h0080000000808080)) 
    \slv_reg2[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(s00_axi_wstrb[1]),
        .I3(s00_axi_awaddr[0]),
        .I4(s00_axi_awvalid),
        .I5(\axi_awaddr_reg_n_0_[2] ),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0080000000808080)) 
    \slv_reg2[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(s00_axi_wstrb[2]),
        .I3(s00_axi_awaddr[0]),
        .I4(s00_axi_awvalid),
        .I5(\axi_awaddr_reg_n_0_[2] ),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0080000000808080)) 
    \slv_reg2[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(s00_axi_wstrb[3]),
        .I3(s00_axi_awaddr[0]),
        .I4(s00_axi_awvalid),
        .I5(\axi_awaddr_reg_n_0_[2] ),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0080000000808080)) 
    \slv_reg2[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(\slv_reg1[31]_i_2_n_0 ),
        .I2(s00_axi_wstrb[0]),
        .I3(s00_axi_awaddr[0]),
        .I4(s00_axi_awvalid),
        .I5(\axi_awaddr_reg_n_0_[2] ),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg2[0]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg2[10]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg2[11]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg2[12]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg2[13]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg2[14]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg2[15]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg2[16]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg2[17]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg2[18]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg2[19]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg2[1]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg2[20]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg2[21]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg2[22]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg2[23]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg2[24]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg2[25]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg2[26]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg2[27]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg2[28]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg2[29]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg2[2]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg2[30]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg2[31]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg2[3]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg2[4]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg2[5]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg2[6]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg2[7]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg2[8]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg2[9]),
        .R(u_breath_led_top_n_0));
  LUT6 #(
    .INIT(64'h8880008000000000)) 
    \slv_reg3[15]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[1]),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[0]),
        .I5(\slv_reg1[31]_i_2_n_0 ),
        .O(\slv_reg3[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8880008000000000)) 
    \slv_reg3[23]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[2]),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[0]),
        .I5(\slv_reg1[31]_i_2_n_0 ),
        .O(\slv_reg3[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8880008000000000)) 
    \slv_reg3[31]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[3]),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[0]),
        .I5(\slv_reg1[31]_i_2_n_0 ),
        .O(\slv_reg3[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8880008000000000)) 
    \slv_reg3[7]_i_1 
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_wstrb[0]),
        .I2(\axi_awaddr_reg_n_0_[2] ),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_awaddr[0]),
        .I5(\slv_reg1[31]_i_2_n_0 ),
        .O(\slv_reg3[7]_i_1_n_0 ));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg3[0]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg3[10]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg3[11]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg3[12]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg3[13]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg3[14]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg3[15]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg3[16]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg3[17]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg3[18]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg3[19]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg3[1]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg3[20]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg3[21]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg3[22]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg3[23]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg3[24]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg3[25]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg3[26]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg3[27]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg3[28]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg3[29]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg3[2]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg3[30]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg3[31]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg3[3]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg3[4]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg3[5]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg3[6]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg3[7]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg3[8]),
        .R(u_breath_led_top_n_0));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg3[9]),
        .R(u_breath_led_top_n_0));
  zynq_breath_led_0_0_breath_led_top u_breath_led_top
       (.Q(slv_reg0),
        .SR(u_breath_led_top_n_0),
        .\freq_set_reg_reg[9]_0 (slv_reg1[9:0]),
        .led(led),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn));
endmodule

(* ORIG_REF_NAME = "breath_led_top" *) 
module zynq_breath_led_0_0_breath_led_top
   (SR,
    led,
    s00_axi_aclk,
    Q,
    \freq_set_reg_reg[9]_0 ,
    s00_axi_aresetn);
  output [0:0]SR;
  output led;
  input s00_axi_aclk;
  input [0:0]Q;
  input [9:0]\freq_set_reg_reg[9]_0 ;
  input s00_axi_aresetn;

  wire [0:0]Q;
  wire [0:0]SR;
  wire [15:0]cnt_1ms;
  wire \cnt_1ms[15]_i_2_n_0 ;
  wire \cnt_1ms[15]_i_3_n_0 ;
  wire \cnt_1ms[15]_i_4_n_0 ;
  wire \cnt_1ms[15]_i_5_n_0 ;
  wire \cnt_1ms_reg[12]_i_2_n_0 ;
  wire \cnt_1ms_reg[12]_i_2_n_1 ;
  wire \cnt_1ms_reg[12]_i_2_n_2 ;
  wire \cnt_1ms_reg[12]_i_2_n_3 ;
  wire \cnt_1ms_reg[15]_i_6_n_2 ;
  wire \cnt_1ms_reg[15]_i_6_n_3 ;
  wire \cnt_1ms_reg[4]_i_2_n_0 ;
  wire \cnt_1ms_reg[4]_i_2_n_1 ;
  wire \cnt_1ms_reg[4]_i_2_n_2 ;
  wire \cnt_1ms_reg[4]_i_2_n_3 ;
  wire \cnt_1ms_reg[8]_i_2_n_0 ;
  wire \cnt_1ms_reg[8]_i_2_n_1 ;
  wire \cnt_1ms_reg[8]_i_2_n_2 ;
  wire \cnt_1ms_reg[8]_i_2_n_3 ;
  wire [15:1]data0;
  wire duty_flag_i_1_n_0;
  wire duty_flag_reg_n_0;
  wire [9:0]freq_set_reg;
  wire \freq_set_reg[0]_i_1_n_0 ;
  wire \freq_set_reg[1]_i_1_n_0 ;
  wire \freq_set_reg[2]_i_1_n_0 ;
  wire \freq_set_reg[2]_i_2_n_0 ;
  wire \freq_set_reg[3]_i_1_n_0 ;
  wire \freq_set_reg[3]_i_2_n_0 ;
  wire \freq_set_reg[4]_i_1_n_0 ;
  wire \freq_set_reg[4]_i_2_n_0 ;
  wire [9:0]\freq_set_reg_reg[9]_0 ;
  wire [15:0]high_duty_cnt;
  wire [15:0]high_duty_cnt0;
  wire [15:0]high_duty_cnt00_in;
  wire high_duty_cnt1;
  wire high_duty_cnt1_carry__0_i_1_n_0;
  wire high_duty_cnt1_carry__0_i_2_n_0;
  wire high_duty_cnt1_carry__0_i_3_n_0;
  wire high_duty_cnt1_carry__0_i_4_n_0;
  wire high_duty_cnt1_carry__0_i_5_n_0;
  wire high_duty_cnt1_carry__0_n_1;
  wire high_duty_cnt1_carry__0_n_2;
  wire high_duty_cnt1_carry__0_n_3;
  wire high_duty_cnt1_carry_i_1_n_0;
  wire high_duty_cnt1_carry_i_2_n_0;
  wire high_duty_cnt1_carry_i_3_n_0;
  wire high_duty_cnt1_carry_i_4_n_0;
  wire high_duty_cnt1_carry_i_5_n_0;
  wire high_duty_cnt1_carry_i_6_n_0;
  wire high_duty_cnt1_carry_i_7_n_0;
  wire high_duty_cnt1_carry_i_8_n_0;
  wire high_duty_cnt1_carry_n_0;
  wire high_duty_cnt1_carry_n_1;
  wire high_duty_cnt1_carry_n_2;
  wire high_duty_cnt1_carry_n_3;
  wire \high_duty_cnt[0]_i_1_n_0 ;
  wire \high_duty_cnt[10]_i_1_n_0 ;
  wire \high_duty_cnt[11]_i_1_n_0 ;
  wire \high_duty_cnt[11]_i_4_n_0 ;
  wire \high_duty_cnt[11]_i_5_n_0 ;
  wire \high_duty_cnt[11]_i_6_n_0 ;
  wire \high_duty_cnt[11]_i_7_n_0 ;
  wire \high_duty_cnt[11]_i_8_n_0 ;
  wire \high_duty_cnt[11]_i_9_n_0 ;
  wire \high_duty_cnt[12]_i_1_n_0 ;
  wire \high_duty_cnt[13]_i_1_n_0 ;
  wire \high_duty_cnt[14]_i_1_n_0 ;
  wire \high_duty_cnt[15]_i_10_n_0 ;
  wire \high_duty_cnt[15]_i_11_n_0 ;
  wire \high_duty_cnt[15]_i_12_n_0 ;
  wire \high_duty_cnt[15]_i_13_n_0 ;
  wire \high_duty_cnt[15]_i_14_n_0 ;
  wire \high_duty_cnt[15]_i_15_n_0 ;
  wire \high_duty_cnt[15]_i_16_n_0 ;
  wire \high_duty_cnt[15]_i_17_n_0 ;
  wire \high_duty_cnt[15]_i_18_n_0 ;
  wire \high_duty_cnt[15]_i_19_n_0 ;
  wire \high_duty_cnt[15]_i_1_n_0 ;
  wire \high_duty_cnt[15]_i_2_n_0 ;
  wire \high_duty_cnt[15]_i_3_n_0 ;
  wire \high_duty_cnt[15]_i_4_n_0 ;
  wire \high_duty_cnt[15]_i_5_n_0 ;
  wire \high_duty_cnt[15]_i_8_n_0 ;
  wire \high_duty_cnt[15]_i_9_n_0 ;
  wire \high_duty_cnt[1]_i_1_n_0 ;
  wire \high_duty_cnt[2]_i_1_n_0 ;
  wire \high_duty_cnt[3]_i_10_n_0 ;
  wire \high_duty_cnt[3]_i_11_n_0 ;
  wire \high_duty_cnt[3]_i_1_n_0 ;
  wire \high_duty_cnt[3]_i_4_n_0 ;
  wire \high_duty_cnt[3]_i_5_n_0 ;
  wire \high_duty_cnt[3]_i_6_n_0 ;
  wire \high_duty_cnt[3]_i_7_n_0 ;
  wire \high_duty_cnt[3]_i_8_n_0 ;
  wire \high_duty_cnt[3]_i_9_n_0 ;
  wire \high_duty_cnt[4]_i_1_n_0 ;
  wire \high_duty_cnt[5]_i_1_n_0 ;
  wire \high_duty_cnt[6]_i_1_n_0 ;
  wire \high_duty_cnt[7]_i_10_n_0 ;
  wire \high_duty_cnt[7]_i_11_n_0 ;
  wire \high_duty_cnt[7]_i_1_n_0 ;
  wire \high_duty_cnt[7]_i_4_n_0 ;
  wire \high_duty_cnt[7]_i_5_n_0 ;
  wire \high_duty_cnt[7]_i_6_n_0 ;
  wire \high_duty_cnt[7]_i_7_n_0 ;
  wire \high_duty_cnt[7]_i_8_n_0 ;
  wire \high_duty_cnt[7]_i_9_n_0 ;
  wire \high_duty_cnt[8]_i_1_n_0 ;
  wire \high_duty_cnt[9]_i_1_n_0 ;
  wire \high_duty_cnt_reg[11]_i_2_n_0 ;
  wire \high_duty_cnt_reg[11]_i_2_n_1 ;
  wire \high_duty_cnt_reg[11]_i_2_n_2 ;
  wire \high_duty_cnt_reg[11]_i_2_n_3 ;
  wire \high_duty_cnt_reg[11]_i_3_n_0 ;
  wire \high_duty_cnt_reg[11]_i_3_n_1 ;
  wire \high_duty_cnt_reg[11]_i_3_n_2 ;
  wire \high_duty_cnt_reg[11]_i_3_n_3 ;
  wire \high_duty_cnt_reg[15]_i_6_n_1 ;
  wire \high_duty_cnt_reg[15]_i_6_n_2 ;
  wire \high_duty_cnt_reg[15]_i_6_n_3 ;
  wire \high_duty_cnt_reg[15]_i_7_n_1 ;
  wire \high_duty_cnt_reg[15]_i_7_n_2 ;
  wire \high_duty_cnt_reg[15]_i_7_n_3 ;
  wire \high_duty_cnt_reg[3]_i_2_n_0 ;
  wire \high_duty_cnt_reg[3]_i_2_n_1 ;
  wire \high_duty_cnt_reg[3]_i_2_n_2 ;
  wire \high_duty_cnt_reg[3]_i_2_n_3 ;
  wire \high_duty_cnt_reg[3]_i_3_n_0 ;
  wire \high_duty_cnt_reg[3]_i_3_n_1 ;
  wire \high_duty_cnt_reg[3]_i_3_n_2 ;
  wire \high_duty_cnt_reg[3]_i_3_n_3 ;
  wire \high_duty_cnt_reg[7]_i_2_n_0 ;
  wire \high_duty_cnt_reg[7]_i_2_n_1 ;
  wire \high_duty_cnt_reg[7]_i_2_n_2 ;
  wire \high_duty_cnt_reg[7]_i_2_n_3 ;
  wire \high_duty_cnt_reg[7]_i_3_n_0 ;
  wire \high_duty_cnt_reg[7]_i_3_n_1 ;
  wire \high_duty_cnt_reg[7]_i_3_n_2 ;
  wire \high_duty_cnt_reg[7]_i_3_n_3 ;
  wire led;
  wire led0;
  wire led0_carry__0_i_1_n_0;
  wire led0_carry__0_i_2_n_0;
  wire led0_carry__0_i_3_n_0;
  wire led0_carry__0_i_4_n_0;
  wire led0_carry__0_i_5_n_0;
  wire led0_carry__0_i_6_n_0;
  wire led0_carry__0_i_7_n_0;
  wire led0_carry__0_i_8_n_0;
  wire led0_carry__0_n_1;
  wire led0_carry__0_n_2;
  wire led0_carry__0_n_3;
  wire led0_carry_i_1_n_0;
  wire led0_carry_i_2_n_0;
  wire led0_carry_i_3_n_0;
  wire led0_carry_i_4_n_0;
  wire led0_carry_i_5_n_0;
  wire led0_carry_i_6_n_0;
  wire led0_carry_i_7_n_0;
  wire led0_carry_i_8_n_0;
  wire led0_carry_n_0;
  wire led0_carry_n_1;
  wire led0_carry_n_2;
  wire led0_carry_n_3;
  wire [15:0]p_0_in;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire [3:2]\NLW_cnt_1ms_reg[15]_i_6_CO_UNCONNECTED ;
  wire [3:3]\NLW_cnt_1ms_reg[15]_i_6_O_UNCONNECTED ;
  wire [3:0]NLW_high_duty_cnt1_carry_O_UNCONNECTED;
  wire [3:0]NLW_high_duty_cnt1_carry__0_O_UNCONNECTED;
  wire [3:3]\NLW_high_duty_cnt_reg[15]_i_6_CO_UNCONNECTED ;
  wire [3:3]\NLW_high_duty_cnt_reg[15]_i_7_CO_UNCONNECTED ;
  wire [3:0]NLW_led0_carry_O_UNCONNECTED;
  wire [3:0]NLW_led0_carry__0_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt_1ms[0]_i_1 
       (.I0(Q),
        .I1(cnt_1ms[0]),
        .O(p_0_in[0]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[10]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[10]),
        .O(p_0_in[10]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[11]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[11]),
        .O(p_0_in[11]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[12]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[12]),
        .O(p_0_in[12]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[13]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[13]),
        .O(p_0_in[13]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[14]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[14]),
        .O(p_0_in[14]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[15]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[15]),
        .O(p_0_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \cnt_1ms[15]_i_2 
       (.I0(cnt_1ms[3]),
        .I1(cnt_1ms[11]),
        .I2(cnt_1ms[6]),
        .I3(cnt_1ms[0]),
        .O(\cnt_1ms[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \cnt_1ms[15]_i_3 
       (.I0(cnt_1ms[15]),
        .I1(cnt_1ms[1]),
        .I2(cnt_1ms[14]),
        .I3(cnt_1ms[10]),
        .O(\cnt_1ms[15]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \cnt_1ms[15]_i_4 
       (.I0(cnt_1ms[5]),
        .I1(cnt_1ms[4]),
        .I2(cnt_1ms[9]),
        .I3(cnt_1ms[13]),
        .O(\cnt_1ms[15]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \cnt_1ms[15]_i_5 
       (.I0(cnt_1ms[8]),
        .I1(cnt_1ms[12]),
        .I2(cnt_1ms[2]),
        .I3(cnt_1ms[7]),
        .O(\cnt_1ms[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[1]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[1]),
        .O(p_0_in[1]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[2]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[2]),
        .O(p_0_in[2]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[3]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[3]),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[4]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[5]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[5]),
        .O(p_0_in[5]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[6]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[6]),
        .O(p_0_in[6]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[7]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[7]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[8]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[8]),
        .O(p_0_in[8]));
  LUT6 #(
    .INIT(64'hFFFB000000000000)) 
    \cnt_1ms[9]_i_1 
       (.I0(\cnt_1ms[15]_i_2_n_0 ),
        .I1(\cnt_1ms[15]_i_3_n_0 ),
        .I2(\cnt_1ms[15]_i_4_n_0 ),
        .I3(\cnt_1ms[15]_i_5_n_0 ),
        .I4(Q),
        .I5(data0[9]),
        .O(p_0_in[9]));
  FDCE \cnt_1ms_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[0]),
        .Q(cnt_1ms[0]));
  FDCE \cnt_1ms_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[10]),
        .Q(cnt_1ms[10]));
  FDCE \cnt_1ms_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[11]),
        .Q(cnt_1ms[11]));
  FDCE \cnt_1ms_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[12]),
        .Q(cnt_1ms[12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_1ms_reg[12]_i_2 
       (.CI(\cnt_1ms_reg[8]_i_2_n_0 ),
        .CO({\cnt_1ms_reg[12]_i_2_n_0 ,\cnt_1ms_reg[12]_i_2_n_1 ,\cnt_1ms_reg[12]_i_2_n_2 ,\cnt_1ms_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(cnt_1ms[12:9]));
  FDCE \cnt_1ms_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[13]),
        .Q(cnt_1ms[13]));
  FDCE \cnt_1ms_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[14]),
        .Q(cnt_1ms[14]));
  FDCE \cnt_1ms_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[15]),
        .Q(cnt_1ms[15]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_1ms_reg[15]_i_6 
       (.CI(\cnt_1ms_reg[12]_i_2_n_0 ),
        .CO({\NLW_cnt_1ms_reg[15]_i_6_CO_UNCONNECTED [3:2],\cnt_1ms_reg[15]_i_6_n_2 ,\cnt_1ms_reg[15]_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_1ms_reg[15]_i_6_O_UNCONNECTED [3],data0[15:13]}),
        .S({1'b0,cnt_1ms[15:13]}));
  FDCE \cnt_1ms_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[1]),
        .Q(cnt_1ms[1]));
  FDCE \cnt_1ms_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[2]),
        .Q(cnt_1ms[2]));
  FDCE \cnt_1ms_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[3]),
        .Q(cnt_1ms[3]));
  FDCE \cnt_1ms_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[4]),
        .Q(cnt_1ms[4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_1ms_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\cnt_1ms_reg[4]_i_2_n_0 ,\cnt_1ms_reg[4]_i_2_n_1 ,\cnt_1ms_reg[4]_i_2_n_2 ,\cnt_1ms_reg[4]_i_2_n_3 }),
        .CYINIT(cnt_1ms[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(cnt_1ms[4:1]));
  FDCE \cnt_1ms_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[5]),
        .Q(cnt_1ms[5]));
  FDCE \cnt_1ms_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[6]),
        .Q(cnt_1ms[6]));
  FDCE \cnt_1ms_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[7]),
        .Q(cnt_1ms[7]));
  FDCE \cnt_1ms_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[8]),
        .Q(cnt_1ms[8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_1ms_reg[8]_i_2 
       (.CI(\cnt_1ms_reg[4]_i_2_n_0 ),
        .CO({\cnt_1ms_reg[8]_i_2_n_0 ,\cnt_1ms_reg[8]_i_2_n_1 ,\cnt_1ms_reg[8]_i_2_n_2 ,\cnt_1ms_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(cnt_1ms[8:5]));
  FDCE \cnt_1ms_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[9]),
        .Q(cnt_1ms[9]));
  LUT5 #(
    .INIT(32'hBF001100)) 
    duty_flag_i_1
       (.I0(\high_duty_cnt[15]_i_3_n_0 ),
        .I1(\high_duty_cnt[15]_i_4_n_0 ),
        .I2(\high_duty_cnt[15]_i_5_n_0 ),
        .I3(Q),
        .I4(duty_flag_reg_n_0),
        .O(duty_flag_i_1_n_0));
  FDCE duty_flag_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(duty_flag_i_1_n_0),
        .Q(duty_flag_reg_n_0));
  LUT6 #(
    .INIT(64'h00000000FF7F0000)) 
    \freq_set_reg[0]_i_1 
       (.I0(\freq_set_reg_reg[9]_0 [9]),
        .I1(\freq_set_reg_reg[9]_0 [8]),
        .I2(\freq_set_reg_reg[9]_0 [6]),
        .I3(\freq_set_reg[4]_i_2_n_0 ),
        .I4(\freq_set_reg_reg[9]_0 [0]),
        .I5(\freq_set_reg[2]_i_2_n_0 ),
        .O(\freq_set_reg[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF7FFF7FFF7F0000)) 
    \freq_set_reg[1]_i_1 
       (.I0(\freq_set_reg_reg[9]_0 [9]),
        .I1(\freq_set_reg_reg[9]_0 [8]),
        .I2(\freq_set_reg_reg[9]_0 [6]),
        .I3(\freq_set_reg[4]_i_2_n_0 ),
        .I4(\freq_set_reg[2]_i_2_n_0 ),
        .I5(\freq_set_reg_reg[9]_0 [1]),
        .O(\freq_set_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF7F0000)) 
    \freq_set_reg[2]_i_1 
       (.I0(\freq_set_reg_reg[9]_0 [9]),
        .I1(\freq_set_reg_reg[9]_0 [8]),
        .I2(\freq_set_reg_reg[9]_0 [6]),
        .I3(\freq_set_reg[4]_i_2_n_0 ),
        .I4(\freq_set_reg_reg[9]_0 [2]),
        .I5(\freq_set_reg[2]_i_2_n_0 ),
        .O(\freq_set_reg[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h002AAAAA)) 
    \freq_set_reg[2]_i_2 
       (.I0(\freq_set_reg[3]_i_2_n_0 ),
        .I1(\freq_set_reg_reg[9]_0 [1]),
        .I2(\freq_set_reg_reg[9]_0 [0]),
        .I3(\freq_set_reg_reg[9]_0 [2]),
        .I4(\freq_set_reg_reg[9]_0 [3]),
        .O(\freq_set_reg[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0080)) 
    \freq_set_reg[3]_i_1 
       (.I0(\freq_set_reg_reg[9]_0 [9]),
        .I1(\freq_set_reg_reg[9]_0 [8]),
        .I2(\freq_set_reg_reg[9]_0 [6]),
        .I3(\freq_set_reg[4]_i_2_n_0 ),
        .I4(\freq_set_reg[3]_i_2_n_0 ),
        .I5(\freq_set_reg_reg[9]_0 [3]),
        .O(\freq_set_reg[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \freq_set_reg[3]_i_2 
       (.I0(\freq_set_reg_reg[9]_0 [4]),
        .I1(\freq_set_reg_reg[9]_0 [5]),
        .I2(\freq_set_reg_reg[9]_0 [9]),
        .I3(\freq_set_reg_reg[9]_0 [8]),
        .I4(\freq_set_reg_reg[9]_0 [7]),
        .I5(\freq_set_reg_reg[9]_0 [6]),
        .O(\freq_set_reg[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFF7F0000)) 
    \freq_set_reg[4]_i_1 
       (.I0(\freq_set_reg_reg[9]_0 [9]),
        .I1(\freq_set_reg_reg[9]_0 [8]),
        .I2(\freq_set_reg_reg[9]_0 [6]),
        .I3(\freq_set_reg[4]_i_2_n_0 ),
        .I4(\freq_set_reg_reg[9]_0 [4]),
        .O(\freq_set_reg[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1FFF)) 
    \freq_set_reg[4]_i_2 
       (.I0(\freq_set_reg_reg[9]_0 [3]),
        .I1(\freq_set_reg_reg[9]_0 [4]),
        .I2(\freq_set_reg_reg[9]_0 [5]),
        .I3(\freq_set_reg_reg[9]_0 [7]),
        .O(\freq_set_reg[4]_i_2_n_0 ));
  FDCE \freq_set_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\freq_set_reg[0]_i_1_n_0 ),
        .Q(freq_set_reg[0]));
  FDCE \freq_set_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\freq_set_reg[1]_i_1_n_0 ),
        .Q(freq_set_reg[1]));
  FDPE \freq_set_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\freq_set_reg[2]_i_1_n_0 ),
        .PRE(SR),
        .Q(freq_set_reg[2]));
  FDCE \freq_set_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\freq_set_reg[3]_i_1_n_0 ),
        .Q(freq_set_reg[3]));
  FDCE \freq_set_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\freq_set_reg[4]_i_1_n_0 ),
        .Q(freq_set_reg[4]));
  FDPE \freq_set_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\freq_set_reg_reg[9]_0 [5]),
        .PRE(SR),
        .Q(freq_set_reg[5]));
  FDPE \freq_set_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\freq_set_reg_reg[9]_0 [6]),
        .PRE(SR),
        .Q(freq_set_reg[6]));
  FDCE \freq_set_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\freq_set_reg_reg[9]_0 [7]),
        .Q(freq_set_reg[7]));
  FDCE \freq_set_reg_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\freq_set_reg_reg[9]_0 [8]),
        .Q(freq_set_reg[8]));
  FDCE \freq_set_reg_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\freq_set_reg_reg[9]_0 [9]),
        .Q(freq_set_reg[9]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 high_duty_cnt1_carry
       (.CI(1'b0),
        .CO({high_duty_cnt1_carry_n_0,high_duty_cnt1_carry_n_1,high_duty_cnt1_carry_n_2,high_duty_cnt1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({high_duty_cnt1_carry_i_1_n_0,high_duty_cnt1_carry_i_2_n_0,high_duty_cnt1_carry_i_3_n_0,high_duty_cnt1_carry_i_4_n_0}),
        .O(NLW_high_duty_cnt1_carry_O_UNCONNECTED[3:0]),
        .S({high_duty_cnt1_carry_i_5_n_0,high_duty_cnt1_carry_i_6_n_0,high_duty_cnt1_carry_i_7_n_0,high_duty_cnt1_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 high_duty_cnt1_carry__0
       (.CI(high_duty_cnt1_carry_n_0),
        .CO({high_duty_cnt1,high_duty_cnt1_carry__0_n_1,high_duty_cnt1_carry__0_n_2,high_duty_cnt1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,high_duty_cnt1_carry__0_i_1_n_0}),
        .O(NLW_high_duty_cnt1_carry__0_O_UNCONNECTED[3:0]),
        .S({high_duty_cnt1_carry__0_i_2_n_0,high_duty_cnt1_carry__0_i_3_n_0,high_duty_cnt1_carry__0_i_4_n_0,high_duty_cnt1_carry__0_i_5_n_0}));
  LUT4 #(
    .INIT(16'h44D4)) 
    high_duty_cnt1_carry__0_i_1
       (.I0(high_duty_cnt[9]),
        .I1(freq_set_reg[9]),
        .I2(freq_set_reg[8]),
        .I3(high_duty_cnt[8]),
        .O(high_duty_cnt1_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    high_duty_cnt1_carry__0_i_2
       (.I0(high_duty_cnt[15]),
        .I1(high_duty_cnt[14]),
        .O(high_duty_cnt1_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    high_duty_cnt1_carry__0_i_3
       (.I0(high_duty_cnt[13]),
        .I1(high_duty_cnt[12]),
        .O(high_duty_cnt1_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    high_duty_cnt1_carry__0_i_4
       (.I0(high_duty_cnt[11]),
        .I1(high_duty_cnt[10]),
        .O(high_duty_cnt1_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    high_duty_cnt1_carry__0_i_5
       (.I0(freq_set_reg[9]),
        .I1(high_duty_cnt[9]),
        .I2(freq_set_reg[8]),
        .I3(high_duty_cnt[8]),
        .O(high_duty_cnt1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    high_duty_cnt1_carry_i_1
       (.I0(high_duty_cnt[7]),
        .I1(freq_set_reg[7]),
        .I2(freq_set_reg[6]),
        .I3(high_duty_cnt[6]),
        .O(high_duty_cnt1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    high_duty_cnt1_carry_i_2
       (.I0(high_duty_cnt[5]),
        .I1(freq_set_reg[5]),
        .I2(freq_set_reg[4]),
        .I3(high_duty_cnt[4]),
        .O(high_duty_cnt1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    high_duty_cnt1_carry_i_3
       (.I0(high_duty_cnt[3]),
        .I1(freq_set_reg[3]),
        .I2(freq_set_reg[2]),
        .I3(high_duty_cnt[2]),
        .O(high_duty_cnt1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    high_duty_cnt1_carry_i_4
       (.I0(high_duty_cnt[1]),
        .I1(freq_set_reg[1]),
        .I2(freq_set_reg[0]),
        .I3(high_duty_cnt[0]),
        .O(high_duty_cnt1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    high_duty_cnt1_carry_i_5
       (.I0(freq_set_reg[7]),
        .I1(high_duty_cnt[7]),
        .I2(freq_set_reg[6]),
        .I3(high_duty_cnt[6]),
        .O(high_duty_cnt1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    high_duty_cnt1_carry_i_6
       (.I0(freq_set_reg[5]),
        .I1(high_duty_cnt[5]),
        .I2(freq_set_reg[4]),
        .I3(high_duty_cnt[4]),
        .O(high_duty_cnt1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    high_duty_cnt1_carry_i_7
       (.I0(freq_set_reg[3]),
        .I1(high_duty_cnt[3]),
        .I2(freq_set_reg[2]),
        .I3(high_duty_cnt[2]),
        .O(high_duty_cnt1_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    high_duty_cnt1_carry_i_8
       (.I0(freq_set_reg[1]),
        .I1(high_duty_cnt[1]),
        .I2(freq_set_reg[0]),
        .I3(high_duty_cnt[0]),
        .O(high_duty_cnt1_carry_i_8_n_0));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[0]_i_1 
       (.I0(high_duty_cnt00_in[0]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[0]),
        .I4(Q),
        .O(\high_duty_cnt[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[10]_i_1 
       (.I0(high_duty_cnt00_in[10]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[10]),
        .I4(Q),
        .O(\high_duty_cnt[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[11]_i_1 
       (.I0(high_duty_cnt00_in[11]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[11]),
        .I4(Q),
        .O(\high_duty_cnt[11]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \high_duty_cnt[11]_i_4 
       (.I0(high_duty_cnt[9]),
        .I1(freq_set_reg[9]),
        .O(\high_duty_cnt[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \high_duty_cnt[11]_i_5 
       (.I0(high_duty_cnt[8]),
        .I1(freq_set_reg[8]),
        .O(\high_duty_cnt[11]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \high_duty_cnt[11]_i_6 
       (.I0(high_duty_cnt[11]),
        .O(\high_duty_cnt[11]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \high_duty_cnt[11]_i_7 
       (.I0(high_duty_cnt[10]),
        .O(\high_duty_cnt[11]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \high_duty_cnt[11]_i_8 
       (.I0(freq_set_reg[9]),
        .I1(high_duty_cnt[9]),
        .O(\high_duty_cnt[11]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \high_duty_cnt[11]_i_9 
       (.I0(freq_set_reg[8]),
        .I1(high_duty_cnt[8]),
        .O(\high_duty_cnt[11]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[12]_i_1 
       (.I0(high_duty_cnt00_in[12]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[12]),
        .I4(Q),
        .O(\high_duty_cnt[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[13]_i_1 
       (.I0(high_duty_cnt00_in[13]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[13]),
        .I4(Q),
        .O(\high_duty_cnt[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[14]_i_1 
       (.I0(high_duty_cnt00_in[14]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[14]),
        .I4(Q),
        .O(\high_duty_cnt[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h04FF)) 
    \high_duty_cnt[15]_i_1 
       (.I0(\high_duty_cnt[15]_i_3_n_0 ),
        .I1(\high_duty_cnt[15]_i_4_n_0 ),
        .I2(\high_duty_cnt[15]_i_5_n_0 ),
        .I3(Q),
        .O(\high_duty_cnt[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \high_duty_cnt[15]_i_10 
       (.I0(high_duty_cnt[11]),
        .I1(high_duty_cnt[10]),
        .I2(high_duty_cnt[13]),
        .I3(high_duty_cnt[12]),
        .O(\high_duty_cnt[15]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000007FFF)) 
    \high_duty_cnt[15]_i_11 
       (.I0(high_duty_cnt[3]),
        .I1(high_duty_cnt[1]),
        .I2(high_duty_cnt[0]),
        .I3(high_duty_cnt[2]),
        .I4(high_duty_cnt[4]),
        .I5(high_duty_cnt[5]),
        .O(\high_duty_cnt[15]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \high_duty_cnt[15]_i_12 
       (.I0(high_duty_cnt[8]),
        .I1(high_duty_cnt[9]),
        .O(\high_duty_cnt[15]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'hDF)) 
    \high_duty_cnt[15]_i_13 
       (.I0(high_duty_cnt[14]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt[15]),
        .O(\high_duty_cnt[15]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \high_duty_cnt[15]_i_14 
       (.I0(high_duty_cnt[8]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt[14]),
        .I3(high_duty_cnt[15]),
        .I4(high_duty_cnt[4]),
        .I5(high_duty_cnt[5]),
        .O(\high_duty_cnt[15]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \high_duty_cnt[15]_i_15 
       (.I0(high_duty_cnt[6]),
        .I1(high_duty_cnt[0]),
        .I2(high_duty_cnt[7]),
        .I3(high_duty_cnt[2]),
        .O(\high_duty_cnt[15]_i_15_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \high_duty_cnt[15]_i_16 
       (.I0(high_duty_cnt[15]),
        .O(\high_duty_cnt[15]_i_16_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \high_duty_cnt[15]_i_17 
       (.I0(high_duty_cnt[14]),
        .O(\high_duty_cnt[15]_i_17_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \high_duty_cnt[15]_i_18 
       (.I0(high_duty_cnt[13]),
        .O(\high_duty_cnt[15]_i_18_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \high_duty_cnt[15]_i_19 
       (.I0(high_duty_cnt[12]),
        .O(\high_duty_cnt[15]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[15]_i_2 
       (.I0(high_duty_cnt00_in[15]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[15]),
        .I4(Q),
        .O(\high_duty_cnt[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFEF)) 
    \high_duty_cnt[15]_i_3 
       (.I0(\cnt_1ms[15]_i_5_n_0 ),
        .I1(\cnt_1ms[15]_i_4_n_0 ),
        .I2(\cnt_1ms[15]_i_3_n_0 ),
        .I3(\high_duty_cnt[15]_i_8_n_0 ),
        .I4(\high_duty_cnt[15]_i_9_n_0 ),
        .O(\high_duty_cnt[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF55551011)) 
    \high_duty_cnt[15]_i_4 
       (.I0(\high_duty_cnt[15]_i_10_n_0 ),
        .I1(high_duty_cnt[7]),
        .I2(\high_duty_cnt[15]_i_11_n_0 ),
        .I3(high_duty_cnt[6]),
        .I4(\high_duty_cnt[15]_i_12_n_0 ),
        .I5(\high_duty_cnt[15]_i_13_n_0 ),
        .O(\high_duty_cnt[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \high_duty_cnt[15]_i_5 
       (.I0(\high_duty_cnt[15]_i_14_n_0 ),
        .I1(high_duty_cnt[9]),
        .I2(high_duty_cnt[1]),
        .I3(high_duty_cnt[3]),
        .I4(\high_duty_cnt[15]_i_15_n_0 ),
        .I5(\high_duty_cnt[15]_i_10_n_0 ),
        .O(\high_duty_cnt[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF70FFFFFFFFFF)) 
    \high_duty_cnt[15]_i_8 
       (.I0(cnt_1ms[0]),
        .I1(cnt_1ms[1]),
        .I2(cnt_1ms[2]),
        .I3(cnt_1ms[14]),
        .I4(cnt_1ms[11]),
        .I5(cnt_1ms[3]),
        .O(\high_duty_cnt[15]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \high_duty_cnt[15]_i_9 
       (.I0(cnt_1ms[8]),
        .I1(cnt_1ms[7]),
        .I2(cnt_1ms[6]),
        .O(\high_duty_cnt[15]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[1]_i_1 
       (.I0(high_duty_cnt00_in[1]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[1]),
        .I4(Q),
        .O(\high_duty_cnt[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[2]_i_1 
       (.I0(high_duty_cnt00_in[2]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[2]),
        .I4(Q),
        .O(\high_duty_cnt[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[3]_i_1 
       (.I0(high_duty_cnt00_in[3]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[3]),
        .I4(Q),
        .O(\high_duty_cnt[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \high_duty_cnt[3]_i_10 
       (.I0(freq_set_reg[1]),
        .I1(high_duty_cnt[1]),
        .O(\high_duty_cnt[3]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \high_duty_cnt[3]_i_11 
       (.I0(freq_set_reg[0]),
        .I1(high_duty_cnt[0]),
        .O(\high_duty_cnt[3]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \high_duty_cnt[3]_i_4 
       (.I0(high_duty_cnt[3]),
        .I1(freq_set_reg[3]),
        .O(\high_duty_cnt[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \high_duty_cnt[3]_i_5 
       (.I0(high_duty_cnt[2]),
        .I1(freq_set_reg[2]),
        .O(\high_duty_cnt[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \high_duty_cnt[3]_i_6 
       (.I0(high_duty_cnt[1]),
        .I1(freq_set_reg[1]),
        .O(\high_duty_cnt[3]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \high_duty_cnt[3]_i_7 
       (.I0(high_duty_cnt[0]),
        .I1(freq_set_reg[0]),
        .O(\high_duty_cnt[3]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \high_duty_cnt[3]_i_8 
       (.I0(freq_set_reg[3]),
        .I1(high_duty_cnt[3]),
        .O(\high_duty_cnt[3]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \high_duty_cnt[3]_i_9 
       (.I0(freq_set_reg[2]),
        .I1(high_duty_cnt[2]),
        .O(\high_duty_cnt[3]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[4]_i_1 
       (.I0(high_duty_cnt00_in[4]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[4]),
        .I4(Q),
        .O(\high_duty_cnt[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[5]_i_1 
       (.I0(high_duty_cnt00_in[5]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[5]),
        .I4(Q),
        .O(\high_duty_cnt[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[6]_i_1 
       (.I0(high_duty_cnt00_in[6]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[6]),
        .I4(Q),
        .O(\high_duty_cnt[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[7]_i_1 
       (.I0(high_duty_cnt00_in[7]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[7]),
        .I4(Q),
        .O(\high_duty_cnt[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \high_duty_cnt[7]_i_10 
       (.I0(freq_set_reg[5]),
        .I1(high_duty_cnt[5]),
        .O(\high_duty_cnt[7]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \high_duty_cnt[7]_i_11 
       (.I0(freq_set_reg[4]),
        .I1(high_duty_cnt[4]),
        .O(\high_duty_cnt[7]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \high_duty_cnt[7]_i_4 
       (.I0(high_duty_cnt[7]),
        .I1(freq_set_reg[7]),
        .O(\high_duty_cnt[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \high_duty_cnt[7]_i_5 
       (.I0(high_duty_cnt[6]),
        .I1(freq_set_reg[6]),
        .O(\high_duty_cnt[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \high_duty_cnt[7]_i_6 
       (.I0(high_duty_cnt[5]),
        .I1(freq_set_reg[5]),
        .O(\high_duty_cnt[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \high_duty_cnt[7]_i_7 
       (.I0(high_duty_cnt[4]),
        .I1(freq_set_reg[4]),
        .O(\high_duty_cnt[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \high_duty_cnt[7]_i_8 
       (.I0(freq_set_reg[7]),
        .I1(high_duty_cnt[7]),
        .O(\high_duty_cnt[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \high_duty_cnt[7]_i_9 
       (.I0(freq_set_reg[6]),
        .I1(high_duty_cnt[6]),
        .O(\high_duty_cnt[7]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[8]_i_1 
       (.I0(high_duty_cnt00_in[8]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[8]),
        .I4(Q),
        .O(\high_duty_cnt[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2E220000)) 
    \high_duty_cnt[9]_i_1 
       (.I0(high_duty_cnt00_in[9]),
        .I1(duty_flag_reg_n_0),
        .I2(high_duty_cnt1),
        .I3(high_duty_cnt0[9]),
        .I4(Q),
        .O(\high_duty_cnt[9]_i_1_n_0 ));
  FDCE \high_duty_cnt_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[0]_i_1_n_0 ),
        .Q(high_duty_cnt[0]));
  FDCE \high_duty_cnt_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[10]_i_1_n_0 ),
        .Q(high_duty_cnt[10]));
  FDCE \high_duty_cnt_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[11]_i_1_n_0 ),
        .Q(high_duty_cnt[11]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \high_duty_cnt_reg[11]_i_2 
       (.CI(\high_duty_cnt_reg[7]_i_2_n_0 ),
        .CO({\high_duty_cnt_reg[11]_i_2_n_0 ,\high_duty_cnt_reg[11]_i_2_n_1 ,\high_duty_cnt_reg[11]_i_2_n_2 ,\high_duty_cnt_reg[11]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,high_duty_cnt[9:8]}),
        .O(high_duty_cnt00_in[11:8]),
        .S({high_duty_cnt[11:10],\high_duty_cnt[11]_i_4_n_0 ,\high_duty_cnt[11]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \high_duty_cnt_reg[11]_i_3 
       (.CI(\high_duty_cnt_reg[7]_i_3_n_0 ),
        .CO({\high_duty_cnt_reg[11]_i_3_n_0 ,\high_duty_cnt_reg[11]_i_3_n_1 ,\high_duty_cnt_reg[11]_i_3_n_2 ,\high_duty_cnt_reg[11]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(high_duty_cnt[11:8]),
        .O(high_duty_cnt0[11:8]),
        .S({\high_duty_cnt[11]_i_6_n_0 ,\high_duty_cnt[11]_i_7_n_0 ,\high_duty_cnt[11]_i_8_n_0 ,\high_duty_cnt[11]_i_9_n_0 }));
  FDCE \high_duty_cnt_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[12]_i_1_n_0 ),
        .Q(high_duty_cnt[12]));
  FDCE \high_duty_cnt_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[13]_i_1_n_0 ),
        .Q(high_duty_cnt[13]));
  FDCE \high_duty_cnt_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[14]_i_1_n_0 ),
        .Q(high_duty_cnt[14]));
  FDCE \high_duty_cnt_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[15]_i_2_n_0 ),
        .Q(high_duty_cnt[15]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \high_duty_cnt_reg[15]_i_6 
       (.CI(\high_duty_cnt_reg[11]_i_2_n_0 ),
        .CO({\NLW_high_duty_cnt_reg[15]_i_6_CO_UNCONNECTED [3],\high_duty_cnt_reg[15]_i_6_n_1 ,\high_duty_cnt_reg[15]_i_6_n_2 ,\high_duty_cnt_reg[15]_i_6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(high_duty_cnt00_in[15:12]),
        .S(high_duty_cnt[15:12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \high_duty_cnt_reg[15]_i_7 
       (.CI(\high_duty_cnt_reg[11]_i_3_n_0 ),
        .CO({\NLW_high_duty_cnt_reg[15]_i_7_CO_UNCONNECTED [3],\high_duty_cnt_reg[15]_i_7_n_1 ,\high_duty_cnt_reg[15]_i_7_n_2 ,\high_duty_cnt_reg[15]_i_7_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,high_duty_cnt[14:12]}),
        .O(high_duty_cnt0[15:12]),
        .S({\high_duty_cnt[15]_i_16_n_0 ,\high_duty_cnt[15]_i_17_n_0 ,\high_duty_cnt[15]_i_18_n_0 ,\high_duty_cnt[15]_i_19_n_0 }));
  FDCE \high_duty_cnt_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[1]_i_1_n_0 ),
        .Q(high_duty_cnt[1]));
  FDCE \high_duty_cnt_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[2]_i_1_n_0 ),
        .Q(high_duty_cnt[2]));
  FDCE \high_duty_cnt_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[3]_i_1_n_0 ),
        .Q(high_duty_cnt[3]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \high_duty_cnt_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\high_duty_cnt_reg[3]_i_2_n_0 ,\high_duty_cnt_reg[3]_i_2_n_1 ,\high_duty_cnt_reg[3]_i_2_n_2 ,\high_duty_cnt_reg[3]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(high_duty_cnt[3:0]),
        .O(high_duty_cnt00_in[3:0]),
        .S({\high_duty_cnt[3]_i_4_n_0 ,\high_duty_cnt[3]_i_5_n_0 ,\high_duty_cnt[3]_i_6_n_0 ,\high_duty_cnt[3]_i_7_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \high_duty_cnt_reg[3]_i_3 
       (.CI(1'b0),
        .CO({\high_duty_cnt_reg[3]_i_3_n_0 ,\high_duty_cnt_reg[3]_i_3_n_1 ,\high_duty_cnt_reg[3]_i_3_n_2 ,\high_duty_cnt_reg[3]_i_3_n_3 }),
        .CYINIT(1'b1),
        .DI(high_duty_cnt[3:0]),
        .O(high_duty_cnt0[3:0]),
        .S({\high_duty_cnt[3]_i_8_n_0 ,\high_duty_cnt[3]_i_9_n_0 ,\high_duty_cnt[3]_i_10_n_0 ,\high_duty_cnt[3]_i_11_n_0 }));
  FDCE \high_duty_cnt_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[4]_i_1_n_0 ),
        .Q(high_duty_cnt[4]));
  FDCE \high_duty_cnt_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[5]_i_1_n_0 ),
        .Q(high_duty_cnt[5]));
  FDCE \high_duty_cnt_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[6]_i_1_n_0 ),
        .Q(high_duty_cnt[6]));
  FDCE \high_duty_cnt_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[7]_i_1_n_0 ),
        .Q(high_duty_cnt[7]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \high_duty_cnt_reg[7]_i_2 
       (.CI(\high_duty_cnt_reg[3]_i_2_n_0 ),
        .CO({\high_duty_cnt_reg[7]_i_2_n_0 ,\high_duty_cnt_reg[7]_i_2_n_1 ,\high_duty_cnt_reg[7]_i_2_n_2 ,\high_duty_cnt_reg[7]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI(high_duty_cnt[7:4]),
        .O(high_duty_cnt00_in[7:4]),
        .S({\high_duty_cnt[7]_i_4_n_0 ,\high_duty_cnt[7]_i_5_n_0 ,\high_duty_cnt[7]_i_6_n_0 ,\high_duty_cnt[7]_i_7_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \high_duty_cnt_reg[7]_i_3 
       (.CI(\high_duty_cnt_reg[3]_i_3_n_0 ),
        .CO({\high_duty_cnt_reg[7]_i_3_n_0 ,\high_duty_cnt_reg[7]_i_3_n_1 ,\high_duty_cnt_reg[7]_i_3_n_2 ,\high_duty_cnt_reg[7]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI(high_duty_cnt[7:4]),
        .O(high_duty_cnt0[7:4]),
        .S({\high_duty_cnt[7]_i_8_n_0 ,\high_duty_cnt[7]_i_9_n_0 ,\high_duty_cnt[7]_i_10_n_0 ,\high_duty_cnt[7]_i_11_n_0 }));
  FDCE \high_duty_cnt_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[8]_i_1_n_0 ),
        .Q(high_duty_cnt[8]));
  FDCE \high_duty_cnt_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\high_duty_cnt[15]_i_1_n_0 ),
        .CLR(SR),
        .D(\high_duty_cnt[9]_i_1_n_0 ),
        .Q(high_duty_cnt[9]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 led0_carry
       (.CI(1'b0),
        .CO({led0_carry_n_0,led0_carry_n_1,led0_carry_n_2,led0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({led0_carry_i_1_n_0,led0_carry_i_2_n_0,led0_carry_i_3_n_0,led0_carry_i_4_n_0}),
        .O(NLW_led0_carry_O_UNCONNECTED[3:0]),
        .S({led0_carry_i_5_n_0,led0_carry_i_6_n_0,led0_carry_i_7_n_0,led0_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 led0_carry__0
       (.CI(led0_carry_n_0),
        .CO({led0,led0_carry__0_n_1,led0_carry__0_n_2,led0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({led0_carry__0_i_1_n_0,led0_carry__0_i_2_n_0,led0_carry__0_i_3_n_0,led0_carry__0_i_4_n_0}),
        .O(NLW_led0_carry__0_O_UNCONNECTED[3:0]),
        .S({led0_carry__0_i_5_n_0,led0_carry__0_i_6_n_0,led0_carry__0_i_7_n_0,led0_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    led0_carry__0_i_1
       (.I0(high_duty_cnt[15]),
        .I1(cnt_1ms[15]),
        .I2(high_duty_cnt[14]),
        .I3(cnt_1ms[14]),
        .O(led0_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    led0_carry__0_i_2
       (.I0(high_duty_cnt[13]),
        .I1(cnt_1ms[13]),
        .I2(high_duty_cnt[12]),
        .I3(cnt_1ms[12]),
        .O(led0_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    led0_carry__0_i_3
       (.I0(high_duty_cnt[11]),
        .I1(cnt_1ms[11]),
        .I2(high_duty_cnt[10]),
        .I3(cnt_1ms[10]),
        .O(led0_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    led0_carry__0_i_4
       (.I0(high_duty_cnt[9]),
        .I1(cnt_1ms[9]),
        .I2(high_duty_cnt[8]),
        .I3(cnt_1ms[8]),
        .O(led0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led0_carry__0_i_5
       (.I0(cnt_1ms[15]),
        .I1(high_duty_cnt[15]),
        .I2(cnt_1ms[14]),
        .I3(high_duty_cnt[14]),
        .O(led0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led0_carry__0_i_6
       (.I0(cnt_1ms[13]),
        .I1(high_duty_cnt[13]),
        .I2(cnt_1ms[12]),
        .I3(high_duty_cnt[12]),
        .O(led0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led0_carry__0_i_7
       (.I0(cnt_1ms[11]),
        .I1(high_duty_cnt[11]),
        .I2(cnt_1ms[10]),
        .I3(high_duty_cnt[10]),
        .O(led0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led0_carry__0_i_8
       (.I0(cnt_1ms[9]),
        .I1(high_duty_cnt[9]),
        .I2(cnt_1ms[8]),
        .I3(high_duty_cnt[8]),
        .O(led0_carry__0_i_8_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    led0_carry_i_1
       (.I0(high_duty_cnt[7]),
        .I1(cnt_1ms[7]),
        .I2(high_duty_cnt[6]),
        .I3(cnt_1ms[6]),
        .O(led0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    led0_carry_i_2
       (.I0(high_duty_cnt[5]),
        .I1(cnt_1ms[5]),
        .I2(high_duty_cnt[4]),
        .I3(cnt_1ms[4]),
        .O(led0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    led0_carry_i_3
       (.I0(high_duty_cnt[3]),
        .I1(cnt_1ms[3]),
        .I2(high_duty_cnt[2]),
        .I3(cnt_1ms[2]),
        .O(led0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    led0_carry_i_4
       (.I0(high_duty_cnt[1]),
        .I1(cnt_1ms[1]),
        .I2(high_duty_cnt[0]),
        .I3(cnt_1ms[0]),
        .O(led0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led0_carry_i_5
       (.I0(cnt_1ms[7]),
        .I1(high_duty_cnt[7]),
        .I2(cnt_1ms[6]),
        .I3(high_duty_cnt[6]),
        .O(led0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led0_carry_i_6
       (.I0(cnt_1ms[5]),
        .I1(high_duty_cnt[5]),
        .I2(cnt_1ms[4]),
        .I3(high_duty_cnt[4]),
        .O(led0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led0_carry_i_7
       (.I0(cnt_1ms[3]),
        .I1(high_duty_cnt[3]),
        .I2(cnt_1ms[2]),
        .I3(high_duty_cnt[2]),
        .O(led0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    led0_carry_i_8
       (.I0(cnt_1ms[1]),
        .I1(high_duty_cnt[1]),
        .I2(cnt_1ms[0]),
        .I3(high_duty_cnt[0]),
        .O(led0_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    led_INST_0
       (.I0(led0),
        .I1(Q),
        .O(led));
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
