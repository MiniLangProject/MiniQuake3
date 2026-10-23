// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// bot_entitystate_t -> aas_entityinfo_t state from be_aas_entity.c.
package mq3.botlib.aas_entities

import mq3.botlib.aas_runtime as aasRuntime
import mq3.compat.numeric as n

const SOLID_BSP=3
const SOLID_BBOX=2
const ET_MOVER=4
const ENTITYNUM_WORLD=1022
const PRESENCE_NORMAL=2

struct EntityState type flags origin angles oldOrigin mins maxs groundent solid modelindex modelindex2 frame event eventParm powerups weapon legsAnim torsoAnim end struct
struct EntityInfo valid type flags ltime updateTime number origin angles oldOrigin lastVisOrigin mins maxs groundent solid modelindex modelindex2 frame event eventParm powerups weapon legsAnim torsoAnim end struct
struct BspData origin angles absmins absmaxs solid modelnum end struct
struct State entities maxEntities time frames areaLinks runtime end struct

function vector(value) return [value[0],value[1],value[2]] end function
function zeros() return [0.0,0.0,0.0] end function
function emptyInfo() return EntityInfo(false,0,0,0.0,0.0,0,zeros(),zeros(),zeros(),zeros(),zeros(),zeros(),0,0,0,0,0,0,0,0,0,0,0) end function

function create(maxEntities)
  if maxEntities<=0 or maxEntities>65536 then return error(7530,"invalid AAS entity capacity") end if
  links=array(maxEntities,void);for index=0 to maxEntities-1 links[index]=[] end for
  return State(array(maxEntities,void),maxEntities,0.0,0,links,void)
end function

function bindRuntime(state,runtime) if state!=void then state.runtime=runtime end if;return state end function
function unlink(state,number) if state!=void and number>=0 and number<state.maxEntities then state.areaLinks[number]=[] end if;return void end function

function startFrame(state,time)
  if state==void or time<0.0 then return error(7530,"invalid AAS entity frame") end if
  state.time=time;state.frames=state.frames+1
  // AAS_StartFrame first unlinks records that were not refreshed during the
  // preceding frame, then invalidates every record for the new frame.
  for index=0 to len(state.entities)-1 if state.entities[index]!=void and not state.entities[index].valid then unlink(state,index) end if end for
  for index=0 to len(state.entities)-1 if state.entities[index]!=void then state.entities[index].valid=false end if end for
  return void
end function

function update(state,number,value,bspBounds)
  if state==void or number<0 or number>=state.maxEntities then return error(7530,"AAS entity number outside state") end if
  // Null updates unlink spatial records but retain the last info exactly as the
  // original does. The next StartFrame already cleared its valid flag.
  if value==void then unlink(state,number);return 0 end if
  previous=state.entities[number];oldLtime=0.0;lastVis=zeros();relink=state.frames==1 or previous==void
  if previous!=void then oldLtime=previous.ltime;lastVis=vector(previous.origin) end if
  mins=vector(value.mins);maxs=vector(value.maxs)
  if value.solid==SOLID_BSP and bspBounds!=void then mins=vector(bspBounds[0]);maxs=vector(bspBounds[1]) end if
  if previous!=void then
    if previous.origin!=value.origin then relink=true end if
    if value.solid==SOLID_BSP and previous.angles!=value.angles then relink=true end if
    if value.solid==SOLID_BBOX and (previous.mins!=mins or previous.maxs!=maxs) then relink=true end if
  end if
  info=EntityInfo(true,value.type,value.flags,state.time,state.time-oldLtime,number,vector(value.origin),vector(value.angles),vector(value.oldOrigin),lastVis,mins,maxs,value.groundent,value.solid,value.modelindex,value.modelindex2,value.frame,value.event,value.eventParm,value.powerups,value.weapon,value.legsAnim,value.torsoAnim)
  state.entities[number]=info
  if relink and number!=ENTITYNUM_WORLD and state.runtime!=void and state.runtime.initialized then
    absmins=[mins[0]+info.origin[0],mins[1]+info.origin[1],mins[2]+info.origin[2]];absmaxs=[maxs[0]+info.origin[0],maxs[1]+info.origin[1],maxs[2]+info.origin[2]]
    // AAS_LinkEntityClientBBox expands the solid by the largest client box.
    absmins=[absmins[0]-15.0,absmins[1]-15.0,absmins[2]-32.0];absmaxs=[absmaxs[0]+15.0,absmaxs[1]+15.0,absmaxs[2]+24.0]
    state.areaLinks[number]=aasRuntime.bboxAreas(state.runtime,absmins,absmaxs,128)
  end if
  return 0
end function

function info(state,number)
  if state==void or number<0 or number>=state.maxEntities then return emptyInfo() end if
  value=state.entities[number];if value==void then return emptyInfo() end if
  return value
end function

// Exact be_aas_entity.c ownership surface.  These functions deliberately use
// the productive State above, so QVM updates and native bot queries observe the
// same validity, history and area-link records.
function AAS_UpdateEntity(state,entnum,value,bspBounds) return update(state,entnum,value,bspBounds) end function
function AAS_EntityInfo(state,entnum) return info(state,entnum) end function
function AAS_EntityOrigin(state,entnum) return vector(info(state,entnum).origin) end function
function AAS_EntityModelindex(state,entnum) return info(state,entnum).modelindex end function
function AAS_EntityType(state,entnum) return info(state,entnum).type end function
function AAS_EntityModelNum(state,entnum) return info(state,entnum).modelindex end function
function AAS_OriginOfMoverWithModelNum(state,modelnum)
  if state==void then return [false,zeros()] end if
  for index=0 to state.maxEntities-1 value=state.entities[index];if value!=void and value.type==ET_MOVER and value.modelindex==modelnum then return [true,vector(value.origin)] end if end for
  return [false,zeros()]
end function
function AAS_EntitySize(state,entnum) value=info(state,entnum);return [vector(value.mins),vector(value.maxs)] end function
function AAS_EntityBSPData(state,entnum)
  value=info(state,entnum);return BspData(vector(value.origin),vector(value.angles),[value.origin[0]+value.mins[0],value.origin[1]+value.mins[1],value.origin[2]+value.mins[2]],[value.origin[0]+value.maxs[0],value.origin[1]+value.maxs[1],value.origin[2]+value.maxs[2]],value.solid,value.modelindex-1)
end function
function AAS_ResetEntityLinks(state) if state!=void then for index=0 to state.maxEntities-1 state.areaLinks[index]=[] end for end if;return void end function
function AAS_InvalidateEntities(state)
  if state!=void then for index=0 to state.maxEntities-1 if state.entities[index]==void then state.entities[index]=emptyInfo() end if;state.entities[index].valid=false;state.entities[index].number=index end for end if;return void
end function
function AAS_UnlinkInvalidEntities(state)
  if state!=void then for index=0 to state.maxEntities-1 value=state.entities[index];if value==void or not value.valid then unlink(state,index) end if end for end if;return void
end function
function AAS_NearestEntity(state,origin,modelindex)
  if state==void then return 0 end if;best=0;bestdist=99999.0
  for index=0 to state.maxEntities-1 value=state.entities[index];if value==void or value.modelindex!=modelindex then continue end if;dx=value.origin[0]-origin[0];dy=value.origin[1]-origin[1];dz=value.origin[2]-origin[2];if dx<40.0 and dx>-40.0 and dy<40.0 and dy>-40.0 then distance=n.fsqrt(dx*dx+dy*dy+dz*dz);if distance<bestdist then bestdist=distance;best=index end if end if end for
  return best
end function
function AAS_BestReachableEntityArea(state,entnum)
  if state==void or entnum<0 or entnum>=state.maxEntities then return 0 end if;fallback=0
  for each areaNum in state.areaLinks[entnum] if fallback==0 then fallback=areaNum end if;if state.runtime!=void and aasRuntime.areaReachability(state.runtime,areaNum)>0 then return areaNum end if end for;return fallback
end function
function AAS_NextEntity(state,entnum)
  if state==void or state.runtime==void or not state.runtime.initialized then return 0 end if;if entnum<0 then entnum=-1 end if;entnum=entnum+1;while entnum<state.maxEntities value=state.entities[entnum];if value!=void and value.valid then return entnum end if;entnum=entnum+1 end while;return 0
end function
