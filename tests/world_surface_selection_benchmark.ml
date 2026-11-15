// Fixed retail camera sweep; includes selection only, not BSP/cache loading.
import std.fs as fs
import std.time as time
import mq3.format.bsp as bsp
import mq3.client.playable_player as player
import mq3.client.playable_viewer as viewer
import mq3.renderer.bsp_render_data as render
import mq3.renderer.world_surface_selection as selection

function main(args)
  if len(args)!=1 then return error(7492,"expected retail BSP path") end if
  map=bsp.load(fs.readAllBytes(args[0]));if map is error then return map end if
  spawn=player.load(map);if spawn is error then return spawn end if
  cache=selection.buildCache(map,render.DEFAULT_PATCH_ERROR);if cache is error then return cache end if
  cfg=selection.defaults(1280,720);cfg.triangleBudget=cache.totalTriangleCount
  camera=viewer.camera(spawn.position,spawn.yaw,0.0,0.0,0.0)
  warmup=selection.chooseCached(cache,camera,cfg);if warmup is error then return warmup end if
  started=time.ticks();selected=0;rejected=0
  for frame=0 to 359
    camera.yaw=spawn.yaw+frame
    chosen=selection.chooseCached(cache,camera,cfg);if chosen is error then return chosen end if
    selected=selected+chosen.selectedSurfaceCount;rejected=rejected+chosen.rejectedBudget
  end for
  elapsed=time.ticks()-started
  if selected<=0 or rejected!=0 then return error(7492,"retail sweep dropped visible world surfaces") end if
  print "World selection sweep: frames=360 elapsedMs="+str(elapsed)+" averageMs="+str(elapsed/360.0)+" selectedSurfaces="+str(selected)+" budgetRejected="+str(rejected)
  return 0
end function
