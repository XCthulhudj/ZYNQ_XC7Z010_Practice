# 2026-11-02T09:23:34.194838700
import vitis

client = vitis.create_client()
client.set_workspace(path="Led_Project")

platform = client.get_component(name="platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../../PL/IP_ps_configuration/zynq7_wrapper.xsa")

status = platform.build()

comp = client.get_component(name="empty_application")
comp.build()

comp.build()

comp.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../../PL/IP_ps_configuration/zynq7_wrapper.xsa")

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../../PL/IP_ps_configuration/zynq7_wrapper.xsa")

status = platform.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../../PL/IP_ps_configuration/zynq7_wrapper.xsa")

status = platform.build()

comp.build()

comp.build()

