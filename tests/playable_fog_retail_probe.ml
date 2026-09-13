import mq3.renderer.playable_fog as fog
import mq3.renderer.playable_materials as materials
import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.renderer.bsp_render_data as renderData

function main(args)
  if len(args)!=1 then print("usage: playable_fog_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;scripts=materials.buildScriptIndex(archive);if scripts is error then return scripts end if
  map=bsp.load(pk3.read(archive,"maps/q3ctf1.bsp"));if map is error then return map end if;catalog=fog.load(map,scripts[0]);if catalog is error then return catalog end if
  if len(catalog.fogs)!=2 then return error(7622,"q3ctf1 fog count mismatch") end if;value=catalog.fogs[1]
  if value.shaderName!="textures/sfx/fog_timctf1" or value.depth!=464.0 or not value.hasSurface then return error(7623,"q3ctf1 fog parameters mismatch") end if
  world=renderData.all(map,30000);if world is error then return world end if;batch=fog.build(world,catalog);if batch is error then return batch end if;if batch.commands.count<1 then return error(7624,"q3ctf1 fog has no attributed triangles") end if
  print("PASS: retail q3ctf1 fog volumes=1 depth="+str(value.depth)+" triangles="+str(batch.commands.count));return 0
end function
