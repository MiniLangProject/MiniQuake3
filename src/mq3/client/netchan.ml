// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Protocol-68 client channel wrapper from client/cl_net_chan.c.
package mq3.client.netchan
import mq3.qcommon.message as message
import mq3.qcommon.netchan as netchan
import mq3.compat.numeric as numeric

/// Capacity limit for the reliable commands collection or bounded storage used by this client module.
const MAX_RELIABLE_COMMANDS=64
/// Byte offset after the connection header at which client message encoding begins.
const CL_ENCODE_START=12
/// Byte offset after the connection header at which client message decoding begins.
const CL_DECODE_START=4
/// Client-message command byte selecting the eof protocol operation.
const CLC_EOF=5

/// Stores netchan connection state, including `challenge`, `reliableCommands`, `serverCommands`.
struct Connection
  /// Server-issued challenge token used to validate the connection handshake.
  challenge
  /// Ring of reliable command strings awaiting acknowledgement or execution.
  reliableCommands
  /// Reliable server commands retained for ordered execution by the client.
  serverCommands
end struct
/// Stores netchan runtime wiring and state, including `transport`, `connection`, `newsize`.
struct Runtime
  /// When constructing this record, `create` supplies `transport` for this member. Used by
  /// `transmitNextFragment` and `transmit` during subsequent processing.
  transport
  /// When constructing this record, `create` supplies `connection` for this member. Used by `transmit`
  /// and `process` during subsequent processing.
  connection
  /// When constructing this record, `create` supplies `0` for this member. Used by `process` during
  /// subsequent processing.
  newsize
end struct

/// Creates the challenge state and separate 64-entry client/server reliable-command rings used by packet XOR encoding.
function createConnection()
  return Connection(0,array(MAX_RELIABLE_COMMANDS,""),array(MAX_RELIABLE_COMMANDS,""))
end function

/// Binds a transport to protocol-68 client channel state, creating the reliable-command rings when omitted.
/// @param transport Value used by `return Runtime(transport,connection,0)`.
/// @param connection Value used by `if connection==void then connection=createConnection() end if`.
function create(transport,connection)
  if connection==void then connection=createConnection() end if
  return Runtime(transport,connection,0)
end function

/// Returns a command-string byte, using zero for indices outside the string.
/// @param raw Sequence read at `raw[index]`.
/// @param index Value tested by `index<0 or index>=len(raw)` before the calculation continues.
function commandByte(raw,index)
  if index<0 or index>=len(raw) then return 0 end if
  return raw[index]
end function

/// XORs packet bytes in place using a cycling command string and alternating key shifts, replacing high bytes and percent signs with periods.
/// @param msg Mutable netchan record/storage; this routine assigns `msg.data[offset]`.
/// @param start Value tested by `start<msg.cursize` before the calculation continues.
/// @param key Key or control identifier used to select the corresponding netchan entry.
/// @param text Text consumed or emitted by `mix` in the netchan path.
function mix(msg,start,key,text)
  raw=bytes(text);index=0
  if start<msg.cursize then
    for offset=start to msg.cursize-1
      value=commandByte(raw,index)
      if value==0 then index=0;value=commandByte(raw,index) end if
      if value>127 or value==37 then value=46 end if
      key=(key^(value<<(offset&1)))&255;index=index+1
      msg.data[offset]=(msg.data[offset]^key)&255
    end for
  end if
  return void
end function

/// XOR-encodes the outgoing payload after its 12-byte header using challenge, server ID, acknowledgement and the referenced server command.
/// @param connection Record read through `connection.serverCommands`, `connection.challenge`.
/// @param msg Mutable netchan record/storage; this routine assigns `msg.bit`, `msg.readcount`, `msg.oob`.
function encode(connection,msg)
  if msg.cursize<=CL_ENCODE_START then return void end if
  savedRead=msg.readcount;savedBit=msg.bit;savedOob=msg.oob
  msg.bit=0;msg.readcount=0;msg.oob=false
  serverId=message.readI32(msg);messageAcknowledge=message.readI32(msg);reliableAcknowledge=message.readI32(msg)
  msg.oob=savedOob;msg.bit=savedBit;msg.readcount=savedRead
  text=connection.serverCommands[reliableAcknowledge&(MAX_RELIABLE_COMMANDS-1)]
  mix(msg,CL_ENCODE_START,(connection.challenge^serverId^messageAcknowledge)&255,text)
  return void
end function

/// XOR-decodes an accepted server payload using its sequence and the acknowledged client command while preserving the message-reader cursor.
/// @param connection Record read through `connection.reliableCommands`, `connection.challenge`.
/// @param msg Mutable netchan record/storage; this routine assigns `msg.oob`, `msg.bit`, `msg.readcount`.
function decodeMessage(connection,msg)
  savedRead=msg.readcount;savedBit=msg.bit;savedOob=msg.oob
  msg.oob=false;reliableAcknowledge=message.readI32(msg)
  msg.oob=savedOob;msg.bit=savedBit;msg.readcount=savedRead
  sequence=numeric.readI32(msg.data,0)
  text=connection.reliableCommands[reliableAcknowledge&(MAX_RELIABLE_COMMANDS-1)]
  mix(msg,msg.readcount+CL_DECODE_START,(connection.challenge^sequence)&255,text)
  return void
end function

/// Sends the next queued channel fragment through the configured transport.
/// @param runtime Record read through `runtime.transport`.
/// @param channel Argument 2 of `mq3.qcommon.netchan.transmitNextFragment`.
function transmitNextFragment(runtime,channel)
  return netchan.transmitNextFragment(runtime.transport,channel)
end function

/// Appends CLC_EOF, encodes the client message and passes its used bytes to the channel transport.
/// @param runtime Record read through `runtime.connection`, `runtime.transport`.
/// @param channel Value used by `return netchan.transmit(runtime.transport,channel,slice(msg.data,0,msg.cursize))`.
/// @param msg Record read through `msg.data`, `msg.cursize`.
function transmit(runtime,channel,msg)
  message.writeByte(msg,CLC_EOF)
  encode(runtime.connection,msg)
  return netchan.transmit(runtime.transport,channel,slice(msg.data,0,msg.cursize))
end function

/// Reassembles and validates a received channel packet, then installs and decodes accepted message bytes and updates received-size accounting.
/// @param runtime Mutable netchan record/storage; this routine assigns `runtime.newsize`.
/// @param channel Value used by `result=netchan.process(channel,slice(msg.data,0,msg.cursize),msg.maxsize)`.
/// @param msg Mutable netchan record/storage; this routine assigns `msg.data`, `msg.cursize`, `msg.readcount`, `msg.bit`.
function process(runtime,channel,msg)
  result=netchan.process(channel,slice(msg.data,0,msg.cursize),msg.maxsize)
  if not result.accepted then return false end if
  msg.data=result.data;msg.cursize=result.cursize;msg.readcount=result.readcount;msg.bit=result.bit
  decodeMessage(runtime.connection,msg);runtime.newsize=runtime.newsize+msg.cursize
  return true
end function
