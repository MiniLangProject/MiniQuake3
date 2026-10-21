import std.fs as fs
import mq3.format.bsp as bsp
import mq3.renderer.qvm_scene_geometry as geometry

function main(args)
  if len(args)!=1 then return error(7678,"expected BSP path") end if
  map=bsp.load(fs.readAllBytes(args[0]));if map is error then return map end if
  if map.counts[7]<2 then return error(7678,"map has no inline brush models") end if
  models=0;surfaces=0;triangles=0;lightmapped=0
  for index=1 to map.counts[7]-1
    model=geometry.loadInlineModel(map,index,65536);if model is error then return model end if
    if not geometry.isInlineModel(model) then return error(7678,"inline model wrapper missing") end if
    models=models+1;surfaces=surfaces+model[0].renderData.surfaceCount;triangles=triangles+len(model[0].renderData.triangles)
    for each triangle in model[0].renderData.triangles if triangle.lightmapIndex>=0 then lightmapped=lightmapped+1 end if end for
  end for
  if surfaces<=0 or triangles<=0 or lightmapped<=0 then return error(7678,"inline brush render data incomplete") end if
  print("PASS: inline BSP models="+str(models)+" surfaces="+str(surfaces)+" triangles="+str(triangles)+" lightmapped="+str(lightmapped))
  return 0
end function
