import mq3.format.md3 as md3
import mq3.format.player_animation as animation
import mq3.renderer.model_tags as tags
import mq3.renderer.player_model_assembly as player
import mq3.renderer.player_render_cache as cache
import mq3.renderer.player_skins as skins
import mq3.renderer.surface_md3 as mesh

function require(ok,text) if not ok then return error(7542,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.001 end function

function surface(name,frames,count,packedNormal)
  packed=[];triangles=[]
  for frame=0 to frames-1
    vertices=[]
    for index=0 to count*3-1 vertices=vertices+[mesh.vertex(64+frame*8,index*2,0,packedNormal)] end for
    packed=packed+[vertices]
  end for
  tex=[]
  for index=0 to count*3-1 tex=tex+[[index*0.01,index*0.02]] end for
  for index=0 to count-1 triangles=triangles+[index*3,index*3+1,index*3+2] end for
  return md3.Surface(name,["placeholder"],mesh.surface(frames,count*3,count,triangles,tex,packed))
end function

function model(name,frames,tagName,surfaces)
  axis=player.identityAxis();tagFrames=[]
  for frame=0 to frames-1
    current=[];if tagName!="" then current=[tags.tag(tagName,[0.0,0.0,8.0],axis)] end if
    tagFrames=tagFrames+[current]
  end for
  return md3.Model(name,0,frames,0,len(surfaces),0,[],tagFrames,surfaces,[[-8.0,-8.0,-8.0],[8.0,8.0,8.0]])
end function

function resolved(path,surface,shader,image)
  return skins.ResolvedSkin(path,[skins.Binding(surface,shader,image,void)],0)
end function

function suite()
  return skins.SargeDefault(resolved("lower","l_body","skin/lower","lower_image"),resolved("upper","u_body","skin/upper","upper_image"),resolved("head","h_head","skin/head","head_image"),3,0)
end function

function frameSample() return animation.FrameSample(0,1,0.25,false) end function
function target(x) return player.transform([x,0.0,0.0],player.identityAxis()) end function

function main(args)
  count=0
  models=player.models(model("lower",2,"tag_torso",[surface("l_body",2,6,0x40)]),model("upper",2,"tag_head",[surface("u_body",2,4,0x40)]),model("head",1,"",[surface("h_head",1,2,0x40)]))
  policy=cache.lodPolicy(100.0,200.0,400.0,2,4);light=cache.lighting(mesh.decodeNormal(0x40),0.2,0.8)
  value=cache.createDetailed(models,suite(),4,4,3,policy,light)
  pose=frameSample()
  count=count+require(value.detailed and value.maxTrianglesPerTarget==8192,"detailed cache retains full surfaces")
  full=cache.renderTargetDetailed(value,pose,pose,target(50.0),[0.0,0.0,0.0],true)
  count=count+require(len(full)==12,"full LOD keeps every lower upper and head triangle")
  count=count+require(full[0].lod==cache.LOD_FULL and full[6].part==player.UPPER_PART and full[10].part==player.HEAD_PART,"complete model stream and LOD retained")
  count=count+require(full[0].surfaceName=="l_body" and full[0].shaderName=="skin/lower" and full[0].imageName=="lower_image","lower surface uses skin override")
  count=count+require(full[6].shaderName=="skin/upper" and full[10].shaderName=="skin/head","upper and head surfaces use their skins")
  count=count+require(full[0].lights[0]>0.98 and full[11].lights[2]>0.98,"decoded MD3 normals drive per-vertex light")
  medium=cache.renderTargetDetailed(value,pose,pose,target(150.0),[0.0,0.0,0.0],true)
  count=count+require(len(medium)==6 and medium[0].lod==cache.LOD_MEDIUM,"medium LOD strides each surface")
  count=count+require(medium[0].part==player.LOWER_PART and medium[3].part==player.UPPER_PART and medium[5].part==player.HEAD_PART,"medium LOD preserves every model piece")
  far=cache.renderTargetDetailed(value,pose,pose,target(300.0),[0.0,0.0,0.0],true)
  count=count+require(len(far)==4 and far[0].lod==cache.LOD_FAR,"far LOD reduces geometry")
  count=count+require(far[0].part==player.LOWER_PART and far[2].part==player.UPPER_PART and far[3].part==player.HEAD_PART,"far LOD preserves every model piece")
  state=cache.stats(value)
  count=count+require(state.builds==1 and state.hits==2 and state.sourceTriangles==12,"all distance levels reuse one complete pose")
  count=count+require(state.frameFull==1 and state.frameMedium==1 and state.frameFar==1 and state.frameTriangles==22,"LOD work is measured")
  cache.beginFrame(value)
  hidden=cache.renderTargetDetailed(value,pose,pose,target(50.0),[0.0,0.0,0.0],false)
  distant=cache.renderTargetDetailed(value,pose,pose,target(401.0),[0.0,0.0,0.0],true)
  count=count+require(len(hidden)==0 and len(distant)==0,"hidden and beyond-range targets are culled")
  count=count+require(value.frameTargets==0 and value.frameCulled==2,"culled targets consume no detailed target budget")
  opposite=cache.createDetailed(models,suite(),2,2,1,policy,cache.lighting([0.0,0.0,-1.0],0.25,0.75))
  dark=cache.renderTargetDetailed(opposite,pose,pose,target(0.0),[0.0,0.0,0.0],true)
  count=count+require(dark[0].lights[0]>=0.25 and dark[0].lights[0]<0.26,"back-facing normals receive ambient light")
  broken=skins.SargeDefault(resolved("lower","wrong","x","x"),suite().upper,suite().head,3,0)
  missing=cache.createDetailed(models,broken,2,2,1,policy,light)
  count=count+require(try(cache.renderTargetDetailed(missing,pose,pose,target(0.0),[0.0,0.0,0.0],true)) is error,"missing skin surface fails instead of drawing a placeholder")
  count=count+require(try(cache.lodPolicy(100.0,90.0,400.0,2,4)) is error,"unordered LOD distances rejected")
  count=count+require(try(cache.lodPolicy(100.0,200.0,400.0,1,4)) is error,"invalid LOD stride rejected")
  count=count+require(try(cache.lighting([0.0,0.0,0.0],0.2,0.8)) is error,"zero light direction rejected")
  count=count+require(try(cache.createDetailed(models,void,2,2,1,policy,light)) is error,"missing skin suite rejected")
  print("PASS: "+str(count)+" player-render quality contracts");return 0
end function
