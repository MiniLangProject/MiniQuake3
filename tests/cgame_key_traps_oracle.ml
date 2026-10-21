import mq3.vm.cgame_key_traps as keys
import mq3.compat.numeric as n

struct Machine data mask end struct
function put(vm,at,text) data=bytes(text);copyBytes(vm.data,at,data,0,len(data));vm.data[at+len(data)]=0;return void end function
function call(host,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return keys.dispatch(host,vm,base) end function

function main(args)
  vm=Machine(bytes(512,0),511);state=keys.create();host=keys.stateServices(state);base=464
  print "abi|"+str(keys.CG_KEY_ISDOWN)+"|"+str(keys.CG_KEY_GETCATCHER)+"|"+str(keys.CG_KEY_SETCATCHER)+"|"+str(keys.CG_KEY_GETKEY)+"|"+str(keys.MAX_KEYS)
  keys.setDown(state,13,true);print "down|"+str(call(host,vm,base,[60,13]))+"|"+str(call(host,vm,base,[60,12]))+"|"+str(call(host,vm,base,[60,256]))
  print "catcher|"+str(call(host,vm,base,[61]))+"|"+str(call(host,vm,base,[62,5]))+"|"+str(call(host,vm,base,[61]))
  keys.setBinding(state,178,"+attack");keys.setBinding(state,32,"+moveup");put(vm,64,"+ATTACK");put(vm,80,"missing")
  print "binding|"+str(call(host,vm,base,[63,64]))+"|"+str(call(host,vm,base,[63,80]))
  keys.setBinding(state,15,"+attack");print "first|"+str(call(host,vm,base,[63,64]))
  put(vm,96,"");keys.setBinding(state,200,"");print "empty|"+str(call(host,vm,base,[63,96]))
  return 0
end function
