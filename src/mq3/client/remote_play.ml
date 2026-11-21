// SPDX-License-Identifier: GPL-2.0-or-later
// Desktop protocol-68 UDP connection and the server-driven gameplay stream.
package mq3.client.remote_play
import mq3.client.command_ring as remoteCommands
import mq3.client.connectionless as remoteConnectionless
import mq3.client.gamestate as remoteGamestate
import mq3.client.netchan as remoteClientNetchan
import mq3.client.network_ingress as remoteIngress
import mq3.client.protocol_runtime as remoteProtocolRuntime
import mq3.client.remote_pure as remotePure
import mq3.client.send_cmd as remoteSend
import mq3.compat.textnumbers as remoteNumbers
import mq3.platform.udp as remoteUdp
import mq3.qcommon.command_buffer as remoteCommandBuffer
import mq3.qcommon.net_transport as remoteTransport
import mq3.qcommon.netchan as remoteNetchan
import mq3.shared.info as remoteInfo
import std.string as remoteStrings

const CS_SERVERINFO=0
const CS_SYSTEMINFO=1
const SNAPFLAG_NOT_ACTIVE=2
const CONNECT_TIMEOUT_MS=12000
const SERVER_TIMEOUT_MS=30000

struct ServerEndpoint host port end struct
struct ConnectionHost socket userinfo end struct
struct Live
  socket connection connectionHost ingress protocol outgoing sendHost
  receiveBytes receiveMetadata epoch map game baseDirectory verifiedArchive
  connectStarted gamestateStarted lastAccepted lastCommandSequence
end struct

function parseEndpoint(address)
  if address==void then return error(7820,"Specify a Quake III server address") end if
  colon=remoteStrings.indexOf(address,":",0)
  host=address
  port=remoteTransport.PORT_SERVER
  if colon>=0 then
    host=remoteStrings.substr(address,0,colon)
    rawPort=bytes(remoteStrings.substr(address,colon+1,len(address)-colon-1))
    if len(rawPort)<1 or len(rawPort)>5 then return error(7820,"Invalid Quake III server port") end if
    port=0
    for each value in rawPort
      if value<48 or value>57 then return error(7820,"Invalid Quake III server port") end if
      port=port*10+value-48
    end for
    if port<1 or port>65535 then return error(7820,"Invalid Quake III server port") end if
  end if
  rawHost=bytes(host)
  if len(rawHost)<1 or len(rawHost)>253 then return error(7820,"Invalid Quake III server hostname") end if
  for each value in rawHost
    if not ((value>=48 and value<=57) or (value>=65 and value<=90) or (value>=97 and value<=122) or value==45 or value==46) then
      return error(7820,"Expected an IPv4 address or hostname, optionally followed by :port")
    end if
  end for
  if host=="localhost" then host="127.0.0.1" end if
  return ServerEndpoint(host,port)
end function

function sendOob(host,state,address,text)
  return remoteTransport.outOfBandPrint(host.context.socket,address,text)
end function

function sendOobData(host,state,address,data)
  return remoteTransport.outOfBandData(host.context.socket,address,data)
end function

function readUserinfo(host,state) return host.context.userinfo end function

function closeSocket(socket)
  if socket!=void then ignored=try(remoteUdp.close(socket)) end if
  return remoteUdp.cleanup()
end function

function create(serverAddress,userinfo,now)
  endpoint=try(parseEndpoint(serverAddress))
  if endpoint is error then return endpoint end if
  remoteUdp.startup()
  address=try(remoteTransport.resolveIPv4(endpoint.host,endpoint.port))
  if address is error then cleanup=try(closeSocket(void));return address end if
  socket=try(remoteUdp.open())
  if socket is error then cleanup=try(closeSocket(void));return socket end if
  local=try(remoteUdp.bind(socket,remoteUdp.Endpoint(0,0)))
  if local is error then cleanup=try(closeSocket(socket));return local end if

  state=remoteConnectionless.create(address)
  state.qport=local.port
  state.connectionState=remoteConnectionless.CA_CONNECTING
  state.connectTime=now-remoteConnectionless.RETRANSMIT_TIMEOUT
  state.realtime=now
  host=remoteConnectionless.services()
  if userinfo==void or userinfo=="" then userinfo="\\name\\UnnamedPlayer\\rate\\25000\\snaps\\40" end if
  host.context=ConnectionHost(socket,userinfo)
  host.outOfBandFn=sendOob
  host.outOfBandDataFn=sendOobData
  host.userinfoFn=readUserinfo

  protocol=remoteProtocolRuntime.create(void)
  outgoing=remoteSend.create()
  outgoing.remoteAddressType=remoteTransport.NA_IP
  outgoing.serverCommands=protocol.dispatcher.serverCommands
  wire=remoteClientNetchan.createConnection()
  wire.reliableCommands=outgoing.reliableCommands
  wire.serverCommands=outgoing.serverCommands
  channel=remoteClientNetchan.create(remoteTransport.attach(remoteNetchan.init(local.port),socket),wire)
  input=remoteIngress.create(state,channel,protocol,remoteIngress.services(host))
  return Live(socket,state,host,input,protocol,outgoing,void,bytes(65535,0),bytes(8,0),protocol.dispatcher.snapshotState,"","","",void,now,now,now,0)
end function

function primed(live)
  return live!=void and live.connection.connectionState==remoteConnectionless.CA_ACTIVE
end function

function mapName(live) return live.map end function
function gameDirectory(live) return live.game end function
function approvedArchive(live) return live.verifiedArchive end function
function setBasePackages(live,baseDirectory)
  live.baseDirectory=baseDirectory
  return void
end function

function status(live)
  if live.map!="" then return "Receiving " + live.map end if
  if live.sendHost!=void then return "Awaiting gamestate" end if
  if live.connection.connectionState==remoteConnectionless.CA_CHALLENGING then return "Awaiting connection" end if
  return "Awaiting challenge"
end function

function updateSendState(live,now)
  outgoing=live.outgoing
  dispatcher=live.protocol.dispatcher
  snapshots=dispatcher.snapshotState
  outgoing.connectionState=live.connection.connectionState
  outgoing.realtime=now
  outgoing.serverMessageSequence=live.ingress.packetState.serverMessageSequence
  outgoing.serverCommandSequence=dispatcher.serverCommandSequence
  outgoing.reliableAcknowledge=dispatcher.reliableAcknowledge
  outgoing.snapValid=snapshots.snap.valid
  outgoing.snapMessageNum=snapshots.snap.messageNum
  snapshots.outPackets=outgoing.outPackets
  snapshots.outgoingSequence=outgoing.outgoingSequence
  return void
end function

function appendCommand(live,command)
  outgoing=live.outgoing
  outgoing.cmdNumber=outgoing.cmdNumber+1
  remoteCommands.store(outgoing.commands,outgoing.cmdNumber,remoteSend.commandCopy(command))
  return void
end function

function writePacket(live,now,force)
  if live.sendHost==void then return false end if
  updateSendState(live,now)
  if not force and not remoteSend.ready(live.outgoing,live.sendHost) then return false end if
  result=try(remoteSend.writePacket(live.outgoing,live.sendHost))
  if result is error then return result end if
  return result.sent
end function

function enterGamestate(live,now)
  state=live.protocol.gamestateState
  serverInfo=remoteGamestate.configString(state,CS_SERVERINFO)
  systemInfo=remoteGamestate.configString(state,CS_SYSTEMINFO)
  map=remoteInfo.value(serverInfo,"mapname")
  serverId=remoteInfo.value(systemInfo,"sv_serverid")
  if map=="" or serverId=="" or state.clientNum<0 or state.clientNum>=64 then
    return error(7821,"The server sent an incomplete Quake III gamestate")
  end if
  game=remoteInfo.value(systemInfo,"fs_game")
  serverId=remoteNumbers.atoi(serverId)
  live.verifiedArchive=void
  if remoteNumbers.atoi(remoteInfo.value(systemInfo,"sv_pure"))!=0 then
    if game!="" and game!="baseq3" then return error(7821,"Pure PK3 verification currently supports the Baseq3 game only") end if
    verified=remotePure.verify(live.baseDirectory,systemInfo,state.checksumFeed,serverId,map)
    queueReliable(live,verified.command)
    live.verifiedArchive=verified.archive
  end if
  live.epoch=live.protocol.dispatcher.snapshotState
  live.map=map
  live.game=game
  live.gamestateStarted=now
  live.lastCommandSequence=state.serverCommandSequence
  live.outgoing.serverId=serverId
  live.outgoing.checksumFeed=state.checksumFeed
  live.connection.connectionState=remoteConnectionless.CA_PRIMED
  appendCommand(live,remoteSend.zeroCommand())
  return writePacket(live,now,true)
end function

function updateServerSystemInfo(live,systemInfo)
  serverId=remoteInfo.value(systemInfo,"sv_serverid")
  if serverId!="" then live.outgoing.serverId=remoteNumbers.atoi(serverId) end if
  return void
end function

function checkServerCommands(live)
  dispatcher=live.protocol.dispatcher
  highest=dispatcher.serverCommandSequence
  first=live.lastCommandSequence+1
  if first<highest-remoteSend.MAX_RELIABLE_COMMANDS+1 then first=highest-remoteSend.MAX_RELIABLE_COMMANDS+1 end if
  if first<=highest then
    argv=remoteCommandBuffer.create()
    for sequence=first to highest
      command=dispatcher.serverCommands[sequence&(remoteSend.MAX_RELIABLE_COMMANDS-1)]
      if remoteConnectionless.startsWith(command,"disconnect") or remoteConnectionless.startsWith(command,"cs ") then
        remoteCommandBuffer.tokenizeString(argv,command)
        name=remoteCommandBuffer.argv(argv,0)
        if name=="disconnect" then
          reason=remoteCommandBuffer.argsFrom(argv,1)
          if reason=="" then reason="The server disconnected" end if
          return error(7822,reason)
        end if
        if name=="cs" and remoteCommandBuffer.argv(argv,1)=="1" then
          updateServerSystemInfo(live,remoteCommandBuffer.argv(argv,2))
        end if
      end if
    end for
  end if
  live.lastCommandSequence=highest
  return void
end function

function acceptPacket(live,packet,now)
  input=live.ingress
  state=live.connection
  oldPhase=state.connectionState
  result=try(remoteIngress.clientPacket(input,packet.address,packet.data))
  if result is error then return result end if
  if state.connectionState!=oldPhase then live.lastAccepted=now end if
  if state.channel!=void and live.sendHost==void then
    input.netchanRuntime.connection.challenge=state.challenge
    live.outgoing.lastPacketSentTime=now-1000
    live.sendHost=remoteSend.liveServices(input.netchanRuntime,state.channel)
    return writePacket(live,now,true)
  end if
  if result!="sequenced" then return false end if
  if input.lastParseResult is error then return input.lastParseResult end if
  live.lastAccepted=now
  if live.protocol.dispatcher.snapshotState!=live.epoch then enterGamestate(live,now) end if
  checkServerCommands(live)
  snap=live.epoch.snap
  if snap.valid and (snap.snapFlags&SNAPFLAG_NOT_ACTIVE)==0 then state.connectionState=remoteConnectionless.CA_ACTIVE end if
  return true
end function

function pump(live,now,budget)
  if live==void or live.socket==void then return error(7822,"The server connection is closed") end if
  if budget<1 or budget>64 then return error(7822,"Invalid UDP receive budget") end if
  state=live.connection
  state.realtime=now
  remoteIngress.setRealtime(live.ingress,now)
  for index=1 to budget
    packet=remoteTransport.receiveBuffered(live.socket,live.receiveBytes,live.receiveMetadata,len(live.receiveBytes))
    if not packet.received then break end if
    if remoteTransport.compareAddress(packet.address,state.serverAddress) then acceptPacket(live,packet,now) end if
  end for
  if live.map=="" and now-live.connectStarted>=CONNECT_TIMEOUT_MS then
    reason=state.serverMessage
    if reason=="" then reason="Timed out joining the Quake III server" end if
    return error(7822,reason)
  end if
  if live.map!="" and not primed(live) and now-live.gamestateStarted>=CONNECT_TIMEOUT_MS then
    return error(7822,"The server did not send an active snapshot")
  end if
  if now-live.lastAccepted>=SERVER_TIMEOUT_MS then return error(7822,"Lost connection to the Quake III server") end if
  remoteConnectionless.checkForResend(state,live.connectionHost)
  if not primed(live) then writePacket(live,now,false) end if
  return primed(live)
end function

function queueReliable(live,text)
  if live==void or live.sendHost==void then return error(7823,"There is no server connection") end if
  if text==void or text=="" or len(bytes(text))>=1024 then return error(7823,"Invalid client command length") end if
  outgoing=live.outgoing
  dispatcher=live.protocol.dispatcher
  if outgoing.reliableSequence-dispatcher.reliableAcknowledge>=remoteSend.MAX_RELIABLE_COMMANDS then
    return error(7823,"The server has not acknowledged pending client commands")
  end if
  outgoing.reliableSequence=outgoing.reliableSequence+1
  outgoing.reliableCommands[outgoing.reliableSequence&(remoteSend.MAX_RELIABLE_COMMANDS-1)]=text
  dispatcher.reliableSequence=outgoing.reliableSequence
  return void
end function

function updateUserinfo(live,userinfo)
  if not primed(live) then return false end if
  if userinfo==live.connectionHost.context.userinfo then return false end if
  if userinfo=="" or not remoteInfo.valid(userinfo) then return error(7823,"Invalid client userinfo") end if
  queueReliable(live,"userinfo \""+userinfo+"\"")
  live.connectionHost.context.userinfo=userinfo
  return true
end function

function writeFrame(live,command,now)
  if not primed(live) then return false end if
  appendCommand(live,command)
  return writePacket(live,now,false)
end function

function close(live,now)
  if live==void or live.socket==void then return void end if
  if live.sendHost!=void then
    queued=try(queueReliable(live,"disconnect"))
    if not (queued is error) then ignored=try(writePacket(live,now,true)) end if
  end if
  socket=live.socket
  live.socket=void
  live.sendHost=void
  live.connection.connectionState=remoteConnectionless.CA_DISCONNECTED
  return closeSocket(socket)
end function
