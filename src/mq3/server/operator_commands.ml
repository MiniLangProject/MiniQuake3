// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/server/sv_ccmds.c.
package mq3.server.operator_commands

import mq3.compat.textnumbers as numbers
import std.string as strings

/// Client-state value identifying an empty slot excluded from operator player queries.
const CS_FREE=0
/// Client lifecycle state retaining a recently disconnected client for final messages.
const CS_ZOMBIE=1
/// Client lifecycle state after connection but before gamestate priming.
const CS_CONNECTED=2
/// Client lifecycle state after gamestate delivery and before entering active play.
const CS_PRIMED=3
/// Client-state value identifying an in-game client included in operator status and player management.
const CS_ACTIVE=4
/// Network-address kind reserved for an in-process bot client.
const NA_BOT=0
/// Network-address kind indicating an invalid or unsupported endpoint.
const NA_BAD=1
/// Network-address kind for local loopback delivery.
const NA_LOOPBACK=2
/// Network-address kind for an IPv4 endpoint.
const NA_IP=4
/// Server lifecycle state with no running map.
const SS_DEAD=0
/// Server lifecycle state while a new map and game VM are loading.
const SS_LOADING=1
/// Server lifecycle state for an active game map.
const SS_GAME=2
/// Toggled every map_restart so transitions can be detected.
const SNAPFLAG_SERVERCOUNT=4
/// Game-mode identifier for free-for-all play.
const GT_FFA=0
/// Game-mode identifier for single-player progression.
const GT_SINGLE_PLAYER=2
/// Server time when the match will be restarted.
const CS_WARMUP=5
/// Host name of the legacy client-authorization service.
const AUTHORIZE_SERVER_NAME="authorize.quake3arena.com"
/// Default UDP port used by the authorization service.
const PORT_AUTHORIZE=27952

/// Client record for server.operator_commands, containing `state`, `name`, `userinfo`, `addressType`, `address`, `ip`, and 7 further fields.
struct Client
  /// Connection lifecycle value that determines which operator commands can address this player slot.
  state
  /// Extracted from userinfo, high bits masked.
  name
  /// Backslash-delimited client information string, including name and connection settings.
  userinfo
  /// Network-address kind, such as loopback, IPv4, or bot.
  addressType
  /// Network address associated with the client or packet.
  address
  /// Address bytes identifying the remote IPv4 endpoint.
  ip
  /// Client-selected virtual port used to recognize a connection across address translation.
  qport
  /// Maximum client download and snapshot transfer rate, in bytes per second.
  rate
  /// Estimated round-trip client latency in milliseconds.
  ping
  /// Server timestamp of the most recently received client packet, in milliseconds.
  lastPacketTime
  /// Client score printed by operator status commands.
  score
  /// Most recent user-command record received or processed for this client.
  lastUsercmd
  /// Reason the client was denied or disconnected by an operator command.
  denied
end struct
/// Action record for server.operator_commands, containing `boundary`, `kind`, `target`, `text`, `values`, `dispatched`.
struct Action
  /// Subsystem boundary at which this host action must be dispatched.
  boundary
  /// Operator-action discriminator used by the host dispatcher.
  kind
  /// Client, map, or other resource targeted by the operator action.
  target
  /// Command or diagnostic text carried by the operator action.
  text
  /// Additional argument values associated with the operator action.
  values
  /// True after the recorded action has been delivered to the host.
  dispatched
end struct
/// State record for server.operator_commands, containing `running`, `dedicated`, `args`, `rawArgs`, `clients`, `maxclients`, and 23 further fields.
struct State
  /// True while the server or represented subsystem is running.
  running
  /// True when the server runs without a local graphical client.
  dedicated
  /// Parsed command arguments supplied to the operator-command handler.
  args
  /// Unmodified command argument text supplied by the operator.
  rawArgs
  /// Player slots searched by operator lookup, status, kick, and administrative commands.
  clients
  /// Client-slot bound used by operator player lookup and status iteration.
  maxclients
  /// Game-mode identifier used when applying mode-specific rules.
  gametype
  /// Name of the current game map.
  mapname
  /// Configuration-variable registry consulted by this subsystem.
  cvars
  /// True when a changed client-slot limit requires server reinitialization.
  maxclientsModified
  /// True when a changed game mode requires server reinitialization.
  gametypeModified
  /// Available BSP map files used to validate map commands.
  mapFiles
  /// Host frame timestamp used when scheduling a map restart.
  frameTime
  /// Identifier distinguishing the current server or map session.
  serverId
  /// Scheduled time for restarting the current map.
  restartTime
  /// Current server time used for operator-visible player status and administrative actions, in
  /// milliseconds.
  time
  /// Snapshot toggle bit changed when the server restarts a map.
  snapFlag
  /// Current server lifecycle state, including loading and active gameplay.
  serverState
  /// True while the server performs an in-place map restart.
  restarting
  /// Server time at which the next master heartbeat should be sent.
  nextHeartbeat
  /// Resolved network-address kind of the authorization service.
  authorizeType
  /// Resolved address bytes of the authorization service.
  authorizeIp
  /// True after server operator commands have been registered.
  commandsInitialized
  /// Names of the registered server operator commands.
  commandNames
  /// Recorded administrative requests such as player management, map changes, and console output.
  actions
  /// Console output recorded while executing operator commands.
  prints
  /// Server configuration strings indexed by their protocol slot.
  configstrings
  /// Host callback that dispatches a subsystem action to the embedding host.
  hostFn
  /// Opaque host data passed to the operator-action callback.
  hostContext
end struct

/// Create `mq3.server.operator_commands.Client` with state=state; name=name; userinfo=""; addressType=addressType; address=address; ip=ip; qport=qport; rate=rate; ping=ping; lastPacketTime=lastPacketTime; score=score; lastUsercmd=void; denied="".
/// @param state Initial `state` field stored in the returned or constructed `mq3.server.operator_commands.Client` record.
/// @param name Initial `name` field stored in the returned or constructed `mq3.server.operator_commands.Client` record.
/// @param addressType Initial `addressType` field stored in the returned or constructed `mq3.server.operator_commands.Client` record.
/// @param address Initial `address` field stored in the returned or constructed `mq3.server.operator_commands.Client` record.
/// @param ip Initial `ip` field stored in the returned or constructed `mq3.server.operator_commands.Client` record.
/// @param qport Initial `qport` field stored in the returned or constructed `mq3.server.operator_commands.Client` record.
/// @param rate Initial `rate` field stored in the returned or constructed `mq3.server.operator_commands.Client` record.
/// @param ping Initial `ping` field stored in the returned or constructed `mq3.server.operator_commands.Client` record.
/// @param lastPacketTime Initial `lastPacketTime` field stored in the returned or constructed `mq3.server.operator_commands.Client` record.
/// @param score Initial `score` field stored in the returned or constructed `mq3.server.operator_commands.Client` record.
function client(state,name,addressType,address,ip,qport,rate,ping,lastPacketTime,score) return Client(state,name,"",addressType,address,ip,qport,rate,ping,lastPacketTime,score,void,"") end function
/// Create `mq3.server.operator_commands.State` with running=false; dedicated=false; args=[]; rawArgs=""; 25 further fields.
function create()
  return State(false,false,[],"",[],0,GT_FFA,"",[],false,false,[],0,0,0,0,0,SS_DEAD,false,0,NA_BAD,[0,0,0,0],false,[],[],[],[],void,void)
end function
/// Set host in server.operator_commands; the normal completion returns `state`.
///
/// Direct state writes: `state.hostContext`, `state.hostFn`.
/// @param state Updated in place: `hostContext`, `hostFn`.
/// @param context Context operand used by `setHost`; its reads are shown in the implementation.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
function setHost(state,context,callback) state.hostContext=context;state.hostFn=callback;return state end function
/// Emit operator commands in server.operator_commands; the normal completion returns `action`.
///
/// Direct state writes: `state.actions`.
/// @param state Record exposing `hostFn`, `actions`, `hostContext`. Updated in place: `actions`.
/// @param boundary Initial `boundary` field stored in the returned or constructed `mq3.server.operator_commands.Action` record.
/// @param kind Initial `kind` field stored in the returned or constructed `mq3.server.operator_commands.Action` record.
/// @param target Initial `target` field stored in the returned or constructed `mq3.server.operator_commands.Action` record.
/// @param text Initial `text` field stored in the returned or constructed `mq3.server.operator_commands.Action` record.
/// @param values Initial `values` field stored in the returned or constructed `mq3.server.operator_commands.Action` record.
function emit(state,boundary,kind,target,text,values) action=Action(boundary,kind,target,text,values,state.hostFn!=void);state.actions=state.actions+[action];if state.hostFn!=void then return state.hostFn(state.hostContext,action) end if;return action end function
/// Update `state.prints` in server.operator_commands; the normal completion returns `text`.
///
/// Direct state writes: `state.prints`.
/// @param state Record exposing `prints`. Updated in place: `prints`.
/// @param text Text passed as `text` to `mq3.server.operator_commands.emit`.
function say(state,text) state.prints=state.prints+[text];emit(state,"console","print","",text,[]);return text end function
/// Compute server.operator_commands.same as `(strings.toLowerAscii(a) == strings.toLowerAscii(b))`.
/// @param a A used in `strings.toLowerAscii(a)` and `(strings.toLowerAscii(a) == strings.toLowerAscii(b))`.
/// @param b B used in `strings.toLowerAscii(b)` and `(strings.toLowerAscii(a) == strings.toLowerAscii(b))`.
function same(a,b) return strings.toLowerAscii(a)==strings.toLowerAscii(b) end function
/// Compute starts in server.operator_commands; the normal completion returns `(slice(bytes(left), 0, len(bytes(right))) == bytes(right))`.
/// @param a A used in `strings.toLowerAscii(a)`.
/// @param b B used in `strings.toLowerAscii(b)`.
function starts(a,b) left=strings.toLowerAscii(a);right=strings.toLowerAscii(b);if len(bytes(left))<len(bytes(right)) then return false end if;return slice(bytes(left),0,len(bytes(right)))==bytes(right) end function
/// Compute cmd argv in server.operator_commands; the normal completion returns `state.args[index]`.
/// @param state Record exposing `args`.
/// @param index Zero-based index into `state.args`.
function Cmd_Argv(state,index) if index<0 or index>=len(state.args) then return "" end if;return state.args[index] end function
/// Compute cmd args in server.operator_commands; the normal completion returns `text`.
/// @param state Record exposing `rawArgs`, `args`.
function cmdArgs(state) if state.rawArgs!="" then return state.rawArgs end if;text="";if len(state.args)>1 then for index=1 to len(state.args)-1 if text!="" then text=text+" " end if;text=text+state.args[index] end for end if;return text end function
/// Compute cvar index in server.operator_commands; the normal completion returns `- 1`.
/// @param state Record exposing `cvars`.
/// @param name Name used in `(state.cvars[index][0] == name)`.
function cvarIndex(state,name) if len(state.cvars)>0 then for index=0 to len(state.cvars)-1 if state.cvars[index][0]==name then return index end if end for end if;return -1 end function
/// Compute cvar in server.operator_commands; the normal completion returns `state.cvars[index][1]`.
/// @param state Record exposing `cvars`.
/// @param name Name passed as `name` to `mq3.server.operator_commands.cvarIndex`.
/// @param fallback Value returned unchanged by this function.
function cvar(state,name,fallback) index=cvarIndex(state,name);if index<0 then return fallback end if;return state.cvars[index][1] end function
/// Set cvar in server.operator_commands; the normal completion returns `value`.
///
/// Direct state writes: `state.cvars`.
/// @param state Record exposing `cvars`. Updated in place: `cvars`.
/// @param name Name passed as `name` to `mq3.server.operator_commands.cvarIndex`.
/// @param value Text passed as `text` to `mq3.server.operator_commands.emit`.
function setCvar(state,name,value) index=cvarIndex(state,name);if index<0 then state.cvars=state.cvars+[[name,value]] else state.cvars[index][1]=value end if;emit(state,"cvar","set",name,value,[]);return value end function
/// Test map exists in server.operator_commands; the normal completion returns `false`.
/// @param state Record exposing `mapFiles`.
/// @param path B passed as `b` to `mq3.server.operator_commands.same`.
function mapExists(state,path) for each candidate in state.mapFiles if same(candidate,path) then return true end if end for;return false end function
/// Compute clean name in server.operator_commands; the normal completion returns `decode(slice(output, 0, count))`.
/// @param name Name used in `bytes(name)`.
function cleanName(name)
  data=bytes(name);output=bytes(len(data),0);count=0;index=0;while index<len(data) if data[index]==94 and index+1<len(data) and data[index+1]>=48 and data[index+1]<=55 then index=index+2 else value=data[index];if value>32 and value<=126 then output[count]=value;count=count+1 end if;index=index+1 end if end while;return decode(slice(output,0,count))
end function
/// Compute player by name in server.operator_commands.
/// @param state Record exposing `running`, `clients`.
/// @param name B passed as `b` to `mq3.server.operator_commands.same`.
function playerByName(state,name)
  if not state.running then return void end if
  if name=="" then say(state,"No player specified.\n");return void end if
  for each value in state.clients if value.state!=CS_FREE and (same(value.name,name) or same(cleanName(value.name),name)) then return value end if end for;say(state,"Player "+name+" is not on the server\n");return void
end function
/// Compute player by num in server.operator_commands; the normal completion returns `value`.
/// @param state Record exposing `running`, `maxclients`, `clients`.
/// @param text Null-terminated narrow numeric text accepted by the C runtime.
function playerByNum(state,text)
  if not state.running then return void end if;if text=="" then say(state,"No player specified.\n");return void end if
  for each value in bytes(text) if value<48 or value>57 then say(state,"Bad slot number: "+text+"\n");return void end if end for
  slot=numbers.atoi(text);if slot<0 or slot>=state.maxclients or slot>=len(state.clients) then say(state,"Bad client slot: "+str(slot)+"\n");return void end if;value=state.clients[slot];if value.state==CS_FREE then say(state,"Client "+str(slot)+" is not active\n");return void end if;return value
end function
/// Update `value.state`, `value.lastPacketTime` in server.operator_commands.
///
/// Direct state writes: `value.state`, `value.lastPacketTime`.
/// @param state Record exposing `time`.
/// @param value Record exposing `name`. Updated in place: `state`, `lastPacketTime`.
/// @param reason Text passed as `text` to `mq3.server.operator_commands.emit`.
function drop(state,value,reason) emit(state,"server","drop-client",value.name,reason,[]);value.state=CS_ZOMBIE;value.lastPacketTime=state.time;return void end function
/// Test host protected in server.operator_commands; the normal completion returns `false`.
/// @param state State passed as `state` to `mq3.server.operator_commands.emit`.
/// @param value Record exposing `addressType`.
function hostProtected(state,value) if value.addressType==NA_LOOPBACK then emit(state,"server","broadcast","","print \"Cannot kick host player\\n\"",[]);return true end if;return false end function

/// Update `state.cvars`, `state.gametype`, `state.mapname` in server.operator_commands; the normal completion returns `true`.
///
/// Direct state writes: `state.cvars`, `state.gametype`, `state.mapname`.
/// @param state Record exposing `cvars`, `gametype`. Updated in place: `cvars`, `gametype`, `mapname`.
function SV_Map_f(state)
  map=Cmd_Argv(state,1);expanded="maps/"+map+".bsp";if not mapExists(state,expanded) then say(state,"Can't find map "+expanded+"\n");return false end if
  if cvarIndex(state,"g_gametype")<0 then state.cvars=state.cvars+[["g_gametype","0"]] end if;command=Cmd_Argv(state,0);killBots=false;cheat=false
  if starts(command,"sp") then state.gametype=GT_SINGLE_PLAYER;setCvar(state,"g_gametype",str(GT_SINGLE_PLAYER));setCvar(state,"g_doWarmup","0");setCvar(state,"sv_maxclients","8");killBots=true
  else if same(command,"devmap") or same(command,"spdevmap") then cheat=true;killBots=true else if state.gametype==GT_SINGLE_PLAYER then state.gametype=GT_FFA;setCvar(state,"g_gametype",str(GT_FFA)) end if
  state.mapname=map;emit(state,"server","spawn",map,"",[killBots]);if cheat then setCvar(state,"sv_cheats","1") else setCvar(state,"sv_cheats","0") end if;return true
end function

/// Update `state.restartTime`, `state.configstrings`, `state.mapname`, `state.snapFlag` in server.operator_commands; the normal completion returns `true`.
///
/// Direct state writes: `state.restartTime`, `state.configstrings`, `state.mapname`, `state.snapFlag`, `state.serverId`, `state.serverState`, `state.restarting`, `state.time`.
/// @param state Record exposing `frameTime`, `serverId`, `running`, `restartTime`, `args`, `time`, `configstrings` and further fields. Updated in place: `restartTime`, `configstrings`, `mapname`, `snapFlag`, `serverId`, `serverState` and further fields.
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

/// Test kick f in server.operator_commands; the normal completion returns `true`.
/// @param state Record exposing `running`, `args`, `clients`.
function SV_Kick_f(state)
  if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)!=2 then say(state,"Usage: kick <player name>\nkick all = kick everyone\nkick allbots = kick all bots\n");return false end if
  name=Cmd_Argv(state,1);value=playerByName(state,name);if value==void then
    if same(name,"all") then for each item in state.clients if item.state!=CS_FREE and item.addressType!=NA_LOOPBACK then drop(state,item,"was kicked") end if end for
    else if same(name,"allbots") then for each item in state.clients if item.state!=CS_FREE and item.addressType==NA_BOT then drop(state,item,"was kicked") end if end for end if;return true
  end if;if hostProtected(state,value) then return false end if;drop(state,value,"was kicked");return true
end function
/// Update `state.authorizeType`, `state.authorizeIp` in server.operator_commands; the normal completion returns `false`.
///
/// Direct state writes: `state.authorizeType`, `state.authorizeIp`.
/// @param state Record exposing `authorizeIp`, `authorizeType`. Updated in place: `authorizeType`, `authorizeIp`.
/// @param value Record exposing `ip`, `name`.
function banClient(state,value)
  if hostProtected(state,value) then return false end if
  if state.authorizeIp[0]==0 and state.authorizeType!=NA_BAD then say(state,"Resolving "+AUTHORIZE_SERVER_NAME+"\n");resolved=emit(state,"network","resolve-authorize",AUTHORIZE_SERVER_NAME,"",[PORT_AUTHORIZE]);if typeof(resolved)=="array" and len(resolved)>=2 then state.authorizeType=resolved[0];state.authorizeIp=resolved[1] else state.authorizeType=NA_BAD;say(state,"Couldn't resolve address\n");return false end if end if
  if state.authorizeType!=NA_BAD then address=str(value.ip[0])+"."+str(value.ip[1])+"."+str(value.ip[2])+"."+str(value.ip[3]);emit(state,"network","out-of-band","authorize","banUser "+address,[]);say(state,value.name+" was banned from coming back\n");return true end if;return false
end function
/// Compute ban f in server.operator_commands; the normal completion returns `banClient(state, value)`.
/// @param state Record exposing `running`, `args`.
function SV_Ban_f(state) if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)!=2 then say(state,"Usage: banUser <player name>\n");return false end if;value=playerByName(state,Cmd_Argv(state,1));if value==void then return false end if;return banClient(state,value) end function
/// Compute ban num f in server.operator_commands; the normal completion returns `banClient(state, value)`.
/// @param state Record exposing `running`, `args`.
function SV_BanNum_f(state) if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)!=2 then say(state,"Usage: banClient <client number>\n");return false end if;value=playerByNum(state,Cmd_Argv(state,1));if value==void then return false end if;return banClient(state,value) end function
/// Test kick num f in server.operator_commands; the normal completion returns `true`.
/// @param state Record exposing `running`, `args`.
function SV_KickNum_f(state) if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)!=2 then say(state,"Usage: kicknum <client number>\n");return false end if;value=playerByNum(state,Cmd_Argv(state,1));if value==void then return false end if;if hostProtected(state,value) then return false end if;drop(state,value,"was kicked");return true end function

/// Compute left pad in server.operator_commands; the normal completion returns `result`.
/// @param text Text operand used by `leftPad`; its reads are shown in the implementation.
/// @param width Width used in `(len(bytes(result)) < width)`.
function leftPad(text,width) result=text;while len(bytes(result))<width result=" "+result end while;return result end function
/// Compute right pad in server.operator_commands; the normal completion returns `result`.
/// @param text Text operand used by `rightPad`; its reads are shown in the implementation.
/// @param width Width used in `(len(bytes(result)) < width)`.
function rightPad(text,width) result=text;while len(bytes(result))<width result=result+" " end while;return result end function
/// Compute status f in server.operator_commands; the normal completion returns `text`.
/// @param state Record exposing `running`, `mapname`, `clients`, `time`.
function SV_Status_f(state)
  if not state.running then say(state,"Server is not running.\n");return "" end if;text="map: "+state.mapname+"\nnum score ping name            lastmsg address               qport rate\n--- ----- ---- --------------- ------- --------------------- ----- -----\n"
  if len(state.clients)>0 then for index=0 to len(state.clients)-1 value=state.clients[index];if value.state!=CS_FREE then ping=leftPad(str(value.ping),4);if value.state==CS_CONNECTED then ping="CNCT" else if value.state==CS_ZOMBIE then ping="ZMBI" else if value.ping>9999 then ping="9999" end if;text=text+leftPad(str(index),3)+" "+leftPad(str(value.score),5)+" "+ping+" "+value.name+"^7"+rightPad("",16-len(bytes(value.name)))+leftPad(str(state.time-value.lastPacketTime),7)+" "+value.address+rightPad("",22-len(bytes(value.address)))+leftPad(str(value.qport),5)+" "+leftPad(str(value.rate),5)+"\n" end if end for end if;text=text+"\n";say(state,text);return text
end function
/// Test con say f in server.operator_commands; the normal completion returns `true`.
/// @param state Record exposing `running`, `args`.
function SV_ConSay_f(state) if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)<2 then return false end if;text=cmdArgs(state);if len(bytes(text))>=2 and bytes(text)[0]==34 then text=decode(slice(bytes(text),1,len(bytes(text))-2)) end if;text="console: "+text;emit(state,"server","broadcast","","chat \""+text+"\n\"",[]);return true end function
/// Update `state.nextHeartbeat` in server.operator_commands; the normal completion returns `state.nextHeartbeat`.
///
/// Direct state writes: `state.nextHeartbeat`.
/// @param state Record exposing `nextHeartbeat`. Updated in place: `nextHeartbeat`.
function SV_Heartbeat_f(state) state.nextHeartbeat=-9999999;return state.nextHeartbeat end function
/// Compute info print in server.operator_commands; the normal completion returns `value`.
/// @param state State passed as `state` to `mq3.server.operator_commands.say`.
/// @param title Title used in `(title + "\n")` and `say(state, (title + "\n"))`.
/// @param value Text passed as `text` to `mq3.server.operator_commands.emit`.
function infoPrint(state,title,value) say(state,title+"\n");emit(state,"console","info-print","",value,[]);return value end function
/// Return `mq3.server.operator_commands.infoPrint(state, "Server info settings:", cvar(state, "serverinfo", ""))` from `server.operator_commands.SV_Serverinfo_f`.
/// @param state State passed as `state` to `mq3.server.operator_commands.infoPrint`.
function SV_Serverinfo_f(state) return infoPrint(state,"Server info settings:",cvar(state,"serverinfo","")) end function
/// Return `mq3.server.operator_commands.infoPrint(state, "System info settings:", cvar(state, "systeminfo", ""))` from `server.operator_commands.SV_Systeminfo_f`.
/// @param state State passed as `state` to `mq3.server.operator_commands.infoPrint`.
function SV_Systeminfo_f(state) return infoPrint(state,"System info settings:",cvar(state,"systeminfo","")) end function
/// Test dump user f in server.operator_commands; the normal completion returns `true`.
/// @param state Record exposing `running`, `args`.
function SV_DumpUser_f(state) if not state.running then say(state,"Server is not running.\n");return false end if;if len(state.args)!=2 then say(state,"Usage: info <userid>\n");return false end if;value=playerByName(state,Cmd_Argv(state,1));if value==void then return false end if;say(state,"userinfo\n");say(state,"--------\n");emit(state,"console","info-print",value.name,value.userinfo,[]);return true end function
/// Update `state.running` in server.operator_commands.
///
/// Direct state writes: `state.running`.
/// @param state Updated in place: `running`.
function SV_KillServer_f(state) emit(state,"server","shutdown","","killserver",[]);state.running=false;return void end function

/// Add operator commands in server.operator_commands; the normal completion returns `len(state.commandNames)`.
///
/// Direct state writes: `state.commandsInitialized`, `state.commandNames`.
/// @param state Record exposing `commandsInitialized`, `dedicated`, `commandNames`. Updated in place: `commandsInitialized`, `commandNames`.
function SV_AddOperatorCommands(state)
  if state.commandsInitialized then return 0 end if;state.commandsInitialized=true;state.commandNames=["heartbeat","kick","banUser","banClient","clientkick","status","serverinfo","systeminfo","dumpuser","map_restart","sectorlist","map","devmap","spmap","spdevmap","killserver"];if state.dedicated then state.commandNames=state.commandNames+["say"] end if;for each name in state.commandNames emit(state,"command","register",name,"",[]) end for;return len(state.commandNames)
end function
/// Compute server.operator_commands.SV_RemoveOperatorCommands as `0`.
/// @param state Reserved argument; this implementation does not read its value.
function SV_RemoveOperatorCommands(state) return 0 end function

