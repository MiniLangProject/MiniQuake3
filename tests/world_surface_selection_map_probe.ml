import std.fs as fs
import mq3.format.bsp as bsp
import mq3.client.playable_player as player
import mq3.client.playable_viewer as viewer
import mq3.renderer.bsp_render_data as render
import mq3.renderer.world_surface_selection as selection

function main(args)
  if len(args)!=1 then return error(7492,"expected BSP path") end if
  map=bsp.load(fs.readAllBytes(args[0]));if map is error then return map end if
  spawn=player.load(map);if spawn is error then return spawn end if
  cache=selection.buildCache(map,render.DEFAULT_PATCH_ERROR);if cache is error then return cache end if
  camera=viewer.camera(spawn.position,spawn.yaw,0.0,0.0,0.0)
  cfg=selection.defaults(1280,720);prepared=selection.prepareCached(cache,camera,cfg);if prepared is error then return prepared end if
  chosen=prepared.selection
  if not chosen.pvsUsed then return error(7493,"q3dm1 PVS was not used") end if
  if chosen.selectedSurfaceCount<=0 or len(prepared.renderData.triangles)<=0 then return error(7494,"q3dm1 selected no render geometry") end if
  if len(prepared.renderData.triangles)!=chosen.estimatedTriangleCount or prepared.renderData.truncated then return error(7495,"cached render count differs from selection") end if
  maxFace=-1;for each face in chosen.faceIndexes if face>maxFace then maxFace=face end if end for
  print("PASS: q3dm1 world selection totalFaces="+str(map.counts[13])+" cachedTriangles="+str(cache.totalTriangleCount)+" candidateSurfaces="+str(chosen.candidateCount)+" selectedSurfaces="+str(chosen.selectedSurfaceCount)+" selectedTriangles="+str(chosen.estimatedTriangleCount)+" maxSelectedFace="+str(maxFace)+" pvsRejectedLeaves="+str(chosen.rejectedPvs)+" frustumRejected="+str(chosen.rejectedFrustum)+" backfaceRejected="+str(chosen.rejectedBackface)+" budgetRejected="+str(chosen.rejectedBudget))
  return 0
end function
