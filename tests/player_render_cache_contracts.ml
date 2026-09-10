import mq3.format.md3 as md3
import mq3.format.player_animation as animation
import mq3.renderer.model_tags as tags
import mq3.renderer.player_model_assembly as player
import mq3.renderer.player_render_cache as cache
import mq3.renderer.surface_md3 as mesh

function require(ok,text) if not ok then return error(7541,text) end if;return 1 end function
function near(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.0001 end function

function surface(name,frames,count)
  packed=[];triangles=[]
  for frame=0 to frames-1
    vertices=[]
    for index=0 to count*3-1 vertices=vertices+[mesh.vertex(64+frame*64,index*2,0,0x40)] end for
    packed=packed+[vertices]
  end for
  tex=[]
  for index=0 to count*3-1 tex=tex+[[0.0,0.0]] end for
  for index=0 to count-1 triangles=triangles+[index*3,index*3+1,index*3+2] end for
  return md3.Surface(name,[name],mesh.surface(frames,count*3,count,triangles,tex,packed))
end function

function model(name,frames,tagName,triangleCount)
  axis=player.identityAxis();tagFrames=[]
  for frame=0 to frames-1
    current=[];if tagName!="" then current=[tags.tag(tagName,[frame*1.0,0.0,1.0],axis)] end if
    tagFrames=tagFrames+[current]
  end for
  return md3.Model(name,0,frames,0,1,0,[],tagFrames,[surface(name,frames,triangleCount)],[[-8.0,-8.0,-8.0],[8.0,8.0,8.0]])
end function

function frameSample(oldFrame,frame,backlerp) return animation.FrameSample(oldFrame,frame,backlerp,false) end function

function main(args)
  count=0
  models=player.models(model("lower",2,"tag_torso",3),model("upper",2,"tag_head",3),model("head",1,"",3))
  value=cache.create(models,5,2,4,3)
  count=count+require(value.phaseCount==5 and value.maxEntries==2,"configuration retained")
  a=frameSample(0,1,0.24);b=frameSample(0,1,0.26)
  ka=cache.keyFor(value,a,a);kb=cache.keyFor(value,b,b)
  count=count+require(ka.lowerPhase==1 and kb.lowerPhase==1,"nearby samples share discrete phase")
  count=count+require(near(cache.phaseBacklerp(value,1),0.25),"phase reconstructs canonical backlerp")
  rootA=player.identityTransform();rootB=player.transform([10.0,0.0,0.0],player.identityAxis())
  first=cache.renderTarget(value,a,a,rootA)
  count=count+require(len(first)==4,"triangle budget is a hard cap")
  complete=true;for each triangle in first if triangle==void then complete=false end if end for
  count=count+require(complete,"fixed-size transformed output fills every triangle slot")
  count=count+require(first[0].part==player.LOWER_PART and first[2].part==player.UPPER_PART and first[3].part==player.HEAD_PART,"LOD samples stable complete-model stream")
  second=cache.renderTarget(value,b,b,rootB);state=cache.stats(value)
  count=count+require(state.hits==1 and state.misses==1 and state.builds==1,"quantized phase reuses assembly")
  count=count+require(near(second[0].positions[0][0]-first[0].positions[0][0],10.0),"cached identity geometry transforms per target")
  count=count+require(state.frameTargets==2 and state.frameTriangles==8,"frame work is measured")
  third=cache.renderTarget(value,frameSample(1,0,0.0),a,rootA);state=cache.stats(value)
  count=count+require(state.entries==2 and state.builds==2,"second key fills entry budget")
  count=count+require(len(third)==4,"each target keeps triangle cap")
  count=count+require(try(cache.renderTarget(value,a,a,rootA)) is error,"target budget enforced")
  cache.beginFrame(value)
  count=count+require(cache.stats(value).frameTargets==0 and cache.stats(value).frameTriangles==0,"frame counters reset")
  cache.renderTarget(value,frameSample(0,1,0.75),frameSample(0,1,0.75),rootA);state=cache.stats(value)
  count=count+require(state.entries==2 and state.evictions==1,"FIFO eviction is bounded")
  cache.renderTarget(value,a,a,rootA);state=cache.stats(value)
  count=count+require(state.misses==4 and state.evictions==2,"evicted oldest key misses deterministically")
  cache.renderTarget(value,b,b,rootB);state=cache.stats(value)
  count=count+require(state.hits==2 and state.builds==4,"repopulated phase is reusable")
  count=count+require(cache.phaseFor(value,frameSample(0,1,0.0))==0 and cache.phaseFor(value,frameSample(0,1,1.0))==4,"phase endpoints exact")
  one=cache.create(models,1,1,0,1)
  count=count+require(cache.keyFor(one,a,b).lowerPhase==0 and near(cache.phaseBacklerp(one,0),0.0),"single phase disables interpolation")
  count=count+require(len(cache.renderTarget(one,a,b,rootA))==0,"zero triangle budget supported")
  count=count+require(try(cache.create(models,0,1,1,1)) is error,"zero phase count rejected")
  count=count+require(try(cache.create(models,1,0,1,1)) is error,"zero entry budget rejected")
  count=count+require(try(cache.create(models,1,1,-1,1)) is error,"negative triangle budget rejected")
  count=count+require(try(cache.create(models,1,1,1,0)) is error,"zero target budget rejected")
  count=count+require(try(cache.keyFor(value,frameSample(0,1,-0.1),a)) is error,"invalid sample rejected")
  cache.beginFrame(value)
  count=count+require(try(cache.renderTarget(value,a,a,player.transform([0.0],player.identityAxis()))) is error,"invalid target rejected")
  count=count+require(cache.sameKey(ka,cache.keyFor(value,a,a)),"keys compare by all sample fields")
  print("PASS: "+str(count)+" player-render cache contracts");return 0
end function
