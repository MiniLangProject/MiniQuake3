import mq3.format.pk3 as pk3
import mq3.format.md3 as md3
import mq3.renderer.surface_md3 as surfaceMd3
import mq3.renderer.qvm_scene_geometry as geometry

function main(args)
  if len(args)!=1 then return error(7670,"usage: stencil_shadow_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  data=pk3.read(archive,"models/players/sarge/lower.md3");if data is error then return data end if
  model=md3.load(data);if model is error then return model end if
  if len(model.surfaces)==0 then return error(7670,"retail lower.md3 has no surfaces") end if
  surface=model.surfaces[0];frame=surfaceMd3.lerpVertexes(surface.mesh,0,0,0.0);if frame is error then return frame end if
  light=[0.4285714286,0.2857142857,0.8571428571];sides=geometry.shadowVolumeSides(frame[0],surface.mesh.triangles,surface.mesh.numTriangles,light);if sides is error then return sides end if
  if len(sides)==0 or len(sides)>surface.mesh.numTriangles*3 then return error(7670,"retail stencil silhouette count outside bounds") end if
  first=sides[0];delta=[first[1][0]-first[0][0],first[1][1]-first[0][1],first[1][2]-first[0][2]]
  if delta[0]>-219.42 or delta[0]<-219.44 or delta[1]>-146.27 or delta[1]<-146.30 or delta[2]>-438.84 or delta[2]<-438.87 then return error(7670,"retail stencil side did not retain 512-unit extrusion") end if
  print("PASS: retail stencil shadow model surfaces="+str(model.numSurfaces)+" triangles="+str(surface.mesh.numTriangles)+" silhouetteSides="+str(len(sides)))
  return 0
end function
