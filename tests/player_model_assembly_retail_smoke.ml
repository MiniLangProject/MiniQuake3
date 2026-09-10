import mq3.format.pk3 as pk3
import mq3.renderer.player_model_assembly as player

function main(args)
  if len(args)<1 then print("usage: player_model_assembly_retail_smoke <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  base="models/players/sarge/"
  lower=pk3.read(archive,base+"lower.md3");if lower is error then return lower end if
  upper=pk3.read(archive,base+"upper.md3");if upper is error then return upper end if
  head=pk3.read(archive,base+"head.md3");if head is error then return head end if
  value=player.load(lower,upper,head);if value is error then return value end if
  still=player.animation(0,0,0.0)
  assembled=player.assemble(value,still,still,still,player.identityTransform());if assembled is error then return assembled end if
  triangles=player.render(assembled,2);if triangles is error then return triangles end if
  if len(triangles)<3 then return error(7531,"retail player produced too few triangles") end if
  print("PASS: retail sarge lower="+str(value.lower.numSurfaces)+" upper="+str(value.upper.numSurfaces)+" head="+str(value.head.numSurfaces)+" sampled="+str(len(triangles))+" torsoZ="+str(assembled.upper.transform.origin[2])+" headZ="+str(assembled.head.transform.origin[2]));return 0
end function
