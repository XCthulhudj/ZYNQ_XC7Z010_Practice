# 2026-11-18T14:33:02.231410300
import vitis

client = vitis.create_client()
client.set_workspace(path="PS")

platform = client.get_component(name="MotionCtrl")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../PL/zynq_wrapper.xsa")

status = platform.build()

comp = client.get_component(name="Core0")
comp.build()

comp.build()

vitis.dispose()

