import mq3.client.cl_cgame_runtime as cl
import mq3.client.cgame_vm as cgameVm
import mq3.client.cgame_time as timing
import mq3.client.snapshot_command as snapshot
import mq3.game.entitystate as entitystate
import mq3.game.playerstate as playerstate
import mq3.vm.syscall_cgame as syscall
import mq3.vm.syscall_common as common
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as command
import mq3.compat.numeric as n

struct Capture events system loadChecksum calls frees time end struct
struct Machine data mask end struct
struct Cmd serverTime angles buttons weapon forwardmove rightmove upmove end struct
function req(value,label) if not value then return error(499,"cl_cgame contract: "+label) end if;return 1 end function
function add(c,name) c.events=c.events+["add:"+name];return void end function
function system(c) c.system=c.system+1;return void end function
function loadMap(c,name,clientLoad) c.events=c.events+["map:"+name+":"+str(clientLoad)];return c.loadChecksum end function
function loadVm(runtime,name,callback,interpret) runtime.events=runtime.events+["load:"+name+":"+str(interpret)];return 17 end function
function callVm(runtime,slot,args) runtime.calls=runtime.calls+[args];return args[0]+100 end function
function freeVm(runtime,slot) runtime.frees=runtime.frees+1;return void end function
function clearNotify(c) c.events=c.events+["clear-notify"];return void end function
function closeConsole(c) c.events=c.events+["close-console"];return void end function
function queueConsole(c,text) c.events=c.events+["queue:"+text];return void end function
function vmSyscall(machine,base) return 0 end function
function milliseconds(c) return c.time end function
function serverInfo(c) return "\\mapname\\q3dm1" end function

function main(args)
  count=0;c=Capture([],0,777,[],0,1234);svc=cl.services();svc.context=c;svc.addCommandFn=add;svc.systemInfoFn=system;svc.loadMapFn=loadMap
  svc.clearNotifyFn=clearNotify;svc.closeConsoleFn=closeConsole;svc.queueConsoleFn=queueConsole
  vmHost=cgameVm.services(c,vmSyscall,loadVm,callVm,freeVm);vmHost.context=c;vmHost.millisecondsFn=milliseconds;vmHost.serverInfoFn=serverInfo;vm=cgameVm.create(vmHost)
  t=timing.create(timing.services());state=cl.create(svc,vm,t,void,void)
  count=count+req(len(cl.CL_GetGameState(state))==syscall.GAMESTATE_SIZE and n.readU32(cl.CL_GetGameState(state),20096)==1,"game state copy")
  state.glconfig[7]=91;copy=cl.CL_GetGlconfig(state);copy[7]=0;count=count+req(state.glconfig[7]==91,"glconfig value copy")
  count=count+req(cl.CL_ConfigstringModified(state,5,"alpha"),"config change")
  gs=cl.CL_GetGameState(state);at=n.readU32(gs,20);count=count+req(at==1 and decode(slice(gs,4096+at,5))=="alpha" and n.readU32(gs,20096)==7,"packed game state")
  count=count+req(not cl.CL_ConfigstringModified(state,5,"alpha"),"unchanged config")
  cl.CL_ConfigstringModified(state,cl.CS_SYSTEMINFO,"\\sv_serverid\\2");count=count+req(c.system==1,"systeminfo callback")

  u=Cmd(123,[11,22,33],7,4,-2,3,1);state.cmdNumber=70;state.commands[69&63]=u
  got=cl.CL_GetUserCmd(state,69);count=count+req(got.found and n.readI32(got.data,0)==123 and n.readI32(got.data,8)==22 and got.data[20]==4 and got.data[21]==254,"usercmd ABI")
  count=count+req(not cl.CL_GetUserCmd(state,6).found,"stale usercmd")
  count=count+req(try(cl.CL_GetUserCmd(state,71)) is error,"future usercmd")
  count=count+req(cl.CL_GetCurrentCmdNumber(state)==70,"current command")
  cl.CL_SetUserCmdValue(state,9,1.25);count=count+req(state.usercmd.weapon==9 and state.usercmd.sensitivity==1.25,"set usercmd value")

  parsed=state.snapshots.entityState;parsed.parseEntitiesNum=2100;e=entitystate.create();e.number=52;e.eType=3;parsed.parseEntities[2099&2047]=e
  pe=cl.CL_GetParseEntityState(state,2099);count=count+req(pe.found and pe.value.number==52,"parse entity")
  count=count+req(not cl.CL_GetParseEntityState(state,52).found,"stale parse entity")
  count=count+req(try(cl.CL_GetParseEntityState(state,2100)) is error,"future parse entity")

  shot=snapshot.emptySnapshot();shot.valid=true;shot.messageNum=9;shot.serverTime=4567;shot.snapFlags=3;shot.ping=44;shot.parseEntitiesNum=1844;shot.numEntities=300;shot.serverCommandNum=81;shot.playerState=playerstate.create();shot.playerState.commandTime=4444
  for index=0 to 255 ent=entitystate.create();ent.number=index;parsed.parseEntities[(shot.parseEntitiesNum+index)&2047]=ent end for
  state.snapshots.snap=snapshot.copySnapshot(shot);state.snapshots.snapshots[9&31]=snapshot.copySnapshot(shot);parsed.parseEntitiesNum=2100
  sn=cl.CL_GetCurrentSnapshotNumber(state);count=count+req(sn.number==9 and sn.serverTime==4567,"snapshot counters")
  fetched=cl.CL_GetSnapshot(state,9);count=count+req(fetched.found and len(fetched.data)==syscall.SNAPSHOT_SIZE,"snapshot ABI size")
  count=count+req(n.readI32(fetched.data,0)==3 and n.readI32(fetched.data,4)==44 and n.readI32(fetched.data,8)==4567,"snapshot header")
  count=count+req(n.readI32(fetched.data,44)==4444 and n.readI32(fetched.data,512)==256 and n.readI32(fetched.data,53768)==81,"snapshot body and truncation")
  count=count+req(not cl.CL_GetSnapshot(state,-23).found,"stale snapshot")
  count=count+req(try(cl.CL_GetSnapshot(state,10)) is error,"future snapshot")

  cl.CL_AddCgameCommand(state,"+scores");count=count+req(c.events[len(c.events)-1]=="add:+scores","add cgame command")
  count=count+req(try(cl.CL_CgameError(state,"boom")) is error,"cgame error")
  count=count+req(cl.CL_CM_LoadMap(state,"maps/q3dm1.bsp")==777 and c.events[len(c.events)-1]=="map:maps/q3dm1.bsp:true","collision map")
  state.commandStream.commandSequence=1;state.commandStream.commands[1]="cs 7 \"retail value\"";count=count+req(cl.CL_GetServerCommand(state,1) and state.configstrings[7]=="retail value","server config command")
  stateBytes=cl.CL_GetGameState(state);configAt=n.readU32(stateBytes,7*4);count=count+req(configAt>0 and decode(slice(stateBytes,4096+configAt,12))=="retail value","server config packed ABI")
  state.commands[0]=u;state.commandStream.commandSequence=2;state.commandStream.commands[2]="map_restart";cl.CL_GetServerCommand(state,2)
  count=count+req(state.commands[0]==void and c.events[len(c.events)-1]=="clear-notify","map restart clears commands and notify")
  state.commandStream.commandSequence=3;state.commandStream.commands[3]="clientLevelShot";before=len(c.events)
  count=count+req(not cl.CL_GetServerCommand(state,3) and len(c.events)==before,"remote level shot rejected")
  svc.serverRunning=true;state.commandStream.commandSequence=4;state.commandStream.commands[4]="clientLevelShot"
  count=count+req(cl.CL_GetServerCommand(state,4),"local level shot accepted")
  count=count+req(c.events[len(c.events)-3]=="clear-notify" and c.events[len(c.events)-2]=="close-console" and c.events[len(c.events)-1]=="queue:wait ; wait ; wait ; wait ; screenshot levelshot\n","local level shot closes console and queues screenshot")

  state.serverMessageSequence=12;state.lastExecutedServerCommand=8;state.clientNum=3;state.connectedToPureServer=1;state.vmCgame=0
  count=count+req(cl.CL_InitCGame(state)==17 and vm.connectionState==cgameVm.CA_PRIMED and vm.mapname=="maps/q3dm1.bsp","init lifecycle")
  count=count+req(c.calls[0][0]==cgameVm.CG_INIT and c.calls[0][1]==12 and c.calls[0][2]==8 and c.calls[0][3]==3,"init arguments")
  count=count+req(cl.CL_GameCommand(state)==102,"console export")
  state.timing.serverTime=900;state.demoPlaying=true;count=count+req(cl.CL_CGameRendering(state,2)==103 and vm.lastArgs[1]==900 and vm.lastArgs[2]==2 and vm.lastArgs[3]==1,"render export")
  cl.CL_ShutdownCGame(state);count=count+req(not vm.active and c.frees==1 and c.calls[len(c.calls)-1][0]==cgameVm.CG_SHUTDOWN,"shutdown lifecycle")

  state.timing.snapServerTime=1000;state.timing.realtime=900;state.timing.serverTimeDelta=50;cl.CL_AdjustTimeDelta(state);count=count+req(state.timing.serverTimeDelta==51,"adjust time wrapper")
  state.timing.connectionState=timing.CA_PRIMED;state.timing.snapFlags=0;state.timing.snapServerTime=1100;state.timing.realtime=1000;count=count+req(cl.CL_FirstSnapshot(state) and state.timing.connectionState==timing.CA_ACTIVE,"first snapshot wrapper")
  state.timing.snapValid=true;count=count+req(cl.CL_SetCGameTime(state),"set cgame time wrapper")
  count=count+req(cl.FloatAsInt(1.0)==1065353216 and cl.FloatAsInt(n.bitsFloat(-2147483648))==-2147483648,"float bit cast")

  machine=Machine(bytes(4096,0),4095);shared=common.services(cvar.create(),command.create(),c);shared.millisecondsFn=milliseconds;sysHost=syscall.services(shared,c)
  callback=cl.wireSyscalls(state,sysHost,machine);base=4000;n.writeU32(machine.data,base,2);count=count+req(cl.CL_CgameSystemCalls(state,base)==1234,"syscall dispatch")
  count=count+req(callback(machine,base)==1234,"syscall callback")
  print "PASS: "+str(count)+" complete cl_cgame contracts";return 0
end function
