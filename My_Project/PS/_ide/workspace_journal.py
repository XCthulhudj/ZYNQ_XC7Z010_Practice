# 2026-11-12T11:36:08.755567300
import vitis

client = vitis.create_client()
client.set_workspace(path="PS")

comp = client.get_component(name="Core0")
comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

