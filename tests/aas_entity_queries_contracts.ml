import mq3.botlib.aas_entities as entities
import mq3.botlib.aas_movement_queries as movement
import mq3.botlib.aas_query_syscalls as queryAbi
import mq3.compat.numeric as n

struct Contents calls value last end struct
struct Machine data mask end struct
function contents(context,point) context.calls=context.calls+1;context.last=point;return context.value end function
function require(ok,message) if not ok then return error(9912,message) end if;return 1 end function
function source(origin,solid)
  return entities.EntityState(2,4,origin,[10.0,20.0,30.0],[7.0,8.0,9.0],[-15.0,-15.0,-24.0],[15.0,15.0,32.0],3,solid,5,6,7,8,9,10,11,12,13)
end function

function main(args)
  count=0;state=entities.create(8);entities.startFrame(state,10.0);entities.update(state,2,source([1.0,2.0,3.0],2),void);info=entities.info(state,2)
  count=count+require(info.valid and info.number==2 and info.type==2 and info.flags==4,"entity identity and validity copied")
  count=count+require(info.ltime==10.0 and info.updateTime==10.0,"first entity update uses zero previous time")
  count=count+require(info.origin==[1.0,2.0,3.0] and info.oldOrigin==[7.0,8.0,9.0] and info.lastVisOrigin==[0.0,0.0,0.0],"entity vectors copied")
  count=count+require(info.groundent==3 and info.solid==2 and info.modelindex==5 and info.modelindex2==6 and info.frame==7 and info.event==8 and info.eventParm==9 and info.powerups==10 and info.weapon==11 and info.legsAnim==12 and info.torsoAnim==13,"entity scalar tail copied")
  entities.startFrame(state,12.5);count=count+require(not entities.info(state,2).valid,"start frame invalidates stale entities")
  next=source([4.0,5.0,6.0],entities.SOLID_BSP);entities.update(state,2,next,[[-2.0,-3.0,-4.0],[2.0,3.0,4.0]]);info=entities.info(state,2)
  count=count+require(info.updateTime==2.5 and info.lastVisOrigin==[1.0,2.0,3.0],"repeat update keeps timing and previous visible origin")
  count=count+require(info.mins==[-2.0,-3.0,-4.0] and info.maxs==[2.0,3.0,4.0],"BSP entity takes model bounds")
  entities.startFrame(state,13.0);entities.update(state,2,void,void);count=count+require(not entities.info(state,2).valid and entities.info(state,2).origin==[4.0,5.0,6.0],"unlink retains last invalid entity info")
  count=count+require(not entities.info(state,-1).valid and entities.info(state,7).origin==[0.0,0.0,0.0],"invalid and unused entity info is zeroed")
  water=Contents(0,movement.CONTENTS_WATER,void);count=count+require(movement.swimming(water,contents,[10.0,20.0,30.0]) and water.last==[10.0,20.0,28.0],"swimming samples two units below origin")
  water.value=1;count=count+require(not movement.swimming(water,contents,[10.0,20.0,30.0]),"non-liquid contents do not swim")
  count=count+require(try(entities.update(state,8,next,void)) is error,"entity capacity enforced")
  vm=Machine(bytes(1024,0),1023);n.writeU32(vm.data,100,9);n.writeU32(vm.data,104,17);n.writeU32(vm.data,108,n.floatBits(1.5));n.writeU32(vm.data,112,n.floatBits(2.5));n.writeU32(vm.data,116,n.floatBits(3.5));n.writeU32(vm.data,172,entities.SOLID_BSP);n.writeU32(vm.data,176,6);n.writeU32(vm.data,208,13)
  decoded=queryAbi.readEntityState(vm,100);count=count+require(decoded.type==9 and decoded.flags==17 and decoded.origin==[1.5,2.5,3.5] and decoded.solid==entities.SOLID_BSP and decoded.modelindex==6 and decoded.torsoAnim==13,"bot_entitystate_t 112-byte ABI decoded")
  entities.startFrame(state,15.0);entities.update(state,3,decoded,void);queryAbi.entityInfo(state,vm,3,400)
  count=count+require(n.readI32(vm.data,400)==1 and n.readI32(vm.data,404)==9 and n.readI32(vm.data,420)==3,"aas_entityinfo_t header ABI written")
  count=count+require(n.bitsFloat(n.readU32(vm.data,424))==1.5 and n.readI32(vm.data,536)==13,"aas_entityinfo_t vector and scalar tail ABI written")
  print("PASS: "+str(count)+" AAS entity/movement-query contracts");return 0
end function
