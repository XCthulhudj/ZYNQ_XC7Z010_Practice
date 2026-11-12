# 2026-11-04T09:58:07.886574600
import vitis

client = vitis.create_client()
client.set_workspace(path="PS")

platform = client.get_component(name="MotionCtrl")
status = platform.build()

comp = client.get_component(name="Core0")
comp.build()

comp.build()

comp.build()

status = comp.clean()

comp.build()

status = platform.build()

comp.build()

comp.build()

vitis.dispose()

