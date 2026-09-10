import mq3.format.pk3 as pk3
import mq3.format.md3 as md3

function main(args)
  if len(args)<1 then print("usage: md3_asset_retail_smoke <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  paths=["models/players/sarge/lower.md3","models/weapons2/machinegun/machinegun.md3","models/weapons2/shotgun/shotgun.md3","models/powerups/armor/armor_yel.md3"]
  data=void;chosen=""
  for each path in paths candidate=try(pk3.read(archive,path));if candidate is not error then data=candidate;chosen=path;break end if end for
  if data==void then return error(7511,"retail MD3 candidate missing") end if
  model=md3.load(data);if model is error then return model end if
  triangles=0;vertices=0
  for surfaceIndex=0 to len(model.surfaces)-1
    surface=model.surfaces[surfaceIndex];triangles=triangles+surface.mesh.numTriangles;vertices=vertices+surface.mesh.numVerts
    preview=md3.renderTriangles(model,surfaceIndex,0,0,0.0,4);if preview is error then return preview end if
  end for
  print("PASS: retail MD3 "+chosen+" frames="+str(model.numFrames)+" surfaces="+str(model.numSurfaces)+" vertices="+str(vertices)+" triangles="+str(triangles));return 0
end function
