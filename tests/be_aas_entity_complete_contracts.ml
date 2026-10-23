import mq3.botlib.aas_entities as entity
import mq3.botlib.aas_runtime as runtime

function require(ok,label) if not ok then return error(7991,"be_aas_entity complete: "+label) end if;return 1 end function
function value(type,model,origin,mins,maxs) return entity.EntityState(type,3,origin,[1.0,2.0,3.0],[4.0,5.0,6.0],mins,maxs,1022,entity.SOLID_BBOX,model,model+1,7,8,9,10,11,12,13) end function
function main(args)
  state=entity.create(8);checks=0
  checks=checks+require(entity.AAS_EntityInfo(state,3).number==0 and not entity.AAS_EntityInfo(state,3).valid,"empty info")
  entity.AAS_UpdateEntity(state,1,value(1,7,[10.0,20.0,30.0],[-2.0,-3.0,-4.0],[2.0,3.0,4.0]),void)
  first=entity.AAS_EntityInfo(state,1);checks=checks+require(first.valid and first.number==1 and first.updateTime==0.0 and first.lastVisOrigin==[0.0,0.0,0.0],"first update")
  state.time=2.5;entity.AAS_UpdateEntity(state,1,value(1,7,[11.0,22.0,33.0],[-2.0,-3.0,-4.0],[2.0,3.0,4.0]),void);second=entity.AAS_EntityInfo(state,1)
  checks=checks+require(second.updateTime==2.5 and second.lastVisOrigin==[10.0,20.0,30.0] and second.oldOrigin==[4.0,5.0,6.0],"history")
  checks=checks+require(entity.AAS_EntityOrigin(state,1)==[11.0,22.0,33.0] and entity.AAS_EntityModelindex(state,1)==7 and entity.AAS_EntityModelNum(state,1)==7 and entity.AAS_EntityType(state,1)==1,"queries")
  size=entity.AAS_EntitySize(state,1);checks=checks+require(size[0]==[-2.0,-3.0,-4.0] and size[1]==[2.0,3.0,4.0],"size")
  bsp=entity.AAS_EntityBSPData(state,1);checks=checks+require(bsp.absmins==[9.0,19.0,29.0] and bsp.absmaxs==[13.0,25.0,37.0] and bsp.modelnum==6,"bsp data")
  entity.AAS_UpdateEntity(state,2,value(entity.ET_MOVER,9,[90.0,80.0,70.0],[-1.0,-1.0,-1.0],[1.0,1.0,1.0]),void);mover=entity.AAS_OriginOfMoverWithModelNum(state,9);checks=checks+require(mover[0] and mover[1]==[90.0,80.0,70.0],"mover origin")
  entity.AAS_UpdateEntity(state,3,value(1,7,[12.0,23.0,34.0],[-1.0,-1.0,-1.0],[1.0,1.0,1.0]),void);checks=checks+require(entity.AAS_NearestEntity(state,[12.0,23.0,34.0],7)==3,"nearest")
  fake=runtime.Runtime(void,true,[],2.5,0);entity.bindRuntime(state,fake);checks=checks+require(entity.AAS_NextEntity(state,-1)==1 and entity.AAS_NextEntity(state,1)==2,"next")
  state.areaLinks[1]=[4,5];entity.AAS_ResetEntityLinks(state);checks=checks+require(len(state.areaLinks[1])==0,"reset links")
  state.areaLinks[1]=[4];entity.AAS_InvalidateEntities(state);checks=checks+require(not state.entities[1].valid and state.entities[1].number==1,"invalidate")
  entity.AAS_UnlinkInvalidEntities(state);checks=checks+require(len(state.areaLinks[1])==0,"unlink invalid")
  state.areaLinks[1]=[3];entity.AAS_UpdateEntity(state,1,void,void);checks=checks+require(len(state.areaLinks[1])==0,"null update unlink")
  checks=checks+require(entity.AAS_BestReachableEntityArea(state,7)==0,"invalid reachable entity")
  print("PASS: "+str(checks)+" complete be_aas_entity contracts");return 0
end function
