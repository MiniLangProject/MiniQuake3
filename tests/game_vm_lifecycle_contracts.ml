// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.game_vm as gameVm

struct Context events loads seed end struct
struct MockSlot name active generation end struct
function syscall(machine,address) return 0 end function
function milliseconds(context) context.events=context.events+"milliseconds,";return context.seed end function
function entityString(context) context.events=context.events+"entities,";return "entity-token-0" end function
function clearClient(context,index) context.events=context.events+"clear:"+str(index)+",";return void end function
function botEnable(context) context.events=context.events+"bot-enable,";return 1 end function
function loadVm(context,name,callback) context.loads=context.loads+1;context.events=context.events+"load:"+name+",";return MockSlot(name,true,1) end function
function callVm(context,slot,arguments) if not slot.active then return error(3438,"mock call inactive") end if;return arguments[0] end function
function restartVm(context,slot) slot.generation=slot.generation+1;context.events=context.events+"restart:"+slot.name+",";return slot end function
function freeVm(context,slot) slot.active=false;context.events=context.events+"free:"+slot.name+",";return void end function
function req(value,label) if not value then return error(3439,"game VM contract: "+label) end if;return 1 end function

function main(args)
  count=0;context=Context("",0,12345)
  host=gameVm.services(context,syscall,loadVm,callVm,restartVm,freeVm);host.context=context
  host.millisecondsFn=milliseconds;host.entityStringFn=entityString;host.clearClientEntityFn=clearClient;host.botEnableFn=botEnable
  state=gameVm.create(host)
  count=count+req(not state.active and state.callCount==0,"fresh state")
  slot=gameVm.initialize(state,7000,3)
  count=count+req(state.active and slot==state.slot and slot.generation==1,"initial load")
  count=count+req(state.botEnable==1 and state.entityParsePoint=="entity-token-0","server setup")
  count=count+req(state.lastExport==gameVm.GAME_INIT and state.lastArgs[1]==7000 and state.lastArgs[2]==12345 and state.lastArgs[3]==0,"GAME_INIT arguments")
  count=count+req(context.events=="bot-enable,load:qagame,entities,clear:0,clear:1,clear:2,milliseconds,","initial order")
  count=count+req(gameVm.clientConnect(state,2,true,false)==gameVm.GAME_CLIENT_CONNECT and state.lastArgs[1]==2 and state.lastArgs[2]==1 and state.lastArgs[3]==0,"client connect")
  count=count+req(gameVm.clientBegin(state,2)==gameVm.GAME_CLIENT_BEGIN,"client begin")
  count=count+req(gameVm.clientUserinfoChanged(state,2)==gameVm.GAME_CLIENT_USERINFO_CHANGED,"userinfo")
  count=count+req(gameVm.clientCommand(state,2)==gameVm.GAME_CLIENT_COMMAND,"client command")
  count=count+req(gameVm.clientThink(state,2)==gameVm.GAME_CLIENT_THINK,"client think")
  count=count+req(gameVm.runFrame(state,7100)==gameVm.GAME_RUN_FRAME and state.lastArgs[1]==7100,"run frame")
  count=count+req(gameVm.consoleCommand(state)==gameVm.GAME_CONSOLE_COMMAND,"console command")
  count=count+req(gameVm.botStartFrame(state,7110)==gameVm.BOTAI_START_FRAME,"bot frame")
  count=count+req(gameVm.clientDisconnect(state,2)==gameVm.GAME_CLIENT_DISCONNECT,"disconnect")
  old=state.slot;gameVm.restart(state,8000,1)
  count=count+req(state.active and state.slot==old and state.slot.generation==2,"VM restart")
  count=count+req(state.lastExport==gameVm.GAME_INIT and state.lastArgs[1]==8000 and state.lastArgs[3]==1,"restart GAME_INIT")
  count=count+req(context.events=="bot-enable,load:qagame,entities,clear:0,clear:1,clear:2,milliseconds,restart:qagame,entities,clear:0,milliseconds,","restart order")
  finalSlot=state.slot;gameVm.shutdown(state);count=count+req(not state.active and state.slot==void and not finalSlot.active,"shutdown frees")
  calls=state.callCount;gameVm.shutdown(state);count=count+req(state.callCount==calls,"inactive shutdown is harmless")
  count=count+req(try(gameVm.runFrame(state,9000)) is error,"inactive call rejected")
  count=count+req(try(gameVm.initialize(state,0,-1)) is error,"negative clients rejected")
  count=count+req(try(gameVm.create(gameVm.services(void,syscall,loadVm,callVm,restartVm,freeVm))) is error,"runtime required")
  print "PASS: "+str(count)+" game VM lifecycle contracts";return 0
end function
