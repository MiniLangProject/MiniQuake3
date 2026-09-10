import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.renderer.playable_materials as materials

function main(args)
  if len(args)!=2 then return error(7488,"usage: playable_materials_real <pak0.pk3> <map path>") end if
  archive=pk3.open(args[0]);map=bsp.load(pk3.read(archive,args[1]))
  catalog=materials.load(archive,map,64,64)
  tga=0;jpeg=0
  for each material in catalog.materials
    if materials.endsIgnoreCase(material.imageName,".tga") then tga=tga+1 else jpeg=jpeg+1 end if
  end for
  if catalog.loaded<1 then return error(7488,"no q3dm1 material images resolved") end if
  if catalog.animatedStageCount<1 or catalog.effectStageCount<1 then return error(7488,"q3dm1 shader animation/effect stages missing") end if
  print("PASS: "+str(catalog.loaded)+" materials / "+str(catalog.textureCount)+" textures ("+str(tga)+" primary TGA, "+str(jpeg)+" primary JPEG), "+str(catalog.animatedStageCount)+" animated and "+str(catalog.effectStageCount)+" effect stages from "+str(catalog.scripts)+" shader scripts")
  return 0
end function
