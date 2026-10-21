import mq3.format.aas as aas
import mq3.botlib.aas_runtime as runtime
import mq3.botlib.aas_client_trace as clientTrace
import mq3.compat.numeric as n

function require(ok,label) if not ok then return error(7548,"AAS client trace: "+label) end if;return 1 end function
function close(a,b,tolerance) d=a-b;if d<0.0 then d=0.0-d end if;return d<=tolerance end function
function putI32(data,at,value) n.writeU32(data,at,value);return void end function
function putFloat(data,at,value) n.writeU32(data,at,n.floatBits(value));return void end function
function putPlane(data,at,x,y,z,distance)
  putFloat(data,at,x);putFloat(data,at+4,y);putFloat(data,at+8,z);putFloat(data,at+12,distance);putI32(data,at+16,3);return void
end function
function putNode(data,at,plane,front,back) putI32(data,at,plane);putI32(data,at+4,front);putI32(data,at+8,back);return void end function
function fixture()
  data=bytes(200,0);putPlane(data,0,1.0,0.0,0.0,0.0);putPlane(data,20,-1.0,0.0,0.0,0.0);putPlane(data,40,0.0,1.0,0.0,10.0);putPlane(data,60,0.0,-1.0,0.0,-10.0)
  // Area one accepts standing and crouching; area two is crouch-only.
  putI32(data,80+28+8,runtime.PRESENCE_NORMAL|runtime.PRESENCE_CROUCH);putI32(data,80+56+8,runtime.PRESENCE_CROUCH)
  putNode(data,164,0,0,0);putNode(data,176,0,-1,2);putNode(data,188,2,-2,0)
  offsets=array(aas.LUMP_COUNT,0);lengths=array(aas.LUMP_COUNT,0);counts=array(aas.LUMP_COUNT,0)
  offsets[aas.LUMP_PLANES]=0;lengths[aas.LUMP_PLANES]=80;counts[aas.LUMP_PLANES]=4
  offsets[aas.LUMP_AREAS]=80;counts[aas.LUMP_AREAS]=3
  offsets[aas.LUMP_AREASETTINGS]=80;lengths[aas.LUMP_AREASETTINGS]=84;counts[aas.LUMP_AREASETTINGS]=3
  offsets[aas.LUMP_NODES]=164;lengths[aas.LUMP_NODES]=36;counts[aas.LUMP_NODES]=3
  return runtime.create(aas.AAS(data,aas.AAS_VERSION,0,offsets,lengths,counts,true))
end function
function main(args)
  nav=fixture();if nav is error then return nav end if;count=0
  open=clientTrace.trace(nav,[5.0,20.0,0.0],[6.0,20.0,0.0],runtime.PRESENCE_NORMAL)
  count=count+require(not open.startsolid and open.fraction==1.0 and open.endpos==[6.0,20.0,0.0] and open.lastarea==1,"open area reaches endpoint")
  blocked=clientTrace.trace(nav,[5.0,20.0,0.0],[-5.0,20.0,0.0],runtime.PRESENCE_NORMAL)
  count=count+require(not blocked.startsolid and close(blocked.fraction,0.4875,0.00001),"presence boundary fraction")
  count=count+require(close(blocked.endpos[0],0.25,0.00001) and blocked.area==2 and blocked.lastarea==1,"presence boundary backs endpoint off")
  count=count+require(blocked.planenum==0 and blocked.normal==[1.0,0.0,0.0],"hit plane faces trace start")
  crouch=clientTrace.trace(nav,[5.0,20.0,0.0],[-5.0,20.0,0.0],runtime.PRESENCE_CROUCH)
  count=count+require(not crouch.startsolid and crouch.fraction==1.0 and crouch.lastarea==2,"crouching enters crouch-only area")
  embedded=clientTrace.trace(nav,[-5.0,20.0,0.0],[-6.0,20.0,0.0],runtime.PRESENCE_NORMAL)
  count=count+require(embedded.startsolid and embedded.fraction==0.0 and embedded.area==2 and embedded.endpos==[-5.0,20.0,0.0],"disallowed starting presence is solid")
  solid=clientTrace.trace(nav,[-5.0,20.0,0.0],[-5.0,0.0,0.0],runtime.PRESENCE_CROUCH)
  count=count+require(not solid.startsolid and close(solid.fraction,0.49375,0.00001) and close(solid.endpos[1],10.25,0.00001),"solid leaf fraction and endpoint")
  count=count+require(solid.area==0 and solid.lastarea==2 and solid.planenum==2 and solid.normal==[0.0,1.0,0.0],"solid leaf fields")
  print("PASS: "+str(count)+" AAS client trace contracts");return 0
end function
