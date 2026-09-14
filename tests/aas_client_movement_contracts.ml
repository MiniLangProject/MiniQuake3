import mq3.botlib.aas_client_movement as movement
import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.aas_client_movement_syscalls as movementSyscalls
import mq3.compat.numeric as n

struct World floorZ wallX gapX waterX areaSplit area2Contents traceCount end struct
struct Machine data mask end struct
function close(a,b,tolerance) d=a-b;if d<0.0 then d=0.0-d end if;return d<=tolerance end function
function require(ok,label) if not ok then return error(7549,"AAS movement: "+label) end if;return 1 end function
function interpolate(start,finish,fraction) return [start[0]+(finish[0]-start[0])*fraction,start[1]+(finish[1]-start[1])*fraction,start[2]+(finish[2]-start[2])*fraction] end function
function trace(world,start,finish,presence,passEntity)
  world.traceCount=world.traceCount+1;bounds=[[-15.0,-15.0,-24.0],[15.0,15.0,32.0]];if presence==aasRuntime.PRESENCE_CROUCH then bounds[1][2]=8.0 end if
  fraction=1.0;normal=[0.0,0.0,0.0];plane=0;startsolid=false
  hasFloor=start[0]<world.gapX
  startBottom=start[2]+bounds[0][2];endBottom=finish[2]+bounds[0][2]
  if hasFloor and startBottom<world.floorZ then startsolid=true;fraction=0.0;normal=[0.0,0.0,1.0];plane=2
  else if hasFloor and endBottom<world.floorZ and startBottom>=world.floorZ then value=(startBottom-world.floorZ)/(startBottom-endBottom);if value<fraction then fraction=value;normal=[0.0,0.0,1.0];plane=2 end if end if
  if world.wallX<99999.0 then startRight=start[0]+bounds[1][0];endRight=finish[0]+bounds[1][0];if startRight<world.wallX and endRight>=world.wallX then value=(world.wallX-startRight)/(endRight-startRight);if value<fraction then fraction=value;normal=[-1.0,0.0,0.0];plane=4 end if end if end if
  return movement.Trace(startsolid,fraction,interpolate(start,finish,fraction),1022,0,0,plane,normal)
end function
function contents(world,point) if point[0]>=world.waterX then return movement.CONTENTS_WATER end if;return 0 end function
function area(world,point) if point[0]>=world.areaSplit then return 2 end if;return 1 end function
function presence(world,point) return aasRuntime.PRESENCE_NORMAL|aasRuntime.PRESENCE_CROUCH end function
function areaContents(world,number) if number==2 then return world.area2Contents end if;return 0 end function
function traceAreas(world,start,finish,maximum)
  if start[0]<world.areaSplit and finish[0]>=world.areaSplit then fraction=(world.areaSplit-start[0])/(finish[0]-start[0]);return movement.AreaTrace([1,2],[start,interpolate(start,finish,fraction)]) end if
  return movement.AreaTrace([area(world,start)],[start])
end function
function host(world) value=movement.services(world);value.traceFn=trace;value.pointContentsFn=contents;value.pointAreaFn=area;value.pointPresenceFn=presence;value.areaContentsFn=areaContents;value.traceAreasFn=traceAreas;return value end function
function world() return World(0.0,99999.0,99999.0,99999.0,50.0,0,0) end function
function writeVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function

function main(args)
  count=0;velocity=[200.0,0.0,0.0];movement.applyFriction(velocity,6.0,100.0,0.1);count=count+require(close(velocity[0],80.0,0.001),"ground friction")
  velocity=[0.0,0.0,0.0];movement.accelerate(velocity,0.1,[1.0,0.0,0.0],320.0,10.0);count=count+require(close(velocity[0],320.0,0.001),"ground acceleration clamp")
  w=world();value=movement.predict(host(w),-1,[0.0,0.0,64.0],aasRuntime.PRESENCE_NORMAL,false,[0.0,0.0,0.0],[0.0,0.0,0.0],0,20,0.1,movement.SE_HITGROUND,0,false)
  count=count+require(value.success and value.stopevent==movement.SE_HITGROUND and value.endpos[2]>23.9 and value.endpos[2]<25.0,"gravity landing")
  w=world();value=movement.predict(host(w),-1,[0.0,0.0,80.0],aasRuntime.PRESENCE_NORMAL,false,[0.0,0.0,0.0],[0.0,0.0,0.0],0,2,0.1,movement.SE_LEAVEGROUND,0,false)
  count=count+require(value.stopevent==movement.SE_LEAVEGROUND and value.frames==0,"leave-ground stop")
  w=world();w.wallX=64.0;value=movement.predict(host(w),-1,[0.0,0.0,24.0],aasRuntime.PRESENCE_NORMAL,true,[200.0,100.0,0.0],[0.0,0.0,0.0],0,2,0.1,0,0,false)
  count=count+require(value.success and value.endpos[0]<49.1 and value.endpos[1]>0.0,"wall sliding")
  w=world();w.waterX=100.0;value=movement.predict(host(w),-1,[90.0,0.0,24.0],aasRuntime.PRESENCE_NORMAL,true,[200.0,0.0,0.0],[0.0,0.0,0.0],0,3,0.1,movement.SE_ENTERWATER,0,false)
  count=count+require(value.stopevent==movement.SE_ENTERWATER and (value.endcontents&movement.CONTENTS_WATER)!=0,"water-entry stop")
  w=world();value=movement.predict(host(w),-1,[0.0,0.0,24.0],aasRuntime.PRESENCE_NORMAL,true,[600.0,0.0,0.0],[0.0,0.0,0.0],0,2,0.1,movement.SE_ENTERAREA,2,false)
  count=count+require(value.stopevent==movement.SE_ENTERAREA and value.endarea==2 and close(value.endpos[0],50.0,0.01),"enter-area stop")
  w=world();w.gapX=30.0;value=movement.predict(host(w),-1,[0.0,0.0,24.0],aasRuntime.PRESENCE_NORMAL,true,[400.0,0.0,0.0],[0.0,0.0,0.0],0,3,0.1,movement.SE_GAP,0,false)
  count=count+require(value.stopevent==movement.SE_GAP and value.endpos[0]<40.0,"gap stop uses last origin")
  w=world();value=movement.predictWithBBox(host(w),-1,[0.0,0.0,24.0],aasRuntime.PRESENCE_NORMAL,true,[600.0,0.0,0.0],[0.0,0.0,0.0],0,2,0.1,movement.SE_HITBOUNDINGBOX,0,[55.0,-20.0,0.0],[75.0,20.0,64.0],false)
  count=count+require(value.stopevent==movement.SE_HITBOUNDINGBOX and value.endpos[0]>39.9 and value.endpos[0]<40.1,"explicit bounding-box stop")
  w=world();value=movement.predict(host(w),-1,[0.0,0.0,24.0],aasRuntime.PRESENCE_NORMAL,true,[0.0,0.0,0.0],[0.0,0.0,400.0],1,1,0.1,0,0,false)
  count=count+require(value.stopevent==0 and value.velocity[2]>200.0 and value.presencetype==aasRuntime.PRESENCE_NORMAL,"jump command and gravity")
  count=count+require(w.traceCount>=2,"prediction uses bbox and ground traces")
  vm=Machine(bytes(1024,0),1023);n.writeU32(vm.data,4,100);n.writeU32(vm.data,8,-1);n.writeU32(vm.data,12,300);n.writeU32(vm.data,16,aasRuntime.PRESENCE_NORMAL);n.writeU32(vm.data,20,0);n.writeU32(vm.data,24,312);n.writeU32(vm.data,28,324);n.writeU32(vm.data,32,0);n.writeU32(vm.data,36,2);n.writeU32(vm.data,40,n.floatBits(0.1));n.writeU32(vm.data,44,movement.SE_LEAVEGROUND);n.writeU32(vm.data,48,0);n.writeU32(vm.data,52,0)
  writeVector(vm.data,300,[0.0,0.0,80.0]);writeVector(vm.data,312,[0.0,0.0,0.0]);writeVector(vm.data,324,[0.0,0.0,0.0]);w=world()
  count=count+require(movementSyscalls.dispatch(host(w),vm,0)==1 and n.readI32(vm.data,168)==movement.SE_LEAVEGROUND and n.readI32(vm.data,180)==0 and close(n.bitsFloat(n.readU32(vm.data,176)),0.0,0.0001),"84-byte clientmove QVM ABI")
  print("PASS: "+str(count)+" AAS client movement contracts");return 0
end function
