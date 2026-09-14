import mq3.botlib.server_bridge as bridge
import mq3.game.entitystate as entitystate
import mq3.vm.syscall_qagame_world as qworld
import mq3.compat.numeric as n

struct Machine data mask end struct
function require(ok,label) if not ok then return error(7589,"bot server bridge contract: "+label) end if;return 1 end function
function invoke(state,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return bridge.dispatch(state,vm,base,values[0]) end function
function textAt(vm,at) stop=at;while vm.data[stop]!=0 stop=stop+1 end while;return decode(slice(vm.data,at,stop-at)) end function
function main(args)
  checks=0;state=bridge.create(2);first=entitystate.create();first.number=7;first.origin=[1.0,2.0,3.0];second=entitystate.create();second.number=19
  checks=checks+require(bridge.publishSnapshot(state,0,[first,second])==2 and bridge.snapshotEntity(state,0,0)==7 and bridge.snapshotEntity(state,0,1)==19,"per-client snapshot sequence")
  first.number=99;first.origin[0]=77.0;copy=bridge.snapshotEntityState(state,0,0);copy.number=88;checks=checks+require(bridge.snapshotEntity(state,0,0)==7 and bridge.snapshotEntityState(state,0,0).origin[0]==1.0,"snapshot owns full entityState copies")
  checks=checks+require(bridge.snapshotEntity(state,0,-1)==-1 and bridge.snapshotEntity(state,0,2)==-1 and bridge.snapshotEntity(state,1,0)==-1,"snapshot bounds")
  bridge.setTime(state,1234);bridge.queueConsoleMessage(state,0,"print \"alpha\"");bridge.queueConsoleMessage(state,0,"chat \"bravo\"")
  vm=Machine(bytes(1024,0),1023);base=900;checks=checks+require(invoke(state,vm,base,[bridge.OP_GET_CONSOLE_MESSAGE,0,100,8])==1 and textAt(vm,100)=="print \"","console ABI truncates and terminates")
  checks=checks+require(invoke(state,vm,base,[bridge.OP_GET_CONSOLE_MESSAGE,0,140,64])==1 and textAt(vm,140)=="chat \"bravo\"" and state.clients[0].lastPacketTime==1234,"console sequence and packet time")
  vm.data[180]=77;checks=checks+require(invoke(state,vm,base,[bridge.OP_GET_CONSOLE_MESSAGE,0,180,8])==0 and vm.data[180]==77,"empty console leaves output")
  for index=0 to 69 bridge.queueConsoleMessage(state,1,"m"+str(index)) end for;firstMessage=bridge.nextConsoleMessage(state,1);checks=checks+require(firstMessage.available and firstMessage.text=="m6","reliable ring retains latest 64")
  command=qworld.userCommand(0x10203040,[-1,32768,65535],0x76543210,250,-128,127,-1);qworld.writeUsercmd(vm,240,command)
  checks=checks+require(invoke(state,vm,base,[bridge.OP_USER_COMMAND,1,240])==0,"user command trap")
  pending=bridge.takePending(state);got=pending[0][1];checks=checks+require(len(pending)==1 and pending[0][0]==1 and got.serverTime==0x10203040 and got.angles==[-1,32768,65535] and got.buttons==0x76543210,"user command 32-bit fields")
  checks=checks+require(got.weapon==250 and got.forwardmove==-128 and got.rightmove==127 and got.upmove==-1 and len(bridge.takePending(state))==0,"user command byte tail and consume")
  vm.data[1020]=1;vm.data[1021]=2;vm.data[1022]=3;vm.data[1023]=4;checks=checks+require((try(invoke(state,vm,base,[bridge.OP_USER_COMMAND,0,1020]))) is error and (try(invoke(state,vm,base,[bridge.OP_GET_CONSOLE_MESSAGE,0,100,0]))) is error,"ABI span and capacity guards")
  checks=checks+require((try(bridge.submitUserCommand(state,4,command))) is error and (try(bridge.publishSnapshot(state,4,[]))) is error,"invalid client mutations rejected")
  print("PASS: "+str(checks)+" bot server bridge contracts");return 0
end function
