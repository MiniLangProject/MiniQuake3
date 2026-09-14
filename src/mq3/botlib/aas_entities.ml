// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// bot_entitystate_t -> aas_entityinfo_t state from be_aas_entity.c.
package mq3.botlib.aas_entities

const SOLID_BSP=3

struct EntityState type flags origin angles oldOrigin mins maxs groundent solid modelindex modelindex2 frame event eventParm powerups weapon legsAnim torsoAnim end struct
struct EntityInfo valid type flags ltime updateTime number origin angles oldOrigin lastVisOrigin mins maxs groundent solid modelindex modelindex2 frame event eventParm powerups weapon legsAnim torsoAnim end struct
struct State entities maxEntities time frames end struct

function vector(value) return [value[0],value[1],value[2]] end function
function zeros() return [0.0,0.0,0.0] end function
function emptyInfo() return EntityInfo(false,0,0,0.0,0.0,0,zeros(),zeros(),zeros(),zeros(),zeros(),zeros(),0,0,0,0,0,0,0,0,0,0,0) end function

function create(maxEntities)
  if maxEntities<=0 or maxEntities>65536 then return error(7530,"invalid AAS entity capacity") end if
  return State(array(maxEntities,void),maxEntities,0.0,0)
end function

function startFrame(state,time)
  if state==void or time<0.0 then return error(7530,"invalid AAS entity frame") end if
  state.time=time;state.frames=state.frames+1
  for index=0 to len(state.entities)-1 if state.entities[index]!=void then state.entities[index].valid=false end if end for
  return void
end function

function update(state,number,value,bspBounds)
  if state==void or number<0 or number>=state.maxEntities then return error(7530,"AAS entity number outside state") end if
  // Null updates unlink spatial records but retain the last info exactly as the
  // original does. The next StartFrame already cleared its valid flag.
  if value==void then return 0 end if
  previous=state.entities[number];oldLtime=0.0;lastVis=zeros()
  if previous!=void then oldLtime=previous.ltime;lastVis=vector(previous.origin) end if
  mins=vector(value.mins);maxs=vector(value.maxs)
  if value.solid==SOLID_BSP and bspBounds!=void then mins=vector(bspBounds[0]);maxs=vector(bspBounds[1]) end if
  info=EntityInfo(true,value.type,value.flags,state.time,state.time-oldLtime,number,vector(value.origin),vector(value.angles),vector(value.oldOrigin),lastVis,mins,maxs,value.groundent,value.solid,value.modelindex,value.modelindex2,value.frame,value.event,value.eventParm,value.powerups,value.weapon,value.legsAnim,value.torsoAnim)
  state.entities[number]=info;return 0
end function

function info(state,number)
  if state==void or number<0 or number>=state.maxEntities then return emptyInfo() end if
  value=state.entities[number];if value==void then return emptyInfo() end if
  return value
end function
