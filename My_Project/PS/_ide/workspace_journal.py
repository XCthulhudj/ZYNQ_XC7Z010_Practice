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

