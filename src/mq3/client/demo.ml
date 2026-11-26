// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Protocol-68 demo record framing from client/cl_main.c.
package mq3.client.demo
import mq3.compat.numeric as numeric
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.entitystate as entitystate
import mq3.client.gamestate as gamestate

/// Maximum byte length accepted for a native network message.
const MAX_MSGLEN=16384
/// Server-message command byte selecting the gamestate protocol operation.
const SVC_GAMESTATE=2
/// Server-message command byte selecting the configstring protocol operation.
const SVC_CONFIGSTRING=3
/// Server-message command byte selecting the baseline protocol operation.
const SVC_BASELINE=4
/// Server-message command byte selecting the eof protocol operation.
const SVC_EOF=8

/// Stores demo record, including `completed`, `truncated`, `sequence`, `payload`, `nextOffset`.
struct Record
  /// When constructing this record, `completed` supplies `true` for this member.
  completed
  /// When constructing this record, `completed` supplies `truncated` for this member.
  truncated
  /// When constructing this record, `completed` supplies `0` for this member. Used by `readDemoMessage`
  /// during subsequent processing.
  sequence
  /// When constructing this record, `completed` supplies `bytes(0,0)` for this member. Used by
  /// `readDemoMessage` during subsequent processing.
  payload
  /// When constructing this record, `completed` supplies `offset` for this member. Used by
  /// `readDemoMessage` during subsequent processing.
  nextOffset
end struct

/// Calls `mq3.compat.numeric.writeU32`, `mq3.compat.numeric.i32` from demo `writeLong`.
/// @param data Value used by `numeric.writeU32(data,offset,numeric.i32(value))`.
/// @param offset Value used by `numeric.writeU32(data,offset,numeric.i32(value))`.
/// @param value Value used by `numeric.writeU32(data,offset,numeric.i32(value))`.
function writeLong(data,offset,value)
  numeric.writeU32(data,offset,numeric.i32(value));return void
end function

/// Calls `mq3.client.demo.writeLong` from demo `encodeMessage`. The final path returns `result`.
/// @param sequence Value used by `writeLong(result,0,sequence)`.
/// @param messageData Sequence read at `messageData[index+headerBytes]`.
/// @param headerBytes Number of transport/header bytes preceding the recorded message payload.
function encodeMessage(sequence,messageData,headerBytes)
  if headerBytes<0 or headerBytes>len(messageData) then return error(6920,"demo: invalid packet header size") end if
  size=len(messageData)-headerBytes
  if size>MAX_MSGLEN then return error(6921,"demo: message exceeds MAX_MSGLEN") end if
  result=bytes(size+8,0);writeLong(result,0,sequence);writeLong(result,4,size)
  if size>0 then for index=0 to size-1 result[index+8]=messageData[index+headerBytes] end for end if
  return result
end function

/// Evaluates demo `encodeEnd` and returns `result` according to its guard/selection conditions.
function encodeEnd()
  result=bytes(8,255);return result
end function

/// Creates a `mq3.client.demo.Record` record. Assigns `truncated` from `truncated`, `nextOffset` from `offset`.
/// @param offset Value used to initialize `Record.nextOffset`.
/// @param truncated Value used to initialize `Record.truncated`.
function completed(offset,truncated)
  return Record(true,truncated,0,bytes(0,0),offset)
end function

/// Calls `mq3.client.demo.completed`, `mq3.compat.numeric.readI32`, `mq3.client.demo.Record` from demo `decodeMessage`. The final path returns `Record(false,false,sequence,payload,offset+size)`.
/// @param data Sequence read at `data[offset+index]`.
/// @param offset Value tested by `offset<0 or offset>len(data)`, `if len(data)-offset<4` and additional values before the calculation continues.
function decodeMessage(data,offset)
  if offset<0 or offset>len(data) then return error(6922,"demo: invalid file offset") end if
  if len(data)-offset<4 then return completed(len(data),offset!=len(data)) end if
  sequence=numeric.readI32(data,offset);offset=offset+4
  if len(data)-offset<4 then return completed(len(data),true) end if
  size=numeric.readI32(data,offset);offset=offset+4
  if size==-1 then return completed(offset,false) end if
  if size<0 then return error(6923,"demo: invalid negative message length") end if
  if size>MAX_MSGLEN then return error(6924,"demo: message exceeds MAX_MSGLEN") end if
  if len(data)-offset<size then return completed(len(data),true) end if
  payload=bytes(size,0)
  if size>0 then for index=0 to size-1 payload[index]=data[offset+index] end for end if
  return Record(false,false,sequence,payload,offset+size)
end function

/// Calls `mq3.compat.numeric.trunc32` from demo `demoFilename`. The final path returns `"demo"+str(thousands)+str(hundreds)+str(tens)+str(ones)`.
/// @param number Value tested by `number<0 or number>9999` before the calculation continues.
function demoFilename(number)
  if number<0 or number>9999 then return "demo9999.tga" end if
  thousands=numeric.trunc32(number/1000);number=number-thousands*1000
  hundreds=numeric.trunc32(number/100);number=number-hundreds*100
  tens=numeric.trunc32(number/10);ones=number-tens*10
  return "demo"+str(thousands)+str(hundreds)+str(tens)+str(ones)
end function

/// Stores demo playback record, including `serverMessageSequence`, `lastPacketTime`, `offset`, `completed`, `truncated`.
struct Playback
  /// Highest server network-message sequence observed by the client.
  serverMessageSequence
  /// Client timestamp of the latest received server packet, used to detect timeouts.
  lastPacketTime
  /// When constructing this record, `playback` supplies `0` for this member.
  offset
  /// When constructing this record, `playback` supplies `false` for this member.
  completed
  /// When constructing this record, `playback` supplies `false` for this member.
  truncated
end struct
/// Creates a `mq3.client.demo.Playback` record. Initializes the record with the defaults written in this constructor.
function playback() return Playback(0,0,0,false,false) end function

// CL_ReadDemoMessage state around the filesystem/parser host boundaries.
/// @param state Mutable demo record/storage; this routine assigns `state.serverMessageSequence`, `state.offset`, `state.completed`, `state.truncated` and additional values.
/// @param data Payload whose length/content is inspected by `readDemoMessage`.
/// @param realtime Current client real-time clock in milliseconds.
function readDemoMessage(state,data,realtime)
  if state==void then return error(6927,"demo: missing playback state") end if
  start=state.offset
  if len(data)-start>=4 then state.serverMessageSequence=numeric.readI32(data,start) end if
  record=decodeMessage(data,state.offset)
  state.offset=record.nextOffset
  if record.completed then state.completed=true;state.truncated=record.truncated;return void end if
  state.serverMessageSequence=record.sequence;state.lastPacketTime=realtime
  return record.payload
end function

/// Evaluates demo `messageBytes` and returns `result` according to its guard/selection conditions.
/// @param msg Record read through `msg.cursize`, `msg.data`.
function messageBytes(msg)
  result=bytes(msg.cursize,0)
  if msg.cursize>0 then for index=0 to msg.cursize-1 result[index]=msg.data[index] end for end if
  return result
end function

// The synthetic first record written by CL_Record_f. It lets a demo start in
// the middle of a match with the current configstrings and entity baselines.
/// @param serverMessageSequence Sequence number of the received server message.
/// @param reliableSequence Value used by `message.writeLong(msg,reliableSequence)`.
/// @param serverCommandSequence Value used by `message.writeLong(msg,serverCommandSequence)`.
/// @param gameState Record read through `gameState.stringOffsets`, `gameState.baselines`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param checksumFeed Value used by `message.writeLong(msg,checksumFeed)`.
function encodeInitialGamestate(serverMessageSequence,reliableSequence,serverCommandSequence,gameState,clientNum,checksumFeed)
  if gameState==void then return error(6925,"demo: missing gamestate") end if
  msg=message.init(MAX_MSGLEN);message.bitstream(msg)
  message.writeLong(msg,reliableSequence);message.writeByte(msg,SVC_GAMESTATE);message.writeLong(msg,serverCommandSequence)
  for index=0 to gamestate.MAX_CONFIGSTRINGS-1
    if gameState.stringOffsets[index]!=0 then
      message.writeByte(msg,SVC_CONFIGSTRING);message.writeShort(msg,index);message.writeBigString(msg,gamestate.configString(gameState,index))
    end if
  end for
  nullState=entitystate.create()
  for index=0 to gamestate.MAX_GENTITIES-1
    baseline=gameState.baselines[index]
    if baseline!=void and baseline.number!=0 then
      message.writeByte(msg,SVC_BASELINE);delta.writeDeltaEntity(msg,nullState,baseline,true)
    end if
  end for
  message.writeByte(msg,SVC_EOF);message.writeLong(msg,clientNum);message.writeLong(msg,checksumFeed);message.writeByte(msg,SVC_EOF)
  if msg.overflowed then return error(6926,"demo: initial gamestate exceeds MAX_MSGLEN") end if
  return encodeMessage(serverMessageSequence-1,messageBytes(msg),0)
end function
