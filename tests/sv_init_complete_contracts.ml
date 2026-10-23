// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.init_runtime as init
import mq3.qcommon.cvar as cvar
import mq3.game.entitystate as entitystate

struct Context events snapshots end struct
function req(value,label) if not value then return error(7382,"sv_init contract: "+label) end if;return 1 end function
function act(host,kind,a,b,c)
  host.context.events=host.context.events+[[kind,a,b,c]]
  if kind=="load-map" then return 123456 end if
  if kind=="loaded-pak-checksums" then return "111 222" end if
  if kind=="loaded-pak-names" then return "pak1 pak0" end if
  if kind=="referenced-pak-checksums" then return "222" end if
  if kind=="referenced-pak-names" then return "pak0" end if
  if kind=="system-info" then return "\\sv_serverid\\99" end if
  if kind=="server-info" then return "\\mapname\\q3dm1" end if
  if kind=="open" then return 7 end if
  if kind=="snapshot" then host.context.snapshots=host.context.snapshots+1 end if
  return void
end function
function millis(host) return 17 end function
function host() value=init.services();value.context=Context([],0);value.actionFn=act;value.millisecondsFn=millis;return value end function
function repeat(value,count) result="";for index=1 to count result=result+value end for;return result end function
function eventCount(h,kind) count=0;for each event in h.context.events if event[0]==kind then count=count+1 end if end for;return count end function

function main(args)
  n=0;s=init.runtime();h=host();cvar.set2(s.registry,"sv_maxclients","3",true);init.SV_Startup(s,h)
  n=n+req(s.maxClients==3 and len(s.svs.clients)==3 and s.svs.numSnapshotEntities==768,"listen startup")
  n=n+req(s.running and s.svs.initialized,"startup state")
  failed=try(init.SV_Startup(s,h));n=n+req(failed is error,"double startup rejected")

  s.sv.state=init.SS_GAME;s.svs.clients[0].state=init.CS_PRIMED;s.svs.clients[1].state=init.CS_ACTIVE;s.svs.clients[1].noServerInfo=true
  n=n+req(init.SV_SetConfigstring(s,4,"warmup")==2,"normal config broadcast")
  n=n+req(s.svs.clients[0].commands[0]=="cs 4 \"warmup\"\n","normal config wire")
  n=n+req(init.SV_SetConfigstring(s,4,"warmup")==0,"unchanged config quiet")
  long=repeat("x",1999);n=n+req(init.SV_SetConfigstring(s,5,long)==6,"chunk delivery count")
  n=n+req(len(s.svs.clients[0].commands)==4 and len(bytes(s.svs.clients[0].commands[1]))==1009,"first chunk payload")
  n=n+req(init.SV_SetConfigstring(s,init.CS_SERVERINFO,"server")==1,"no-serverinfo filter")
  n=n+req(init.SV_GetConfigstring(s,4,5)=="warm","config bounded read")
  bad=try(init.SV_GetConfigstring(s,1024,4));n=n+req(bad is error,"config index guard")

  init.SV_SetUserinfo(s,0,"\\name\\123456789012345678901234567890123456\\rate\\25000")
  n=n+req(len(bytes(s.svs.clients[0].name))==31,"name truncation")
  n=n+req(init.SV_GetUserinfo(s,0,8)=="\\name\\1","userinfo read")
  bad=try(init.SV_GetUserinfo(s,3,8));n=n+req(bad is error,"userinfo index guard")

  s.sv.numEntities=4;s.sv.entities[1].linked=true;s.sv.entities[1].state.eType=7;s.sv.entities[3].linked=true;s.sv.entities[3].state.modelindex=9
  n=n+req(init.SV_CreateBaseline(s)==2,"baseline linked entities")
  n=n+req(s.sv.baselines[1].number==1 and s.sv.baselines[1].eType==7 and s.sv.baselines[3].number==3,"baseline copy")
  s.sv.entities[1].state.eType=8;n=n+req(s.sv.baselines[1].eType==7,"baseline deep copy")

  s.svs.clients[2].state=init.CS_CONNECTED;s.svs.clients[2].tag=77;cvar.set2(s.registry,"sv_maxclients","1",true)
  n=n+req(not init.SV_ChangeMaxClients(s,h) and s.maxClients==3,"highest connected lower bound")
  s.svs.clients[2].state=init.CS_FREE;cvar.set2(s.registry,"sv_maxclients","6",true)
  n=n+req(init.SV_ChangeMaxClients(s,h) and s.maxClients==6 and len(s.svs.clients)==6,"grow clients")
  n=n+req(s.svs.clients[0].state==init.CS_PRIMED,"connected client preserved")
  cvar.set2(s.registry,"sv_maxclients","99",true);n=n+req(init.SV_BoundMaxClients(s,1)==64,"max client clamp")

  s=init.runtime();h=host();n=n+req(init.SV_Init(s,h)==40,"full cvar registry")
  n=n+req(cvar.find(s.registry,"sv_hostname").string=="noname" and cvar.find(s.registry,"protocol").integer==68,"init defaults")
  n=n+req(s.operatorCommands and s.botInitialized and eventCount(h,"botlib-init")==1,"init services")
  s.dedicated=1;cvar.set2(s.registry,"sv_maxclients","2",true);s.frameTime=99;s.svs.time=1000
  init.SV_Startup(s,h);s.svs.clients[0].state=init.CS_ACTIVE;s.svs.clients[0].bot=false;s.svs.clients[1].state=init.CS_CONNECTED;s.svs.clients[1].bot=true;s.sv.numEntities=2;s.sv.entities[1].linked=true
  checksum=init.SV_SpawnServer(s,h,"q3dm1",false)
  n=n+req(checksum==123456 and s.sv.mapname=="q3dm1" and s.sv.mapChecksum==123456,"spawn map")
  n=n+req(s.sv.state==init.SS_GAME and s.svs.time==1400 and s.svs.snapFlagServerBit==4,"spawn frames/state")
  n=n+req(s.svs.clients[0].state==init.CS_CONNECTED and s.svs.clients[1].state==init.CS_ACTIVE,"human/bot reconnect")
  n=n+req(s.svs.clients[1].deltaMessage==-1 and s.svs.clients[1].nextSnapshotTime==1300,"bot immediate snapshot")
  n=n+req(cvar.find(s.registry,"sv_paks").string=="111 222" and cvar.find(s.registry,"sv_referencedPakNames").string=="pak0","pure pak cvars")
  n=n+req(s.sv.configstrings[init.CS_SYSTEMINFO]=="\\sv_serverid\\99" and s.sv.configstrings[init.CS_SERVERINFO]=="\\mapname\\q3dm1","spawn info configstrings")
  n=n+req(eventCount(h,"game-frame")==4 and eventCount(h,"bot-frame")==4,"settling frames")
  n=n+req(eventCount(h,"open")==1 and eventCount(h,"close")==1,"dedicated cgame touch")
  n=n+req(eventCount(h,"heartbeat")==1 and eventCount(h,"hunk-mark")==1,"spawn completion")

  s.svs.clients[0].loopback=true;s.svs.clients[0].state=init.CS_CONNECTED;s.svs.clients[1].loopback=false;s.svs.clients[1].state=init.CS_ACTIVE
  n=n+req(init.SV_FinalMessage(s,h,"bye")==4 and h.context.snapshots==4,"double final snapshots")
  n=n+req(len(s.svs.clients[0].commands)==0 and s.svs.clients[1].commands[len(s.svs.clients[1].commands)-1]=="disconnect","loopback final filtering")
  n=n+req(init.SV_Shutdown(s,h,"quit") and not s.running and len(s.svs.clients)==0,"shutdown clears static state")
  n=n+req(not init.SV_Shutdown(s,h,"again"),"shutdown idempotence")
  n=n+req(eventCount(h,"remove-operator-commands")==1 and eventCount(h,"client-disconnect")==1,"shutdown services")
  print("PASS: "+str(n)+" sv_init complete contracts");return 0
end function
