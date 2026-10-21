import mq3.vm.cgame_key_traps as keys
import mq3.vm.syscall_cgame as cgame
import mq3.vm.syscall_common as common
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as commandBuffer
import mq3.compat.numeric as n

struct Machine data mask end struct

function require(value,label) if not value then return error(499,"cgame key traps: "+label) end if;return 1 end function
function put(vm,at,text) data=bytes(text);copyBytes(vm.data,at,data,0,len(data));vm.data[at+len(data)]=0;return at end function
function invoke(host,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return keys.dispatch(host,vm,base) end function
function invokeCgame(host,vm,base,values) for index=0 to len(values)-1 n.writeU32(vm.data,base+index*4,values[index]) end for;return cgame.dispatch(host,vm,base) end function

function main(args)
  vm=Machine(bytes(512,0),511);state=keys.create();host=keys.stateServices(state);base=464;count=0
  count=count+require(not keys.setDown(state,-1,true) and not keys.setDown(state,256,true),"reject out-of-range state changes")
  count=count+require(invoke(host,vm,base,[keys.CG_KEY_ISDOWN,13])==0,"released key")
  keys.setDown(state,13,true);count=count+require(invoke(host,vm,base,[keys.CG_KEY_ISDOWN,13])==1,"pressed key")
  count=count+require(invoke(host,vm,base,[keys.CG_KEY_ISDOWN,256])==0,"out-of-range key is up")
  count=count+require(invoke(host,vm,base,[keys.CG_KEY_GETCATCHER])==0,"initial catcher")
  count=count+require(invoke(host,vm,base,[keys.CG_KEY_SETCATCHER,7])==0 and invoke(host,vm,base,[keys.CG_KEY_GETCATCHER])==7,"catcher round trip")
  count=count+require(keys.setBinding(state,32,"+moveup") and keys.setBinding(state,178,"+attack"),"binding setup")
  put(vm,64,"+ATTACK");count=count+require(invoke(host,vm,base,[keys.CG_KEY_GETKEY,64])==178,"binding lookup ignores case")
  keys.setBinding(state,15,"+attack");count=count+require(invoke(host,vm,base,[keys.CG_KEY_GETKEY,64])==15,"binding lookup returns first key")
  put(vm,80,"missing");count=count+require(invoke(host,vm,base,[keys.CG_KEY_GETKEY,80])==-1,"missing binding")
  put(vm,96,"");count=count+require(invoke(host,vm,base,[keys.CG_KEY_GETKEY,96])==-1,"unbound empty binding")
  keys.setBinding(state,200,"");count=count+require(invoke(host,vm,base,[keys.CG_KEY_GETKEY,96])==200,"explicit empty binding follows Key_GetKey")
  count=count+require(try(invoke(host,vm,base,[keys.CG_KEY_GETKEY,0])) is error,"NULL binding rejected")
  vm.data[511]=65;count=count+require(try(invoke(host,vm,base,[keys.CG_KEY_GETKEY,511])) is error,"unterminated binding rejected");vm.data[511]=0
  empty=keys.services(state);count=count+require(try(invoke(empty,vm,base,[keys.CG_KEY_ISDOWN,13])) is error,"missing key-state service")
  count=count+require(try(invoke(empty,vm,base,[keys.CG_KEY_GETCATCHER])) is error,"missing catcher service")
  count=count+require(try(invoke(empty,vm,base,[keys.CG_KEY_SETCATCHER,1])) is error,"missing set-catcher service")
  count=count+require(try(invoke(empty,vm,base,[keys.CG_KEY_GETKEY,64])) is error,"missing binding service")
  count=count+require(try(invoke(host,vm,base,[59])) is error,"unrelated trap rejected")
  count=count+require(try(keys.dispatch(void,vm,base)) is error,"invalid host rejected")
  put(vm,120,"+moveup");count=count+require(invoke(host,vm,base,[keys.CG_KEY_GETKEY,632])==32,"masked string pointer")
  shared=common.services(cvar.create(),commandBuffer.create(),state);client=cgame.services(shared,state);client.keyServices=host
  count=count+require(invokeCgame(client,vm,base,[keys.CG_KEY_ISDOWN,13])==1,"central cgame dispatcher key state")
  count=count+require(invokeCgame(client,vm,base,[keys.CG_KEY_GETCATCHER])==7,"central cgame dispatcher catcher")
  count=count+require(invokeCgame(client,vm,base,[keys.CG_KEY_SETCATCHER,3])==0 and state.catcher==3,"central cgame dispatcher set catcher")
  count=count+require(invokeCgame(client,vm,base,[keys.CG_KEY_GETKEY,120])==32,"central cgame dispatcher binding")
  count=count+require(keys.keynumToString(-1)=="<KEY NOT FOUND>" and keys.keynumToString(256)=="<OUT OF RANGE>","key name sentinels")
  count=count+require(keys.keynumToString(97)=="a" and keys.keynumToString(34)=="0x22" and keys.keynumToString(59)=="SEMICOLON","printable key names")
  count=count+require(keys.keynumToString(9)=="TAB" and keys.keynumToString(13)=="ENTER" and keys.keynumToString(27)=="ESCAPE","control key names")
  count=count+require(keys.keynumToString(145)=="F1" and keys.keynumToString(156)=="F12" and keys.keynumToString(157)=="0x9d","function key names")
  count=count+require(keys.keynumToString(160)=="KP_HOME" and keys.keynumToString(177)=="KP_EQUALS","keypad names")
  count=count+require(keys.keynumToString(178)=="MOUSE1" and keys.keynumToString(184)=="MWHEELUP","mouse names")
  count=count+require(keys.keynumToString(185)=="JOY1" and keys.keynumToString(216)=="JOY32" and keys.keynumToString(232)=="AUX16","joystick names")
  count=count+require(keys.stringToKeynum("a")==97 and keys.stringToKeynum("ENTER")==13 and keys.stringToKeynum("mouse5")==182,"key name parsing")
  count=count+require(keys.stringToKeynum("0x9d")==157 and keys.stringToKeynum("0xZZ")==0 and keys.stringToKeynum("")==-1,"hex key parsing")
  count=count+require(not keys.getOverstrike(state),"initial overstrike state")
  keys.setOverstrike(state,true);count=count+require(keys.getOverstrike(state),"overstrike round trip")
  keys.setDown(state,13,true);keys.setDown(state,178,true);keys.clearStates(state);count=count+require(not keys.isDown(state,13) and not keys.isDown(state,178),"clear key states")
  print("PASS: "+str(count)+" cgame key-trap contracts");return 0
end function
