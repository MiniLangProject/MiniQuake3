// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Client-side protocol-68 packet-entity merge from client/cl_parse.c.
package mq3.client.snapshot_parse
import mq3.qcommon.message as message
import mq3.qcommon.message_state_delta as delta
import mq3.game.entitystate as entitystate

/// Capacity limit for the parse entities collection or bounded storage used by this client module.
const MAX_PARSE_ENTITIES=2048
/// Capacity limit for the gentities collection or bounded storage used by this client module.
const MAX_GENTITIES=1024
/// Number of bits allocated to an entity number in the native network protocol.
const GENTITYNUM_BITS=10
/// Terminating entity identifier used to mark the end of the entity sequence.
const ENTITY_SENTINEL=1023

/// Stores snapshot parse frame data, including `parseEntitiesNum`, `numEntities`.
struct Frame
  /// Absolute position in the parsed-entity ring at which this snapshot's entities begin.
  parseEntitiesNum
  /// Number of entity-state entries represented by the snapshot or scene.
  numEntities
end struct

/// Stores snapshot parse state, including `parseEntities`, `parseEntitiesNum`, `entityBaselines`, `shownetLevel`, `shownetLines`.
struct State
  /// Parsed entity-state ring used to reconstruct snapshots from their absolute entity positions.
  parseEntities
  /// Absolute position in the parsed-entity ring at which this snapshot's entities begin.
  parseEntitiesNum
  /// Baseline entity states used when delta decoding has no previous snapshot state.
  entityBaselines
  /// When constructing this record, `createState` supplies `0` for this member. Used by `trace` during
  /// subsequent processing.
  shownetLevel
  /// When constructing this record, `createState` supplies an empty list for this member. Used by
  /// `trace` during subsequent processing.
  shownetLines
end struct

/// Creates an empty packet-entity frame descriptor with zero ring origin and entity count.
function createFrame() return Frame(0,0) end function

/// Allocates the 2,048-entry parse-entity ring and 1,024 baseline slots with diagnostic tracing disabled.
function createState()
  return State(array(MAX_PARSE_ENTITIES,void),0,array(MAX_GENTITIES,void),0,[])
end function

/// Left-pads a packet offset to at least three characters for entity diagnostics.
/// @param value Value used by `text=str(value)`.
function pad3(value) text=str(value);while len(bytes(text))<3 text=" "+text end while;return text end function
/// Records packet-entity trace lines only at shownet level three.
/// @param state Mutable snapshot parse record/storage; this routine assigns `state.shownetLines`.
/// @param msg Record read through `msg.readcount`.
/// @param text Text consumed or emitted by `trace` in the snapshot parse path.
function trace(state,msg,text)
  if state.shownetLevel==3 then state.shownetLines=state.shownetLines+[pad3(msg.readcount)+":  "+text] end if
  return void
end function

/// Returns a validated entity baseline or creates a zeroed fallback carrying the requested entity number.
/// @param state Record read through `state.entityBaselines`.
/// @param number Value assigned to `value.number`.
function baseline(state,number)
  if number<0 or number>=MAX_GENTITIES then return error(6850,"snapshot parse: bad baseline number") end if
  value=state.entityBaselines[number]
  if value==void then value=entitystate.create();value.number=number end if
  return value
end function

/// Reads an absolute entity sequence through the parse ring, rejecting negative indices and missing history entries.
/// @param state Record read through `state.parseEntities`.
/// @param absoluteIndex Value used by `if absoluteIndex<0 then return error(6851,"snapshot parse: negative entity index") end if`.
function parsedEntity(state,absoluteIndex)
  if absoluteIndex<0 then return error(6851,"snapshot parse: negative entity index") end if
  value=state.parseEntities[absoluteIndex&(MAX_PARSE_ENTITIES-1)]
  if value==void then return error(6852,"snapshot parse: missing old entity") end if
  return value
end function

// Mirrors CL_DeltaEntity: removed records occupy no ring slot.
/// @param state Mutable snapshot parse record/storage; this routine assigns `state.parseEntities[state.parseEntitiesNum&(MAX_PARSE_ENTITIES-1)]`, `state.parseEntitiesNum`.
/// @param msg Value used by `if unchanged then value=entitystate.copy(old) else value=delta.readDeltaEntity(msg,old,newnum) end if`.
/// @param frame Mutable snapshot parse record/storage; this routine assigns `frame.numEntities`.
/// @param newnum Value used by `if newnum<0 or newnum>=MAX_GENTITIES then return error(6853,"snapshot parse: bad entity number") end if`.
/// @param old Value used by `if old==void then old=baseline(state,newnum) end if`.
/// @param unchanged Value used by `if unchanged then value=entitystate.copy(old) else value=delta.readDeltaEntity(msg,old,newnum) end if`.
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

/// Reads the next entity from the prior snapshot, returning the merge sentinel pair [99999, void] at the end.
/// @param state Shared snapshot parse state passed to the helper calls in `nextOld`.
/// @param oldframe Record read through `oldframe.numEntities`, `oldframe.parseEntitiesNum`.
/// @param index Value tested by `oldframe==void or index>=oldframe.numEntities` before the calculation continues.
function nextOld(state,oldframe,index)
  if oldframe==void or index>=oldframe.numEntities then return [99999,void] end if
  value=parsedEntity(state,oldframe.parseEntitiesNum+index)
  return [value.number,value]
end function

// Merge the sorted wire entity stream with the prior snapshot's sorted ring slice.
/// @param state Record read through `state.parseEntitiesNum`.
/// @param msg Record read through `msg.readcount`, `msg.cursize`.
/// @param oldframe Value used by `pair=nextOld(state,oldframe,oldindex)`.
/// @param newframe Mutable snapshot parse record/storage; this routine assigns `newframe.parseEntitiesNum`, `newframe.numEntities`.
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
      trace(state,msg,"unchanged: "+str(oldnum))
      deltaEntity(state,msg,newframe,oldnum,oldstate,true)
      oldindex=oldindex+1;pair=nextOld(state,oldframe,oldindex);oldnum=pair[0];oldstate=pair[1]
    end while
    if oldnum==newnum then
      trace(state,msg,"delta: "+str(newnum))
      deltaEntity(state,msg,newframe,newnum,oldstate,false)
      oldindex=oldindex+1;pair=nextOld(state,oldframe,oldindex);oldnum=pair[0];oldstate=pair[1]
    else
      trace(state,msg,"baseline: "+str(newnum))
      deltaEntity(state,msg,newframe,newnum,baseline(state,newnum),false)
    end if
  end while
  while oldnum!=99999
    trace(state,msg,"unchanged: "+str(oldnum))
    deltaEntity(state,msg,newframe,oldnum,oldstate,true)
    oldindex=oldindex+1;pair=nextOld(state,oldframe,oldindex);oldnum=pair[0];oldstate=pair[1]
  end while
  return newframe.numEntities
end function
