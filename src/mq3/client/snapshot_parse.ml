// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Client-side protocol-68 packet-entity merge from client/cl_parse.c.
package mq3.client.snapshot_parse
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.entitystate as entitystate

const MAX_PARSE_ENTITIES=2048
const MAX_GENTITIES=1024
const GENTITYNUM_BITS=10
const ENTITY_SENTINEL=1023

struct Frame
  parseEntitiesNum
  numEntities
end struct

struct State
  parseEntities
  parseEntitiesNum
  entityBaselines
end struct

function createFrame() return Frame(0,0) end function

function createState()
  return State(array(MAX_PARSE_ENTITIES,void),0,array(MAX_GENTITIES,void))
end function

function baseline(state,number)
  if number<0 or number>=MAX_GENTITIES then return error(6850,"snapshot parse: bad baseline number") end if
  value=state.entityBaselines[number]
  if value==void then value=entitystate.create();value.number=number end if
  return value
end function

function parsedEntity(state,absoluteIndex)
  if absoluteIndex<0 then return error(6851,"snapshot parse: negative entity index") end if
  value=state.parseEntities[absoluteIndex&(MAX_PARSE_ENTITIES-1)]
  if value==void then return error(6852,"snapshot parse: missing old entity") end if
  return value
end function

// Mirrors CL_DeltaEntity: removed records occupy no ring slot.
function deltaEntity(state,msg,frame,newnum,old,unchanged)
  if newnum<0 or newnum>=MAX_GENTITIES then return error(6853,"snapshot parse: bad entity number") end if
  if old==void then old=baseline(state,newnum) end if
  value=void
  if unchanged then value=entitystate.copy(old) else value=delta.readDeltaEntity(msg,old,newnum) end if
  if value.number==ENTITY_SENTINEL then return false end if
  state.parseEntities[state.parseEntitiesNum&(MAX_PARSE_ENTITIES-1)]=value
  state.parseEntitiesNum=state.parseEntitiesNum+1;frame.numEntities=frame.numEntities+1
  return true
end function

function nextOld(state,oldframe,index)
  if oldframe==void or index>=oldframe.numEntities then return [99999,void] end if
  value=parsedEntity(state,oldframe.parseEntitiesNum+index)
  return [value.number,value]
end function

// Merge the sorted wire entity stream with the prior snapshot's sorted ring slice.
function parsePacketEntities(state,msg,oldframe,newframe)
  if state==void or msg==void or newframe==void then return error(6854,"snapshot parse: missing state") end if
  newframe.parseEntitiesNum=state.parseEntitiesNum;newframe.numEntities=0
  oldindex=0;pair=nextOld(state,oldframe,oldindex);oldnum=pair[0];oldstate=pair[1];lastnew=-1
  while true
    newnum=message.readBits(msg,GENTITYNUM_BITS)
    if msg.readcount>msg.cursize then return error(6855,"snapshot parse: end of message") end if
    if newnum==ENTITY_SENTINEL then break end if
    if newnum<=lastnew then return error(6856,"snapshot parse: unsorted entity number") end if
    lastnew=newnum
    while oldnum<newnum
      deltaEntity(state,msg,newframe,oldnum,oldstate,true)
      oldindex=oldindex+1;pair=nextOld(state,oldframe,oldindex);oldnum=pair[0];oldstate=pair[1]
    end while
    if oldnum==newnum then
      deltaEntity(state,msg,newframe,newnum,oldstate,false)
      oldindex=oldindex+1;pair=nextOld(state,oldframe,oldindex);oldnum=pair[0];oldstate=pair[1]
    else
      deltaEntity(state,msg,newframe,newnum,baseline(state,newnum),false)
    end if
  end while
  while oldnum!=99999
    deltaEntity(state,msg,newframe,oldnum,oldstate,true)
    oldindex=oldindex+1;pair=nextOld(state,oldframe,oldindex);oldnum=pair[0];oldstate=pair[1]
  end while
  return newframe.numEntities
end function
