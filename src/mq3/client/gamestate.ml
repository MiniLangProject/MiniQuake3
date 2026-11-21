// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_ParseGamestate protocol state from client/cl_parse.c.
package mq3.client.gamestate
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.entitystate as entitystate

const MAX_CONFIGSTRINGS=1024
const MAX_GAMESTATE_CHARS=16000
const MAX_GENTITIES=1024
const GENTITYNUM_BITS=10
const SVC_CONFIGSTRING=3
const SVC_BASELINE=4
const SVC_EOF=8

struct State
  stringOffsets
  stringData
  dataCount
  baselines
  serverCommandSequence
  clientNum
  checksumFeed
  connectPacketCount
  paused
  closeFn
  systemInfoFn
  restartFn
  downloadsFn
  pauseFn
  context
end struct

function create()
  return State(array(MAX_CONFIGSTRINGS,0),bytes(MAX_GAMESTATE_CHARS,0),1,array(MAX_GENTITIES,void),0,0,0,0,0,void,void,void,void,void,void)
end function

function clear(state)
  state.stringOffsets=array(MAX_CONFIGSTRINGS,0);state.stringData=bytes(MAX_GAMESTATE_CHARS,0);state.dataCount=1
  state.baselines=array(MAX_GENTITIES,void);state.clientNum=0;state.checksumFeed=0;state.paused=0
  return void
end function

function configString(state,index)
  if index<0 or index>=MAX_CONFIGSTRINGS then return error(6900,"gamestate: configstring index") end if
  offset=state.stringOffsets[index]
  if offset<=0 then return "" end if
  finish=offset
  while finish<len(state.stringData) and state.stringData[finish]!=0
    finish=finish+1
  end while
  return decode(slice(state.stringData,offset,finish-offset))
end function

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
      if length>0 then for offset=0 to length-1 state.stringData[state.dataCount+offset]=raw[offset] end for end if
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
