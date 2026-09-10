import mq3.format.pk3 as pk3
import mq3.format.player_animation as animation
import mq3.renderer.player_model_assembly as player
import mq3.renderer.player_render_cache as cache
import mq3.renderer.player_skins as skins

function triangleCount(model)
  count=0
  for each surface in model.surfaces count=count+surface.mesh.numTriangles end for
  return count
end function

function main(args)
  if len(args)!=1 then print("usage: player_render_quality_retail_probe <pak0.pk3>");return 2 end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  base="models/players/sarge/"
  lower=pk3.read(archive,base+"lower.md3");if lower is error then return lower end if
  upper=pk3.read(archive,base+"upper.md3");if upper is error then return upper end if
  head=pk3.read(archive,base+"head.md3");if head is error then return head end if
  models=player.load(lower,upper,head);if models is error then return models end if
  skinSet=skins.loadSargeDefault(archive);if skinSet is error then return skinSet end if
  policy=cache.lodPolicy(256.0,768.0,1536.0,2,4);light=cache.lighting([0.35,-0.45,0.82],0.28,0.72)
  value=cache.createDetailed(models,skinSet,4,8,4,policy,light);if value is error then return value end if
  sample=animation.FrameSample(0,0,0.0,false)
  triangles=cache.renderTargetDetailed(value,sample,sample,player.identityTransform(),[0.0,0.0,0.0],true);if triangles is error then return triangles end if
  expected=triangleCount(models.lower)+triangleCount(models.upper)+triangleCount(models.head)
  if len(triangles)!=expected then return error(7543,"retail full LOD dropped triangles") end if
  lowerCount=0;upperCount=0;headCount=0
  for each triangle in triangles
    if triangle.imageName=="" or len(triangle.lights)!=3 then return error(7544,"retail triangle lacks skin or lighting") end if
    for each value in triangle.lights if value<0.0 or value>1.0 then return error(7545,"retail light outside range") end if end for
    if triangle.part==player.LOWER_PART then lowerCount=lowerCount+1 else if triangle.part==player.UPPER_PART then upperCount=upperCount+1 else headCount=headCount+1 end if
  end for
  if lowerCount==0 or upperCount==0 or headCount==0 then return error(7546,"retail model piece disappeared") end if
  mediumTarget=player.identityTransform();mediumTarget.origin=[512.0,0.0,0.0]
  farTarget=player.identityTransform();farTarget.origin=[1024.0,0.0,0.0]
  medium=cache.renderTargetDetailed(value,sample,sample,mediumTarget,[0.0,0.0,0.0],true);if medium is error then return medium end if
  far=cache.renderTargetDetailed(value,sample,sample,farTarget,[0.0,0.0,0.0],true);if far is error then return far end if
  state=cache.stats(value)
  if len(medium)>=len(triangles) or len(far)>=len(medium) or state.builds!=1 or state.hits!=2 then return error(7547,"retail LOD did not reuse the full pose") end if
  print("PASS: retail Sarge full="+str(expected)+" medium="+str(len(medium))+" far="+str(len(far))+" lower="+str(lowerCount)+" upper="+str(upperCount)+" head="+str(headCount)+" skinImages="+str(skinSet.uniqueImages)+" poseBuilds="+str(state.builds)+" poseHits="+str(state.hits))
  return 0
end function
