import mq3.compat.numeric as n
import mq3.engine.local_qvm_match as match
import mq3.vm.cgame_misc_traps as traps

struct Vm data mask end struct
struct Host rendererEntityTokens end struct

function require(condition,message) if not condition then return error(7486,message) end if;return 1 end function
function put(vm,address,value) n.writeU32(vm.data,address,n.i32(value));return void end function
function putFloat(vm,address,value) n.writeU32(vm.data,address,n.floatBits(value));return void end function
function dispatchTrap(host,vm,base,op,arguments)
  for index=0 to len(arguments)-1 put(vm,base+(index+1)*4,arguments[index]) end for
  return match.extendedCgame(host,vm,base,op)
end function

function main(args)
  count=0;vm=Vm(bytes(1024,0),1023);host=Host(traps.createEntityTokens("{ \"classname\" \"worldspawn\" }"));base=800
  epoch=dispatchTrap(host,vm,base,70,[64]);count=count+require(epoch>1600000000,"op70 returns current Unix seconds")
  count=count+require(n.readI32(vm.data,64)>=0 and n.readI32(vm.data,64)<=59 and n.readI32(vm.data,80)>=0 and n.readI32(vm.data,80)<=11 and n.readI32(vm.data,84)>100,"op70 writes qtime_t fields in QVM layout")
  count=count+require(dispatchTrap(host,vm,base,70,[0])>1600000000,"op70 preserves Com_RealTime NULL-output behavior")
  count=count+require(try(dispatchTrap(host,vm,base,70,[1000])) is error,"op70 rejects a truncated qtime_t output")
  putFloat(vm,128,1.5);putFloat(vm,132,2.5);putFloat(vm,136,-1.5);count=count+require(dispatchTrap(host,vm,base,71,[128])==0,"op71 dispatch return")
  count=count+require([n.bitsFloat(n.readU32(vm.data,128)),n.bitsFloat(n.readU32(vm.data,132)),n.bitsFloat(n.readU32(vm.data,136))]==[2.0,2.0,-2.0],"op71 mutates vec3_t in place")
  count=count+require(try(dispatchTrap(host,vm,base,71,[1016])) is error,"op71 validates the complete vec3_t")
  count=count+require(dispatchTrap(host,vm,base,86,[256,16])==1 and vm.data[256]==123,"op86 returns and writes the first renderer entity token")
  count=count+require(dispatchTrap(host,vm,base,86,[256,6])==1 and decode(slice(vm.data,256,5))=="class" and vm.data[261]==0,"op86 applies bounded C-string output")
  dispatchTrap(host,vm,base,86,[256,16]);dispatchTrap(host,vm,base,86,[256,16])
  count=count+require(dispatchTrap(host,vm,base,86,[256,16])==0 and vm.data[256]==0,"op86 reports EOF with an empty output")
  count=count+require(dispatchTrap(host,vm,base,86,[256,16])==1 and vm.data[256]==123,"op86 restarts renderer entity parsing after EOF")
  count=count+require(try(dispatchTrap(host,vm,base,86,[256,0])) is error,"op86 rejects invalid output capacity")
  print("PASS: "+str(count)+" cgame misc-dispatch contracts");return 0
end function
