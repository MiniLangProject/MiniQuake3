// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_CreateNewCommands, CL_ReadyToSendPacket and CL_WritePacket policy.
package mq3.client.send_cmd

import mq3.client.netchan as clientNetchan
import mq3.client.command_ring as sendCommandRing
import mq3.compat.numeric as n
import mq3.qcommon.message as message
import mq3.qcommon.message_delta as usercmdDelta

/// Connection-state value for a completed handshake before game-state loading, defined for deciding
/// when client user commands and command packets can be sent.
const CA_CONNECTED=5
/// Client connection state with game state loaded, awaiting a playable snapshot.
const CA_PRIMED=7
/// Connection-state value for normal gameplay after game-state loading, defined for deciding when
/// client user commands and command packets can be sent.
const CA_ACTIVE=8
/// Client connection state used for fullscreen cinematic playback.
const CA_CINEMATIC=9
/// Network-address kind identifying a loopback destination.
const NA_LOOPBACK=2
/// Number of recent user commands retained in the command-history ring.
const CMD_BACKUP=64
/// Mask that maps a user-command sequence number into the command-history ring.
const CMD_MASK=63
/// Number of packet records retained in the client packet-history ring.
const PACKET_BACKUP=32
/// Mask that maps a packet sequence number into the packet-history ring.
const PACKET_MASK=31
/// Capacity limit for the packet usercmds collection or bounded storage used by this client module.
const MAX_PACKET_USERCMDS=32
/// Capacity limit for the reliable commands collection or bounded storage used by this client module.
const MAX_RELIABLE_COMMANDS=64
/// Client-message command byte selecting the move protocol operation.
const CLC_MOVE=2
/// Client-message command byte selecting the move no delta protocol operation.
const CLC_MOVE_NO_DELTA=3
/// Client-message command byte selecting the client command protocol operation.
const CLC_CLIENT_COMMAND=4

/// Stores send cmd out packet record, including `serverTime`, `realtime`, `cmdNumber`.
struct OutPacket
  /// Timestamp in milliseconds of the latest user command included in this outgoing packet.
  serverTime
  /// Local timestamp in milliseconds at which this outgoing user-command packet was sent.
  realtime
  /// Monotonically advancing user-command sequence number for the client.
  cmdNumber
end struct
/// Stores send cmd state, including `connectionState`, `realtime`, `oldFrameTime`, `frameMsec`, `lastPacketSentTime`, `demoPlaying` and additional values.
struct State
  /// Client connection-state identifier controlling handshake, loading, and active-play behavior.
  connectionState
  /// Current local client clock in milliseconds used for command-packet scheduling and send timestamps.
  realtime
  /// Client time in milliseconds at which the previous animation frame was exact.
  oldFrameTime
  /// When constructing this record, `create` supplies `0` for this member. Used by `createNewCommand`
  /// during subsequent processing.
  frameMsec
  /// Client timestamp of the latest outgoing packet, used to schedule retransmission.
  lastPacketSentTime
  /// True while the client receives its game data from a recorded demo.
  demoPlaying
  /// When constructing this record, `create` supplies `false` for this member. Used by `writePacket`
  /// during subsequent processing.
  demoWaiting
  /// When constructing this record, `create` supplies an empty string for this member. Used by `ready`
  /// during subsequent processing.
  downloadTempName
  /// When constructing this record, `create` supplies `0` for this member. Used by `ready` during
  /// subsequent processing.
  remoteAddressType
  /// When constructing this record, `create` supplies `false` for this member. Used by `ready` during
  /// subsequent processing.
  lanAddress
  /// When constructing this record, `create` supplies `30` for this member. Used by `ready` during
  /// subsequent processing.
  maxPackets
  /// When constructing this record, `create` supplies `1` for this member. Used by `writePacket` during
  /// subsequent processing.
  packetDup
  /// When constructing this record, `create` supplies `false` for this member. Used by `writePacket`
  /// during subsequent processing.
  noDelta
  /// True when a local game server is running in the same engine instance.
  serverRunning
  /// When constructing this record, `create` supplies `false` for this member. Used by `send` during
  /// subsequent processing.
  serverPaused
  /// When constructing this record, `create` supplies `false` for this member. Used by `send` during
  /// subsequent processing.
  clientPaused
  /// Server-instance identifier included in client messages to reject stale connections.
  serverId
  /// Highest server network-message sequence observed by the client.
  serverMessageSequence
  /// Latest received reliable server-command sequence acknowledged in outgoing packets and used to
  /// select command text for encoding.
  serverCommandSequence
  /// Highest reliable-command sequence acknowledged as executed by the peer.
  reliableAcknowledge
  /// Sequence number assigned to the latest queued reliable command.
  reliableSequence
  /// Ring of reliable command strings awaiting acknowledgement or execution.
  reliableCommands
  /// Reliable server commands retained for ordered execution by the client.
  serverCommands
  /// Server-provided seed used when calculating the client's content checksums.
  checksumFeed
  /// When constructing this record, `create` supplies `false` for this member. Used by `writePacket`
  /// during subsequent processing.
  snapValid
  /// When constructing this record, `create` supplies `0` for this member. Used by `writePacket` during
  /// subsequent processing.
  snapMessageNum
  /// When constructing this record, `create` supplies `1` for this member. Used by `ready` and
  /// `writePacket` during subsequent processing.
  outgoingSequence
  /// Monotonically advancing user-command sequence number for the client.
  cmdNumber
  /// When constructing this record, `create` supplies `commands` for this member. Used by
  /// `createNewCommand` and `writePacket` during subsequent processing.
  commands
  /// History of outgoing packet metadata used to estimate acknowledgement timing.
  outPackets
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `writePacket` during subsequent processing.
  codec
end struct
/// Stores send cmd host-service callbacks, including `createCommandFn`, `transmitFn`, `cvarFn`, `diagnosticFn`, `context`.
struct Services
  /// Host callback for the create command operation; an unset callback leaves that host operation
  /// unavailable.
  createCommandFn
  /// Host callback for the transmit operation; an unset callback leaves that host operation
  /// unavailable.
  transmitFn
  /// Host callback for the cvar operation; an unset callback leaves that host operation unavailable.
  cvarFn
  /// Host callback for the diagnostic operation; an unset callback leaves that host operation
  /// unavailable.
  diagnosticFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for client command-packet
  /// transmission.
  context
end struct
/// Stores send cmd write result record, including `sent`, `message`, `commandCount`, `moveType`, `key`.
struct WriteResult
  /// When constructing this record, `writePacket` supplies `false` for this member.
  sent
  /// When constructing this record, `writePacket` supplies an absent (`void`) value for this member.
  message
  /// When constructing this record, `writePacket` supplies `0` for this member.
  commandCount
  /// When constructing this record, `writePacket` supplies `0` for this member.
  moveType
  /// When constructing this record, `writePacket` supplies `0` for this member.
  key
end struct
/// Stores send cmd live transport record, including `runtime`, `channel`.
struct LiveTransport
  /// When constructing this record, `liveServices` supplies `runtime` for this member.
  runtime
  /// When constructing this record, `liveServices` supplies `channel` for this member.
  channel
end struct

/// Adapts `mq3.qcommon.message_delta.userCommand` to send cmd `zeroCommand`, returning its result for `0, 0, 0, 0, 0, 0, 0, 0, 0`.
function zeroCommand() return usercmdDelta.userCommand(0,0,0,0,0,0,0,0,0) end function
/// Calls `mq3.client.send_cmd.zeroCommand`, `mq3.qcommon.message_delta.userCommand` from send cmd `commandCopy`.
/// @param value Record read through `value.serverTime`, `value.angles`, `value.buttons`, `value.weapon` and additional values.
function commandCopy(value)
  if value==void then return zeroCommand() end if
  return usercmdDelta.userCommand(value.serverTime,value.angles[0],value.angles[1],value.angles[2],value.buttons,value.weapon,value.forwardmove,value.rightmove,value.upmove)
end function
/// Calls `mq3.client.command_ring.create`, `mq3.client.send_cmd.zeroCommand`, `mq3.client.send_cmd.OutPacket` and additional helpers from send cmd `create`.
function create()
  reliable=array(MAX_RELIABLE_COMMANDS,"");server=array(MAX_RELIABLE_COMMANDS,"")
  commands=sendCommandRing.create();for index=0 to CMD_BACKUP-1 commands[index]=zeroCommand() end for
  packets=array(PACKET_BACKUP,void);for index=0 to PACKET_BACKUP-1 packets[index]=OutPacket(0,0,0) end for
  return State(1,0,0,0,0,false,false,"",0,false,30,1,false,false,false,false,0,0,0,0,0,reliable,server,0,false,0,1,0,commands,packets,void)
end function
/// Creates a `mq3.client.send_cmd.Services` record. Initializes the record with the defaults written in this constructor.
function services() return Services(void,void,void,void,void) end function

// Com_HashKey uses signed char on the pinned Windows reference build.
/// @param text Text consumed or emitted by `hashKey` in the send cmd path.
/// @param maxLength Value used by `if limit>maxLength then limit=maxLength end if`.
function hashKey(text,maxLength)
  if text==void then return 0 end if;raw=bytes(text);limit=len(raw);if limit>maxLength then limit=maxLength end if;hash=0
  if limit>0 then for index=0 to limit-1 value=raw[index];if value>127 then value=value-256 end if;hash=n.i32(hash+value*(119+index)) end for end if
  return n.i32(hash^(hash>>10)^(hash>>20))
end function

/// Calls `host.cvarFn` from send cmd `setCvar`. The final path returns `value`.
/// @param host Record read through `host.cvarFn`.
/// @param name Name used to select or register the corresponding send cmd resource.
/// @param value Value used by `if host.cvarFn!=void then host.cvarFn(host,name,str(value)) end if`.
function setCvar(host,name,value)
  if host.cvarFn!=void then host.cvarFn(host,name,str(value)) end if;return value
end function
/// Calls `host.diagnosticFn` from send cmd `diagnose`.
/// @param host Record read through `host.diagnosticFn`.
/// @param text Text consumed or emitted by `diagnose` in the send cmd path.
function diagnose(host,text) if host.diagnosticFn!=void then host.diagnosticFn(host,text) end if;return void end function

/// Updates `state.frameMsec`, `state.oldFrameTime`, `state.cmdNumber` during send cmd `createNewCommand`.
/// @param state Mutable send cmd record/storage; this routine assigns `state.frameMsec`, `state.oldFrameTime`, `state.cmdNumber`.
/// @param frameTime Value assigned to `command.serverTime`.
/// @param host Record read through `host.createCommandFn`.
function createNewCommand(state,frameTime,host)
  advanced=sendCommandRing.advance(state.connectionState,frameTime,state.oldFrameTime,state.cmdNumber)
  if not advanced.created then return false end if
  state.frameMsec=advanced.frameMsec;state.oldFrameTime=advanced.oldFrameTime;state.cmdNumber=advanced.commandNumber;slot=advanced.slot
  command=void;if host.createCommandFn!=void then command=host.createCommandFn(host,state,state.frameMsec,frameTime) end if
  if command==void then command=zeroCommand();command.serverTime=frameTime end if
  sendCommandRing.store(state.commands,state.cmdNumber,commandCopy(command));return true
end function

/// Updates `state.maxPackets` during send cmd `ready`.
/// @param state Mutable send cmd record/storage; this routine assigns `state.maxPackets`.
/// @param host host record passed to the send cmd helper calls.
function ready(state,host)
  if state.demoPlaying or state.connectionState==CA_CINEMATIC then return false end if
  elapsed=n.i32(state.realtime-state.lastPacketSentTime)
  if state.downloadTempName!="" and elapsed<50 then return false end if
  if state.connectionState!=CA_ACTIVE and state.connectionState!=CA_PRIMED and state.downloadTempName=="" and elapsed<1000 then return false end if
  if state.remoteAddressType==NA_LOOPBACK or state.lanAddress then return true end if
  if state.maxPackets<15 then state.maxPackets=setCvar(host,"cl_maxpackets",15) else if state.maxPackets>125 then state.maxPackets=setCvar(host,"cl_maxpackets",125) end if
  oldPacket=state.outPackets[(state.outgoingSequence-1)&PACKET_MASK]
  return n.i32(state.realtime-oldPacket.realtime)>=1000/state.maxPackets
end function

/// Updates `state.codec`, `state.packetDup`, `state.outPackets[packetNum]`, `state.lastPacketSentTime` and additional values during send cmd `writePacket`.
/// @param state Mutable send cmd record/storage; this routine assigns `state.codec`, `state.packetDup`, `state.outPackets[packetNum]`, `state.lastPacketSentTime` and additional values.
/// @param host Record read through `host.transmitFn`.
function writePacket(state,host)
  if state.demoPlaying or state.connectionState==CA_CINEMATIC then return WriteResult(false,void,0,0,0) end if
  msg=message.initStorageWithCodec(bytes(16384,0),16384,false,state.codec);state.codec=msg.codec
  message.bitstream(msg);message.writeLong(msg,state.serverId);message.writeLong(msg,state.serverMessageSequence);message.writeLong(msg,state.serverCommandSequence)
  if state.reliableSequence-state.reliableAcknowledge>MAX_RELIABLE_COMMANDS then return error(7710,"client send: reliable command overflow") end if
  if state.reliableAcknowledge<state.reliableSequence then
    for sequence=state.reliableAcknowledge+1 to state.reliableSequence
      message.writeByte(msg,CLC_CLIENT_COMMAND);message.writeLong(msg,sequence);message.writeString(msg,state.reliableCommands[sequence&(MAX_RELIABLE_COMMANDS-1)])
    end for
  end if
  if state.packetDup<0 then state.packetDup=setCvar(host,"cl_packetdup",0) else if state.packetDup>5 then state.packetDup=setCvar(host,"cl_packetdup",5) end if
  oldPacketNum=(state.outgoingSequence-1-state.packetDup)&PACKET_MASK
  count=n.i32(state.cmdNumber-state.outPackets[oldPacketNum].cmdNumber)
  if count>MAX_PACKET_USERCMDS then count=MAX_PACKET_USERCMDS;diagnose(host,"MAX_PACKET_USERCMDS") end if
  if count<0 then count=0 end if
  oldCommand=zeroCommand();moveType=0;key=0
  if count>=1 then
    moveType=CLC_MOVE
    if state.noDelta or not state.snapValid or state.demoWaiting or state.serverMessageSequence!=state.snapMessageNum then moveType=CLC_MOVE_NO_DELTA end if
    message.writeByte(msg,moveType);message.writeByte(msg,count)
    commandText=state.serverCommands[state.serverCommandSequence&(MAX_RELIABLE_COMMANDS-1)]
    key=n.i32(state.checksumFeed^state.serverMessageSequence^hashKey(commandText,32))
    for index=0 to count-1
      slot=(state.cmdNumber-count+index+1)&CMD_MASK;command=sendCommandRing.get(state.commands,state.cmdNumber,state.cmdNumber-count+index+1)
      usercmdDelta.writeDeltaUsercmdKey(msg,key,oldCommand,command);oldCommand=command
    end for
  end if
  packetNum=state.outgoingSequence&PACKET_MASK;state.outPackets[packetNum]=OutPacket(oldCommand.serverTime,state.realtime,state.cmdNumber);state.lastPacketSentTime=state.realtime
  nextSequence=void;if host.transmitFn!=void then nextSequence=host.transmitFn(host,state,msg) end if
  if nextSequence is error then return nextSequence end if
  if nextSequence==void then state.outgoingSequence=n.i32(state.outgoingSequence+1) else state.outgoingSequence=nextSequence end if
  return WriteResult(true,msg,count,moveType,key)
end function

/// Calls `mq3.client.send_cmd.createNewCommand`, `mq3.client.send_cmd.ready`, `mq3.client.send_cmd.writePacket` from send cmd `send`. The final path returns `result`.
/// @param state Record read through `state.connectionState`, `state.serverRunning`, `state.serverPaused`, `state.clientPaused`.
/// @param frameTime Value used by `created=createNewCommand(state,frameTime,host)`.
/// @param host host record passed to the send cmd helper calls.
function send(state,frameTime,host)
  if state==void or host==void then return error(7710,"client send: missing state or services") end if
  if state.connectionState<CA_CONNECTED then return "disconnected" end if
  if state.serverRunning and state.serverPaused and state.clientPaused then return "paused" end if
  created=createNewCommand(state,frameTime,host)
  if not ready(state,host) then return "choked" end if
  result=writePacket(state,host);if result is error then return result end if;return result
end function

/// Calls `mq3.client.netchan.transmit`, `mq3.client.netchan.transmitNextFragment` from send cmd `liveTransmit`. The final path returns `transport.channel.outgoingSequence`.
/// @param host Record read through `host.context`.
/// @param state Accepted for compatibility with `liveTransmit`; the current implementation does not read it.
/// @param msg Value used by `result=clientNetchan.transmit(transport.runtime,transport.channel,msg)`.
function liveTransmit(host,state,msg)
  transport=host.context;result=clientNetchan.transmit(transport.runtime,transport.channel,msg);if result is error then return result end if
  while transport.channel.unsentFragments result=clientNetchan.transmitNextFragment(transport.runtime,transport.channel);if result is error then return result end if end while
  return transport.channel.outgoingSequence
end function
/// Calls `mq3.client.send_cmd.services`, `mq3.client.send_cmd.LiveTransport` from send cmd `liveServices`. The final path returns `host`.
/// @param runtime runtime record passed to the send cmd helper calls.
/// @param channel Value used by `if runtime==void or channel==void then return error(7710,"client send: missing live transport") end if`.
function liveServices(runtime,channel)
  if runtime==void or channel==void then return error(7710,"client send: missing live transport") end if
  host=services();host.context=LiveTransport(runtime,channel);host.transmitFn=liveTransmit;return host
end function
