// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.init_runtime as init
import mq3.format.pk3 as pk3
import mq3.qcommon.cvar as cvar
struct Context archive mapBytes cgameBytes events end struct
function req(value,label) if not value then return error(7383,"sv_init Retail: "+label) end if;return 1 end function
function act(host,kind,a,b,c)
  host.context.events=host.context.events+[kind]
  if kind=="load-map" then data=pk3.read(host.context.archive,a);if data is error then return data end if;host.context.mapBytes=len(data);return len(data) end if
  if kind=="open" then data=pk3.read(host.context.archive,a);if data is error then return 0 end if;host.context.cgameBytes=len(data);return 1 end if
  if kind=="loaded-pak-checksums" then return "retail-pak0" end if
  if kind=="loaded-pak-names" then return "pak0" end if
  if kind=="referenced-pak-checksums" then return "retail-pak0" end if
  if kind=="referenced-pak-names" then return "pak0" end if
  if kind=="system-info" then return "\\sv_pure\\1\\sv_pakNames\\pak0" end if
  if kind=="server-info" then return "\\mapname\\q3dm1\\sv_hostname\\MiniQuake3" end if
  return void
end function
function contains(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function
function main(args)
  if len(args)!=1 then return error(7383,"usage: sv_init_retail_probe <pak0.pk3>") end if
  archive=pk3.open(args[0]);if archive is error then return archive end if
  context=Context(archive,0,0,[]);host=init.services();host.context=context;host.actionFn=act
  state=init.runtime();init.SV_Init(state,host);state.dedicated=1;state.pure=1;state.frameTime=132000;cvar.set2(state.registry,"sv_maxclients","2",true);init.SV_Startup(state,host);state.svs.clients[0].state=init.CS_CONNECTED;state.svs.clients[0].name="Ranger"
  checksum=init.SV_SpawnServer(state,host,"q3dm1",false);checks=0
  checks=checks+req(context.mapBytes>100000 and checksum==context.mapBytes,"real q3dm1 BSP load")
  checks=checks+req(context.cgameBytes>10000,"real cgame QVM touch")
  checks=checks+req(state.sv.state==init.SS_GAME and state.sv.mapname=="q3dm1","productive spawn completion")
  checks=checks+req(state.svs.clients[0].state==init.CS_CONNECTED,"connected human carried across map")
  checks=checks+req(cvar.find(state.registry,"sv_pakNames").string=="pak0" and cvar.find(state.registry,"sv_referencedPakNames").string=="pak0","Retail pak publication")
  checks=checks+req(state.sv.configstrings[init.CS_SERVERINFO]=="\\mapname\\q3dm1\\sv_hostname\\MiniQuake3","serverinfo publication")
  checks=checks+req(contains(context.events,"init-game") and contains(context.events,"heartbeat") and contains(context.events,"hunk-mark"),"lifecycle host traversal")
  checks=checks+req(init.SV_Shutdown(state,host,"Server quit") and not state.running,"productive shutdown")
  print("PASS: "+str(checks)+" Retail sv_init contracts bsp="+str(context.mapBytes)+" cgame="+str(context.cgameBytes));return 0
end function
