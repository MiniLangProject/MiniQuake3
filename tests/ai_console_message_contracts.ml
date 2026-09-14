import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_console_messages as messages
import mq3.compat.numeric as n

struct Machine data mask end struct
function require(ok,label) if not ok then return error(7599,"AI console contract: "+label) end if;return 1 end function
function putString(vm,at,text) data=bytes(text);copyBytes(vm.data,at,data,0,len(data));vm.data[at+len(data)]=0 end function
function invoke(state,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return messages.dispatch(state,vm,base,values[0]) end function
function main(args)
  checks=0;resources=pools.create();chat=pools.allocChatState(resources);state=messages.create(resources);messages.setTime(state,12.5)
  first=messages.queue(state,chat,0,"alpha");second=messages.queue(state,chat,1,"bravo")
  checks=checks+require(first==1 and second==2 and messages.count(state,chat)==2,"FIFO queue and per-state handles")
  peek=messages.next(state,chat);checks=checks+require(peek.handle==1 and peek.time==12.5 and peek.type==0 and messages.messageText(peek)=="alpha" and messages.count(state,chat)==2,"next peeks without removal")
  messages.remove(state,chat,1);checks=checks+require(messages.next(state,chat).handle==2 and messages.count(state,chat)==1,"remove by handle")
  messages.remove(state,chat,999);checks=checks+require(messages.count(state,chat)==1,"unknown handle leaves queue")
  long="";for index=0 to 299 long=long+"x" end for;third=messages.queue(state,chat,7,long);checks=checks+require(third==3 and len(bytes(messages.messageText(messages.next(state,chat))))==5,"existing FIFO remains first")
  messages.remove(state,chat,2);checks=checks+require(len(bytes(messages.messageText(messages.next(state,chat))))==256,"strncpy-compatible 256-byte payload")
  for index=0 to 254 messages.queue(state,chat,index,"m") end for;checks=checks+require(messages.count(state,chat)==256 and messages.queue(state,chat,9,"full")==0,"global 256-node heap exhaustion")
  secondChat=pools.allocChatState(resources);messages.remove(state,chat,3);checks=checks+require(messages.queue(state,secondChat,2,"reuse")==1 and messages.count(state,secondChat)==1,"freed node reused across chat states")
  messages.remove(state,chat,4)
  vm=Machine(bytes(2048,0),2047);base=1900;putString(vm,100,"console text");invoke(state,vm,base,[messages.OP_QUEUE_CONSOLE_MESSAGE,secondChat,4,100]);checks=checks+require(invoke(state,vm,base,[messages.OP_NUM_CONSOLE_MESSAGE,secondChat])==2,"queue and count trap ABI")
  handle=invoke(state,vm,base,[messages.OP_NEXT_CONSOLE_MESSAGE,secondChat,400]);checks=checks+require(handle==1 and n.readI32(vm.data,400)==1 and n.bitsFloat(n.readI32(vm.data,404))==12.5 and n.readI32(vm.data,408)==2,"276-byte header ABI")
  checks=checks+require(decode(slice(vm.data,412,5))=="reuse" and n.readI32(vm.data,668)==0 and n.readI32(vm.data,672)==0,"message and NULL link ABI")
  invoke(state,vm,base,[messages.OP_REMOVE_CONSOLE_MESSAGE,secondChat,1]);checks=checks+require(invoke(state,vm,base,[messages.OP_NUM_CONSOLE_MESSAGE,secondChat])==1,"remove trap ABI")
  checks=checks+require(messages.count(state,99)==0 and messages.next(state,99)==void and messages.queue(state,99,0,"x")==0,"invalid chat handle semantics")
  checks=checks+require((try(invoke(state,vm,base,[messages.OP_NEXT_CONSOLE_MESSAGE,secondChat,1900]))) is error and (try(messages.dispatch(state,vm,base,513))) is error,"output span and opcode guards")
  messages.clearChat(state,secondChat);checks=checks+require(messages.count(state,secondChat)==0 and len(state.freeSlots)==2,"chat clear returns its remaining node")
  messages.shutdown(state);checks=checks+require(len(state.freeSlots)==256,"shutdown restores complete heap")
  print("PASS: "+str(checks)+" AI console message contracts");return 0
end function
