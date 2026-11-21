import mq3.format.bsp as bsp
import mq3.format.pk3 as pk3
import mq3.renderer.world_surface_selection as selection
import mq3.renderer.qvm_scene_geometry as scene
import mq3.renderer.bsp_render_data as render
import mq3.compat.numeric as n

function main(args)
  if len(args)!=1 then return error(7492,"expected Retail pak0 path") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  map=bsp.load(pk3.read(archive,"maps/q3dm0.bsp"));if map is error then return map end if
  range=selection.worldSurfaceRange(map);if range is error then return range end if
  if range[0]!=0 or range[1]>=map.counts[13] then return error(7492,"q3dm0 world and inline model ranges missing") end if
  leafFaces=selection.visibleFaces(map,0,false,void);if leafFaces is error then return leafFaces end if
  for each face in leafFaces[0] if face>=range[1] then return error(7492,"moving door leaked into static leaf selection") end if end for
  cache=selection.buildCache(map,render.DEFAULT_PATCH_ERROR);if cache is error then return cache end if
  rawLeafFaces=array(map.counts[13],false)
  for slot=0 to map.counts[5]-1 face=n.readI32(map.data,map.offsets[5]+slot*4);if face>=0 and face<map.counts[13] then rawLeafFaces[face]=true end if end for
  moving=0
  for model=12 to 13
    brush=scene.loadInlineModel(map,model,65536);if brush is error then return brush end if
    if len(brush[0].renderData.triangles)!=6 then return error(7492,"Retail door brush triangles missing") end if
    for each triangle in brush[0].renderData.triangles
      if not rawLeafFaces[triangle.faceIndex] then return error(7492,"Retail door is absent from leaf marksurfaces") end if
      if len(cache.trianglesByFace[triangle.faceIndex])!=0 then return error(7492,"door face cached in static world") end if
      moving=moving+1
    end for
  end for
  print("PASS: q3dm0 world range="+str(range[1])+" selected="+str(len(leafFaces[0]))+" movingDoorTriangles="+str(moving)+" staticCopies=0")
  return 0
end function
