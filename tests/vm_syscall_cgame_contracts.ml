import mq3.vm.syscall_cgame as cg
import mq3.vm.syscall_common as common
import mq3.qcommon.cvar as cv
import mq3.qcommon.command_buffer as cmd
import mq3.compat.numeric as n

struct Machine data mask end struct
struct Context events end struct

function req(value,label) if not value then return error(499,"cgame syscall: "+label) end if;return 1 end function
function put(vm,at,text) data=bytes(text);copyBytes(vm.data,at,data,0,len(data));vm.data[at+len(data)]=0;return at end function
function invoke(host,vm,base,values) for i=0 to len(values)-1 n.writeU32(vm.data,base+i*4,values[i]) end for;return cg.dispatch(host,vm,base) end function
function event(c,value) c.events=c.events+[value];return void end function

function add(c,text) event(c,"add:"+text) end function
function remove(c,text) event(c,"remove:"+text) end function
function send(c,text) event(c,"send:"+text) end function
function update(c) event(c,"update") end function
function world(c,text) event(c,"world:"+text) end function
function model(c,text) event(c,"model:"+text);return 11 end function
function skin(c,text) event(c,"skin:"+text);return 12 end function
function shader(c,text) event(c,"shader:"+text);return 13 end function
function shaderNoMip(c,text) event(c,"nomip:"+text);return 14 end function
function clear(c) event(c,"clear") end function
function glconfig(c) return bytes(cg.GLCONFIG_SIZE,21) end function
function gameState(c) return bytes(cg.GAMESTATE_SIZE,22) end function
function snapshotNumber(c) return cg.SnapshotNumber(77,123456) end function
function snapshot(c,number) if number!=76 then return cg.BytesResult(false,bytes(0,0)) end if;return cg.BytesResult(true,bytes(cg.SNAPSHOT_SIZE,23)) end function
function hostServerCommand(c,number) event(c,"server:"+str(number));return number==31 end function
function commandNumber(c) return 88 end function
function userCmd(c,number) if number!=87 then return cg.BytesResult(false,bytes(0,0)) end if;return cg.BytesResult(true,bytes(cg.USERCMD_SIZE,24)) end function
function setCmd(c,value,sensitivity) event(c,"cmd:"+str(value)+":"+str(sensitivity)) end function
function memory(c) return 654321 end function
function tick(c) return 99 end function
function badState(c) return bytes(10,0) end function
function badSnapshot(c,number) return cg.BytesResult(true,bytes(10,0)) end function

function fixture()
  vm=Machine(bytes(131072,0),131071);context=Context([])
  shared=common.services(cv.create(),cmd.create(),context);shared.millisecondsFn=tick
  host=cg.services(shared,context)
  host.addCommandFn=add;host.removeCommandFn=remove;host.sendClientCommandFn=send;host.updateScreenFn=update
  host.loadWorldFn=world;host.registerModelFn=model;host.registerSkinFn=skin;host.registerShaderFn=shader
  host.registerShaderNoMipFn=shaderNoMip;host.clearSceneFn=clear;host.getGlconfigFn=glconfig
  host.getGameStateFn=gameState;host.getCurrentSnapshotNumberFn=snapshotNumber;host.getSnapshotFn=snapshot
  host.getServerCommandFn=hostServerCommand;host.getCurrentCmdNumberFn=commandNumber;host.getUserCmdFn=userCmd
  host.setUserCmdValueFn=setCmd;host.memoryRemainingFn=memory
  return [vm,host,context]
end function

function main(args)
  f=fixture();vm=f[0];host=f[1];c=f[2];base=130900;count=0
  count=count+req(invoke(host,vm,base,[2])==99,"common delegation")
  put(vm,100,"+scores");invoke(host,vm,base,[15,100]);count=count+req(c.events[0]=="add:+scores","add command")
  put(vm,120,"score");invoke(host,vm,base,[16,120]);count=count+req(c.events[1]=="send:score","client command")
  invoke(host,vm,base,[17]);count=count+req(c.events[2]=="update","screen update")
  put(vm,140,"maps/q3dm1.bsp");invoke(host,vm,base,[36,140]);count=count+req(c.events[3]=="world:maps/q3dm1.bsp","world map")
  put(vm,180,"models/powerups/armor/armor_yel.md3");count=count+req(invoke(host,vm,base,[37,180])==11,"model handle")
  put(vm,230,"models/players/sarge/default.skin");count=count+req(invoke(host,vm,base,[38,230])==12,"skin handle")
  put(vm,280,"textures/sfx/quad");count=count+req(invoke(host,vm,base,[39,280])==13,"shader handle")
  count=count+req(invoke(host,vm,base,[57,280])==14,"shader no-mip handle")
  count=count+req(c.events[4]=="model:models/powerups/armor/armor_yel.md3" and c.events[7]=="nomip:textures/sfx/quad","registration names")
  invoke(host,vm,base,[40]);count=count+req(c.events[8]=="clear","clear scene")

  invoke(host,vm,base,[49,1000]);count=count+req(vm.data[1000]==21 and vm.data[1000+cg.GLCONFIG_SIZE-1]==21,"glconfig layout")
  invoke(host,vm,base,[50,13000]);count=count+req(vm.data[13000]==22 and vm.data[13000+cg.GAMESTATE_SIZE-1]==22,"gamestate layout")
  invoke(host,vm,base,[51,400,404]);count=count+req(n.readI32(vm.data,400)==77 and n.readI32(vm.data,404)==123456,"snapshot counters")
  count=count+req(invoke(host,vm,base,[52,76,34000])==1,"snapshot found")
  count=count+req(vm.data[34000]==23 and vm.data[34000+cg.SNAPSHOT_SIZE-1]==23,"snapshot layout")
  vm.data[90000]=91;count=count+req(invoke(host,vm,base,[52,75,90000])==0 and vm.data[90000]==91,"snapshot missing leaves output")
  count=count+req(invoke(host,vm,base,[53,31])==1 and invoke(host,vm,base,[53,30])==0,"server command availability")
  count=count+req(c.events[9]=="server:31" and c.events[10]=="server:30","server command sequence")
  count=count+req(invoke(host,vm,base,[54])==88,"current usercmd number")
  count=count+req(invoke(host,vm,base,[55,87,90100])==1 and vm.data[90100]==24 and vm.data[90123]==24,"usercmd layout")
  vm.data[90200]=92;count=count+req(invoke(host,vm,base,[55,86,90200])==0 and vm.data[90200]==92,"usercmd missing leaves output")
  invoke(host,vm,base,[56,5,n.floatBits(1.25)]);count=count+req(c.events[11]=="cmd:5:1.25","usercmd value")
  count=count+req(invoke(host,vm,base,[58])==654321,"memory remaining")
  invoke(host,vm,base,[72,100]);count=count+req(c.events[12]=="remove:+scores","remove command")

  count=count+req(try(invoke(host,vm,base,[49,125000])) is error,"glconfig span")
  count=count+req(try(invoke(host,vm,base,[50,0])) is error,"NULL gamestate")
  count=count+req(try(invoke(host,vm,base,[51,0,404])) is error,"NULL snapshot number")
  count=count+req(try(invoke(host,vm,base,[52,76,100000])) is error,"snapshot span")
  count=count+req(try(invoke(host,vm,base,[55,87,131060])) is error,"usercmd span")
  host.getGameStateFn=badState;count=count+req(try(invoke(host,vm,base,[50,1000])) is error,"gamestate service layout")
  host.getSnapshotFn=badSnapshot;count=count+req(try(invoke(host,vm,base,[52,76,34000])) is error,"snapshot service layout")
  empty=cg.services(host.shared,c);count=count+req(try(invoke(empty,vm,base,[37,180])) is error,"missing service")
  count=count+req(try(invoke(host,vm,base,[18])) is error,"unported collision explicit")
  count=count+req(try(invoke(host,vm,base,[41])) is error,"unported scene entity explicit")
  count=count+req(try(cg.dispatch(void,vm,base)) is error,"invalid host")
  host.getGlconfigFn=glconfig;invoke(host,vm,base,[49,132072]);count=count+req(vm.data[1000]==21,"masked output pointer")

  print "PASS: "+str(count)+" cgame-specific syscall contracts";return 0
end function
