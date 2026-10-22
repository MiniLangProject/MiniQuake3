import std.fs as fs
import mq3.format.bsp as bsp
import mq3.renderer.tr_bsp_runtime as tr

function main(args)
  if len(args)!=1 then return error(7712,"expected retail BSP path") end if
  data=fs.readAllBytes(args[0]);map=bsp.load(data);if map is error then return map end if
  state=tr.createState();world=tr.RE_LoadWorldMap(state,args[0],data,void);if world is error then return world end if
  if not state.worldMapLoaded or state.world!=world then return error(7713,"world was not published atomically") end if
  if len(world.shaders)!=map.counts[1] or len(world.surfaces)!=map.counts[13] or len(world.planes)!=map.counts[2] then return error(7714,"retained world lump counts differ") end if
  if len(world.nodes)!=map.counts[3]+map.counts[4] or len(world.models)!=map.counts[7] then return error(7715,"retained BSP tree/model counts differ") end if
  if world.models[0].renderData.triangleCount<=0 or not world.lightGrid.valid then return error(7716,"retail geometry or light grid missing") end if
  token=tr.R_GetEntityToken(world,64);if token!=[true,"{"] then return error(7717,"entity token stream missing") end if
  print("PASS: retail tr_bsp world shaders="+str(len(world.shaders))+" surfaces="+str(len(world.surfaces))+" planes="+str(len(world.planes))+" nodes="+str(len(world.nodes))+" models="+str(len(world.models))+" lightmaps="+str(len(world.lightmaps))+" triangles="+str(world.models[0].renderData.triangleCount));return 0
end function
