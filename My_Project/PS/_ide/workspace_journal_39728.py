# 2026-11-17T08:34:05.780338200
import vitis

client = vitis.create_client()
client.set_workspace(path="PS")

comp = client.get_component(name="Core0")
comp.build()

platform = client.get_component(name="MotionCtrl")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../PL/zynq_wrapper.xsa")

status = platform.build()

comp.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../PL/zynq_wrapper.xsa")

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = comp.clean()

comp.build()

status = platform.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

domain = platform.get_domain(name="standalone_ps7_cortexa9_0")

status = domain.regenerate()

status = platform.build()

comp.build()

vitis.dispose()

