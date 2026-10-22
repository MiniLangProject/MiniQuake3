// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/server/sv_ccmds.c.
package mq3.server.operator_commands

import mq3.compat.textnumbers as numbers
import std.string as strings

const CS_FREE=0
const CS_ZOMBIE=1
const CS_CONNECTED=2
const CS_PRIMED=3
const CS_ACTIVE=4
const NA_BOT=0
const NA_BAD=1
const NA_LOOPBACK=2
const NA_IP=4
const SS_DEAD=0
const SS_LOADING=1
const SS_GAME=2
const SNAPFLAG_SERVERCOUNT=4
const GT_FFA=0
const GT_SINGLE_PLAYER=2
const CS_WARMUP=5
const AUTHORIZE_SERVER_NAME="authorize.quake3arena.com"
const PORT_AUTHORIZE=27952

struct Client state name userinfo addressType address ip qport rate ping lastPacketTime score lastUsercmd denied end struct
struct Action boundary kind target text values dispatched end struct
struct State running dedicated args rawArgs clients maxclients gametype mapname cvars maxclientsModified gametypeModified mapFiles frameTime serverId restartTime time snapFlag serverState restarting nextHeartbeat authorizeType authorizeIp commandsInitialized commandNames actions prints configstrings hostFn hostContext end struct

function client(state,name,addressType,address,ip,qport,rate,ping,lastPacketTime,score) return Client(state,name,"",addressType,address,ip,qport,rate,ping,lastPacketTime,score,void,"") end function
function create()
  return State(false,false,[],"",[],0,GT_FFA,"",[],false,false,[],0,0,0,0,0,SS_DEAD,false,0,NA_BAD,[0,0,0,0],false,[],[],[],[],void,void)
end function
function setHost(state,context,callback) state.hostContext=context;state.hostFn=callback;return state end function
function emit(state,boundary,kind,target,text,values) action=Action(boundary,kind,target,text,values,state.hostFn!=void);state.actions=state.actions+[action];if state.hostFn!=void then return state.hostFn(state.hostContext,action) end if;return action end function
function say(state,text) state.prints=state.prints+[text];emit(state,"console","print","",text,[]);return text end function
function same(a,b) return strings.toLowerAscii(a)==strings.toLowerAscii(b) end function
function starts(a,b) left=strings.toLowerAscii(a);right=strings.toLowerAscii(b);if len(bytes(left))<len(bytes(right)) then return false end if;return slice(bytes(left),0,len(bytes(right)))==bytes(right) end function
function Cmd_Argv(state,index) if index<0 or index>=len(state.args) then return "" end if;return state.args[index] end function
function cmdArgs(state) if state.rawArgs!="" then return state.rawArgs end if;text="";if len(state.args)>1 then for index=1 to len(state.args)-1 if text!="" then text=text+" " end if;text=text+state.args[index] end for end if;return text end function
function cvarIndex(state,name) if len(state.cvars)>0 then for index=0 to len(state.cvars)-1 if state.cvars[index][0]==name then return index end if end for end if;return -1 end function
function cvar(state,name,fallback) index=cvarIndex(state,name);if index<0 then return fallback end if;return state.cvars[index][1] end function
function setCvar(state,name,value) index=cvarIndex(state,name);if index<0 then state.cvars=state.cvars+[[name,value]] else state.cvars[index][1]=value end if;emit(state,"cvar","set",name,value,[]);return value end function
function mapExists(state,path) for each candidate in state.mapFiles if same(candidate,path) then return true end if end for;return false end function
function cleanName(name)
  data=bytes(name);output=bytes(len(data),0);count=0;index=0;while index<len(data) if data[index]==94 and index+1<len(data) and data[index+1]>=48 and data[index+1]<=55 then index=index+2 else value=data[index];if value>32 and value<=126 then output[count]=value;count=count+1 end if;index=index+1 end if end while;return decode(slice(output,0,count))
end function
function playerByName(state,name)
  if not state.running then return void end if
  if name=="" then say(state,"No player specified.\n");return void end if
  for each value in state.clients if value.state!=CS_FREE and (same(value.name,name) or same(cleanName(value.name),name)) then return value end if end for;say(state,"Player "+name+" is not on the server\n");return void
end function
function playerByNum(state,text)
  if not state.running then return void end if;if text=="" then say(state,"No player specified.\n");return void end if
  for each value in bytes(text) if value<48 or value>57 then say(state,"Bad slot number: "+text+"\n");return void end if end for
  slot=numbers.atoi(text);if slot<0 or slot>=state.maxclients or slot>=len(state.clients) then say(state,"Bad client slot: "+str(slot)+"\n");return void end if;value=state.clients[slot];if value.state==CS_FREE then say(state,"Client "+str(slot)+" is not active\n");return void end if;return value
end function
function drop(state,value,reason) emit(state,"server","drop-client",value.name,reason,[]);value.state=CS_ZOMBIE;value.lastPacketTime=state.time;return void end function
function hostProtected(state,value) if value.addressType==NA_LOOPBACK then emit(state,"server","broadcast","","print \"Cannot kick host player\\n\"",[]);return true end if;return false end function

function SV_Map_f(state)
  map=Cmd_Argv(state,1);expanded="maps/"+map+".bsp";if not mapExists(state,expanded) then say(state,"Can't find map "+expanded+"\n");return false end if
  if cvarIndex(state,"g_gametype")<0 then state.cvars=state.cvars+[["g_gametype","0"]] end if;command=Cmd_Argv(state,0);killBots=false;cheat=false
  if starts(command,"sp") then state.gametype=GT_SINGLE_PLAYER;setCvar(state,"g_gametype",str(GT_SINGLE_PLAYER));setCvar(state,"g_doWarmup","0");setCvar(state,"sv_maxclients","8");killBots=true
  else if same(command,"devmap") or same(command,"spdevmap") then cheat=true;killBots=true else if state.gametype==GT_SINGLE_PLAYER then state.gametype=GT_FFA;setCvar(state,"g_gametype",str(GT_FFA)) end if
  state.mapname=map;emit(state,"server","spawn",map,"",[killBots]);if cheat then setCvar(state,"sv_cheats","1") else setCvar(state,"sv_cheats","0") end if;return true
end function

function SV_MapRestart_f(state)
  if state.frameTime==state.serverId then return false end if;if not state.running then say(state,"Server is not running.\n");return false end if;if state.restartTime!=0 then return false end if
  delay=5;if len(state.args)>1 then delay=numbers.atoi(Cmd_Argv(state,1)) end if
  if delay!=0 and toNumber(cvar(state,"g_doWarmup","0"))==0 then state.restartTime=state.time+delay*1000;state.configstrings=state.configstrings+[[CS_WARMUP,str(state.restartTime)]];emit(state,"server","set-configstring",str(CS_WARMUP),str(state.restartTime),[]);return true end if
  if state.maxclientsModified or state.gametypeModified then say(state,"variable change -- restarting.\n");state.mapname=cvar(state,"mapname",state.mapname);emit(state,"server","spawn",state.mapname,"",[false]);return true end if
  state.snapFlag=state.snapFlag^SNAPFLAG_SERVERCOUNT;state.serverId=state.frameTime;setCvar(state,"sv_serverid",str(state.serverId));state.serverState=SS_LOADING;state.restarting=true;emit(state,"game","restart-progs","","",[])
  for index=0 to 2 emit(state,"game","run-frame","","",[state.time]);state.time=state.time+100 end for;state.serverState=SS_GAME;state.restarting=false
  if len(state.clients)>0 then for index=0 to len(state.clients)-1 value=state.clients[index];if value.state>=CS_CONNECTED then isBot=value.addressType==NA_BOT;emit(state,"server","client-command",value.name,"map_restart\n",[]);denied=value.denied;response=emit(state,"game","client-connect",value.name,"",[index,false,isBot]);if typeof(response)=="string" then denied=response end if;if denied!="" then drop(state,value,denied);say(state,"SV_MapRestart_f("+str(delay)+"): dropped client "+str(index)+" - denied!\n") else value.state=CS_ACTIVE;emit(state,"server","enter-world",value.name,"",[value.lastUsercmd]) end if end if end for end if
  emit(state,"game","run-frame","","",[state.time]);state.time=state.time+100;return true
end function

function SV_Kick_f(state)
  if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)!=2 then say(state,"Usage: kick <player name>\nkick all = kick everyone\nkick allbots = kick all bots\n");return false end if
  name=Cmd_Argv(state,1);value=playerByName(state,name);if value==void then
    if same(name,"all") then for each item in state.clients if item.state!=CS_FREE and item.addressType!=NA_LOOPBACK then drop(state,item,"was kicked") end if end for
    else if same(name,"allbots") then for each item in state.clients if item.state!=CS_FREE and item.addressType==NA_BOT then drop(state,item,"was kicked") end if end for end if;return true
  end if;if hostProtected(state,value) then return false end if;drop(state,value,"was kicked");return true
end function
function banClient(state,value)
  if hostProtected(state,value) then return false end if
  if state.authorizeIp[0]==0 and state.authorizeType!=NA_BAD then say(state,"Resolving "+AUTHORIZE_SERVER_NAME+"\n");resolved=emit(state,"network","resolve-authorize",AUTHORIZE_SERVER_NAME,"",[PORT_AUTHORIZE]);if typeof(resolved)=="array" and len(resolved)>=2 then state.authorizeType=resolved[0];state.authorizeIp=resolved[1] else state.authorizeType=NA_BAD;say(state,"Couldn't resolve address\n");return false end if end if
  if state.authorizeType!=NA_BAD then address=str(value.ip[0])+"."+str(value.ip[1])+"."+str(value.ip[2])+"."+str(value.ip[3]);emit(state,"network","out-of-band","authorize","banUser "+address,[]);say(state,value.name+" was banned from coming back\n");return true end if;return false
end function
function SV_Ban_f(state) if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)!=2 then say(state,"Usage: banUser <player name>\n");return false end if;value=playerByName(state,Cmd_Argv(state,1));if value==void then return false end if;return banClient(state,value) end function
function SV_BanNum_f(state) if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)!=2 then say(state,"Usage: banClient <client number>\n");return false end if;value=playerByNum(state,Cmd_Argv(state,1));if value==void then return false end if;return banClient(state,value) end function
function SV_KickNum_f(state) if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)!=2 then say(state,"Usage: kicknum <client number>\n");return false end if;value=playerByNum(state,Cmd_Argv(state,1));if value==void then return false end if;if hostProtected(state,value) then return false end if;drop(state,value,"was kicked");return true end function

function leftPad(text,width) result=text;while len(bytes(result))<width result=" "+result end while;return result end function
function rightPad(text,width) result=text;while len(bytes(result))<width result=result+" " end while;return result end function
function SV_Status_f(state)
  if not state.running then say(state,"Server is not running.\n");return "" end if;text="map: "+state.mapname+"\nnum score ping name            lastmsg address               qport rate\n--- ----- ---- --------------- ------- --------------------- ----- -----\n"
  if len(state.clients)>0 then for index=0 to len(state.clients)-1 value=state.clients[index];if value.state!=CS_FREE then ping=leftPad(str(value.ping),4);if value.state==CS_CONNECTED then ping="CNCT" else if value.state==CS_ZOMBIE then ping="ZMBI" else if value.ping>9999 then ping="9999" end if;text=text+leftPad(str(index),3)+" "+leftPad(str(value.score),5)+" "+ping+" "+value.name+"^7"+rightPad("",16-len(bytes(value.name)))+leftPad(str(state.time-value.lastPacketTime),7)+" "+value.address+rightPad("",22-len(bytes(value.address)))+leftPad(str(value.qport),5)+" "+leftPad(str(value.rate),5)+"\n" end if end for end if;text=text+"\n";say(state,text);return text
end function
function SV_ConSay_f(state) if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)<2 then return false end if;text=cmdArgs(state);if len(bytes(text))>=2 and bytes(text)[0]==34 then text=decode(slice(bytes(text),1,len(bytes(text))-2)) end if;text="console: "+text;emit(state,"server","broadcast","","chat \""+text+"\n\"",[]);return true end function
function SV_Heartbeat_f(state) state.nextHeartbeat=-9999999;return state.nextHeartbeat end function
function infoPrint(state,title,value) say(state,title+"\n");emit(state,"console","info-print","",value,[]);return value end function
function SV_Serverinfo_f(state) return infoPrint(state,"Server info settings:",cvar(state,"serverinfo","")) end function
function SV_Systeminfo_f(state) return infoPrint(state,"System info settings:",cvar(state,"systeminfo","")) end function
function SV_DumpUser_f(state) if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)!=2 then say(state,"Usage: info <userid>\n");return false end if;value=playerByName(state,Cmd_Argv(state,1));if value==void then return false end if;say(state,"userinfo\n");say(state,"--------\n");emit(state,"console","info-print",value.name,value.userinfo,[]);return true end function
function SV_KillServer_f(state) emit(state,"server","shutdown","","killserver",[]);state.running=false;return void end function

function SV_AddOperatorCommands(state)
  if state.commandsInitialized then return 0 end if;state.commandsInitialized=true;state.commandNames=["heartbeat","kick","banUser","banClient","clientkick","status","serverinfo","systeminfo","dumpuser","map_restart","sectorlist","map","devmap","spmap","spdevmap","killserver"];if state.dedicated then state.commandNames=state.commandNames+["say"] end if;for each name in state.commandNames emit(state,"command","register",name,"",[]) end for;return len(state.commandNames)
end function
function SV_RemoveOperatorCommands(state) return 0 end function

