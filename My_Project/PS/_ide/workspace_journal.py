# 2026-11-21T10:07:33.153636500
import vitis

client = vitis.create_client()
client.set_workspace(path="PS")

platform = client.get_component(name="MotionCtrl")
status = platform.build()

comp = client.get_component(name="Core0")
comp.build()

status = platform.build()

domain = platform.get_domain(name="standalone_ps7_cortexa9_0")

status = domain.set_config(option = "os", param = "standalone_stdin", value = "ps7_uart_1")

status = domain.set_config(option = "os", param = "standalone_stdout", value = "ps7_uart_1")

status = domain.set_lib(lib_name="xilrsa", path="E:\Xilinx\2025.1.1\Vitis\data\embeddedsw\lib\sw_services\xilrsa_v1_8")

status = domain.set_lib(lib_name="xilflash", path="E:\Xilinx\2025.1.1\Vitis\data\embeddedsw\lib\sw_services\xilflash_v4_12")

status = domain.set_lib(lib_name="xilffs", path="E:\Xilinx\2025.1.1\Vitis\data\embeddedsw\lib\sw_services\xilffs_v5_4")

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../PL/zynq_wrapper.xsa")

status = platform.build()

comp.build()

comp.build()

comp.build()

status = domain.regenerate()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../PL/zynq_wrapper.xsa")

status = platform.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../PL/zynq_wrapper.xsa")

status = platform.build()

comp.build()

comp.build()

domain = platform.get_domain(name="zynq_fsbl")

status = domain.set_config(option = "os", param = "standalone_stdin", value = "ps7_uart_1")

status = domain.set_config(option = "os", param = "standalone_stdout", value = "ps7_uart_1")

status = domain.regenerate()

status = domain.regenerate()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

status = platform.build()

comp.build()

comp.build()

comp.build()

comp.build()

vitis.dispose()

