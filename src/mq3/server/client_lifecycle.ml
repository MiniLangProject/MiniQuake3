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

const CS_FREE=0
const CS_ZOMBIE=1
const CS_CONNECTED=2
const CS_PRIMED=3
const CS_ACTIVE=4
const SVC_GAMESTATE=2
const SVC_CONFIGSTRING=3
const SVC_BASELINE=4
const SVC_EOF=8
const MAX_MSGLEN=16384

struct Client state name userinfo addressText lan local bot gentityNumber rate snapshotMsec nextSnapshotTime deltaMessage lastUsercmd pureAuthentic gotCP gamestateMessageNum outgoingSequence lastClientCommand reliableSequence reliableAcknowledge reliableSent reliableCommands downloadName end struct
function createClient()
  return Client(CS_FREE,"","","",false,false,false,-1,3000,50,0,-1,userMove.zeroCommand(),0,false,-1,0,0,0,0,0,array(64,""),"")
end function

struct Server time checksumFeed checksumFeedServerId pure configstrings baselines clients loadedPureChecksums cgameChecksum uiChecksum cgamePakFound uiPakFound dedicated lanForceRate end struct
function createServer(clientCount)
  clients=[];for index=0 to clientCount-1 clients=clients+[createClient()] end for
  return Server(0,0,0,0,array(1024,""),array(1024,void),clients,[],0,0,false,false,0,1)
end function

struct Services context transmitFn snapshotFn dropFn gameBeginFn gameDisconnectFn gameUserinfoFn closeDownloadFn broadcastFn sendCommandFn botFreeFn heartbeatFn challengeDisconnectFn setUserinfoFn end struct
function services() return Services(void,void,void,void,void,void,void,void,void,void,void,void,void,void) end function
function call2(callback,host,a,b) if callback!=void then return callback(host,a,b) end if;return void end function
function call3(callback,host,a,b,c) if callback!=void then return callback(host,a,b,c) end if;return void end function

function boundedName(value) return info.copy(value,32) end function
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
function SV_UserinfoChanged(server,client) return userinfoChanged(client,server.dedicated,server.lanForceRate) end function

function updateUserinfo(server,client,text,host,clientNum)
  client.userinfo=info.copy(text,1024);SV_UserinfoChanged(server,client)
  call2(host.gameUserinfoFn,host,clientNum,client);return void
end function
function SV_UpdateUserinfo_f(server,client,text,host,clientNum) return updateUserinfo(server,client,text,host,clientNum) end function
function resetPureClient(client) client.pureAuthentic=0;client.gotCP=false;return void end function
function SV_ResetPureClient_f(client) return resetPureClient(client) end function

function contains(values,wanted) for each value in values if value==wanted then return true end if end for;return false end function
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
function SV_VerifyPaks_f(server,client,args,host,clientNum) return verifyPaks(server,client,args,host,clientNum) end function

function packetBytes(msg) result=bytes(msg.cursize,0);if msg.cursize>0 then for index=0 to msg.cursize-1 result[index]=msg.data[index] end for end if;return result end function
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
function SV_SendClientGameState(server,client,clientNum,host) return sendClientGameState(server,client,clientNum,host) end function

function clientEnterWorld(server,client,clientNum,cmd,host)
  client.state=CS_ACTIVE;client.gentityNumber=clientNum;client.deltaMessage=-1;client.nextSnapshotTime=server.time;client.lastUsercmd=userMove.copyCommand(cmd)
  call2(host.gameBeginFn,host,clientNum,client);return void
end function
function SV_ClientEnterWorld(server,client,clientNum,cmd,host) return clientEnterWorld(server,client,clientNum,cmd,host) end function

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
function SV_DropClient(server,client,clientNum,reason,host) return dropClient(server,client,clientNum,reason,host) end function
function SV_Disconnect_f(server,client,clientNum,host) return dropClient(server,client,clientNum,"disconnected",host) end function

function commandArgs(parser) args=[];for index=0 to command.argc(parser)-1 args=args+[command.argv(parser,index)] end for;return args end function
// Productive callback for client_command_dispatch.Services.builtinFn.
function dispatchBuiltin(runtime,client,name,parser)
  if name=="userinfo" then return SV_UpdateUserinfo_f(runtime.server,client,command.argv(parser,1),runtime.host,runtime.clientNum) end if
  if name=="disconnect" then return SV_Disconnect_f(runtime.server,client,runtime.clientNum,runtime.host) end if
  if name=="cp" then return SV_VerifyPaks_f(runtime.server,client,commandArgs(parser),runtime.host,runtime.clientNum) end if
  if name=="vdr" then return SV_ResetPureClient_f(client) end if
  return false
end function
struct Runtime server host clientNum end struct
function runtime(server,host,clientNum) return Runtime(server,host,clientNum) end function
