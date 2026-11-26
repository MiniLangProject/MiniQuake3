// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native host-independent remainder of server/sv_main.c.
package mq3.server.main_runtime

import mq3.shared.info as info
import mq3.compat.textnumbers as numbers
import mq3.compat.numeric as numeric
import mq3.server.connectionless as connectionless
import std.string as strings

const MAX_RELIABLE_COMMANDS=64
const MAX_STRING_CHARS=1024
const MAX_MSGLEN=16384
const MAX_INFO_STRING=1024
const CS_FREE=0
const CS_ZOMBIE=1
const CS_CONNECTED=2
const CS_PRIMED=3
const CS_ACTIVE=4
const GT_SINGLE_PLAYER=2
const HEARTBEAT_MSEC=300000
const HEARTBEAT_GAME="QuakeArena-1"
const PORT_MASTER=27950

/// Client record for server.main_runtime, containing `state`, `name`, `ping`, `score`, `reliableAcknowledge`, `reliableSequence`, and 2 further fields.
struct Client state name ping score reliableAcknowledge reliableSequence reliableSent reliableCommands end struct
/// Create `mq3.server.main_runtime.Client` with state=state; name=name; ping=ping; score=score; reliableAcknowledge=0; reliableSequence=0; reliableSent=0; reliableCommands=array(MAX_RELIABLE_COMMANDS, "").
/// @param state Initial `state` field stored in the returned or constructed `mq3.server.main_runtime.Client` record.
/// @param name Initial `name` field stored in the returned or constructed `mq3.server.main_runtime.Client` record.
/// @param ping Initial `ping` field stored in the returned or constructed `mq3.server.main_runtime.Client` record.
/// @param score Initial `score` field stored in the returned or constructed `mq3.server.main_runtime.Client` record.
function client(state,name,ping,score)
  return Client(state,name,ping,score,0,0,0,array(MAX_RELIABLE_COMMANDS,""))
end function

/// Master record for server.main_runtime, containing `name`, `value`, `modified`, `address`.
struct Master name value modified address end struct
/// Create `mq3.server.main_runtime.Master` with name=name; value=value; modified=true; address=void.
/// @param name Initial `name` field stored in the returned or constructed `mq3.server.main_runtime.Master` record.
/// @param value Initial `value` field stored in the returned or constructed `mq3.server.main_runtime.Master` record.
function master(name,value) return Master(name,value,true,void) end function

/// Runtime record for server.main_runtime, containing `time`, `nextHeartbeatTime`, `dedicated`, `masters`, `clients`, `maxClients`, and 16 further fields.
struct Runtime time nextHeartbeatTime dedicated masters clients maxClients privateClients gametype uiSinglePlayerActive restricted serverInfo hostname mapname protocol gametypeValue pure minPing maxPing game lastRconTime rconPassword redirectAddress end struct
/// Create `mq3.server.main_runtime.Runtime` with time=0; nextHeartbeatTime=0; dedicated=0; masters=[]; 18 further fields.
function runtime()
  return Runtime(0,0,0,[],[],0,0,0,false,false,"","","",68,0,0,0,0,"",0,"",void)
end function

/// Services record for server.main_runtime, containing `sendFn`, `resolveFn`, `printFn`, `dropFn`, `executeFn`, `millisecondsFn`, and 4 further fields.
struct Services sendFn resolveFn printFn dropFn executeFn millisecondsFn authorizeFn decompressFn diagnosticFn context end struct
/// Create `mq3.server.main_runtime.Services` with sendFn=void; resolveFn=void; printFn=void; dropFn=void; executeFn=void; millisecondsFn=void; authorizeFn=void; decompressFn=void; diagnosticFn=void; context=void.
function services() return Services(void,void,void,void,void,void,void,void,void,void) end function

/// Send main runtime in server.main_runtime.
/// @param host Record exposing `sendFn`.
/// @param address Address used in `host.sendFn(host, address, text)`.
/// @param text Text used in `host.sendFn(host, address, text)`.
function send(host,address,text) if host.sendFn!=void then return host.sendFn(host,address,text) end if;return void end function
/// Compute say in server.main_runtime.
/// @param host Record exposing `printFn`.
/// @param text Text used in `host.printFn(host, text)`.
function say(host,text) if host.printFn!=void then host.printFn(host,text) end if;return void end function

// SV_ExpandNewlines uses a 1024-byte static buffer and stops with three bytes
// left, because a final input newline needs two output bytes plus NUL.
/// @param value Value used in `bytes(value)` and `(value == void)`.
function SV_ExpandNewlines(value)
  if value==void then return "" end if
  input=bytes(value);output=bytes(1023,0);at=0;index=0
  while index<len(input) and input[index]!=0 and at<1021
    if input[index]==10 then output[at]=92;output[at+1]=110;at=at+2 else output[at]=input[index];at=at+1 end if
    index=index+1
  end while
  return decode(slice(output,0,at))
end function

/// Compute config number in server.main_runtime; the normal completion returns `numbers.atoi(decode(slice(data, index, (len(data) - index))))`.
/// @param text Text used in `bytes(text)` and `(text == void)`.
function configNumber(text)
  if text==void or not strings.startsWith(text,"cs") then return void end if
  data=bytes(text);index=2;while index<len(data) and data[index]<=32 index=index+1 end while
  if index>=len(data) then return void end if
  return numbers.atoi(decode(slice(data,index,len(data)-index)))
end function

/// Compute require client in server.main_runtime.
///
/// Validation failures include `sv_main: invalid reliable client`.
/// @param value Record exposing `reliableCommands`.
function requireClient(value)
  if value==void or value.reliableCommands==void or len(value.reliableCommands)!=MAX_RELIABLE_COMMANDS then return error(7340,"sv_main: invalid reliable client") end if
  return void
end function

/// Compute bounded in server.main_runtime; the normal completion returns `decode(slice(data, 0, (capacity - 1)))`.
/// @param text Text used in `bytes(text)`.
/// @param capacity Capacity used in `(capacity - 1)` and `(len(data) < capacity)`.
function bounded(text,capacity)
  data=bytes(text);if len(data)<capacity then return text end if;return decode(slice(data,0,capacity-1))
end function

/// Test replace pending server commands in server.main_runtime; the normal completion returns `false`.
/// @param value Record exposing `reliableSent`, `reliableSequence`, `reliableCommands`.
/// @param cmd Text passed as `text` to `mq3.server.main_runtime.configNumber`.
function SV_ReplacePendingServerCommands(value,cmd)
  requireClient(value);wanted=configNumber(cmd);if wanted==void then return false end if
  sequence=value.reliableSent+1
  while sequence<=value.reliableSequence
    index=sequence&(MAX_RELIABLE_COMMANDS-1);existing=value.reliableCommands[index]
    if strings.startsWith(existing,"cs") and configNumber(existing)==wanted then value.reliableCommands[index]=bounded(cmd,MAX_STRING_CHARS);return true end if
    sequence=sequence+1
  end while
  return false
end function

/// Add server command in server.main_runtime; the normal completion returns `true`.
///
/// Direct state writes: `value.reliableSequence`.
/// @param host Record exposing `dropFn`.
/// @param value Record exposing `reliableSequence`, `reliableAcknowledge`, `reliableCommands`. Updated in place: `reliableSequence`.
/// @param cmd Text passed as `text` to `mq3.server.main_runtime.bounded`.
function SV_AddServerCommand(host,value,cmd)
  requireClient(value);value.reliableSequence=value.reliableSequence+1
  if value.reliableSequence-value.reliableAcknowledge==MAX_RELIABLE_COMMANDS+1 then
    say(host,"===== pending server commands =====\n")
    sequence=value.reliableAcknowledge+1
    while sequence<=value.reliableSequence
      text="";if sequence<value.reliableSequence then text=value.reliableCommands[sequence&(MAX_RELIABLE_COMMANDS-1)] else text=cmd end if
      say(host,"cmd "+str(sequence)+": "+text+"\n");sequence=sequence+1
    end while
    if host.dropFn!=void then host.dropFn(host,value,"Server command overflow") end if
    return false
  end if
  value.reliableCommands[value.reliableSequence&(MAX_RELIABLE_COMMANDS-1)]=bounded(cmd,MAX_STRING_CHARS)
  return true
end function

/// Send server command in server.main_runtime; the normal completion returns `count`.
///
/// Validation failures include `sv_main: missing command runtime`.
/// @param state Record exposing `dedicated`, `clients`.
/// @param host Host passed as `host` to `mq3.server.main_runtime.SV_AddServerCommand`.
/// @param target Value passed as `value` to `mq3.server.main_runtime.SV_AddServerCommand`.
/// @param cmd Text passed as `text` to `mq3.server.main_runtime.bounded`.
function SV_SendServerCommand(state,host,target,cmd)
  if state==void or host==void then return error(7341,"sv_main: missing command runtime") end if
  cmd=bounded(cmd,MAX_MSGLEN)
  if target!=void then SV_AddServerCommand(host,target,cmd);return 1 end if
  if state.dedicated!=0 and strings.startsWith(cmd,"print") then say(host,"broadcast: "+SV_ExpandNewlines(cmd)+"\n") end if
  count=0
  for each value in state.clients if value.state>=CS_PRIMED then SV_AddServerCommand(host,value,cmd);count=count+1 end if end for
  return count
end function

/// Update `state.nextHeartbeatTime` in server.main_runtime; the normal completion returns `count`.
///
/// Validation failures include `sv_main: missing heartbeat runtime`.
/// Direct state writes: `state.nextHeartbeatTime`.
/// @param state Record exposing `dedicated`, `time`, `nextHeartbeatTime`, `masters`. Updated in place: `nextHeartbeatTime`.
/// @param host Record exposing `resolveFn`.
function SV_MasterHeartbeat(state,host)
  if state==void or host==void then return error(7342,"sv_main: missing heartbeat runtime") end if
  if state.dedicated!=2 or state.time<state.nextHeartbeatTime then return 0 end if
  state.nextHeartbeatTime=state.time+HEARTBEAT_MSEC;count=0
  for each value in state.masters
    if value.value!="" then
      if value.modified then
        value.modified=false;resolved=void;if host.resolveFn!=void then resolved=host.resolveFn(host,value.value) end if
        if resolved==void then value.value="";value.modified=false;continue end if
        value.address=resolved
        // Preserve the pinned source's reversed strstr arguments exactly:
        // strstr(":", value) is NULL for every normal hostname.
        if value.value!=":" then value.address.port=PORT_MASTER end if
      end if
      if value.address!=void then send(host,value.address,"heartbeat "+HEARTBEAT_GAME+"\n");count=count+1 end if
    end if
  end for
  return count
end function

/// Update `state.nextHeartbeatTime` in server.main_runtime; the normal completion returns `(first + second)`.
///
/// Direct state writes: `state.nextHeartbeatTime`.
/// @param state Updated in place: `nextHeartbeatTime`.
/// @param host Host passed as `host` to `mq3.server.main_runtime.SV_MasterHeartbeat`.
function SV_MasterShutdown(state,host)
  state.nextHeartbeatTime=-9999;first=SV_MasterHeartbeat(state,host)
  state.nextHeartbeatTime=-9999;second=SV_MasterHeartbeat(state,host)
  return first+second
end function

/// Return `mq3.server.main_runtime.bounded((((((str(value.score) + " ") + str(value.ping)) + " \"") + value.name) + "\"\n"), 1024)` from `server.main_runtime.statusLine`.
/// @param value Record exposing `score`, `ping`, `name`.
function statusLine(value)
  return bounded(str(value.score)+" "+str(value.ping)+" \""+value.name+"\"\n",1024)
end function

/// Compute svc status in server.main_runtime; the normal completion returns `response`.
/// @param state Record exposing `gametype`, `serverInfo`, `restricted`, `clients`.
/// @param host Host passed as `host` to `mq3.server.main_runtime.send`.
/// @param address Address passed as `address` to `mq3.server.main_runtime.send`.
/// @param challenge New value passed as `newValue` to `mq3.shared.info.setValue`.
function SVC_Status(state,host,address,challenge)
  if state.gametype==GT_SINGLE_PLAYER then return "" end if
  text=info.setValue(state.serverInfo,"challenge",challenge,void,void)
  if state.restricted then text=info.setValue(text,"sv_keywords","demo "+info.value(text,"sv_keywords"),void,void) end if
  players=""
  for each value in state.clients
    if value.state>=CS_CONNECTED then line=statusLine(value);if len(bytes(players))+len(bytes(line))>=MAX_MSGLEN then break end if;players=players+line end if
  end for
  response="statusResponse\n"+text+"\n"+players;send(host,address,response);return response
end function

/// Compute svc info in server.main_runtime; the normal completion returns `response`.
/// @param state Record exposing `gametype`, `uiSinglePlayerActive`, `maxClients`, `clients`, `privateClients`, `protocol`, `hostname` and further fields.
/// @param host Host passed as `host` to `mq3.server.main_runtime.send`.
/// @param address Address passed as `address` to `mq3.server.main_runtime.send`.
/// @param challenge New value passed as `newValue` to `mq3.shared.info.setValue`.
function SVC_Info(state,host,address,challenge)
  if state.gametype==GT_SINGLE_PLAYER or state.uiSinglePlayerActive then return "" end if
  connected=0;limit=state.maxClients;if limit>len(state.clients) then limit=len(state.clients) end if
  index=state.privateClients;while index<limit if state.clients[index].state>=CS_CONNECTED then connected=connected+1 end if;index=index+1 end while
  text="";text=info.setValue(text,"challenge",challenge,void,void);text=info.setValue(text,"protocol",str(state.protocol),void,void)
  text=info.setValue(text,"hostname",state.hostname,void,void);text=info.setValue(text,"mapname",state.mapname,void,void)
  text=info.setValue(text,"clients",str(connected),void,void);text=info.setValue(text,"sv_maxclients",str(state.maxClients-state.privateClients),void,void)
  text=info.setValue(text,"gametype",str(state.gametypeValue),void,void);text=info.setValue(text,"pure",str(state.pure),void,void)
  if state.minPing!=0 then text=info.setValue(text,"minPing",str(state.minPing),void,void) end if
  if state.maxPing!=0 then text=info.setValue(text,"maxPing",str(state.maxPing),void,void) end if
  if state.game!="" then text=info.setValue(text,"game",state.game,void,void) end if
  response="infoResponse\n"+text;send(host,address,response);return response
end function

/// Compute flush redirect in server.main_runtime; the normal completion returns `text`.
///
/// Validation failures include `sv_main: missing redirect address`.
/// @param state Record exposing `redirectAddress`.
/// @param host Host passed as `host` to `mq3.server.main_runtime.send`.
/// @param output Output used in `("print\n" + output)`.
function SV_FlushRedirect(state,host,output)
  if state.redirectAddress==void then return error(7343,"sv_main: missing redirect address") end if
  text="print\n"+output;send(host,state.redirectAddress,text);return text
end function

/// Compute remote tail in server.main_runtime; the normal completion returns `decode(slice(data, index, (len(data) - index)))`.
/// @param text Text used in `bytes(text)`.
function remoteTail(text)
  data=bytes(text);index=0
  while index<len(data) and data[index]!=32 index=index+1 end while
  while index<len(data) and data[index]==32 index=index+1 end while
  while index<len(data) and data[index]!=32 index=index+1 end while
  while index<len(data) and data[index]==32 index=index+1 end while
  return decode(slice(data,index,len(data)-index))
end function

/// Update `state.lastRconTime`, `state.redirectAddress` in server.main_runtime; the normal completion returns `output`.
///
/// Direct state writes: `state.lastRconTime`, `state.redirectAddress`.
/// @param state Record exposing `time`, `lastRconTime`, `rconPassword`. Updated in place: `lastRconTime`, `redirectAddress`.
/// @param host Record exposing `millisecondsFn`, `executeFn`.
/// @param address Address operand used by `SVC_RemoteCommand`; its reads are shown in the implementation.
/// @param raw Text passed as `text` to `mq3.server.main_runtime.remoteTail`.
/// @param args Args used in `args[1]` and `len(args)`.
function SVC_RemoteCommand(state,host,address,raw,args)
  now=state.time;if host.millisecondsFn!=void then now=host.millisecondsFn(host) end if;now=numeric.u32(now)
  if now<numeric.u32(state.lastRconTime+500) then return "throttled" end if;state.lastRconTime=now
  password="";if len(args)>1 then password=args[1] end if;valid=state.rconPassword!="" and password==state.rconPassword
  state.redirectAddress=address;output=""
  if state.rconPassword=="" then output="No rconpassword set on the server.\n"
  else if not valid then output="Bad rconpassword.\n"
  else command=remoteTail(raw);if host.executeFn!=void then result=host.executeFn(host,command);if typeof(result)=="string" then output=result end if end if end if
  SV_FlushRedirect(state,host,output);return output
end function

/// Binding record for server.main_runtime, containing `state`, `services`.
struct Binding state services end struct
/// Compute status callback in server.main_runtime; the normal completion returns `SVC_Status(host.context.state, host.context.services, address, challenge)`.
/// @param host Record exposing `context`.
/// @param address Address passed as `address` to `mq3.server.main_runtime.SVC_Status`.
/// @param args Args used in `args[1]` and `len(args)`.
function statusCallback(host,address,args) challenge="";if len(args)>1 then challenge=args[1] end if;return SVC_Status(host.context.state,host.context.services,address,challenge) end function
/// Compute info callback in server.main_runtime; the normal completion returns `SVC_Info(host.context.state, host.context.services, address, challenge)`.
/// @param host Record exposing `context`.
/// @param address Address passed as `address` to `mq3.server.main_runtime.SVC_Info`.
/// @param args Args used in `args[1]` and `len(args)`.
function infoCallback(host,address,args) challenge="";if len(args)>1 then challenge=args[1] end if;return SVC_Info(host.context.state,host.context.services,address,challenge) end function
/// Return `mq3.server.main_runtime.SVC_RemoteCommand(host.context.state, host.context.services, address, text, args)` from `server.main_runtime.rconCallback`.
/// @param host Record exposing `context`.
/// @param address Address passed as `address` to `mq3.server.main_runtime.SVC_RemoteCommand`.
/// @param msg Reserved argument; this implementation does not read its value.
/// @param text Raw passed as `raw` to `mq3.server.main_runtime.SVC_RemoteCommand`.
/// @param args Args passed as `args` to `mq3.server.main_runtime.SVC_RemoteCommand`.
function rconCallback(host,address,msg,text,args) return SVC_RemoteCommand(host.context.state,host.context.services,address,text,args) end function
/// Compute authorize callback in server.main_runtime.
/// @param host Record exposing `context`.
/// @param address Address used in `host.context.services.authorizeFn(host.context.services, address, args)`.
/// @param args Args used in `host.context.services.authorizeFn(host.context.services, address, args)`.
function authorizeCallback(host,address,args) if host.context.services.authorizeFn!=void then return host.context.services.authorizeFn(host.context.services,address,args) end if;return void end function
/// Decompress callback in server.main_runtime.
/// @param host Record exposing `context`.
/// @param msg Msg used in `host.context.services.decompressFn(host.context.services, msg, offset)`.
/// @param offset Offset used in `host.context.services.decompressFn(host.context.services, msg, offset)`.
function decompressCallback(host,msg,offset) if host.context.services.decompressFn!=void then return host.context.services.decompressFn(host.context.services,msg,offset) end if;return void end function
/// Compute diagnostic callback in server.main_runtime.
/// @param host Record exposing `context`.
/// @param address Address used in `host.context.services.diagnosticFn(host.context.services, address, text)`.
/// @param text Text used in `host.context.services.diagnosticFn(host.context.services, address, text)`.
function diagnosticCallback(host,address,text) if host.context.services.diagnosticFn!=void then return host.context.services.diagnosticFn(host.context.services,address,text) end if;return void end function
/// Compute connectionless services in server.main_runtime; the normal completion returns `result`.
/// @param state Initial `state` field stored in the returned or constructed `mq3.server.main_runtime.Binding` record.
/// @param host Initial `services` field stored in the returned or constructed `mq3.server.main_runtime.Binding` record.
function connectionlessServices(state,host)
  result=connectionless.services();result.context=Binding(state,host);result.statusFn=statusCallback;result.infoFn=infoCallback;result.rconFn=rconCallback;result.authorizeFn=authorizeCallback;result.decompressFn=decompressCallback;result.diagnosticFn=diagnosticCallback;return result
end function
