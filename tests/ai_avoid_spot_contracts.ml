import mq3.botlib.ai_avoid_spots as avoidSpots
import mq3.botlib.ai_avoid_spot_syscalls as traps
import mq3.botlib.ai_resource_pools as resources
import mq3.compat.numeric as n

struct Machine data mask end struct
function require(ok,label) if not ok then return error(7609,"AI avoid spot: "+label) end if;return 1 end function
function writeVector(data,address,value) for axis=0 to 2 n.writeU32(data,address+axis*4,n.floatBits(value[axis])) end for;return void end function
function arg(vm,base,index,value) n.writeU32(vm.data,base+index*4,value);return void end function

function main(args)
  checks=0;pools=resources.create();handle=resources.allocMoveState(pools);state=resources.moveState(pools,handle)
  checks=checks+require(avoidSpots.add(pools,handle,[1.25,-2.5,3.75],160.5,avoidSpots.AVOID_ALWAYS)==0 and state.numAvoidSpots==1,"first append")
  first=state.avoidSpots[0];checks=checks+require(first.origin==[1.25,-2.5,3.75] and first.radius==160.5 and first.type==avoidSpots.AVOID_ALWAYS,"first fields")
  avoidSpots.add(pools,handle,[4.0,5.0,6.0],9.0,avoidSpots.AVOID_DONTBLOCK);checks=checks+require(state.numAvoidSpots==2 and state.avoidSpots[1].type==avoidSpots.AVOID_DONTBLOCK,"ordered append")
  checks=checks+require(avoidSpots.add(pools,0,[9.0,9.0,9.0],1.0,1)==0 and state.numAvoidSpots==2,"invalid handle is harmless")
  old=state.avoidSpots[0];avoidSpots.add(pools,handle,[0.0,0.0,0.0],0.0,avoidSpots.AVOID_CLEAR)
  checks=checks+require(state.numAvoidSpots==0 and state.avoidSpots[0].origin==old.origin and state.avoidSpots[0].radius==old.radius,"clear only resets active count")
  avoidSpots.add(pools,handle,[7.0,8.0,9.0],32.0,37);checks=checks+require(state.numAvoidSpots==1 and state.avoidSpots[0].type==37,"clear reuses first slot and preserves arbitrary type")
  for index=1 to resources.MAX_AVOIDSPOTS-1 avoidSpots.add(pools,handle,[toNumber(index),0.0,0.0],toNumber(index),1) end for
  last=state.avoidSpots[resources.MAX_AVOIDSPOTS-1];avoidSpots.add(pools,handle,[999.0,999.0,999.0],999.0,2)
  checks=checks+require(state.numAvoidSpots==resources.MAX_AVOIDSPOTS and state.avoidSpots[resources.MAX_AVOIDSPOTS-1].origin==last.origin,"full table ignores append")

  pools2=resources.create();handle2=resources.allocMoveState(pools2);vm=Machine(bytes(256,0),255);base=128;originAt=32
  writeVector(vm.data,originAt,[11.5,-12.25,13.0]);arg(vm,base,1,handle2);arg(vm,base,2,originAt);arg(vm,base,3,n.floatBits(48.75));arg(vm,base,4,avoidSpots.AVOID_DONTBLOCK)
  checks=checks+require(traps.dispatch(pools2,vm,base)==0,"QVM dispatcher return")
  state2=resources.moveState(pools2,handle2);checks=checks+require(state2.numAvoidSpots==1 and state2.avoidSpots[0].origin==[11.5,-12.25,13.0] and state2.avoidSpots[0].radius==48.75 and state2.avoidSpots[0].type==avoidSpots.AVOID_DONTBLOCK,"QVM argument ABI")
  arg(vm,base,4,avoidSpots.AVOID_CLEAR);checks=checks+require(traps.dispatch(pools2,vm,base)==0 and state2.numAvoidSpots==0,"QVM clear ABI")
  print("PASS: "+str(checks)+" AI avoid-spot contracts");return 0
end function
