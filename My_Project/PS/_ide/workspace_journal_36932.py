# 2026-11-04T14:03:31.547367
import vitis

client = vitis.create_client()
client.set_workspace(path="PS")

platform = client.get_component(name="MotionCtrl")
status = platform.build()

comp = client.get_component(name="Core0")
comp.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../PL/zynq_wrapper.xsa")

status = platform.build()

comp.build()

comp.build()

