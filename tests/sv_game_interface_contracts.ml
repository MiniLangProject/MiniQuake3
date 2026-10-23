import mq3.server.game_interface as game
import mq3.qcommon.message_delta as delta
import mq3.vm.syscall_qagame as qagame
import mq3.vm.syscall_qagame_world as qworld
import mq3.vm.syscall_common as common
import mq3.qcommon.cvar as cvar
import mq3.qcommon.command_buffer as commands
import mq3.compat.numeric as n

struct Context state events mask commandResult end struct
struct Machine data mask end struct
function req(value,label) if not value then return error(499,"sv_game interface: "+label) end if;return 1 end function
function event(c,text) c.events=c.events+[text];return void end function
function printFn(c,text) return event(c,"print:"+text) end function
function errorFn(c,text) return event(c,"error:"+text) end function
function sendFn(c,client,text) return event(c,"send:"+str(client)+":"+text) end function
function dropFn(c,client,text) return event(c,"drop:"+str(client)+":"+text) end function
function leafFn(c,point) return n.trunc32(point[0]) end function
function clusterFn(c,leaf) return leaf end function
function areaFn(c,leaf) return leaf+10 end function
function pvsFn(c,cluster) return c.mask end function
function portalFn(c,a,b,open) return event(c,"portal:"+str(a)+":"+str(b)+":"+str(open)) end function
function commandFn(c) return c.commandResult end function
function interfaceHost(context)
  h=game.services(context);h.errorFn=errorFn;h.printFn=printFn;h.sendServerCommandFn=sendFn;h.dropClientFn=dropFn
  h.pointLeafnumFn=leafFn;h.leafClusterFn=clusterFn;h.leafAreaFn=areaFn;h.clusterPvsFn=pvsFn;h.adjustAreaPortalFn=portalFn;h.gameCommandFn=commandFn;return h
end function
function put(vm,at,text) encoded=bytes(text);copyBytes(vm.data,at,encoded,0,len(encoded));vm.data[at+len(encoded)]=0;return at end function
function invoke(host,vm,base,args) for index=0 to len(args)-1 n.writeU32(vm.data,base+index*4,args[index]) end for;return qagame.dispatch(host,vm,base) end function
function locateAdapter(c,entities,count,entityStride,clients,clientStride) return game.SV_LocateGameData(c.state,entities,count,entityStride,clients,clientStride) end function
function sendAdapter(c,client,text) return game.SV_GameSendServerCommand(c.state,client,text,interfaceHost(c)) end function
function serverInfoAdapter(c) return c.state.serverInfo end function
function pvsAdapter(c,a,b,ignore) if ignore then return game.SV_inPVSIgnorePortals(a,b,interfaceHost(c)) end if;return false end function
function portalAdapter(c,entity,open) number=game.SV_NumForGentity(c.state,entity);return game.SV_AdjustAreaPortalState(c.state,number,open,interfaceHost(c)) end function
function usercmdAdapter(c,client) return game.SV_GetUsercmd(c.state,client) end function

function main(args)
  count=0;state=game.state(3);context=Context(state,[],bytes([4,0]),0);host=interfaceHost(context)
  count=count+req(try(game.SV_GentityNum(state,0)) is error,"layout required")
  count=count+req(game.SV_LocateGameData(state,100,4,64,1000,32)==void,"locate game data")
  count=count+req(game.SV_NumForGentity(state,292)==3,"entity pointer division")
  count=count+req(game.SV_GentityNum(state,2)==228 and game.SV_GameClientNum(state,2)==1064,"entity/client pointer addition")
  count=count+req(game.SV_SvEntityForGentity(state,7).number==7 and game.SV_GEntityForSvEntity(state,state.svEntities[7])==548,"sv entity conversion")
  count=count+req(try(game.SV_SvEntityForGentity(state,-1)) is error and try(game.SV_SvEntityForGentity(state,1024)) is error,"sv entity bounds")
  count=count+req(game.SV_GameSendServerCommand(state,-1,"all",host) and game.SV_GameSendServerCommand(state,2,"one",host),"command dispatch")
  count=count+req(not game.SV_GameSendServerCommand(state,3,"bad",host) and not game.SV_GameSendServerCommand(state,-2,"bad",host),"command client bounds")
  count=count+req(context.events[0]=="send:-1:all" and context.events[1]=="send:2:one","command callback arguments")
  count=count+req(game.SV_GameDropClient(state,1,"bye",host) and not game.SV_GameDropClient(state,-1,"bad",host),"drop bounds")
  count=count+req(context.events[2]=="drop:1:bye","drop callback")
  game.SV_GamePrint(host,"hello");game.SV_GameError(host,"boom")
  count=count+req(context.events[3]=="print:hello" and context.events[4]=="error:boom","print/error callbacks")
  state.serverInfo="abcdef";count=count+req(game.SV_GetServerinfo(state,7)=="abcdef" and game.SV_GetServerinfo(state,4)=="abc","serverinfo NUL capacity")
  count=count+req(try(game.SV_GetServerinfo(state,0)) is error,"serverinfo rejects zero")
  state.clients[0]=delta.userCommand(123,[1,2,3][0],[1,2,3][1],[1,2,3][2],5,6,7,8,9)
  count=count+req(game.SV_GetUsercmd(state,0).serverTime==123 and game.SV_GetUsercmd(state,0).upmove==9,"usercmd copy source")
  count=count+req(try(game.SV_GetUsercmd(state,3)) is error,"usercmd bounds")
  count=count+req(game.SV_inPVSIgnorePortals([1.0,0.0,0.0],[2.0,0.0,0.0],host),"PVS visible")
  count=count+req(not game.SV_inPVSIgnorePortals([1.0,0.0,0.0],[3.0,0.0,0.0],host),"PVS hidden")
  context.mask=void;count=count+req(game.SV_inPVSIgnorePortals([1.0,0.0,0.0],[99.0,0.0,0.0],host),"NULL PVS mask visible")
  context.mask=bytes([4]);count=count+req(not game.SV_inPVSIgnorePortals([1.0,0.0,0.0],[-1.0,0.0,0.0],host),"negative cluster safe")
  state.svEntities[4].areanum=2;state.svEntities[4].areanum2=-1;count=count+req(not game.SV_AdjustAreaPortalState(state,4,true,host),"single-area portal ignored")
  state.svEntities[4].areanum2=8;count=count+req(game.SV_AdjustAreaPortalState(state,4,true,host),"area portal callback")
  count=count+req(context.events[len(context.events)-1]=="portal:2:8:true","area portal arguments")
  state.serverState=game.SS_LOADING;count=count+req(game.SV_GameCommand(state,host)==0,"game command state gate")
  state.serverState=game.SS_GAME;context.commandResult=0;count=count+req(game.SV_GameCommand(state,host)==0,"game command false")
  context.commandResult=7;count=count+req(game.SV_GameCommand(state,host)==7,"game command raw result")
  count=count+req(game.FloatAsInt(1.0)==1065353216 and game.FloatAsInt(n.bitsFloat(-2147483648))==-2147483648,"FloatAsInt bit cast")

  // Productive qagame dispatcher wiring for the newly centralized helpers.
  state=game.state(3);state.serverInfo="\\sv_hostname\\MiniQuake3";state.clients[1]=delta.userCommand(777,1,2,3,4,5,6,7,8);state.svEntities[1].areanum=5;state.svEntities[1].areanum2=6
  context=Context(state,[],bytes([2]),0);vm=Machine(bytes(4096,0),4095);shared=common.services(cvar.create(),commands.create(),context);qh=qagame.services(shared,context)
  qh.locateGameDataFn=locateAdapter;qh.sendServerCommandFn=sendAdapter;qh.getServerinfoFn=serverInfoAdapter;qh.inPvsFn=pvsAdapter;qh.adjustAreaPortalFn=portalAdapter
  wh=qworld.services(context);wh.getUsercmdFn=usercmdAdapter;qh.worldServices=wh;base=3900
  count=count+req(invoke(qh,vm,base,[15,100,2,64,1000,32])==0 and state.gentities==100 and state.gameClients==1000,"productive locate trap")
  put(vm,300,"cp test");count=count+req(invoke(qh,vm,base,[17,-1,300])==0 and context.events[0]=="send:-1:cp test","productive command trap")
  serverResult=invoke(qh,vm,base,[22,400,16]);count=count+req(serverResult==0 and decode(slice(vm.data,400,15))=="\\sv_hostname\\Mi","productive serverinfo trap")
  n.writeU32(vm.data,500,n.floatBits(0.0));n.writeU32(vm.data,504,0);n.writeU32(vm.data,508,0);n.writeU32(vm.data,520,n.floatBits(1.0));n.writeU32(vm.data,524,0);n.writeU32(vm.data,528,0)
  count=count+req(invoke(qh,vm,base,[27,500,520])==1,"productive PVS trap")
  count=count+req(invoke(qh,vm,base,[28,164,1])==0 and context.events[len(context.events)-1]=="portal:5:6:true","productive portal trap")
  count=count+req(invoke(qh,vm,base,[36,1,600])==0 and n.readI32(vm.data,600)==777 and vm.data[621]==6 and vm.data[623]==8,"productive usercmd trap")
  print "PASS: "+str(count)+" sv_game interface contracts";return 0
end function
