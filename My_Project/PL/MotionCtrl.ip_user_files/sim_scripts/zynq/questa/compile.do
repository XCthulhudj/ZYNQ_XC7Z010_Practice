vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_21
vlib questa_lib/msim/processing_system7_vip_v1_0_23
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/interrupt_control_v3_1_5
vlib questa_lib/msim/axi_gpio_v2_0_37
vlib questa_lib/msim/xlconstant_v1_1_10
vlib questa_lib/msim/proc_sys_reset_v5_0_17
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_register_slice_v2_1_35

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_21 questa_lib/msim/axi_vip_v1_1_21
vmap processing_system7_vip_v1_0_23 questa_lib/msim/processing_system7_vip_v1_0_23
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 questa_lib/msim/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 questa_lib/msim/axi_gpio_v2_0_37
vmap xlconstant_v1_1_10 questa_lib/msim/xlconstant_v1_1_10
vmap proc_sys_reset_v5_0_17 questa_lib/msim/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_35 questa_lib/msim/axi_register_slice_v2_1_35

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"E:/Xilinx/2025.1.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/Xilinx/2025.1.1/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"E:/Xilinx/2025.1.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"E:/Xilinx/2025.1.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_21  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f16f/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_23  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_processing_system7_0_0/sim/zynq_processing_system7_0_0.v" \
"../../../bd/zynq/ip/zynq_pl_led_blink_0_0/sim/zynq_pl_led_blink_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4  -93  \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5  -93  \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_37  -93  \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/0271/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/zynq/ip/zynq_axi_gpio_0_0/sim/zynq_axi_gpio_0_0.vhd" \

vlog -work xlconstant_v1_1_10  -incr -mfcu  "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a165/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_0/sim/bd_bc6a_one_0.v" \

vcom -work proc_sys_reset_v5_0_17  -93  \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_1/sim/bd_bc6a_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/3718/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_2/sim/bd_bc6a_arinsw_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_3/sim/bd_bc6a_rinsw_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_4/sim/bd_bc6a_awinsw_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_5/sim/bd_bc6a_winsw_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_6/sim/bd_bc6a_binsw_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_7/sim/bd_bc6a_aroutsw_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_8/sim/bd_bc6a_routsw_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_9/sim/bd_bc6a_awoutsw_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_10/sim/bd_bc6a_woutsw_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_11/sim/bd_bc6a_boutsw_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_12/sim/bd_bc6a_arni_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_13/sim/bd_bc6a_rni_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_14/sim/bd_bc6a_awni_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_15/sim/bd_bc6a_wni_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_16/sim/bd_bc6a_bni_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/d800/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_17/sim/bd_bc6a_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/2da8/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_18/sim/bd_bc6a_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/dce3/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_19/sim/bd_bc6a_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/cef3/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_20/sim/bd_bc6a_s00a2s_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_21/sim/bd_bc6a_sarn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_22/sim/bd_bc6a_srn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_23/sim/bd_bc6a_sawn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_24/sim/bd_bc6a_swn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_25/sim/bd_bc6a_sbn_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/7f4f/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_26/sim/bd_bc6a_m00s2a_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_27/sim/bd_bc6a_m00arn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_28/sim/bd_bc6a_m00rn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_29/sim/bd_bc6a_m00awn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_30/sim/bd_bc6a_m00wn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_31/sim/bd_bc6a_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/0133/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_32/sim/bd_bc6a_m00e_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_33/sim/bd_bc6a_m01s2a_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_34/sim/bd_bc6a_m01arn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_35/sim/bd_bc6a_m01rn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_36/sim/bd_bc6a_m01awn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_37/sim/bd_bc6a_m01wn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_38/sim/bd_bc6a_m01bn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_39/sim/bd_bc6a_m01e_0.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/sim/bd_bc6a.v" \

vlog -work axi_register_slice_v2_1_35  -incr -mfcu  "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/c5b7/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/sim/zynq_axi_smc_1.sv" \

vcom -work xil_defaultlib  -93  \
"../../../bd/zynq/ip/zynq_rst_ps7_0_50M_1/sim/zynq_rst_ps7_0_50M_1.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/sim/zynq.v" \
"../../../bd/zynq/ipshared/d9f5/hdl/breath_led_slave_lite_v1_0_S00_AXI.v" \
"../../../bd/zynq/ipshared/d9f5/hdl/breath_led_top.v" \
"../../../bd/zynq/ipshared/d9f5/hdl/breath_led.v" \
"../../../bd/zynq/ip/zynq_breath_led_0_0/sim/zynq_breath_led_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

