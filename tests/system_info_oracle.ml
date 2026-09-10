// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.client.system_info as systemInfo
import std.string as strings

struct Context events keys values end struct
function find(context,key)
  for i=0 to len(context.keys)-1
    if strings.equalsIgnoreCaseAscii(context.keys[i],key) then return i end if
  end for
  return -1
end function
function get(host,key) index=find(host.context,key);if index<0 then return "" end if;return host.context.values[index] end function
function put(host,key,value)
  index=find(host.context,key)
  if index<0 then host.context.keys=host.context.keys+[key];host.context.values=host.context.values+[value]
  else host.context.values[index]=value end if
end function
function event(host,kind,a,b)
  text=kind
  if a!=void then text=text+a end if
  if b!=void then text=text+"="+b end if
  host.context.events=host.context.events+text+";"
end function
function cheats(host) event(host,"cheats",void,void) end function
function loaded(host,paks,names) event(host,"loaded:",paks,names) end function
function referenced(host,paks,names) event(host,"referenced:",paks,names) end function
function set(host,key,value) put(host,key,value);event(host,"set:",key,value) end function
function make(fsGame)
  host=systemInfo.services();host.context=Context("",["fs_game"],[fsGame]);host.cheatResetFn=cheats
  host.loadedPaksFn=loaded;host.referencedPaksFn=referenced;host.setCvarFn=set;host.getCvarFn=get;return host
end function
function run(name,text,fsGame,demo,connected)
  state=systemInfo.create();state.demoPlaying=demo;state.connectedPure=connected;host=make(fsGame)
  systemInfo.apply(state,host,text)
  print name+"|server="+str(state.serverId)+"|pure="+str(state.connectedPure)+"|fs="+get(host,"fs_game")+"|events="+host.context.events
end function
function main(args)
  run("normal","\\sv_serverid\\42\\sv_cheats\\0\\sv_paks\\1 2\\sv_pakNames\\a b\\sv_referencedPaks\\3\\sv_referencedPakNames\\c\\sv_pure\\1\\fs_game\\mymod","oldmod",false,0)
  run("demo","\\sv_serverid\\99\\sv_cheats\\0\\sv_pure\\1\\fs_game\\ignored","keep",true,7)
  run("clear","\\sv_serverid\\7\\sv_cheats\\1\\sv_pure\\0","oldmod",false,5)
  run("case","\\sv_serverid\\8\\sv_cheats\\1\\sv_pure\\1.9\\FS_GAME\\CaseMod","oldmod",false,0)
  run("dangling","sv_serverid\\-3\\sv_cheats\\0\\sv_pure\\0.9\\dangling","",false,4)
  return 0
end function
