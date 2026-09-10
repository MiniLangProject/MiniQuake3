// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.system_info as systemInfo
import mq3.client.gamestate as gamestate
struct Context events fsGame svPure end struct
function req(value,label) if not value then return error(499,"systeminfo: "+label) end if;return 1 end function
function event(host,value) host.context.events=host.context.events+[value] end function
function cheats(host) event(host,"cheats") end function
function loaded(host,paks,names) event(host,"loaded:"+paks+":"+names) end function
function referenced(host,paks,names) event(host,"referenced:"+paks+":"+names) end function
function setCvar(host,key,value) event(host,"set:"+key+"="+value);if key=="fs_game" then host.context.fsGame=value end if;if key=="sv_pure" then host.context.svPure=value end if end function
function getCvar(host,key) if key=="fs_game" then return host.context.fsGame end if;if key=="sv_pure" then return host.context.svPure end if;return "" end function
function host(fsGame) result=systemInfo.services();result.context=Context([],fsGame,"0");result.cheatResetFn=cheats;result.loadedPaksFn=loaded;result.referencedPaksFn=referenced;result.setCvarFn=setCvar;result.getCvarFn=getCvar;return result end function
function main(args)
  count=0;state=systemInfo.create();service=host("oldmod")
  text="\\sv_serverid\\42\\sv_cheats\\0\\sv_paks\\1 2\\sv_pakNames\\a b\\sv_referencedPaks\\3\\sv_referencedPakNames\\c\\sv_pure\\1\\fs_game\\mymod"
  count=count+req(systemInfo.apply(state,service,text)==8,"pair count")
  count=count+req(state.serverId==42 and state.connectedPure==1,"server and pure state")
  count=count+req(service.context.fsGame=="mymod","fs_game set")
  count=count+req(service.context.events[0]=="cheats","cheat reset first")
  count=count+req(service.context.events[1]=="loaded:1 2:a b","loaded paks")
  count=count+req(service.context.events[2]=="referenced:3:c","referenced paks")
  count=count+req(service.context.events[len(service.context.events)-1]=="set:fs_game=mymod","cvars preserve order")
  state=systemInfo.create();service=host("oldmod");systemInfo.apply(state,service,"\\sv_serverid\\7\\sv_cheats\\1\\sv_pure\\0")
  count=count+req(state.serverId==7 and state.connectedPure==0,"nonpure state")
  count=count+req(service.context.fsGame=="","missing fs_game cleared")
  count=count+req(service.context.events[0]!="cheats","cheats enabled preserves cheat cvars")
  state=systemInfo.create();state.demoPlaying=true;service=host("keep");systemInfo.apply(state,service,"\\sv_serverid\\99\\sv_pure\\1\\fs_game\\ignored")
  count=count+req(state.serverId==99 and state.connectedPure==0,"demo only updates server id")
  count=count+req(service.context.events==[] and service.context.fsGame=="keep","demo has no policy side effects")
  values=systemInfo.pairs("\\a\\1\\b\\2");count=count+req(values==[["a","1"],["b","2"]],"pair parser")
  values=systemInfo.pairs("a\\1\\dangling");count=count+req(values==[["a","1"],["dangling",""]],"nonleading and dangling pair")
  state=systemInfo.create();service=host("");systemInfo.apply(state,service,"\\sv_serverid\\5\\sv_cheats\\1\\sv_pure\\0.9");count=count+req(state.connectedPure==0,"cvar float truncates below one")
  state=systemInfo.create();service=host("");systemInfo.apply(state,service,"\\sv_serverid\\6\\sv_cheats\\1\\sv_pure\\1.9");count=count+req(state.connectedPure==1,"cvar float truncates above one")
  state=systemInfo.create();service=host("old");systemInfo.apply(state,service,"\\sv_serverid\\8\\sv_cheats\\1\\sv_pure\\1\\FS_GAME\\CaseMod");count=count+req(service.context.fsGame=="old","case-sensitive host fixture remains explicit")
  count=count+req(service.context.events[len(service.context.events)-1]=="set:FS_GAME=CaseMod","fs_game detection is case-insensitive")
  state=systemInfo.create();service=host("");count=count+req(systemInfo.apply(state,service,"")==0 and state.serverId==0,"empty info")
  count=count+req(try(systemInfo.apply(void,service,text)) is error,"missing state rejected")
  game=gamestate.create();raw=bytes("\\sv_serverid\\123\\sv_cheats\\1\\sv_pure\\1");game.stringOffsets[1]=1;for i=0 to len(raw)-1 game.stringData[i+1]=raw[i] end for
  bound=systemInfo.create();service=host("");systemInfo.install(game,bound,service)
  count=count+req(game.systemInfoFn!=void and game.context is systemInfo.Binding,"gamestate binding installed")
  game.systemInfoFn(game);count=count+req(bound.serverId==123 and bound.connectedPure==1,"gamestate callback applies policy")
  print "PASS: "+str(count)+" systeminfo contracts";return 0
end function
