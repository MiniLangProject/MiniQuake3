// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_ParseGamestate protocol state from client/cl_parse.c.
package mq3.client.gamestate
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.entitystate as entitystate

/// Capacity limit for the configstrings collection or bounded storage used by this client module.
const MAX_CONFIGSTRINGS=1024
/// Capacity of the packed server configuration-string character storage.
const MAX_GAMESTATE_CHARS=16000
/// Capacity limit for the gentities collection or bounded storage used by this client module.
const MAX_GENTITIES=1024
/// Number of bits allocated to an entity number in the native network protocol.
const GENTITYNUM_BITS=10
/// Server-message command byte selecting the configstring protocol operation.
const SVC_CONFIGSTRING=3
/// Server-message command byte selecting the baseline protocol operation.
const SVC_BASELINE=4
/// Server-message command byte selecting the eof protocol operation.
const SVC_EOF=8

/// Stores gamestate state, including `stringOffsets`, `stringData`, `dataCount`, `baselines`, `serverCommandSequence`, `clientNum` and additional values.
struct State
  /// When constructing this record, `create` supplies `array(MAX_CONFIGSTRINGS,0)` for this member.
  /// Used by `clear` and `configString` during subsequent processing.
  stringOffsets
  /// When constructing this record, `create` supplies `bytes(MAX_GAMESTATE_CHARS,0)` for this member.
  /// Used by `clear` and `configString` during subsequent processing.
  stringData
  /// When constructing this record, `create` supplies `1` for this member. Used by `clear` and `parse`
  /// during subsequent processing.
  dataCount
  /// When constructing this record, `create` supplies `array(MAX_GENTITIES,void)` for this member. Used
  /// by `clear` and `parse` during subsequent processing.
  baselines
  /// Reliable server-command sequence read at the start of the server game-state payload.
  serverCommandSequence
  /// Client slot assigned by the server in the received game-state message.
  clientNum
  /// Server-provided seed used when calculating the client's content checksums.
  checksumFeed
  /// Number of connection-handshake packets sent, also used by progress displays.
  connectPacketCount
  /// When constructing this record, `create` supplies `0` for this member. Used by `clear` and `parse`
  /// during subsequent processing.
  paused
  /// Host callback for the close operation; an unset callback leaves that host operation unavailable.
  closeFn
  /// Host callback for the system info operation; an unset callback leaves that host operation
  /// unavailable.
  systemInfoFn
  /// Host callback for the restart operation; an unset callback leaves that host operation unavailable.
  restartFn
  /// Host callback for the downloads operation; an unset callback leaves that host operation
  /// unavailable.
  downloadsFn
  /// Host callback for the pause operation; an unset callback leaves that host operation unavailable.
  pauseFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for initial game-state
  /// decoding.
  context
end struct

/// Creates a `mq3.client.gamestate.State` record. Initializes the record with the defaults written in this constructor.
function create()
  return State(array(MAX_CONFIGSTRINGS,0),bytes(MAX_GAMESTATE_CHARS,0),1,array(MAX_GENTITIES,void),0,0,0,0,0,void,void,void,void,void,void)
end function

/// Updates `state.stringOffsets`, `state.stringData`, `state.dataCount`, `state.baselines` and additional values during gamestate `clear`.
/// @param state Mutable gamestate record/storage; this routine assigns `state.stringOffsets`, `state.stringData`, `state.dataCount`, `state.baselines` and additional values.
function clear(state)
  state.stringOffsets=array(MAX_CONFIGSTRINGS,0);state.stringData=bytes(MAX_GAMESTATE_CHARS,0);state.dataCount=1
  state.baselines=array(MAX_GENTITIES,void);state.clientNum=0;state.checksumFeed=0;state.paused=0
  return void
end function

/// Calls `decode`, `slice` from gamestate `configString`. The final path returns `decode(slice(state.stringData,offset,finish-offset))`.
/// @param state Record read through `state.stringOffsets`, `state.stringData`.
/// @param index Value tested by `index<0 or index>=MAX_CONFIGSTRINGS` before the calculation continues.
function configString(state,index)
  if index<0 or index>=MAX_CONFIGSTRINGS then return error(6900,"gamestate: configstring index") end if
  offset=state.stringOffsets[index]
  if offset<=0 then return "" end if
  start=offset
  while offset<len(state.stringData) and state.stringData[offset]!=0 offset=offset+1 end while
  return decode(slice(state.stringData,start,offset-start))
end function

/// Replaces one configstring by rebuilding packed string storage before publishing any mutation.
/// Returns false for identical text and true when the offsets, bytes and used-byte count change.
/// Empty text removes the slot. Error 6900 rejects missing inputs, an invalid index or embedded zero
/// bytes; error 6904 rejects storage overflow. Every failed update preserves the prior state.
/// Unchanged strings are copied as bytes, and the packed table reserves byte zero and each terminator.
/// @param state Mutable gamestate with valid packed string offsets and storage.
/// @param index Configstring slot in the range zero through `MAX_CONFIGSTRINGS - 1`.
/// @param value Replacement text whose encoded bytes must fit within `MAX_GAMESTATE_CHARS` with all other strings.
function updateConfigString(state,index,value)
  if state==void or value==void or index<0 or index>=MAX_CONFIGSTRINGS then return error(6900,"gamestate: invalid configstring update") end if
  if configString(state,index)==value then return false end if
  replacement=bytes(value)
  if len(replacement)>0 then
    for each item in replacement if item==0 then return error(6900,"gamestate: embedded configstring terminator") end if end for
  end if
  offsets=array(MAX_CONFIGSTRINGS,0);data=bytes(MAX_GAMESTATE_CHARS,0);count=1
  for slot=0 to MAX_CONFIGSTRINGS-1
    source=state.stringData;start=state.stringOffsets[slot];length=0
    if slot==index then
      source=replacement;start=0;length=len(replacement)
    else if start>0 then
      cursor=start
      while cursor<len(source) and source[cursor]!=0 cursor=cursor+1 end while
      length=cursor-start
    end if
    if length>0 then
      if length+1+count>MAX_GAMESTATE_CHARS then return error(6904,"gamestate: string storage exceeded") end if
      offsets[slot]=count;copyBytes(data,count,source,start,length);count=count+length+1
    end if
  end for
  state.stringOffsets=offsets;state.stringData=data;state.dataCount=count
  return true
end function

/// Updates `state.connectPacketCount`, `state.serverCommandSequence`, `state.stringOffsets[index]`, `state.stringData[state.dataCount+offset]` and additional values during gamestate `parse`.
/// @param state Mutable gamestate record/storage; this routine assigns `state.connectPacketCount`, `state.serverCommandSequence`, `state.stringOffsets[index]`, `state.stringData[state.dataCount+offset]` and additional values.
/// @param msg Record read through `msg.readcount`, `msg.cursize`.
function parse(state,msg)
  if state==void or msg==void then return error(6901,"gamestate: missing state") end if
  if state.closeFn!=void then state.closeFn(state) end if
  state.connectPacketCount=0;clear(state);state.serverCommandSequence=message.readI32(msg)
  while true
    command=message.readU8(msg)
    if command==SVC_EOF then break end if
    if command==SVC_CONFIGSTRING then
      index=message.readI16(msg)
      if index<0 or index>=MAX_CONFIGSTRINGS then return error(6902,"gamestate: configstring index") end if
      value=message.readBigCString(msg);raw=bytes(value);length=len(raw)
      if msg.readcount>msg.cursize then return error(6903,"gamestate: truncated configstring") end if
      if length+1+state.dataCount>MAX_GAMESTATE_CHARS then return error(6904,"gamestate: string storage exceeded") end if
      state.stringOffsets[index]=state.dataCount
      if length>0 then copyBytes(state.stringData,state.dataCount,raw,0,length) end if
      state.dataCount=state.dataCount+length+1
    else if command==SVC_BASELINE then
      number=message.readBits(msg,GENTITYNUM_BITS)
      if number<0 or number>=MAX_GENTITIES then return error(6905,"gamestate: baseline number") end if
      base=entitystate.create();base.number=number
      state.baselines[number]=delta.readDeltaEntity(msg,base,number)
    else
      return error(6906,"gamestate: bad command")
    end if
  end while
  state.clientNum=message.readI32(msg);state.checksumFeed=message.readI32(msg)
  if msg.readcount>msg.cursize then return error(6907,"gamestate: truncated trailer") end if
  if state.systemInfoFn!=void then state.systemInfoFn(state) end if
  if state.restartFn!=void then state.restartFn(state,state.checksumFeed) end if
  if state.downloadsFn!=void then state.downloadsFn(state) end if
  state.paused=0;if state.pauseFn!=void then state.pauseFn(state,0) end if
  return state
end function
