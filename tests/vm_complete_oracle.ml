// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.vm.runtime as runtime
import mq3.vm.interpreter as interpreter
import mq3.compat.numeric as n

function fixture()
  code=bytes([3,64,0,0,0,8,42,0,0,0,4,64,0,0,0]);image=bytes(51,0)
  n.writeU32(image,0,0x12721444);n.writeU32(image,4,3);n.writeU32(image,8,32);n.writeU32(image,12,15);n.writeU32(image,16,47);n.writeU32(image,20,4);n.writeU32(image,24,0);n.writeU32(image,28,65532)
  copyBytes(image,32,code,0,len(code));return image
end function
function syscall(machine,address) return 0 end function
function flag(value) if value then return 1 end if;return 0 end function
function main(args)
  host=runtime.services();host.loadFn=function(service,path) => fixture();state=runtime.create(host);slot=runtime.load(state,"probe",syscall)
  first=runtime.Symbol(10,"first",30);second=runtime.Symbol(20,"second",10);slot.symbols=[first,second];slot.numSymbols=2
  print "hex|"+str(runtime.parseHex(""))+"|"+str(runtime.parseHex("1aF"))+"|"+str(runtime.parseHex("zz1-2"))+"|"+str(runtime.parseHex("FFFFFFFF"))
  print "sym|"+runtime.valueToSymbol(slot,10)+"|"+runtime.valueToSymbol(slot,15)+"|"+runtime.valueToSymbol(slot,20)+"|"+runtime.valueToSymbol(slot,25)
  print "func|"+runtime.valueToFunctionSymbol(slot,15).name+"|"+runtime.valueToFunctionSymbol(slot,25).name+"|lookup="+str(runtime.symbolToValue(slot,"second"))+"|missing="+str(runtime.symbolToValue(slot,"SECOND"))
  slot.symbols=[];print "nosym|"+runtime.valueToSymbol(slot,7)+"|"+str(runtime.valueToFunctionSymbol(slot,7).value)
  first.value=0;first.name="start";second.value=1;second.name="middle";slot.symbols=[first,second]
  print "compiled|"+runtime.symbolForCompiledPointer(slot,-1)+"|"+runtime.symbolForCompiledPointer(slot,6)+"|"+runtime.symbolForCompiledPointer(slot,15)
  slot.machine.mask=15;state.current=slot;print "arg0|"+str(flag(runtime.argPtr(state,0)==void));print "arg|"+str(runtime.argPtr(state,35));print "explicit|"+str(runtime.explicitArgPtr(state,slot,34));state.current=void;print "nocurrent|"+str(flag(runtime.argPtr(state,3)==void))
  state.current=slot;slot.native=true;print "nativearg|"+str(runtime.argPtr(state,35))
  print "vm2c|"+str(runtime.vm2c(1234,999));runtime.debug(state,7);print "debug|"+str(state.debugLevel)
  first.profileCount=30;second.profileCount=10;print "profilecmp|"+str(runtime.profileSort(first,second))+"|"+str(runtime.profileSort(second,first))+"|"+str(runtime.profileSort(first,first));return 0
end function
