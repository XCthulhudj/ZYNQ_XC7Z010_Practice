# 2026-11-03T09:37:59.632789500
import vitis

client = vitis.create_client()
client.set_workspace(path="PS")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "MotionCtrl",hw_design = "$COMPONENT_LOCATION/../../PL/zynq_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",generate_dtb = False,advanced_options = advanced_options,compiler = "gcc")

comp = client.create_app_component(name="Core0",platform = "$COMPONENT_LOCATION/../MotionCtrl/export/MotionCtrl/MotionCtrl.xpfm",domain = "standalone_ps7_cortexa9_0",template = "empty_application")

vitis.dispose()

vitis.dispose()

