// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native client lifecycle, gamestate, pure-validation and userinfo portion of
// server/sv_client.c.  Network parsing and downloads remain in their focused
// modules and call this surface through explicit services.
package mq3.server.client_lifecycle
import mq3.shared.info as info
import mq3.compat.textnumbers as numbers
import mq3.compat.numeric as numeric
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.qcommon.command_buffer as command
import mq3.game.entitystate as entitystate
import mq3.server.reliable_commands as reliable
import mq3.server.user_move as userMove

/// Client-state value identifying a slot with no live client lifecycle to manage.
const CS_FREE=0
/// Client lifecycle state retaining a recently disconnected client for final messages.
const CS_ZOMBIE=1
/// Client lifecycle state after connection but before gamestate priming.
const CS_CONNECTED=2
/// Client lifecycle state after gamestate delivery and before entering active play.
const CS_PRIMED=3
/// Client-state value identifying a client that has completed entry into the game world.
const CS_ACTIVE=4
/// Server-to-client opcode introducing the initial configuration and entity baselines.
const SVC_GAMESTATE=2
/// Server-to-client opcode introducing an indexed configuration string.
const SVC_CONFIGSTRING=3
/// Server-to-client opcode introducing an entity state used as a delta baseline.
const SVC_BASELINE=4
/// Server-to-client opcode marking the end of a message.
const SVC_EOF=8
/// Maximum byte length of a complete sequenced network message.
const MAX_MSGLEN=16384

/// Client record for server.client_lifecycle, containing `state`, `name`, `userinfo`, `addressText`, `lan`, `local`, and 17 further fields.
struct Client
  /// Connection lifecycle value that records progression through connection, world entry, and
  /// disconnection.
  state
  /// Extracted from userinfo, high bits masked.
  name
  /// Backslash-delimited client information string, including name and connection settings.
  userinfo
  /// Formatted network address retained in the client information.
  addressText
  /// True when this connection is classified as belonging to the local network.
  lan
  /// True when this connection or destination is local to the host.
  local
  /// True when the client slot is controlled by an in-process bot.
  bot
  /// Index of the client's entity in the game VM entity array.
  gentityNumber
  /// Maximum client download and snapshot transfer rate, in bytes per second.
  rate
  /// Requested interval between snapshots, in milliseconds.
  snapshotMsec
  /// Earliest server timestamp for sending the next snapshot, in milliseconds.
  nextSnapshotTime
  /// Acknowledged snapshot message selected as the base for delta compression.
  deltaMessage
  /// Most recent user-command record received or processed for this client.
  lastUsercmd
  /// True after the client has passed the pure-package authentication check.
  pureAuthentic
  /// True after the client has sent its pure-server checksum verification command.
  gotCP
  /// Outgoing network sequence number of the client gamestate message.
  gamestateMessageNum
  /// Sequence number to place on the next outgoing network message.
  outgoingSequence
  /// Sequence number of the last processed reliable client command.
  lastClientCommand
  /// Sequence number of the newest queued reliable command.
  reliableSequence
  /// Acknowledged reliable sequence preserved while managing client entry and disconnection.
  reliableAcknowledge
  /// Sequence number of the newest reliable command transmitted to the peer.
  reliableSent
  /// Reliable command entries retained until the peer acknowledges them.
  reliableCommands
  /// Requested asset download path, or an empty string when no download is active.
  downloadName
end struct
/// Create `mq3.server.client_lifecycle.Client` with state=CS_FREE; name=""; userinfo=""; addressText=""; 19 further fields.
function createClient()
  return Client(CS_FREE,"","","",false,false,false,-1,3000,50,0,-1,userMove.zeroCommand(),0,false,-1,0,0,0,0,0,array(64,""),"")
end function

/// Server record for server.client_lifecycle, containing `time`, `checksumFeed`, `checksumFeedServerId`, `pure`, `configstrings`, `baselines`, and 8 further fields.
struct Server
  /// Server time used when clients enter the world, update state, or disconnect, in milliseconds.
  time
  /// Server-supplied feed value used to calculate pure-package checksums.
  checksumFeed
  /// Server identifier associated with the current checksum feed.
  checksumFeedServerId
  /// True when clients must use the server-approved package checksums.
  pure
  /// Server configuration strings indexed by their protocol slot.
  configstrings
  /// Baseline entity states used as initial references for delta compression.
  baselines
  /// Client records whose entry, userinfo, and disconnection are managed by this lifecycle runtime.
  clients
  /// Package checksums accepted by the current pure server.
  loadedPureChecksums
  /// Checksum expected for the client-game VM package.
  cgameChecksum
  /// Checksum expected for the UI VM package.
  uiChecksum
  /// True when the required client-game package is available.
  cgamePakFound
  /// True when the required UI package is available.
  uiPakFound
  /// True when the server runs without a local graphical client.
  dedicated
  /// True when LAN clients bypass the normal rate limit.
  lanForceRate
end struct
/// Create server in server.client_lifecycle; the normal completion returns `Server(0, 0, 0, 0, array(1024, ""), array(1024, void), clients, [], 0, 0, false, false, 0, 1)`.
/// @param clientCount Client count used in `(clientCount - 1)`.
function createServer(clientCount)
  clients=[];for index=0 to clientCount-1 clients=clients+[createClient()] end for
  return Server(0,0,0,0,array(1024,""),array(1024,void),clients,[],0,0,false,false,0,1)
end function

/// Services record for server.client_lifecycle, containing `context`, `transmitFn`, `snapshotFn`, `dropFn`, `gameBeginFn`, `gameDisconnectFn`, and 8 further fields.
struct Services
  /// Caller-supplied data associated with client admission, userinfo changes, disconnection, and final
  /// messages.
  context
  /// Host callback that transmits a complete message through a sequenced channel.
  transmitFn
  /// Host callback that sends lifecycle snapshot state to a client.
  snapshotFn
  /// Host callback that disconnects a client and reports the supplied reason.
  dropFn
  /// Host callback that notifies the game VM that a client is entering play.
  gameBeginFn
  /// Host callback that notifies the game VM that a client has disconnected.
  gameDisconnectFn
  /// Host callback that notifies the game VM that client user information changed.
  gameUserinfoFn
  /// Host callback that closes the active client-download resource.
  closeDownloadFn
  /// Host callback that broadcasts a server command to the selected clients.
  broadcastFn
  /// Host callback that queues a reliable command for a client.
  sendCommandFn
  /// Host callback that releases a bot client and its associated resources.
  botFreeFn
  /// Host callback that sends a server heartbeat to the configured master.
  heartbeatFn
  /// Host callback that removes connection-challenge state when a client disconnects.
  challengeDisconnectFn
  /// Host callback that updates the server's information string for a client.
  setUserinfoFn
end struct
/// Create `mq3.server.client_lifecycle.Services` with context=void; transmitFn=void; snapshotFn=void; dropFn=void; 10 further fields.
function services() return Services(void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
/// Compute call 2 in server.client_lifecycle.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
/// @param host Host used in `callback(host, a, b)`.
/// @param a A used in `callback(host, a, b)`.
/// @param b B used in `callback(host, a, b)`.
function call2(callback,host,a,b) if callback!=void then return callback(host,a,b) end if;return void end function
/// Compute call 3 in server.client_lifecycle.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
/// @param host Host used in `callback(host, a, b, c)`.
/// @param a A used in `callback(host, a, b, c)`.
/// @param b B used in `callback(host, a, b, c)`.
/// @param c C used in `callback(host, a, b, c)`.
function call3(callback,host,a,b,c) if callback!=void then return callback(host,a,b,c) end if;return void end function

/// Return `mq3.shared.info.copy(value, 32)` from `server.client_lifecycle.boundedName`.
/// @param value Text passed as `text` to `mq3.shared.info.copy`.
function boundedName(value) return info.copy(value,32) end function
/// Update `client.name`, `client.rate`, `client.userinfo`, `client.snapshotMsec` in server.client_lifecycle.
///
/// Direct state writes: `client.name`, `client.rate`, `client.userinfo`, `client.snapshotMsec`.
/// @param client Record exposing `userinfo`, `lan`, `rate`, `addressText`, `local`. Updated in place: `name`, `rate`, `userinfo`, `snapshotMsec`.
/// @param dedicated Dedicated used in `(dedicated != 2)` and `(client.lan and (dedicated != 2))`.
/// @param lanForceRate Lan force rate used in `(lanForceRate == 1)` and `((client.lan and (dedicated != 2)) and (lanForceRate == 1))`.
function userinfoChanged(client,dedicated,lanForceRate)
  client.name=boundedName(info.value(client.userinfo,"name"))
  if client.lan and dedicated!=2 and lanForceRate==1 then client.rate=99999 else
    text=info.value(client.userinfo,"rate");if text=="" then client.rate=3000 else client.rate=numbers.atoi(text);if client.rate<1000 then client.rate=1000 else if client.rate>90000 then client.rate=90000 end if end if
  end if
  handicap=info.value(client.userinfo,"handicap")
  if handicap!="" then value=numbers.atoi(handicap);if value<=0 or value>100 or len(bytes(handicap))>4 then client.userinfo=info.setValue(client.userinfo,"handicap","100",void,void) end if end if
  snaps=info.value(client.userinfo,"snaps")
  if snaps=="" then client.snapshotMsec=50 else value=numbers.atoi(snaps);if value<1 then value=1 else if value>30 then value=30 end if;client.snapshotMsec=numeric.quotient(1000,value) end if
  if info.value(client.userinfo,"ip")=="" then address=client.addressText;if client.local then address="localhost" end if;client.userinfo=info.setValue(client.userinfo,"ip",address,void,void) end if
  return void
end function
/// Return `mq3.server.client_lifecycle.userinfoChanged(client, server.dedicated, server.lanForceRate)` from `server.client_lifecycle.SV_UserinfoChanged`.
/// @param server Record exposing `dedicated`, `lanForceRate`.
/// @param client Client passed as `client` to `mq3.server.client_lifecycle.userinfoChanged`.
function SV_UserinfoChanged(server,client) return userinfoChanged(client,server.dedicated,server.lanForceRate) end function

/// Update userinfo in server.client_lifecycle.
///
/// Direct state writes: `client.userinfo`.
/// @param server Server passed as `server` to `mq3.server.client_lifecycle.SV_UserinfoChanged`.
/// @param client Updated in place: `userinfo`.
/// @param text Text passed as `text` to `mq3.shared.info.copy`.
/// @param host Record exposing `gameUserinfoFn`.
/// @param clientNum A passed as `a` to `mq3.server.client_lifecycle.call2`.
function updateUserinfo(server,client,text,host,clientNum)
  client.userinfo=info.copy(text,1024);SV_UserinfoChanged(server,client)
  call2(host.gameUserinfoFn,host,clientNum,client);return void
end function
/// Return `mq3.server.client_lifecycle.updateUserinfo(server, client, text, host, clientNum)` from `server.client_lifecycle.SV_UpdateUserinfo_f`.
/// @param server Server passed as `server` to `mq3.server.client_lifecycle.updateUserinfo`.
/// @param client Client passed as `client` to `mq3.server.client_lifecycle.updateUserinfo`.
/// @param text Text passed as `text` to `mq3.server.client_lifecycle.updateUserinfo`.
/// @param host Host passed as `host` to `mq3.server.client_lifecycle.updateUserinfo`.
/// @param clientNum Client num passed as `clientNum` to `mq3.server.client_lifecycle.updateUserinfo`.
function SV_UpdateUserinfo_f(server,client,text,host,clientNum) return updateUserinfo(server,client,text,host,clientNum) end function
/// Reset pure client in server.client_lifecycle; updates `client.pureAuthentic`, `client.gotCP`.
///
/// Direct state writes: `client.pureAuthentic`, `client.gotCP`.
/// @param client Updated in place: `pureAuthentic`, `gotCP`.
function resetPureClient(client) client.pureAuthentic=0;client.gotCP=false;return void end function
/// Return `mq3.server.client_lifecycle.resetPureClient(client)` from `server.client_lifecycle.SV_ResetPureClient_f`.
/// @param client Client passed as `client` to `mq3.server.client_lifecycle.resetPureClient`.
function SV_ResetPureClient_f(client) return resetPureClient(client) end function

/// Test client lifecycle in server.client_lifecycle; the normal completion returns `false`.
/// @param values Sequence traversed as `value` by the loop in `contains`.
/// @param wanted Wanted used in `(value == wanted)`.
function contains(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function
/// Update `client.gotCP`, `client.pureAuthentic`, `client.nextSnapshotTime`, `client.state` in server.client_lifecycle; the normal completion returns `"invalid"`.
///
/// Direct state writes: `client.gotCP`, `client.pureAuthentic`, `client.nextSnapshotTime`, `client.state`.
/// @param server Record exposing `pure`, `cgamePakFound`, `uiPakFound`, `checksumFeedServerId`, `cgameChecksum`, `uiChecksum`, `loadedPureChecksums` and further fields.
/// @param client Updated in place: `gotCP`, `pureAuthentic`, `nextSnapshotTime`, `state`.
/// @param args Args used in `args[1]` and `args[4]`.
/// @param host Record exposing `snapshotFn`, `dropFn`.
/// @param clientNum Reserved argument; this implementation does not read its value.
function verifyPaks(server,client,args,host,clientNum)
  if server.pure==0 then return "disabled" end if
  good=server.cgamePakFound and server.uiPakFound
  if len(args)<2 then
    good=false
  else
    if numbers.atoi(args[1])<server.checksumFeedServerId then return "outdated" end if
  end if
  if len(args)<6 then good=false end if
  clientChecks=[];encoded=0
  if good then
    delimiter=bytes(args[4]);if numbers.atoi(args[2])!=server.cgameChecksum or numbers.atoi(args[3])!=server.uiChecksum or len(delimiter)<1 or delimiter[0]!=64 then good=false end if
  end if
  if good then
    values=[];for index=5 to len(args)-1 values=values+[numbers.atoi(args[index])] end for
    if len(values)<1 then
      good=false
    else
      encoded=values[len(values)-1]
      if len(values)>1 then for index=0 to len(values)-2 clientChecks=clientChecks+[values[index]] end for end if
    end if
  end if
  if good and len(clientChecks)>0 then
    for first=0 to len(clientChecks)-1
      for second=0 to len(clientChecks)-1 if first!=second and clientChecks[first]==clientChecks[second] then good=false end if end for
      if not contains(server.loadedPureChecksums,clientChecks[first]) then good=false end if
    end for
  end if
  if good then checksum=server.checksumFeed;for each value in clientChecks checksum=checksum^value end for;checksum=checksum^len(clientChecks);if checksum!=encoded then good=false end if end if
  client.gotCP=true
  if good then client.pureAuthentic=1;return "valid" end if
  client.pureAuthentic=0;client.nextSnapshotTime=-1;client.state=CS_ACTIVE
  if host.snapshotFn!=void then host.snapshotFn(host,client) end if
  if host.dropFn!=void then host.dropFn(host,client,"Unpure client detected. Invalid .PK3 files referenced!") end if
  return "invalid"
end function
/// Return `mq3.server.client_lifecycle.verifyPaks(server, client, args, host, clientNum)` from `server.client_lifecycle.SV_VerifyPaks_f`.
/// @param server Server passed as `server` to `mq3.server.client_lifecycle.verifyPaks`.
/// @param client Client passed as `client` to `mq3.server.client_lifecycle.verifyPaks`.
/// @param args Args passed as `args` to `mq3.server.client_lifecycle.verifyPaks`.
/// @param host Host passed as `host` to `mq3.server.client_lifecycle.verifyPaks`.
/// @param clientNum Client num passed as `clientNum` to `mq3.server.client_lifecycle.verifyPaks`.
function SV_VerifyPaks_f(server,client,args,host,clientNum) return verifyPaks(server,client,args,host,clientNum) end function

/// Compute packet bytes in server.client_lifecycle; the normal completion returns `result`.
/// @param msg Record exposing `cursize`, `data`.
function packetBytes(msg) result=bytes(msg.cursize,0);if msg.cursize>0 then for index=0 to msg.cursize-1 result[index]=msg.data[index] end for end if;return result end function
/// Send client game state in server.client_lifecycle; the normal completion returns `payload`.
///
/// Direct state writes: `client.state`, `client.pureAuthentic`, `client.gotCP`, `client.gamestateMessageNum`.
/// @param server Record exposing `configstrings`, `baselines`, `checksumFeed`.
/// @param client Record exposing `outgoingSequence`, `lastClientCommand`, `reliableSequence`. Updated in place: `state`, `pureAuthentic`, `gotCP`, `gamestateMessageNum`.
/// @param clientNum Value passed as `value` to `mq3.qcommon.message.writeLong`.
/// @param host Record exposing `transmitFn`.
function sendClientGameState(server,client,clientNum,host)
  client.state=CS_PRIMED;client.pureAuthentic=0;client.gotCP=false;client.gamestateMessageNum=client.outgoingSequence
  msg=message.init(MAX_MSGLEN);message.writeLong(msg,client.lastClientCommand);reliable.updateServerCommandsToClient(client,msg)
  message.writeByte(msg,SVC_GAMESTATE);message.writeLong(msg,client.reliableSequence)
  for index=0 to len(server.configstrings)-1 if server.configstrings[index]!="" then message.writeByte(msg,SVC_CONFIGSTRING);message.writeShort(msg,index);message.writeBigString(msg,server.configstrings[index]) end if end for
  zero=entitystate.create()
  for each baseline in server.baselines if baseline!=void and baseline.number!=0 then message.writeByte(msg,SVC_BASELINE);delta.writeDeltaEntity(msg,zero,baseline,true) end if end for
  message.writeByte(msg,SVC_EOF);message.writeLong(msg,clientNum);message.writeLong(msg,server.checksumFeed)
  payload=packetBytes(msg);if host.transmitFn!=void then host.transmitFn(host,client,payload) end if;return payload
end function
/// Return `mq3.server.client_lifecycle.sendClientGameState(server, client, clientNum, host)` from `server.client_lifecycle.SV_SendClientGameState`.
/// @param server Server passed as `server` to `mq3.server.client_lifecycle.sendClientGameState`.
/// @param client Client passed as `client` to `mq3.server.client_lifecycle.sendClientGameState`.
/// @param clientNum Client num passed as `clientNum` to `mq3.server.client_lifecycle.sendClientGameState`.
/// @param host Host passed as `host` to `mq3.server.client_lifecycle.sendClientGameState`.
function SV_SendClientGameState(server,client,clientNum,host) return sendClientGameState(server,client,clientNum,host) end function

/// Update `client.state`, `client.gentityNumber`, `client.deltaMessage`, `client.nextSnapshotTime` in server.client_lifecycle.
///
/// Direct state writes: `client.state`, `client.gentityNumber`, `client.deltaMessage`, `client.nextSnapshotTime`, `client.lastUsercmd`.
/// @param server Record exposing `time`.
/// @param client Updated in place: `state`, `gentityNumber`, `deltaMessage`, `nextSnapshotTime`, `lastUsercmd`.
/// @param clientNum A passed as `a` to `mq3.server.client_lifecycle.call2`.
/// @param cmd Command passed as `command` to `mq3.server.user_move.copyCommand`.
/// @param host Record exposing `gameBeginFn`.
function clientEnterWorld(server,client,clientNum,cmd,host)
  client.state=CS_ACTIVE;client.gentityNumber=clientNum;client.deltaMessage=-1;client.nextSnapshotTime=server.time;client.lastUsercmd=userMove.copyCommand(cmd)
  call2(host.gameBeginFn,host,clientNum,client);return void
end function
/// Return `mq3.server.client_lifecycle.clientEnterWorld(server, client, clientNum, cmd, host)` from `server.client_lifecycle.SV_ClientEnterWorld`.
/// @param server Server passed as `server` to `mq3.server.client_lifecycle.clientEnterWorld`.
/// @param client Client passed as `client` to `mq3.server.client_lifecycle.clientEnterWorld`.
/// @param clientNum Client num passed as `clientNum` to `mq3.server.client_lifecycle.clientEnterWorld`.
/// @param cmd Cmd passed as `cmd` to `mq3.server.client_lifecycle.clientEnterWorld`.
/// @param host Host passed as `host` to `mq3.server.client_lifecycle.clientEnterWorld`.
function SV_ClientEnterWorld(server,client,clientNum,cmd,host) return clientEnterWorld(server,client,clientNum,cmd,host) end function

/// Update `client.state`, `client.userinfo` in server.client_lifecycle; the normal completion returns `true`.
///
/// Direct state writes: `client.state`, `client.userinfo`.
/// @param server Record exposing `clients`.
/// @param client Record exposing `state`, `bot`, `name`. Updated in place: `state`, `userinfo`.
/// @param clientNum A passed as `a` to `mq3.server.client_lifecycle.call2`.
/// @param reason Reason used in `("disconnect \"" + reason)` and `(("disconnect \"" + reason) + "\"")`.
/// @param host Record exposing `challengeDisconnectFn`, `closeDownloadFn`, `broadcastFn`, `gameDisconnectFn`, `sendCommandFn`, `botFreeFn`, `setUserinfoFn` and further fields.
function dropClient(server,client,clientNum,reason,host)
  if client.state==CS_ZOMBIE then return false end if
  if not client.bot and host.challengeDisconnectFn!=void then host.challengeDisconnectFn(host,client) end if
  if host.closeDownloadFn!=void then host.closeDownloadFn(host,client) end if
  if host.broadcastFn!=void then host.broadcastFn(host,"print \""+client.name+"^7 "+reason+"\n\"") end if
  client.state=CS_ZOMBIE
  call2(host.gameDisconnectFn,host,clientNum,client)
  if host.sendCommandFn!=void then host.sendCommandFn(host,client,"disconnect \""+reason+"\"") end if
  if client.bot and host.botFreeFn!=void then host.botFreeFn(host,clientNum) end if
  client.userinfo="";if host.setUserinfoFn!=void then host.setUserinfoFn(host,clientNum,"") end if
  any=false;for each current in server.clients if current.state>=CS_CONNECTED then any=true end if end for
  if not any and host.heartbeatFn!=void then host.heartbeatFn(host) end if
  return true
end function
/// Return `mq3.server.client_lifecycle.dropClient(server, client, clientNum, reason, host)` from `server.client_lifecycle.SV_DropClient`.
/// @param server Server passed as `server` to `mq3.server.client_lifecycle.dropClient`.
/// @param client Client passed as `client` to `mq3.server.client_lifecycle.dropClient`.
/// @param clientNum Client num passed as `clientNum` to `mq3.server.client_lifecycle.dropClient`.
/// @param reason Reason passed as `reason` to `mq3.server.client_lifecycle.dropClient`.
/// @param host Host passed as `host` to `mq3.server.client_lifecycle.dropClient`.
function SV_DropClient(server,client,clientNum,reason,host) return dropClient(server,client,clientNum,reason,host) end function
/// Return `mq3.server.client_lifecycle.dropClient(server, client, clientNum, "disconnected", host)` from `server.client_lifecycle.SV_Disconnect_f`.
/// @param server Server passed as `server` to `mq3.server.client_lifecycle.dropClient`.
/// @param client Client passed as `client` to `mq3.server.client_lifecycle.dropClient`.
/// @param clientNum Client num passed as `clientNum` to `mq3.server.client_lifecycle.dropClient`.
/// @param host Host passed as `host` to `mq3.server.client_lifecycle.dropClient`.
function SV_Disconnect_f(server,client,clientNum,host) return dropClient(server,client,clientNum,"disconnected",host) end function

/// Compute command args in server.client_lifecycle; the normal completion returns `args`.
/// @param parser State passed as `state` to `mq3.qcommon.command_buffer.argc`.
function commandArgs(parser) args=[];for index=0 to command.argc(parser)-1 args=args+[command.argv(parser,index)] end for;return args end function
// Productive callback for client_command_dispatch.Services.builtinFn.
/// @param runtime Record exposing `server`, `host`, `clientNum`.
/// @param client Client passed as `client` to `mq3.server.client_lifecycle.SV_UpdateUserinfo_f`.
/// @param name Name used in `(name == "cp")` and `(name == "vdr")`.
/// @param parser State passed as `state` to `mq3.qcommon.command_buffer.argv`.
function dispatchBuiltin(runtime,client,name,parser)
  if name=="userinfo" then return SV_UpdateUserinfo_f(runtime.server,client,command.argv(parser,1),runtime.host,runtime.clientNum) end if
  if name=="disconnect" then return SV_Disconnect_f(runtime.server,client,runtime.clientNum,runtime.host) end if
  if name=="cp" then return SV_VerifyPaks_f(runtime.server,client,commandArgs(parser),runtime.host,runtime.clientNum) end if
  if name=="vdr" then return SV_ResetPureClient_f(client) end if
  return false
end function
/// Runtime record for server.client_lifecycle, containing `server`, `host`, `clientNum`.
struct Runtime
  /// Server policy and package-checksum state used by client lifecycle operations.
  server
  /// Host callback interface supplying external services to this runtime.
  host
  /// Server client-slot number associated with this runtime.
  clientNum
end struct
/// Create `mq3.server.client_lifecycle.Runtime` with server=server; host=host; clientNum=clientNum.
/// @param server Initial `server` field stored in the returned or constructed `mq3.server.client_lifecycle.Runtime` record.
/// @param host Initial `host` field stored in the returned or constructed `mq3.server.client_lifecycle.Runtime` record.
/// @param clientNum Initial `clientNum` field stored in the returned or constructed `mq3.server.client_lifecycle.Runtime` record.
function runtime(server,host,clientNum) return Runtime(server,host,clientNum) end function
