// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// bot_entitystate_t -> aas_entityinfo_t state from be_aas_entity.c.
package mq3.botlib.aas_entities

import mq3.botlib.aas_runtime as aasRuntime
import mq3.compat.numeric as n

/// Entity collision-kind identifier for a brush-model collision hull.
const SOLID_BSP=3
/// Entity collision-kind identifier for bounding-box geometry.
const SOLID_BBOX=2
/// Network entity-type identifier for a moving brush model.
const ET_MOVER=4
/// Reserved entity number identifying world geometry.
const ENTITYNUM_WORLD=1022
/// AAS presence-mask value selecting normal.
const PRESENCE_NORMAL=2

/// `EntityState` record for aas entities, containing `type`, `flags`, `origin`, `angles` and `oldOrigin` and related fields.
struct EntityState
  /// Network entity-type identifier reported to the navigation system.
  type
  /// Network entity flags reported to the navigation system.
  flags
  /// World-space entity position received from the game for the next AAS update.
  origin
  /// Pitch, yaw, and roll values carried by the entity or user command.
  angles
  /// Entity origin retained from the previous update.
  oldOrigin
  /// Minimum XYZ corner of the incoming game entity collision box relative to its origin.
  mins
  /// Maximum XYZ corner of the incoming game entity collision box relative to its origin.
  maxs
  /// Entity number of the ground supporting this entity.
  groundent
  /// Encoded collision-hull or solidity value associated with the entity.
  solid
  /// Model index used to associate this entity or item with registered model data.
  modelindex
  /// Secondary game model index, commonly used for carried weapons or flags.
  modelindex2
  /// Current animation-frame number reported by the entity.
  frame
  /// Transient entity event identifier, such as a footstep or muzzle flash.
  event
  /// Parameter value associated with the current network entity event.
  eventParm
  /// Bit mask of powerup effects currently associated with the entity.
  powerups
  /// Weapon identifier selected by the bot or user command.
  weapon
  /// Leg animation identifier, including the animation-toggle bit.
  legsAnim
  /// Torso animation identifier, including the animation-toggle bit.
  torsoAnim
end struct
/// `EntityInfo` record for aas entities, containing `valid`, `type`, `flags`, `ltime` and `updateTime` and related fields.
struct EntityInfo
  /// True when the represented entry contains usable data.
  valid
  /// Network entity-type identifier retained by the navigation system.
  type
  /// Network entity flags retained by the navigation system.
  flags
  /// Timestamp of the previous entity-information update.
  ltime
  /// Time between last and current update.
  updateTime
  /// Game-entity number identifying this navigation entity record.
  number
  /// Most recently cached world-space position of this AAS-tracked game entity.
  origin
  /// Pitch, yaw, and roll values carried by the entity or user command.
  angles
  /// Entity origin retained from the previous update.
  oldOrigin
  /// Most recent recorded position at which this entity was visible.
  lastVisOrigin
  /// Minimum XYZ corner of the cached AAS entity collision box relative to its origin.
  mins
  /// Maximum XYZ corner of the cached AAS entity collision box relative to its origin.
  maxs
  /// Entity number of the ground supporting this entity.
  groundent
  /// Encoded collision-hull or solidity value associated with the entity.
  solid
  /// Model index used to associate this entity or item with registered model data.
  modelindex
  /// Secondary game model index, commonly used for carried weapons or flags.
  modelindex2
  /// Current animation-frame number retained for the entity.
  frame
  /// Transient entity event identifier, such as a footstep or muzzle flash.
  event
  /// Parameter value associated with the current network entity event.
  eventParm
  /// Bit mask of powerup effects currently associated with the entity.
  powerups
  /// Weapon identifier selected by the bot or user command.
  weapon
  /// Leg animation identifier, including the animation-toggle bit.
  legsAnim
  /// Torso animation identifier, including the animation-toggle bit.
  torsoAnim
end struct
/// `BspData` record for aas entities, containing `origin`, `angles`, `absmins`, `absmaxs` and `solid` and related fields.
struct BspData
  /// Origin parsed from the map entity key/value data.
  origin
  /// Pitch, yaw, and roll values carried by the entity or user command.
  angles
  /// Minimum corner of the model's world-space collision bounds.
  absmins
  /// Maximum corner of the model's world-space collision bounds.
  absmaxs
  /// Encoded collision-hull or solidity value associated with the entity.
  solid
  /// Brush-model number associated with the mover or collision entity.
  modelnum
end struct
/// `State` record for aas entities, containing `entities`, `maxEntities`, `time`, `frames` and `areaLinks` and related fields.
struct State
  /// Game or BSP entity records tracked by this subsystem.
  entities
  /// Maximum number of entities.
  maxEntities
  /// Current navigation time used to timestamp entity updates.
  time
  /// Number of AAS entity-update frames processed by this state.
  frames
  /// AAS area-link information associated with the tracked entities.
  areaLinks
  /// AAS map runtime used to relink updated game entities to navigation areas.
  runtime
end struct

/// Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for aas entities.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function vector(value) return [value[0],value[1],value[2]] end function
/// Return a new array `[0.0,0.0,0.0]` for `zeros`.
function zeros() return [0.0,0.0,0.0] end function
/// Create a `mq3.botlib.aas_entities.EntityInfo` record, initializing `origin` as `zeros()`, `angles` as `zeros()` and `oldOrigin` as `zeros()`.
function emptyInfo() return EntityInfo(false,0,0,0.0,0.0,0,zeros(),zeros(),zeros(),zeros(),zeros(),zeros(),0,0,0,0,0,0,0,0,0,0,0) end function

/// Build the `mq3.botlib.aas_entities.State` result for `create`. Return paths include `State(array(maxEntities,void),maxEntities,0.0,0,links,void)`.
/// @param maxEntities Initial value stored in `mq3.botlib.aas_entities.State.maxEntities`.
function create(maxEntities)
  if maxEntities<=0 or maxEntities>65536 then return error(7530,"invalid AAS entity capacity") end if
  links=array(maxEntities,void);for index=0 to maxEntities-1 links[index]=[] end for
  return State(array(maxEntities,void),maxEntities,0.0,0,links,void)
end function

/// Set `state.runtime` to `runtime` in `mq3.botlib.aas_entities.bindRuntime`. Return paths include `state`.
/// @param state AAS entities state; accesses `runtime`. May update `state.runtime` in place.
/// @param runtime Value used by `bindRuntime` in `if state!=void then state.runtime=runtime end if`.
function bindRuntime(state,runtime) if state!=void then state.runtime=runtime end if;return state end function
/// Set `state.areaLinks[number]` to `[]` in `mq3.botlib.aas_entities.unlink`.
/// @param state AAS entities state; accesses `maxEntities` and `areaLinks`. May update `state.areaLinks[number]` in place.
/// @param number Value used by `unlink` in `if state!=void and number>=0 and number<state.maxEntities and len(state.areaLinks[number])>0 then state.areaLink...`.
function unlink(state,number) if state!=void and number>=0 and number<state.maxEntities and len(state.areaLinks[number])>0 then state.areaLinks[number]=[] end if;return void end function

/// Update `state.time`, `state.frames` and `state.entities[index].valid` during `startFrame`.
/// @param state AAS entities state; accesses `time`, `frames` and `entities`. May update `state.time`, `state.frames` and `state.entities[index].valid` in place.
/// @param time Time value in the units expected by this module.
function startFrame(state,time)
  if state==void or time<0.0 then return error(7530,"invalid AAS entity frame") end if
  state.time=time;state.frames=state.frames+1
  // AAS_StartFrame first unlinks records that were not refreshed during the
  // preceding frame, then invalidates every record for the new frame.
  for index=0 to len(state.entities)-1 if state.entities[index]!=void and not state.entities[index].valid then unlink(state,index) end if end for
  for index=0 to len(state.entities)-1 if state.entities[index]!=void then state.entities[index].valid=false end if end for
  return void
end function

/// Set `state.entities[number]` to `info` and `state.areaLinks[number]` to `aasRuntime.bboxAreas(state.runtime,absmins,absmaxs,128)` in `mq3.botlib.aas_entities.update`.
/// @param state AAS entities state; accesses `maxEntities`, `entities`, `frames`, `time` and `runtime` and related fields. May update `state.entities[number]` and `state.areaLinks[number]` in place.
/// @param number Value used by `unlink` in `if state!=void and number>=0 and number<state.maxEntities and len(state.areaLinks[number])>0 then state.areaLink...`.
/// @param value Value record; accesses `mins`, `maxs`, `solid`, `origin` and `angles` and related fields.
/// @param bspBounds Array or byte sequence accessed at `0` and `1`.
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

/// Apply `mq3.botlib.aas_entities.emptyInfo` while evaluating `info`.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
/// @param number Value used by `info` in `if state==void or number<0 or number>=state.maxEntities then return emptyInfo() end if`.
function info(state,number)
  if state==void or number<0 or number>=state.maxEntities then return emptyInfo() end if
  value=state.entities[number];if value==void then return emptyInfo() end if
  return value
end function

// Exact be_aas_entity.c ownership surface.  These functions deliberately use
// the productive State above, so QVM updates and native bot queries observe the
// same validity, history and area-link records.
/// @param state AAS entities state; accesses `maxEntities`, `entities`, `frames`, `time` and `runtime` and related fields. May update `state.entities[number]` and `state.areaLinks[number]` in place.
/// @param entnum Entity number in the game or AAS entity table.
/// @param value Value record; accesses `mins`, `maxs`, `solid`, `origin` and `angles` and related fields.
/// @param bspBounds Array or byte sequence accessed at `0` and `1`.
function AAS_UpdateEntity(state,entnum,value,bspBounds) return update(state,entnum,value,bspBounds) end function
/// Forward `AAS_EntityInfo` to `mq3.botlib.aas_entities.info` and return the delegated result.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
/// @param entnum Entity number in the game or AAS entity table.
function AAS_EntityInfo(state,entnum) return info(state,entnum) end function
/// Forward `AAS_EntityOrigin` to `mq3.botlib.aas_entities.vector` and return the delegated result.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
/// @param entnum Entity number in the game or AAS entity table.
function AAS_EntityOrigin(state,entnum) return vector(info(state,entnum).origin) end function
/// Return `info(state,entnum).modelindex` for `AAS_EntityModelindex`.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
/// @param entnum Entity number in the game or AAS entity table.
function AAS_EntityModelindex(state,entnum) return info(state,entnum).modelindex end function
/// Return `info(state,entnum).type` for `AAS_EntityType`.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
/// @param entnum Entity number in the game or AAS entity table.
function AAS_EntityType(state,entnum) return info(state,entnum).type end function
/// Return `info(state,entnum).modelindex` for `AAS_EntityModelNum`.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
/// @param entnum Entity number in the game or AAS entity table.
function AAS_EntityModelNum(state,entnum) return info(state,entnum).modelindex end function
/// Apply `mq3.botlib.aas_entities.zeros` and `mq3.botlib.aas_entities.vector` while evaluating `AAS_OriginOfMoverWithModelNum`. Return paths include `[false,zeros()]`.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
/// @param modelnum Value used by `AAS_OriginOfMoverWithModelNum` in `if value!=void and value.type==ET_MOVER and value.modelindex==modelnum then return [true,vector(value.origin)] e...`.
function AAS_OriginOfMoverWithModelNum(state,modelnum)
  if state==void then return [false,zeros()] end if
  for index=0 to state.maxEntities-1 value=state.entities[index];if value!=void and value.type==ET_MOVER and value.modelindex==modelnum then return [true,vector(value.origin)] end if end for
  return [false,zeros()]
end function
/// Apply `mq3.botlib.aas_entities.info` and `mq3.botlib.aas_entities.vector` while evaluating `AAS_EntitySize`. Return paths include `[vector(value.mins),vector(value.maxs)]`.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
/// @param entnum Entity number in the game or AAS entity table.
function AAS_EntitySize(state,entnum) value=info(state,entnum);return [vector(value.mins),vector(value.maxs)] end function
/// Build the `mq3.botlib.aas_entities.BspData` result for `AAS_EntityBSPData`.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
/// @param entnum Entity number in the game or AAS entity table.
function AAS_EntityBSPData(state,entnum)
  value=info(state,entnum);return BspData(vector(value.origin),vector(value.angles),[value.origin[0]+value.mins[0],value.origin[1]+value.mins[1],value.origin[2]+value.mins[2]],[value.origin[0]+value.maxs[0],value.origin[1]+value.maxs[1],value.origin[2]+value.maxs[2]],value.solid,value.modelindex-1)
end function
/// Set `state.areaLinks[index]` to `[]` in `mq3.botlib.aas_entities.AAS_ResetEntityLinks`.
/// @param state AAS entities state; accesses `maxEntities` and `areaLinks`. May update `state.areaLinks[index]` in place.
function AAS_ResetEntityLinks(state) if state!=void then for index=0 to state.maxEntities-1 state.areaLinks[index]=[] end for end if;return void end function
/// Update `state.entities[index]`, `state.entities[index].valid` and `state.entities[index].number` during `AAS_InvalidateEntities`.
/// @param state AAS entities state; accesses `maxEntities` and `entities`. May update `state.entities[index]`, `state.entities[index].valid` and `state.entities[index].number` in place.
function AAS_InvalidateEntities(state)
  if state!=void then for index=0 to state.maxEntities-1 if state.entities[index]==void then state.entities[index]=emptyInfo() end if;state.entities[index].valid=false;state.entities[index].number=index end for end if;return void
end function
/// Apply `mq3.botlib.aas_entities.unlink` while evaluating `AAS_UnlinkInvalidEntities`.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
function AAS_UnlinkInvalidEntities(state)
  if state!=void then for index=0 to state.maxEntities-1 value=state.entities[index];if value==void or not value.valid then unlink(state,index) end if end for end if;return void
end function
/// Find the nearest entity with the requested model index inside the original forty-unit horizontal search window.
/// @param state AAS entities state; accesses `maxEntities` and `entities`.
/// @param origin World-space position as three coordinates.
/// @param modelindex Value used by `AAS_NearestEntity` in `if value==void or value.modelindex!=modelindex then continue end if`.
function AAS_NearestEntity(state,origin,modelindex)
  if state==void then return 0 end if;best=0;bestdist=99999.0
  for index=0 to state.maxEntities-1 value=state.entities[index];if value==void or value.modelindex!=modelindex then continue end if;dx=value.origin[0]-origin[0];dy=value.origin[1]-origin[1];dz=value.origin[2]-origin[2];if dx<40.0 and dx>-40.0 and dy<40.0 and dy>-40.0 then distance=n.fsqrt(dx*dx+dy*dy+dz*dz);if distance<bestdist then bestdist=distance;best=index end if end if end for
  return best
end function
/// Apply `mq3.botlib.aas_runtime.areaReachability` while evaluating `AAS_BestReachableEntityArea`. Return paths include `fallback`.
/// @param state AAS entities state; accesses `maxEntities`, `areaLinks` and `runtime`.
/// @param entnum Entity number in the game or AAS entity table.
function AAS_BestReachableEntityArea(state,entnum)
  if state==void or entnum<0 or entnum>=state.maxEntities then return 0 end if;fallback=0
  for each areaNum in state.areaLinks[entnum] if fallback==0 then fallback=areaNum end if;if state.runtime!=void and aasRuntime.areaReachability(state.runtime,areaNum)>0 then return areaNum end if end for;return fallback
end function
/// Scan forward to the next valid entity in an initialized AAS runtime, returning zero when none remains.
/// @param state AAS entities state; accesses `runtime`, `maxEntities` and `entities`.
/// @param entnum Entity number in the game or AAS entity table.
function AAS_NextEntity(state,entnum)
  if state==void or state.runtime==void or not state.runtime.initialized then return 0 end if;if entnum<0 then entnum=-1 end if;entnum=entnum+1;while entnum<state.maxEntities value=state.entities[entnum];if value!=void and value.valid then return entnum end if;entnum=entnum+1 end while;return 0
end function
