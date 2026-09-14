import mq3.botlib.aas_syscalls as syscalls
import mq3.botlib.aas_runtime as aasRuntime
import mq3.compat.numeric as n

struct Machine data mask end struct
function require(ok,label) if not ok then return error(7698,"botlib AAS syscall: "+label) end if;return 1 end function
function writeString(vm,address,value) encoded=bytes(value);copyBytes(vm.data,address,encoded,0,len(encoded));vm.data[address+len(encoded)]=0;return void end function
function argument(vm,index,value) n.writeU32(vm.data,index*4,value);return void end function
function close(a,b) d=a-b;if d<0.0 then d=0.0-d end if;return d<0.0001 end function

function main(args)
  count=0;vm=Machine(bytes(4096,0),4095);entities=[[ ["classname","worldspawn"],["gravity","800"] ],[["classname","func_door"],["origin","1 2 3"],["speed","2.5"],["spawnflags","3"]]]
  count=count+require(syscalls.nextBspEntity(entities,0)==1 and syscalls.nextBspEntity(entities,1)==0,"BSP entity iteration skips worldspawn and end handle")
  pair=syscalls.bspValue(entities,1,"classname");count=count+require(pair[0] and pair[1]=="func_door","BSP epair handle indexes original entity")
  count=count+require(not syscalls.bspValue(entities,1,"missing")[0] and not syscalls.bspValue(entities,2,"classname")[0],"missing and end-handle BSP epairs")
  writeString(vm,100,"classname");argument(vm,1,1);argument(vm,2,100);argument(vm,3,200);argument(vm,4,32)
  count=count+require(syscalls.dispatch(void,void,entities,vm,0,311)==1 and decode(slice(vm.data,200,9))=="func_door","string epair ABI")
  writeString(vm,100,"missing");vm.data[200]=88;count=count+require(syscalls.dispatch(void,void,entities,vm,0,311)==0 and vm.data[200]==0,"missing string epair clears output")
  writeString(vm,100,"origin");argument(vm,3,240)
  count=count+require(syscalls.dispatch(void,void,entities,vm,0,312)==1 and close(n.bitsFloat(n.readU32(vm.data,240)),1.0) and close(n.bitsFloat(n.readU32(vm.data,248)),3.0),"vector epair ABI")
  writeString(vm,100,"speed");argument(vm,3,280)
  count=count+require(syscalls.dispatch(void,void,entities,vm,0,313)==1 and close(n.bitsFloat(n.readU32(vm.data,280)),2.5),"float epair ABI")
  writeString(vm,100,"spawnflags");argument(vm,3,300)
  count=count+require(syscalls.dispatch(void,void,entities,vm,0,314)==1 and n.readI32(vm.data,300)==3,"integer epair ABI")
  argument(vm,1,aasRuntime.PRESENCE_NORMAL);argument(vm,2,320);argument(vm,3,332)
  count=count+require(syscalls.dispatch(void,void,entities,vm,0,305)==0 and close(n.bitsFloat(n.readU32(vm.data,320)),-15.0) and close(n.bitsFloat(n.readU32(vm.data,340)),32.0),"presence bounding-box ABI")
  runtime=aasRuntime.Runtime(void,true,[],12.5,0)
  count=count+require(syscalls.dispatch(runtime,void,entities,vm,0,304)==1 and syscalls.dispatch(void,void,entities,vm,0,304)==0,"initialized state")
  count=count+require(close(n.bitsFloat(syscalls.dispatch(runtime,void,entities,vm,0,306)),12.5),"AAS time float ABI")
  print("PASS: "+str(count)+" botlib AAS syscall contracts");return 0
end function
