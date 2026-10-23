import mq3.server.game_interface as game
import mq3.qcommon.message_delta as delta
import mq3.compat.numeric as n

struct Context events pvs vmResult end struct
function append(c,text) c.events=c.events+text+";";return void end function
function gameError(c,text) return append(c,"error") end function
function gamePrint(c,text) return append(c,"print:"+text) end function
function send(c,client,text) return append(c,"send:"+str(client)+":"+text) end function
function drop(c,client,text) return append(c,"drop:"+str(client)+":"+text) end function
function leaf(c,point) return n.trunc32(point[0]) end function
function cluster(c,leafnum) return leafnum end function
function area(c,leafnum) return leafnum+10 end function
function pvs(c,cluster) return c.pvs end function
function portal(c,a,b,open) flag=0;if open then flag=1 end if;return append(c,"portal:"+str(a)+":"+str(b)+":"+str(flag)) end function
function command(c) return c.vmResult end function
function bit(value) if value then return 1 end if;return 0 end function
function host(context)
  h=game.services(context);h.errorFn=gameError;h.printFn=gamePrint;h.sendServerCommandFn=send;h.dropClientFn=drop
  h.pointLeafnumFn=leaf;h.leafClusterFn=cluster;h.leafAreaFn=area;h.clusterPvsFn=pvs;h.adjustAreaPortalFn=portal;h.gameCommandFn=command;return h
end function
function main(args)
  state=game.state(4);game.SV_LocateGameData(state,1000,4,32,2000,16);state.svEntities[2].areanum=3;state.svEntities[2].areanum2=7
  print "layout|"+str(game.SV_NumForGentity(state,1096))+"|"+str(game.SV_GentityNum(state,2)-1000)+"|"+str(game.SV_GameClientNum(state,3)-2000)+"|"+str(game.SV_SvEntityForGentity(state,2).number*8)+"|"+str(game.SV_GEntityForSvEntity(state,state.svEntities[2])-1000)
  c=Context("",bytes([4,0]),9);h=host(c);game.SV_GamePrint(h,"hello");game.SV_GameSendServerCommand(state,-1,"broadcast",h);game.SV_GameSendServerCommand(state,2,"direct",h);game.SV_GameSendServerCommand(state,9,"ignored",h);game.SV_GameDropClient(state,1,"bye",h);game.SV_GameDropClient(state,-1,"ignored",h);print "events|"+c.events
  print "pvs|"+str(bit(game.SV_inPVSIgnorePortals([1.0,0.0,0.0],[2.0,0.0,0.0],h)))+"|"+str(bit(game.SV_inPVSIgnorePortals([1.0,0.0,0.0],[3.0,0.0,0.0],h)))
  c.events="";game.SV_AdjustAreaPortalState(state,2,true,h);state.svEntities[2].areanum2=-1;game.SV_AdjustAreaPortalState(state,2,false,h);print "portal|"+c.events
  state.serverInfo="\\sv_hostname\\MiniQuake3";state.clients[3]=delta.userCommand(1234,0,0,0,77,0,0,0,0);cmd=game.SV_GetUsercmd(state,3);print "data|"+game.SV_GetServerinfo(state,12)+"|"+str(cmd.serverTime)+"|"+str(cmd.buttons)
  print "float|"+str(game.FloatAsInt(1.0))+"|"+str(game.FloatAsInt(n.bitsFloat(-2147483648)))
  state.serverState=game.SS_LOADING;first=game.SV_GameCommand(state,h);state.serverState=game.SS_GAME;c.vmResult=0;second=game.SV_GameCommand(state,h);c.vmResult=5;third=game.SV_GameCommand(state,h);print "command|"+str(first)+"|"+str(second)+"|"+str(third)
  return 0
end function
