# 2026-11-16T09:38:02.515378600
import vitis

client = vitis.create_client()
client.set_workspace(path="PS")

comp = client.get_component(name="Core0")
comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

platform = client.get_component(name="MotionCtrl")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../PL/zynq_wrapper.xsa")

status = platform.build()

comp.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../PL/zynq_wrapper.xsa")

status = platform.build()

comp.build()

comp.build()

domain = platform.get_domain(name="zynq_fsbl")

status = domain.regenerate()

status = platform.build()

comp.build()

vitis.dispose()

