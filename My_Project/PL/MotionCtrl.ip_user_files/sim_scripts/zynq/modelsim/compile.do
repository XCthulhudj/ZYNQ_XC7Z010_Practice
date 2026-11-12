vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_21
vlib modelsim_lib/msim/processing_system7_vip_v1_0_23
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/interrupt_control_v3_1_5
vlib modelsim_lib/msim/axi_gpio_v2_0_37
vlib modelsim_lib/msim/xlconstant_v1_1_10
vlib modelsim_lib/msim/proc_sys_reset_v5_0_17
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_35

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_21 modelsim_lib/msim/axi_vip_v1_1_21
vmap processing_system7_vip_v1_0_23 modelsim_lib/msim/processing_system7_vip_v1_0_23
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 modelsim_lib/msim/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 modelsim_lib/msim/axi_gpio_v2_0_37
vmap xlconstant_v1_1_10 modelsim_lib/msim/xlconstant_v1_1_10
vmap proc_sys_reset_v5_0_17 modelsim_lib/msim/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_35 modelsim_lib/msim/axi_register_slice_v2_1_35

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
"../../../bd/zynq/sim/zynq.v" \

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
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/d800/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_2/sim/bd_bc6a_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/2da8/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_3/sim/bd_bc6a_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/dce3/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_4/sim/bd_bc6a_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/cef3/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_5/sim/bd_bc6a_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_6/sim/bd_bc6a_sarn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_7/sim/bd_bc6a_srn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_8/sim/bd_bc6a_sawn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_9/sim/bd_bc6a_swn_0.sv" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_10/sim/bd_bc6a_sbn_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/7f4f/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_11/sim/bd_bc6a_m00s2a_0.sv" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/0133/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/ip/ip_12/sim/bd_bc6a_m00e_0.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/bd_0/sim/bd_bc6a.v" \

vlog -work smartconnect_v1_0  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/3718/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work axi_register_slice_v2_1_35  -incr -mfcu  "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/c5b7/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_23 -L xilinx_vip "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/ec67/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/6cfa/hdl" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/f0b6/hdl/verilog" "+incdir+../../../../MotionCtrl.gen/sources_1/bd/zynq/ipshared/a8e4/hdl/verilog" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/rsb/busdef" "+incdir+E:/Xilinx/2025.1.1/Vivado/data/xilinx_vip/include" \
"../../../bd/zynq/ip/zynq_axi_smc_1/sim/zynq_axi_smc_1.sv" \

vcom -work xil_defaultlib  -93  \
"../../../bd/zynq/ip/zynq_rst_ps7_0_50M_1/sim/zynq_rst_ps7_0_50M_1.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

