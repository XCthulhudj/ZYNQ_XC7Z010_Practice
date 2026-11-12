# 2026-10-31T14:37:06.062249700
import vitis

client = vitis.create_client()
client.set_workspace(path="Led_Project")

comp = client.get_component(name="empty_application")
comp.build()

vitis.dispose()

