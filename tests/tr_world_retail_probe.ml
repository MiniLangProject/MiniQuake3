import mq3.format.pk3 as pk3
import mq3.format.bsp as bsp
import mq3.client.playable_player as player
import mq3.client.playable_viewer as viewer
import mq3.renderer.bsp_render_data as render
import mq3.renderer.world_surface_selection as selection
import mq3.renderer.tr_world_runtime as world

function main(args)
  if len(args)!=2 then return error(7795,"usage: tr_world_retail_probe <pak> <map>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if;map=bsp.load(pk3.read(archive,args[1]));if map is error then return map end if
  spawn=player.load(map);if spawn is error then return spawn end if;cache=selection.buildCache(map,render.DEFAULT_PATCH_ERROR);if cache is error then return cache end if
  camera=viewer.camera(spawn.position,spawn.yaw,0.0,0.0,0.0);cfg=selection.defaults(1280,720);prepared=world.R_AddWorldSurfaces(cache,camera,cfg);if prepared is error then return prepared end if
  chosen=prepared.selection;if not chosen.pvsUsed or chosen.cameraLeaf<0 or chosen.cameraCluster<0 or chosen.selectedSurfaceCount<=0 or chosen.estimatedTriangleCount!=len(prepared.renderData.triangles) or prepared.renderData.truncated then return error(7796,"Retail world traversal did not produce a complete PVS selection") end if
  direct=selection.prepareCached(cache,camera,cfg);if direct is error then return direct end if;if not selection.sameFaces(chosen.faceIndexes,direct.selection.faceIndexes) then return error(7797,"facade and productive world selection differ") end if
  print("PASS: "+args[1]+" tr_world faces="+str(map.counts[13])+" nodes="+str(map.counts[3])+" leaves="+str(map.counts[4])+" cluster="+str(chosen.cameraCluster)+" candidates="+str(chosen.candidateCount)+" selected="+str(chosen.selectedSurfaceCount)+" triangles="+str(chosen.estimatedTriangleCount)+" pvsRejected="+str(chosen.rejectedPvs)+" frustumRejected="+str(chosen.rejectedFrustum)+" backfaceRejected="+str(chosen.rejectedBackface));return 0
end function
