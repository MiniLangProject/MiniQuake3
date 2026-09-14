import mq3.botlib.ai_predict_visible_position as visible
import mq3.botlib.ai_predict_visible_position_syscalls as traps
import mq3.botlib.ai_resource_pools as resources
import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.aas_routing as routing
import mq3.format.aas as aas
import mq3.compat.numeric as n
import std.fs as fs

struct Host mode traces passEntities masks end struct
struct Machine data mask end struct
function require(ok,label) if not ok then return error(7599,"AI visible position: "+label) end if;return 1 end function
function trace(host,start,finish,passEntity,mask)
  host.traces=host.traces+1;host.passEntities=host.passEntities+[passEntity];host.masks=host.masks+[mask]
  if host.mode==1 and finish[0]==0.0 and finish[1]==10.0 then return 1.0 end if
  if host.mode==2 and finish[0]==0.0 and finish[1]==20.0 then return 1.0 end if;return 0.5
end function
function same(a,b) return a[0]==b[0] and a[1]==b[1] and a[2]==b[2] end function
function arg(vm,base,index,value) n.writeU32(vm.data,base+index*4,value);return void end function
function putVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function putGoal(vm,address,value) putVector(vm.data,address,value.origin);n.writeU32(vm.data,address+12,value.areaNum);putVector(vm.data,address+16,value.mins);putVector(vm.data,address+28,value.maxs);n.writeU32(vm.data,address+40,value.entityNum);n.writeU32(vm.data,address+44,value.number);n.writeU32(vm.data,address+48,value.flags);n.writeU32(vm.data,address+52,value.itemInfo);return void end function
function vector(data,address) return [n.bitsFloat(n.readI32(data,address)),n.bitsFloat(n.readI32(data,address+4)),n.bitsFloat(n.readI32(data,address+8))] end function

function main(args)
  if len(args)!=2 then return 2 end if;map=aas.load(fs.readAllBytes(args[0]));if map is error then return map end if;aasState=aasRuntime.create(map);router=routing.create(aasState);if router is error then return router end if
  checks=0;host=Host(0,0,[],[]);runtime=visible.create(router,host,trace);goal=resources.Goal([100.0,0.0,0.0],4,[0.0,0.0,0.0],[0.0,0.0,0.0],9,0,0,0)
  result=visible.predict(runtime,[0.0,0.0,0.0],1,goal,routing.TFL_DEFAULT);checks=checks+require(result.found and result.hops==2 and result.reachNums==[2,4] and same(result.target,[100.0,0.0,0.0]),"weighted two-hop route reaches goal")
  checks=checks+require(host.traces==4 and host.passEntities==[9,9,9,9] and host.masks==[0x10001,0x10001,0x10001,0x10001],"two visibility traces per hop use goal entity and mask")
  host.mode=1;host.traces=0;result=visible.predict(runtime,[0.0,0.0,0.0],1,goal,routing.TFL_DEFAULT);checks=checks+require(result.found and result.hops==1 and same(result.target,[0.0,10.0,0.0]) and host.traces==1,"visible reach start returns first")
  host.mode=2;host.traces=0;result=visible.predict(runtime,[0.0,0.0,0.0],1,goal,routing.TFL_DEFAULT);checks=checks+require(result.found and result.hops==1 and same(result.target,[0.0,20.0,0.0]) and host.traces==2,"visible reach end returns second")
  checks=checks+require(not visible.predict(runtime,[0.0,0.0,0.0],0,goal,routing.TFL_DEFAULT).found and not visible.predict(runtime,[0.0,0.0,0.0],1,resources.Goal([0.0,0.0,0.0],0,[],[],0,0,0,0),routing.TFL_DEFAULT).found,"zero source or goal area rejected")
  checks=checks+require(not visible.predict(runtime,[0.0,0.0,0.0],4,goal,routing.TFL_DEFAULT).found,"already in goal area matches released false result")
  checks=checks+require(visible.nextReachability(runtime,[0.0,0.0,0.0],1,4,1,goal,routing.TFL_DEFAULT)==2,"best reach uses route time plus reach travel time")
  longMap=aas.load(fs.readAllBytes(args[1]));longState=aasRuntime.create(longMap);longRouter=routing.create(longState);longRuntime=visible.create(longRouter,host,trace);host.mode=0;longGoal=resources.Goal([220.0,0.0,0.0],22,[0.0,0.0,0.0],[0.0,0.0,0.0],9,0,0,0);longResult=visible.predict(longRuntime,[0.0,0.0,0.0],1,longGoal,routing.TFL_DEFAULT)
  checks=checks+require(not longResult.found and longResult.hops==20 and len(longResult.reachNums)==20,"released twenty-hop limit")

  vm=Machine(bytes(1024,0),1023);base=900;putVector(vm.data,20,[0.0,0.0,0.0]);putGoal(vm,60,goal);putVector(vm.data,160,[-1.0,-1.0,-1.0]);arg(vm,base,1,20);arg(vm,base,2,1);arg(vm,base,3,60);arg(vm,base,4,routing.TFL_DEFAULT);arg(vm,base,5,160);host.mode=0
  checks=checks+require(traps.dispatch(runtime,vm,base,visible.OP_PREDICT_VISIBLE_POSITION)==1 and same(vector(vm.data,160),[100.0,0.0,0.0]),"op572 exact argument order and vec3 output")
  arg(vm,base,2,0);putVector(vm.data,160,[-1.0,-1.0,-1.0]);checks=checks+require(traps.dispatch(runtime,vm,base,visible.OP_PREDICT_VISIBLE_POSITION)==0 and same(vector(vm.data,160),[-1.0,-1.0,-1.0]),"failed op572 leaves target untouched")
  print("PASS: "+str(checks)+" AI visible-position contracts");return 0
end function
