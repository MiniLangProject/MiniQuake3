// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_CreateNewCommands, CL_ReadyToSendPacket and CL_WritePacket policy.
package mq3.client.send_cmd

import mq3.client.netchan as clientNetchan
import mq3.client.command_ring as sendCommandRing
import mq3.compat.numeric as n
import mq3.qcommon.message as message
import mq3.qcommon.message_delta as usercmdDelta

const CA_CONNECTED=5
const CA_PRIMED=7
const CA_ACTIVE=8
const CA_CINEMATIC=9
const NA_LOOPBACK=2
const CMD_BACKUP=64
const CMD_MASK=63
const PACKET_BACKUP=32
const PACKET_MASK=31
const MAX_PACKET_USERCMDS=32
const MAX_RELIABLE_COMMANDS=64
const CLC_MOVE=2
const CLC_MOVE_NO_DELTA=3
const CLC_CLIENT_COMMAND=4

struct OutPacket serverTime realtime cmdNumber end struct
struct State
  connectionState realtime oldFrameTime frameMsec lastPacketSentTime
  demoPlaying demoWaiting downloadTempName remoteAddressType lanAddress
  maxPackets packetDup noDelta serverRunning serverPaused clientPaused
  serverId serverMessageSequence serverCommandSequence reliableAcknowledge reliableSequence
  reliableCommands serverCommands checksumFeed snapValid snapMessageNum outgoingSequence
  cmdNumber commands outPackets codec
end struct
struct Services createCommandFn transmitFn cvarFn diagnosticFn context end struct
struct WriteResult sent message commandCount moveType key end struct
struct LiveTransport runtime channel end struct

function zeroCommand() return usercmdDelta.userCommand(0,0,0,0,0,0,0,0,0) end function
function commandCopy(value)
  if value==void then return zeroCommand() end if
  return usercmdDelta.userCommand(value.serverTime,value.angles[0],value.angles[1],value.angles[2],value.buttons,value.weapon,value.forwardmove,value.rightmove,value.upmove)
end function
function create()
  reliable=array(MAX_RELIABLE_COMMANDS,"");server=array(MAX_RELIABLE_COMMANDS,"")
  commands=sendCommandRing.create();for index=0 to CMD_BACKUP-1 commands[index]=zeroCommand() end for
  packets=array(PACKET_BACKUP,void);for index=0 to PACKET_BACKUP-1 packets[index]=OutPacket(0,0,0) end for
  return State(1,0,0,0,0,false,false,"",0,false,30,1,false,false,false,false,0,0,0,0,0,reliable,server,0,false,0,1,0,commands,packets,void)
end function
function services() return Services(void,void,void,void,void) end function

// Com_HashKey uses signed char on the pinned Windows reference build.
function hashKey(text,maxLength)
  if text==void then return 0 end if;raw=bytes(text);limit=len(raw);if limit>maxLength then limit=maxLength end if;hash=0
  if limit>0 then for index=0 to limit-1 value=raw[index];if value>127 then value=value-256 end if;hash=n.i32(hash+value*(119+index)) end for end if
  return n.i32(hash^(hash>>10)^(hash>>20))
end function

function setCvar(host,name,value)
  if host.cvarFn!=void then host.cvarFn(host,name,str(value)) end if;return value
end function
function diagnose(host,text) if host.diagnosticFn!=void then host.diagnosticFn(host,text) end if;return void end function

function createNewCommand(state,frameTime,host)
  advanced=sendCommandRing.advance(state.connectionState,frameTime,state.oldFrameTime,state.cmdNumber)
  if not advanced.created then return false end if
  state.frameMsec=advanced.frameMsec;state.oldFrameTime=advanced.oldFrameTime;state.cmdNumber=advanced.commandNumber;slot=advanced.slot
  command=void;if host.createCommandFn!=void then command=host.createCommandFn(host,state,state.frameMsec,frameTime) end if
  if command==void then command=zeroCommand();command.serverTime=frameTime end if
  sendCommandRing.store(state.commands,state.cmdNumber,commandCopy(command));return true
end function

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

function send(state,frameTime,host)
  if state==void or host==void then return error(7710,"client send: missing state or services") end if
  if state.connectionState<CA_CONNECTED then return "disconnected" end if
  if state.serverRunning and state.serverPaused and state.clientPaused then return "paused" end if
  created=createNewCommand(state,frameTime,host)
  if not ready(state,host) then return "choked" end if
  result=writePacket(state,host);if result is error then return result end if;return result
end function

function liveTransmit(host,state,msg)
  transport=host.context;result=clientNetchan.transmit(transport.runtime,transport.channel,msg);if result is error then return result end if
  while transport.channel.unsentFragments result=clientNetchan.transmitNextFragment(transport.runtime,transport.channel);if result is error then return result end if end while
  return transport.channel.outgoingSequence
end function
function liveServices(runtime,channel)
  if runtime==void or channel==void then return error(7710,"client send: missing live transport") end if
  host=services();host.context=LiveTransport(runtime,channel);host.transmitFn=liveTransmit;return host
end function
