// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 server getchallenge/direct-connect policy sourceAddress sv_client.c.
package mq3.server.oob_connect
import mq3.shared.info as info
import mq3.compat.numeric as numeric
import std.string as strings

const MAX_CHALLENGES=1024
const AUTHORIZE_TIMEOUT=5000
const PROTOCOL_VERSION=68
const CS_FREE=0
const CS_CONNECTED=2
const NA_BOT=0

/// Address record for server.oob_connect, containing `type`, `ip`, `port`.
struct Address type ip port end struct
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
struct Challenge address challenge time pingTime firstTime connected end struct
/// Create `mq3.server.oob_connect.Challenge` with address=void; challenge=0; time=0; pingTime=0; firstTime=0; connected=false.
function emptyChallenge() return Challenge(void,0,0,0,0,false) end function
/// Client record for server.oob_connect, containing `state`, `address`, `qport`, `lastConnectTime`, `reliableAcknowledge`, `reliableSequence`, and 6 further fields.
struct Client state address qport lastConnectTime reliableAcknowledge reliableSequence challenge userinfo nextSnapshotTime lastPacketTime gamestateMessageNum bot end struct
/// Create `mq3.server.oob_connect.Client` with state=CS_FREE; address=void; qport=0; lastConnectTime=0; reliableAcknowledge=0; reliableSequence=0; challenge=0; userinfo=""; nextSnapshotTime=0; lastPacketTime=0; gamestateMessageNum=0; bot=false.
function emptyClient() return Client(CS_FREE,void,0,0,0,0,0,"",0,0,0,false) end function
/// Config record for server.oob_connect, containing `singlePlayer`, `reconnectLimit`, `minPing`, `maxPing`, `privateClients`, `privatePassword`.
struct Config singlePlayer reconnectLimit minPing maxPing privateClients privatePassword end struct
/// Create `mq3.server.oob_connect.Config` with singlePlayer=false; reconnectLimit=3; minPing=0; maxPing=0; privateClients=0; privatePassword="".
function config() return Config(false,3,0,0,0,"") end function
/// Runtime record for server.oob_connect, containing `time`, `challenges`, `clients`, `config`, `randFn`, `lanFn`, and 9 further fields.
struct Runtime time challenges clients config randFn lanFn localFn sendFn authorizeFn gameConnectFn dropFn heartbeatFn context authorizeAddress diagnosticFn end struct
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
struct Result accepted reason slot challengeIndex userinfo end struct
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
