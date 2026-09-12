import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.renderer.bsp_render_data as renderData
import mq3.renderer.playable_materials as materials
import mq3.renderer.playable_world_batch as worldBatch
import mq3.client.playable_sky as sky

function main(args)
  if len(args)!=2 then return error(7492,"usage: playable_world_material_retail_probe <pak0.pk3> <map>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,args[1]));if map is error then return map end if
  catalog=materials.load(archive,map,128,64);if catalog is error then return catalog end if
  data=renderData.all(map,20000);if data is error then return data end if
  flags=array(map.counts[1],false)
  for index=0 to map.counts[1]-1 name=materials.shaderName(map,index);if name is error then return name end if;flags[index]=sky.isSkyShader(name) end for
  batch=worldBatch.buildMaterials(data,catalog,flags);if batch is error then return batch end if
  if batch.animatedPasses<1 or batch.uvModifiedPasses<1 or batch.blendedPasses<1 or batch.generatorPasses<1 or batch.alphaTestPasses<1 then return error(7492,"q3dm1 retained material effects missing") end if
  print("PASS: q3dm1 materials="+str(catalog.loaded)+" textures="+str(catalog.textureCount)+" sourceTriangles="+str(batch.sourceTriangles)+" drawableTriangles="+str(batch.drawableTriangles)+" emittedTriangles="+str(batch.emittedTriangles)+" passes="+str(len(batch.passes))+" animated="+str(batch.animatedPasses)+" tcMod="+str(batch.uvModifiedPasses)+" blended="+str(batch.blendedPasses)+" rgbGenWave="+str(batch.generatorPasses)+" alphaTest="+str(batch.alphaTestPasses)+" skySkipped="+str(batch.skippedSky))
  return 0
end function
