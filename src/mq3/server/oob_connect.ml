// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 server getchallenge/direct-connect policy sourceAddress sv_client.c.
package mq3.server.oob_connect
import mq3.shared.info as info
import mq3.compat.numeric as numeric
import std.string as strings

/// Number of pending connection-challenge entries retained by the server.
const MAX_CHALLENGES=1024
/// Wait limit before the connection policy stops waiting for authorization.
const AUTHORIZE_TIMEOUT=5000
/// Protocol version placed in Quake III connection and discovery messages.
const PROTOCOL_VERSION=68
/// Client-state value identifying a vacant slot available for accepting a new connection.
const CS_FREE=0
/// Client lifecycle state after connection but before gamestate priming.
const CS_CONNECTED=2
/// Network-address kind reserved for an in-process bot client.
const NA_BOT=0

/// Address record for server.oob_connect, containing `type`, `ip`, `port`.
struct Address
  /// Network-address kind used when validating the connection source.
  type
  /// Address bytes identifying the remote IPv4 endpoint.
  ip
  /// Network port associated with the endpoint.
  port
end struct
/// Create `mq3.server.oob_connect.Address` with type=type; ip=ip; port=port.
/// @param type Initial `type` field stored in the returned or constructed `mq3.server.oob_connect.Address` record.
/// @param ip Initial `ip` field stored in the returned or constructed `mq3.server.oob_connect.Address` record.
/// @param port Initial `port` field stored in the returned or constructed `mq3.server.oob_connect.Address` record.
function address(type,ip,port) return Address(type,ip,port) end function
/// Compute server.oob_connect.sameBase as `((((a != void) and (b != void)) and (a.type == b.type)) and (a.ip == b.ip))`.
/// @param a Record exposing `type`, `ip`.
/// @param b Record exposing `type`, `ip`.
function sameBase(a,b) return a!=void and b!=void and a.type==b.type and a.ip==b.ip end function
/// Compute server.oob_connect.sameAddress as `(sameBase(a, b) and (a.port == b.port))`.
/// @param a Record exposing `port`.
/// @param b Record exposing `port`.
function sameAddress(a,b) return sameBase(a,b) and a.port==b.port end function

/// Challenge record for server.oob_connect, containing `address`, `challenge`, `time`, `pingTime`, `firstTime`, `connected`.
struct Challenge
  /// Network address associated with the client or packet.
  address
  /// Challenge value used to authenticate a connection attempt.
  challenge
  /// Server timestamp when this challenge entry was assigned, used to select the oldest reusable entry.
  time
  /// Server timestamp of the challenge response used to measure connection latency.
  pingTime
  /// Server timestamp when this challenge address was first registered.
  firstTime
  /// True after the connection challenge has been accepted by a client.
  connected
end struct
/// Create `mq3.server.oob_connect.Challenge` with address=void; challenge=0; time=0; pingTime=0; firstTime=0; connected=false.
function emptyChallenge() return Challenge(void,0,0,0,0,false) end function
/// Client record for server.oob_connect, containing `state`, `address`, `qport`, `lastConnectTime`, `reliableAcknowledge`, `reliableSequence`, and 6 further fields.
struct Client
  /// Connection lifecycle value that tracks slot availability and progress through connection
  /// admission.
  state
  /// Network address associated with the client or packet.
  address
  /// Client-selected virtual port used to recognize a connection across address translation.
  qport
  /// Server timestamp when this client connection began, in milliseconds.
  lastConnectTime
  /// Reliable command acknowledgment reset when this connection slot is admitted or reused.
  reliableAcknowledge
  /// Sequence number of the newest queued reliable command.
  reliableSequence
  /// Challenge value used to authenticate a connection attempt.
  challenge
  /// Backslash-delimited client information string, including name and connection settings.
  userinfo
  /// Earliest server timestamp for sending the next snapshot, in milliseconds.
  nextSnapshotTime
  /// Server timestamp of the most recently received client packet, in milliseconds.
  lastPacketTime
  /// Outgoing network sequence number of the client gamestate message.
  gamestateMessageNum
  /// True when the client slot is controlled by an in-process bot.
  bot
end struct
/// Create `mq3.server.oob_connect.Client` with state=CS_FREE; address=void; qport=0; lastConnectTime=0; reliableAcknowledge=0; reliableSequence=0; challenge=0; userinfo=""; nextSnapshotTime=0; lastPacketTime=0; gamestateMessageNum=0; bot=false.
function emptyClient() return Client(CS_FREE,void,0,0,0,0,0,"",0,0,0,false) end function
/// Config record for server.oob_connect, containing `singlePlayer`, `reconnectLimit`, `minPing`, `maxPing`, `privateClients`, `privatePassword`.
struct Config
  /// True when the connection policy is configured for single-player operation.
  singlePlayer
  /// Minimum interval required before a client may reconnect.
  reconnectLimit
  /// Minimum client latency accepted by the connection policy.
  minPing
  /// Maximum client latency accepted by the connection policy.
  maxPing
  /// Number of client slots reserved for clients with the private password.
  privateClients
  /// Password required to use the reserved private client slots.
  privatePassword
end struct
/// Create `mq3.server.oob_connect.Config` with singlePlayer=false; reconnectLimit=3; minPing=0; maxPing=0; privateClients=0; privatePassword="".
function config() return Config(false,3,0,0,0,"") end function
/// Runtime record for server.oob_connect, containing `time`, `challenges`, `clients`, `config`, `randFn`, `lanFn`, and 9 further fields.
struct Runtime
  /// Server clock used for challenge expiration, authorization waits, and connection admission, in
  /// milliseconds.
  time
  /// Pending connection challenges used to validate connecting client addresses.
  challenges
  /// Connection slots searched for reconnecting clients and available admission capacity.
  clients
  /// Configuration object supplying the settings used by this runtime.
  config
  /// Host callback that supplies random values used for connection challenges.
  randFn
  /// Host callback that classifies a network address for LAN connection policy.
  lanFn
  /// Host callback that classifies a connection address as local or remote.
  localFn
  /// Host callback that transmits the supplied message through the host network interface.
  sendFn
  /// Host callback that performs the host-side client authorization exchange.
  authorizeFn
  /// Host callback that asks the game VM to accept or reject a client.
  gameConnectFn
  /// Host callback that disconnects a client and reports the supplied reason.
  dropFn
  /// Host callback that sends a server heartbeat to the configured master.
  heartbeatFn
  /// Caller-supplied data associated with connection challenges, authorization, and connection
  /// admission.
  context
  /// Network address of the external client-authorization server.
  authorizeAddress
  /// Host callback that reports subsystem diagnostics to the host.
  diagnosticFn
end struct
/// Create oob connect in server.oob_connect; the normal completion returns `Runtime(0, challenges, clients, settings, void, void, void, void, void, void, void, void, void, void, void)`.
///
/// Validation failures include `oob connect: invalid maxclients`.
/// @param maxClients Max clients used in `(maxClients - 1)` and `(maxClients <= 0)`.
/// @param settings Initial `config` field stored in the returned or constructed `mq3.server.oob_connect.Runtime` record.
function create(maxClients,settings)
  if maxClients<=0 then return error(6920,"oob connect: invalid maxclients") end if
  challenges=array(MAX_CHALLENGES,void);for index=0 to MAX_CHALLENGES-1 challenges[index]=emptyChallenge() end for
  clients=array(maxClients,void);for index=0 to maxClients-1 clients[index]=emptyClient() end for
  return Runtime(0,challenges,clients,settings,void,void,void,void,void,void,void,void,void,void,void)
end function
/// Result record for server.oob_connect, containing `accepted`, `reason`, `slot`, `challengeIndex`, `userinfo`.
struct Result
  /// True when validation accepted the requested operation.
  accepted
  /// Diagnostic explaining the result or rejection of this operation.
  reason
  /// Index identifying this entry in its owning slot table.
  slot
  /// Index of the challenge-table entry used by the connection attempt.
  challengeIndex
  /// Backslash-delimited client information string, including name and connection settings.
  userinfo
end struct
/// Create `mq3.server.oob_connect.Result` with accepted=ok; reason=reason; slot=slot; challengeIndex=index; userinfo=userinfo.
/// @param ok Initial `accepted` field stored in the returned or constructed `mq3.server.oob_connect.Result` record.
/// @param reason Initial `reason` field stored in the returned or constructed `mq3.server.oob_connect.Result` record.
/// @param slot Initial `slot` field stored in the returned or constructed `mq3.server.oob_connect.Result` record.
/// @param index Initial `challengeIndex` field stored in the returned or constructed `mq3.server.oob_connect.Result` record.
/// @param userinfo Initial `userinfo` field stored in the returned or constructed `mq3.server.oob_connect.Result` record.
function result(ok,reason,slot,index,userinfo) return Result(ok,reason,slot,index,userinfo) end function

/// Test lan in server.oob_connect; the normal completion returns `runtime.lanFn(runtime, sourceAddress)`.
/// @param runtime Record exposing `lanFn`.
/// @param sourceAddress Source address used in `runtime.lanFn(runtime, sourceAddress)`.
function isLan(runtime,sourceAddress) if runtime.lanFn==void then return false end if;return runtime.lanFn(runtime,sourceAddress) end function
/// Test local in server.oob_connect; the normal completion returns `runtime.localFn(runtime, sourceAddress)`.
/// @param runtime Record exposing `localFn`.
/// @param sourceAddress Source address used in `runtime.localFn(runtime, sourceAddress)`.
function isLocal(runtime,sourceAddress) if runtime.localFn==void then return false end if;return runtime.localFn(runtime,sourceAddress) end function
/// Send oob connect in server.oob_connect.
/// @param runtime Record exposing `sendFn`.
/// @param targetAddress Target address used in `runtime.sendFn(runtime, targetAddress, text)`.
/// @param text Text used in `runtime.sendFn(runtime, targetAddress, text)`.
function send(runtime,targetAddress,text) if runtime.sendFn!=void then runtime.sendFn(runtime,targetAddress,text) end if;return void end function
/// Compute random value in server.oob_connect; the normal completion returns `runtime.randFn(runtime)`.
///
/// Validation failures include `oob connect: missing random service`.
/// @param runtime Record exposing `randFn`.
function randomValue(runtime) if runtime.randFn==void then return error(6921,"oob connect: missing random service") end if;return runtime.randFn(runtime) end function

/// Get challenge in server.oob_connect; the normal completion returns `c`.
/// @param runtime Record exposing `config`, `challenges`, `time`, `authorizeFn`.
/// @param sourceAddress A passed as `a` to `mq3.server.oob_connect.sameAddress`.
function getChallenge(runtime,sourceAddress)
  if runtime.config.singlePlayer then return void end if
  oldest=0;oldestTime=0x7fffffff;found=-1
  for index=0 to MAX_CHALLENGES-1
    c=runtime.challenges[index]
    if not c.connected and sameAddress(sourceAddress,c.address) then found=index;break end if
    if c.time<oldestTime then oldestTime=c.time;oldest=index end if
  end for
  if found<0 then
    found=oldest;c=runtime.challenges[found];c.challenge=numeric.i32(((randomValue(runtime)<<16)^randomValue(runtime))^runtime.time);c.address=sourceAddress;c.firstTime=runtime.time;c.time=runtime.time;c.connected=false
  end if
  c=runtime.challenges[found]
  if isLan(runtime,sourceAddress) or runtime.time-c.firstTime>AUTHORIZE_TIMEOUT then c.pingTime=runtime.time;send(runtime,c.address,"challengeResponse "+str(c.challenge));return c end if
  if runtime.authorizeFn!=void then runtime.authorizeFn(runtime,c.challenge,sourceAddress) end if
  return c
end function

/// Compute authorize diagnostic in server.oob_connect.
/// @param runtime Record exposing `diagnosticFn`.
/// @param text Text used in `runtime.diagnosticFn(runtime, text)`.
function authorizeDiagnostic(runtime,text) if runtime.diagnosticFn!=void then runtime.diagnosticFn(runtime,text) end if;return void end function
/// Compute authorize ip packet in server.oob_connect; the normal completion returns `"denied"`.
/// @param runtime Record exposing `authorizeAddress`, `challenges`, `time`.
/// @param sourceAddress A passed as `a` to `mq3.server.oob_connect.sameBase`.
/// @param args Args used in `args[1]` and `args[2]`.
/// @param fsRestrict Fs restrict used in `(fsRestrict != 0)`.
function authorizeIpPacket(runtime,sourceAddress,args,fsRestrict)
  if runtime.authorizeAddress==void or not sameBase(sourceAddress,runtime.authorizeAddress) then authorizeDiagnostic(runtime,"SV_AuthorizeIpPacket: not from authorize server\n");return "wrongServer" end if
  wanted=0;if len(args)>1 then wanted=atoi(args[1]) end if;found=-1
  for index=0 to MAX_CHALLENGES-1 if runtime.challenges[index].challenge==wanted then found=index;break end if end for
  if found<0 then authorizeDiagnostic(runtime,"SV_AuthorizeIpPacket: challenge not found\n");return "notFound" end if
  challenge=runtime.challenges[found];challenge.pingTime=runtime.time;status="";reason="";if len(args)>2 then status=args[2] end if;if len(args)>3 then reason=args[3] end if
  if strings.equalsIgnoreCaseAscii(status,"demo") then
    if fsRestrict!=0 then send(runtime,challenge.address,"challengeResponse "+str(challenge.challenge));return "acceptedDemo" end if
    send(runtime,challenge.address,"print\nServer is not a demo server\n");runtime.challenges[found]=emptyChallenge();return "rejectedDemo"
  end if
  if strings.equalsIgnoreCaseAscii(status,"accept") then send(runtime,challenge.address,"challengeResponse "+str(challenge.challenge));return "accepted" end if
  if strings.equalsIgnoreCaseAscii(status,"unknown") then
    // Cmd_Argv returns a stable empty string for a missing argument.  The
    // original tests !r (the pointer), so an omitted reason is sent empty.
    send(runtime,challenge.address,"print\n"+reason+"\n");runtime.challenges[found]=emptyChallenge();return "unknown"
  end if
  send(runtime,challenge.address,"print\n"+reason+"\n");runtime.challenges[found]=emptyChallenge();return "denied"
end function
/// Return `mq3.server.oob_connect.authorizeIpPacket(runtime, sourceAddress, args, fsRestrict)` from `server.oob_connect.SV_AuthorizeIpPacket`.
/// @param runtime Runtime passed as `runtime` to `mq3.server.oob_connect.authorizeIpPacket`.
/// @param sourceAddress Source address passed as `sourceAddress` to `mq3.server.oob_connect.authorizeIpPacket`.
/// @param args Args passed as `args` to `mq3.server.oob_connect.authorizeIpPacket`.
/// @param fsRestrict Fs restrict passed as `fsRestrict` to `mq3.server.oob_connect.authorizeIpPacket`.
function SV_AuthorizeIpPacket(runtime,sourceAddress,args,fsRestrict) return authorizeIpPacket(runtime,sourceAddress,args,fsRestrict) end function

/// Compute atoi in server.oob_connect; the normal completion returns `(value * sign)`.
/// @param text Text used in `len(text)` and `bytes(text)`.
function atoi(text) value=0;sign=1;index=0;if len(text)>0 and bytes(text)[0]==45 then sign=-1;index=1 end if;raw=bytes(text);while index<len(raw) and raw[index]>=48 and raw[index]<=57 value=value*10+raw[index]-48;index=index+1 end while;return value*sign end function
/// Compute server.oob_connect.matchingClient as `(((client.state != CS_FREE) and sameBase(sourceAddress, client.address)) and ((client.qport == qport) or (sourceAddress.port == client.address.port)))`.
/// @param client Record exposing `state`, `address`, `qport`.
/// @param sourceAddress Record exposing `port`.
/// @param qport Qport used in `(client.qport == qport)` and `((client.qport == qport) or (sourceAddress.port == client.address.port))`.
function matchingClient(client,sourceAddress,qport) return client.state!=CS_FREE and sameBase(sourceAddress,client.address) and (client.qport==qport or sourceAddress.port==client.address.port) end function

/// Compute direct connect in server.oob_connect; the normal completion returns `result(true, "", slot, challengeIndex, userinfo)`.
/// @param runtime Record exposing `clients`, `time`, `config`, `challenges`, `dropFn`, `gameConnectFn`, `heartbeatFn`.
/// @param sourceAddress Record exposing `ip`, `port`.
/// @param userinfo Info passed as `info` to `mq3.shared.info.value`.
function directConnect(runtime,sourceAddress,userinfo)
  version=atoi(info.value(userinfo,"protocol"));if version!=PROTOCOL_VERSION then send(runtime,sourceAddress,"print\nServer uses protocol version 68.\n");return result(false,"protocol",-1,-1,userinfo) end if
  challenge=atoi(info.value(userinfo,"challenge"));qport=atoi(info.value(userinfo,"qport"))
  reuse=-1
  for index=0 to len(runtime.clients)-1
    c=runtime.clients[index]
    if matchingClient(c,sourceAddress,qport) then
      if runtime.time-c.lastConnectTime<runtime.config.reconnectLimit*1000 then return result(false,"reconnect",-1,-1,userinfo) end if
      reuse=index;break
    end if
  end for
  challengeIndex=-1
  if not isLocal(runtime,sourceAddress) then
    for index=0 to MAX_CHALLENGES-1
      if sameAddress(sourceAddress,runtime.challenges[index].address) and challenge==runtime.challenges[index].challenge then challengeIndex=index;break end if
    end for
    if challengeIndex<0 then send(runtime,sourceAddress,"print\nNo or bad challenge for address.\n");return result(false,"challenge",-1,-1,userinfo) end if
    userinfo=info.setValue(userinfo,"ip",str(sourceAddress.ip[0])+"."+str(sourceAddress.ip[1])+"."+str(sourceAddress.ip[2])+"."+str(sourceAddress.ip[3])+":"+str(sourceAddress.port),void,void)
    ping=runtime.time-runtime.challenges[challengeIndex].pingTime;runtime.challenges[challengeIndex].connected=true
    if not isLan(runtime,sourceAddress) and runtime.config.minPing!=0 and ping<runtime.config.minPing then runtime.challenges[challengeIndex].address.port=0;send(runtime,sourceAddress,"print\nServer is for high pings only\n");return result(false,"minping",-1,challengeIndex,userinfo) end if
    if not isLan(runtime,sourceAddress) and runtime.config.maxPing!=0 and ping>runtime.config.maxPing then send(runtime,sourceAddress,"print\nServer is for low pings only\n");return result(false,"maxping",-1,challengeIndex,userinfo) end if
  else userinfo=info.setValue(userinfo,"ip","localhost",void,void) end if
  slot=reuse
  if slot<0 then
    start=runtime.config.privateClients;if info.value(userinfo,"password")==runtime.config.privatePassword then start=0 end if
    for index=start to len(runtime.clients)-1 if runtime.clients[index].state==CS_FREE then slot=index;break end if end for
    if slot<0 and isLocal(runtime,sourceAddress) then
      bots=0;for index=start to len(runtime.clients)-1 if runtime.clients[index].bot then bots=bots+1 end if end for
      if bots>=len(runtime.clients)-start then slot=len(runtime.clients)-1;if runtime.dropFn!=void then runtime.dropFn(runtime,runtime.clients[slot],"only bots on server") end if
      else return result(false,"local-full",-1,challengeIndex,userinfo) end if
    end if
    if slot<0 then send(runtime,sourceAddress,"print\nServer is full.\n");return result(false,"full",-1,challengeIndex,userinfo) end if
  end if
  denied=void;if runtime.gameConnectFn!=void then denied=runtime.gameConnectFn(runtime,slot,userinfo) end if
  if denied!=void and denied!="" then send(runtime,sourceAddress,"print\n"+denied+"\n");return result(false,"game",slot,challengeIndex,userinfo) end if
  c=emptyClient();c.address=sourceAddress;c.qport=qport;c.challenge=challenge;c.userinfo=userinfo;c.state=CS_CONNECTED;c.nextSnapshotTime=runtime.time;c.lastPacketTime=runtime.time;c.lastConnectTime=runtime.time;c.gamestateMessageNum=-1;runtime.clients[slot]=c
  send(runtime,sourceAddress,"connectResponse");count=0;for each client in runtime.clients if client.state>=CS_CONNECTED then count=count+1 end if end for
  if (count==1 or count==len(runtime.clients)) and runtime.heartbeatFn!=void then runtime.heartbeatFn(runtime) end if
  return result(true,"",slot,challengeIndex,userinfo)
end function
