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
  catalog=materials.load(archive,map,256,64);if catalog is error then return catalog end if
  twoSided=0;rgbVertex=0;rgbEntity=0;alphaPortal=0;alphaEntity=0;tcVector=0;deformWave=0;deformOther=0;opaqueSort=0;transparentSort=0
  for each material in catalog.materials
    if material.twoSided then twoSided=twoSided+1 end if
    if material.sort<=3.0 then opaqueSort=opaqueSort+1 else transparentSort=transparentSort+1 end if
    for each stage in material.stages
      if stage.rgbGen=="vertex" or stage.rgbGen=="exactvertex" or stage.rgbGen=="lightingdiffuse" or stage.rgbGen=="oneminusvertex" then rgbVertex=rgbVertex+1 end if
      if stage.rgbGen=="entity" or stage.rgbGen=="oneminusentity" then rgbEntity=rgbEntity+1 end if
      if stage.alphaGen=="portal" then alphaPortal=alphaPortal+1 end if
      if stage.alphaGen=="entity" or stage.alphaGen=="oneminusentity" then alphaEntity=alphaEntity+1 end if
      if stage.tcGen=="vector" then tcVector=tcVector+1 end if
    end for
    for each deform in material.deforms if deform.kind=="wave" then deformWave=deformWave+1 else deformOther=deformOther+1 end if end for
  end for
  data=renderData.all(map,20000);if data is error then return data end if
  flags=array(map.counts[1],false)
  for index=0 to map.counts[1]-1 name=materials.shaderName(map,index);if name is error then return name end if;flags[index]=sky.isSkyShader(name) end for
  batch=worldBatch.buildMaterials(data,catalog,flags);if batch is error then return batch end if
  lastSort=0.0;for each pass in batch.passes if pass.sort<lastSort then return error(7492,"q3dm1 material passes are not shader-sorted") end if;lastSort=pass.sort end for
  if batch.animatedPasses<1 or batch.uvModifiedPasses<1 or batch.blendedPasses<1 or batch.generatorPasses<1 or batch.alphaTestPasses<1 or batch.turbulentPasses<1 or batch.stretchPasses<1 or batch.environmentPasses<1 or batch.destinationAlphaPasses<1 or batch.deformedPasses<1 or twoSided<1 then return error(7492,"q3dm1 effects missing: attempted="+str(catalog.attempted)+" loaded="+str(catalog.loaded)+" textures="+str(catalog.textureCount)+" twoSided="+str(twoSided)+" animated="+str(batch.animatedPasses)+" tcMod="+str(batch.uvModifiedPasses)+" blended="+str(batch.blendedPasses)+" wave="+str(batch.generatorPasses)+" alpha="+str(batch.alphaTestPasses)+" turb="+str(batch.turbulentPasses)+" stretch="+str(batch.stretchPasses)+" environment="+str(batch.environmentPasses)+" destinationAlpha="+str(batch.destinationAlphaPasses)+" clamped="+str(batch.clampedPasses)+" deformed="+str(batch.deformedPasses)) end if
  print("q3dm1 generators: rgbVertex="+str(rgbVertex)+" rgbEntity="+str(rgbEntity)+" alphaPortal="+str(alphaPortal)+" alphaEntity="+str(alphaEntity)+" tcVector="+str(tcVector)+" deformWave="+str(deformWave)+" deformOther="+str(deformOther)+" opaqueSort="+str(opaqueSort)+" transparentSort="+str(transparentSort))
  print("PASS: q3dm1 materials="+str(catalog.loaded)+" textures="+str(catalog.textureCount)+" twoSided="+str(twoSided)+" sourceTriangles="+str(batch.sourceTriangles)+" drawableTriangles="+str(batch.drawableTriangles)+" emittedTriangles="+str(batch.emittedTriangles)+" passes="+str(len(batch.passes))+" animated="+str(batch.animatedPasses)+" tcMod="+str(batch.uvModifiedPasses)+" blended="+str(batch.blendedPasses)+" rgbGenWave="+str(batch.generatorPasses)+" alphaTest="+str(batch.alphaTestPasses)+" turb="+str(batch.turbulentPasses)+" stretch="+str(batch.stretchPasses)+" environment="+str(batch.environmentPasses)+" filter="+str(batch.filterPasses)+" destinationAlpha="+str(batch.destinationAlphaPasses)+" clamped="+str(batch.clampedPasses)+" deformed="+str(batch.deformedPasses)+" skySkipped="+str(batch.skippedSky))
  return 0
end function
