import mq3.botlib.aas_entities as entity
import mq3.botlib.aas_runtime as runtime
import mq3.compat.numeric as n

function v(value) return str(n.trunc32(value[0]))+","+str(n.trunc32(value[1]))+","+str(n.trunc32(value[2])) end function
function b(value) if value then return 1 end if;return 0 end function
function value(type,model,origin,mins,maxs) return entity.EntityState(type,0,origin,[0.0,0.0,0.0],[0.0,0.0,0.0],mins,maxs,0,entity.SOLID_BBOX,model,0,0,0,0,0,0,0,0) end function
function main(args)
  state=entity.create(6)
  entity.update(state,1,value(1,7,[10.0,20.0,30.0],[-2.0,-3.0,-4.0],[2.0,3.0,4.0]),void);state.areaLinks[1]=[77]
  entity.update(state,2,value(entity.ET_MOVER,9,[90.0,80.0,70.0],[0.0,0.0,0.0],[0.0,0.0,0.0]),void)
  entity.update(state,3,value(0,7,[12.0,21.0,33.0],[0.0,0.0,0.0],[0.0,0.0,0.0]),void)
  info=entity.AAS_EntityInfo(state,1);print("info="+str(b(info.valid))+","+str(info.number)+","+str(info.modelindex));print("origin="+v(entity.AAS_EntityOrigin(state,1)));print("model="+str(entity.AAS_EntityModelindex(state,1))+","+str(entity.AAS_EntityType(state,1))+","+str(entity.AAS_EntityModelNum(state,1)))
  mover=entity.AAS_OriginOfMoverWithModelNum(state,9);print("mover="+str(b(mover[0]))+":"+v(mover[1]));size=entity.AAS_EntitySize(state,1);print("size="+v(size[0])+":"+v(size[1]));bsp=entity.AAS_EntityBSPData(state,1);print("bsp="+v(bsp.absmins)+":"+v(bsp.absmaxs)+":"+str(bsp.modelnum))
  print("nearest="+str(entity.AAS_NearestEntity(state,[12.0,21.0,33.0],7)));print("best="+str(entity.AAS_BestReachableEntityArea(state,1)));state.runtime=runtime.Runtime(void,true,[],0.0,0);print("next="+str(entity.AAS_NextEntity(state,-1))+","+str(entity.AAS_NextEntity(state,1)))
  state.areaLinks[4]=[4];entity.AAS_UnlinkInvalidEntities(state);print("unlinks=1,1");entity.AAS_InvalidateEntities(state);print("invalid="+str(b(state.entities[2].valid))+","+str(state.entities[2].number));entity.AAS_ResetEntityLinks(state);print("reset="+str(b(len(state.areaLinks[1])==0))+",1");return 0
end function
