import mq3.renderer.md3_entity as entity
import mq3.compat.numeric as numeric

function req(value,label) if not value then return error(7696,"MD3 entity contract: "+label) end if;return 1 end function
function matrix() value=array(16,0.0);value[5]=1.0;value[11]=-1.0;return value end function
function main(args)
  count=0;projection=matrix();mins=[-3.0,-4.0,0.0];maxs=[3.0,4.0,0.0];origin=[0.0,0.0,0.0];forward=[1.0,0.0,0.0]
  frames=entity.normalizeFrames(5,7,6,entity.RF_WRAP_FRAMES)
  count=count+req(frames.frame==2 and frames.oldFrame==1 and frames.wrapped and not frames.repaired,"continuous frames wrap")
  frames=entity.normalizeFrames(5,-1,6,entity.RF_WRAP_FRAMES)
  count=count+req(frames.frame==0 and frames.oldFrame==0 and frames.wrapped and frames.repaired,"negative wrapped frame repairs pair")
  frames=entity.normalizeFrames(5,1,8,0)
  count=count+req(frames.frame==0 and frames.oldFrame==0 and not frames.wrapped and frames.repaired,"invalid old frame repairs pair")
  frames=entity.normalizeFrames(5,4,0,0)
  count=count+req(frames.frame==4 and frames.oldFrame==0 and not frames.repaired,"valid frames retained")
  count=count+req(try(entity.normalizeFrames(0,0,0,0)) is error,"empty model rejected")
  count=count+req(entity.radiusFromBounds(mins,maxs)==5.0,"bounds radius")
  count=count+req(entity.radiusFromBounds([-8.0,-2.0,-3.0],[1.0,7.0,6.0])>12.20 and entity.radiusFromBounds([-8.0,-2.0,-3.0],[1.0,7.0,6.0])<12.21,"farthest corner radius")
  count=count+req(try(entity.radiusFromBounds([0.0],[1.0,2.0,3.0])) is error,"bounds shape checked")
  count=count+req(numeric.floatBits(entity.projectRadius(5.0,[100.0,0.0,0.0],origin,forward,projection))==numeric.floatBits(numeric.f32(0.05)),"projected radius")
  count=count+req(entity.projectRadius(5.0,[2.0,0.0,0.0],origin,forward,projection)==1.0,"projected radius clamps")
  count=count+req(entity.projectRadius(5.0,[0.0,0.0,0.0],origin,forward,projection)==0.0,"near plane intersection")
  count=count+req(entity.projectRadius(5.0,[-1.0,0.0,0.0],origin,forward,projection)==0.0,"behind view")
  count=count+req(try(entity.projectRadius(1.0,[0.0],origin,forward,projection)) is error,"location shape checked")
  count=count+req(try(entity.projectRadius(1.0,origin,origin,forward,[1.0])) is error,"projection shape checked")
  count=count+req(entity.computeLod(3,mins,maxs,[100.0,0.0,0.0],origin,forward,projection,5.0,0)==2,"far model selects last LOD")
  count=count+req(entity.computeLod(3,mins,maxs,[25.0,0.0,0.0],origin,forward,projection,2.0,0)==1,"middle model selects middle LOD")
  count=count+req(entity.computeLod(3,mins,maxs,[2.0,0.0,0.0],origin,forward,projection,5.0,0)==0,"near model selects full detail")
  count=count+req(entity.computeLod(3,mins,maxs,[-2.0,0.0,0.0],origin,forward,projection,5.0,0)==0,"near-plane intersection selects full detail")
  count=count+req(entity.computeLod(4,mins,maxs,[100.0,0.0,0.0],origin,forward,projection,99.0,0)==0,"lod scale capped at twenty")
  count=count+req(entity.computeLod(4,mins,maxs,[100.0,0.0,0.0],origin,forward,projection,1.0,1)==3,"positive bias clamps")
  count=count+req(entity.computeLod(4,mins,maxs,[100.0,0.0,0.0],origin,forward,projection,1.0,-9)==0,"negative bias clamps")
  count=count+req(entity.computeLod(1,mins,maxs,[100.0,0.0,0.0],origin,forward,projection,5.0,9)==0,"single LOD remains zero")
  count=count+req(try(entity.computeLod(0,mins,maxs,origin,origin,forward,projection,5.0,0)) is error,"empty LOD set rejected")
  count=count+req(numeric.floatBits(entity.projectRadius(-5.0,[100.0,0.0,0.0],origin,forward,projection))==numeric.floatBits(numeric.f32(0.05)),"projected radius takes absolute value")
  print("PASS: "+str(count)+" MD3 entity contracts");return 0
end function
