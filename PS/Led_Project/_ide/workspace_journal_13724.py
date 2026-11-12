# 2026-10-31T13:53:49.107085600
import vitis

client = vitis.create_client()
client.set_workspace(path="Led_Project")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../../PL/IP_ps_configuration/zynq7_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",generate_dtb = False,advanced_options = advanced_options,compiler = "gcc")

comp = client.create_app_component(name="empty_application",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "empty_application")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="empty_application")
comp.build()

