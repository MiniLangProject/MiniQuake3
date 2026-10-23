// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.init_runtime as init
import mq3.qcommon.cvar as cvar
import std.string as strings
struct Context opened closes end struct
function act(host,kind,a,b,c) if kind=="open" then return host.context.opened end if;if kind=="close" then host.context.closes=host.context.closes+1 end if;return void end function
function host() h=init.services();h.context=Context(0,0);h.actionFn=act;return h end function
function repeat(value,count) result="";for i=1 to count result=result+value end for;return result end function
function main(args)
 s=init.runtime();h=host();cvar.set2(s.registry,"sv_maxclients","3",true);init.SV_Startup(s,h);s.sv.state=init.SS_GAME;s.svs.clients[0].state=init.CS_PRIMED;s.svs.clients[1].state=init.CS_PRIMED;s.svs.clients[1].noServerInfo=true
 init.SV_SetConfigstring(s,4,"warmup");init.SV_SetConfigstring(s,4,"warmup");init.SV_SetConfigstring(s,0,"server");print("config|"+s.sv.configstrings[4]+"|"+str(len(s.svs.clients[0].commands))+"|"+str(len(s.svs.clients[1].commands)))
 init.SV_SetConfigstring(s,5,repeat("x",1999));print("chunks|"+str(len(s.svs.clients[0].commands))+"|"+strings.substr(s.svs.clients[0].commands[2],0,4)+"|"+strings.substr(s.svs.clients[0].commands[3],0,4)+"|"+strings.substr(s.svs.clients[0].commands[4],0,4)+"|"+str(len(bytes(s.svs.clients[0].commands[2]))))
 init.SV_SetUserinfo(s,0,"\\name\\ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789\\rate\\25000");print("get|"+init.SV_GetConfigstring(s,4,5)+"|"+s.svs.clients[0].name+"|"+str(len(bytes(s.svs.clients[0].name))));print("userinfo|"+init.SV_GetUserinfo(s,0,8))
 s.sv.numEntities=4;s.sv.entities[1].linked=true;s.sv.entities[1].state.eType=7;s.sv.entities[3].linked=true;s.sv.entities[3].state.modelindex=9;init.SV_CreateBaseline(s);s.sv.entities[1].state.eType=8;print("base|"+str(s.sv.baselines[1].number)+"|"+str(s.sv.baselines[1].eType)+"|"+str(s.sv.baselines[3].number)+"|"+str(s.sv.baselines[3].modelindex))
 s=init.runtime();h=host();cvar.set2(s.registry,"sv_maxclients","3",true);init.SV_Startup(s,h);print("startup|1|"+str(s.maxClients)+"|"+str(s.svs.numSnapshotEntities));s.svs.clients[2].state=init.CS_CONNECTED;s.svs.clients[2].tag=77;cvar.set2(s.registry,"sv_maxclients","1",true);init.SV_ChangeMaxClients(s,h);print("floor|"+str(s.maxClients)+"|"+str(s.svs.clients[2].tag));s.svs.clients[2].state=init.CS_FREE;cvar.set2(s.registry,"sv_maxclients","6",true);init.SV_ChangeMaxClients(s,h);print("grow|"+str(s.maxClients)+"|"+str(s.svs.numSnapshotEntities))
 s.sv.configstrings[9]="x";s.sv.state=init.SS_GAME;init.SV_ClearServer(s);print("clear|"+str(s.sv.state)+"|00000000");h.context.opened=7;init.SV_TouchCGame(s,h);print("touch|"+str(h.context.closes));return 0
end function
