// SPDX-License-Identifier: GPL-2.0-or-later
// Deterministic local opponents for the standalone playable preview.
package mq3.client.playable_targets

import mq3.format.bsp as bsp
import mq3.compat.textnumbers as textnumbers
import mq3.compat.transcendental as trans
import mq3.shared.math as qmath
import std.string as strings

const DEFAULT_HEALTH=100
const DEFAULT_DAMAGE=34
const DEFAULT_RADIUS=15.0
const DEFAULT_MIN_Z=-24.0
const DEFAULT_MAX_Z=32.0
const DEFAULT_RESPAWN_MILLISECONDS=3000
const DEFAULT_PATROL_RADIUS=24.0

/// Stores playable targets target record, including `origin`, `health`, `maxHealth`, `alive`, `respawnAt`, `score` and additional values.
struct Target origin health maxHealth alive respawnAt score spawnOrigin spawnIndex end struct
/// Stores playable targets state, including `targets`, `score`, `lastTime`, `respawnMilliseconds`, `radius`, `minZ` and additional values.
struct State targets score lastTime respawnMilliseconds radius minZ maxZ end struct
/// Stores playable targets hit record, including `targetIndex`, `damage`, `killed`, `point`, `distance`, `awardedScore`.
struct Hit targetIndex damage killed point distance awardedScore end struct

/// Creates the playable targets error `7520` with diagnostic text `"preview targets: "+message`.
/// @param message Argument 2 of `error`; passed as `"preview targets: "+message`.
function fail(message) return error(7520,"preview targets: "+message) end function

/// Calls `std.string.toLowerAscii` from playable targets `field`. The final path returns `""`.
/// @param fields Value used by `for each pair in fields`.
/// @param key Key or control identifier used to select the corresponding playable targets entry.
function field(fields,key)
  wanted=strings.toLowerAscii(key)
  for each pair in fields
    if len(pair)>=2 and strings.toLowerAscii(pair[0])==wanted then return pair[1] end if
  end for
  return ""
end function

/// Calls `std.string.toLowerAscii`, `mq3.client.playable_targets.field`, `mq3.compat.textnumbers.vector` and additional helpers from playable targets `fromEntities`. The final path returns `State(targets,0,0,DEFAULT_RESPAWN_MILLISECONDS,DEFAULT_RADIUS,DEFAULT_MIN_Z,DEFAULT_MAX_Z)`.
/// @param entities Value used by `if entities==void or playerSpawnIndex< -1 then return fail("entities and a valid player spawn index are required") end if`.
/// @param playerSpawnIndex Value used by `if entities==void or playerSpawnIndex< -1 then return fail("entities and a valid player spawn index are required") end if`.
function fromEntities(entities,playerSpawnIndex)
  if entities==void or playerSpawnIndex< -1 then return fail("entities and a valid player spawn index are required") end if
  targets=[];spawnIndex=0
  for each entity in entities
    if strings.toLowerAscii(field(entity,"classname"))=="info_player_deathmatch" then
      if spawnIndex!=playerSpawnIndex then
        parsed=textnumbers.vector(field(entity,"origin"),[0.0,0.0,0.0])
        if parsed[0]==3 then
          origin=[parsed[1][0],parsed[1][1],parsed[1][2]]
          targets=targets+[Target(origin,DEFAULT_HEALTH,DEFAULT_HEALTH,true,0,1,[origin[0],origin[1],origin[2]],spawnIndex)]
        end if
      end if
      spawnIndex=spawnIndex+1
    end if
  end for
  return State(targets,0,0,DEFAULT_RESPAWN_MILLISECONDS,DEFAULT_RADIUS,DEFAULT_MIN_Z,DEFAULT_MAX_Z)
end function

/// Calls `mq3.format.bsp.entities`, `mq3.client.playable_targets.fromEntities` from playable targets `load`. The final path returns `fromEntities(entities,playerSpawnIndex)`.
/// @param map map record passed to the playable targets helper calls.
/// @param playerSpawnIndex Value used by `return fromEntities(entities,playerSpawnIndex)`.
function load(map,playerSpawnIndex)
  entities=bsp.entities(map);if entities is error then return entities end if
  return fromEntities(entities,playerSpawnIndex)
end function

/// Evaluates playable targets `activeCount` and returns `0`, `count` according to its guard/selection conditions.
/// @param state Record read through `state.targets`.
function activeCount(state)
  if state==void then return 0 end if
  count=0;for each target in state.targets if target.alive then count=count+1 end if end for
  return count
end function

// Returns the normalized entry fraction for a segment/AABB hit, or -1 on miss.
/// @param startPoint Starting world-space point of the segment or trace.
/// @param endPoint Ending world-space point of the segment or trace.
/// @param target Record read through `target.origin`.
/// @param radius Radius used by the spatial or visual calculation.
/// @param minZ Value used by `if axis==2 then low=target.origin[2]+minZ`.
/// @param maxZ Value used by `high=target.origin[2]+maxZ end if`.
function segmentFraction(startPoint,endPoint,target,radius,minZ,maxZ)
  tMinimum=0.0;tMaximum=1.0
  for axis=0 to 2
    low=target.origin[axis]-radius;high=target.origin[axis]+radius
    if axis==2 then low=target.origin[2]+minZ;high=target.origin[2]+maxZ end if
    delta=endPoint[axis]-startPoint[axis]
    absolute=delta;if absolute<0.0 then absolute=0.0-absolute end if
    if absolute<0.000001 then
      if startPoint[axis]<low or startPoint[axis]>high then return -1.0 end if
    else
      first=(low-startPoint[axis])/delta;last=(high-startPoint[axis])/delta
      if first>last then swap=first;first=last;last=swap end if
      if first>tMinimum then tMinimum=first end if
      if last<tMaximum then tMaximum=last end if
      if tMinimum>tMaximum then return -1.0 end if
    end if
  end for
  if tMaximum<0.0 or tMinimum>1.0 then return -1.0 end if
  if tMinimum<0.0 then return 0.0 end if
  return tMinimum
end function

// The Shot endpoint already contains the BSP world hit, so targets behind a wall
// cannot win this nearest-segment test.
/// @param state Mutable playable targets record/storage; this routine assigns `state.score`.
/// @param shot Record read through `shot.start`, `shot.endPoint`.
/// @param damage Value used by `if damage<=0 or now<0 then return fail("positive damage and non-negative time are required") end if`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function applyShot(state,shot,damage,now)
  if state==void or shot==void then return fail("state and shot are required") end if
  if damage<=0 or now<0 then return fail("positive damage and non-negative time are required") end if
  if len(shot.start)!=3 or len(shot.endPoint)!=3 then return fail("shot endpoints need three axes") end if
  best=-1;bestFraction=2.0
  for index=0 to len(state.targets)-1
    target=state.targets[index]
    if target.alive then
      fraction=segmentFraction(shot.start,shot.endPoint,target,state.radius,state.minZ,state.maxZ)
      if fraction>=0.0 and fraction<bestFraction then best=index;bestFraction=fraction end if
    end if
  end for
  if best<0 then return void end if
  target=state.targets[best]
  applied=damage;if applied>target.health then applied=target.health end if
  target.health=target.health-applied;killed=false;awarded=0
  if target.health<=0 then
    target.health=0;target.alive=false;target.respawnAt=now+state.respawnMilliseconds
    killed=true;awarded=target.score;state.score=state.score+awarded
  end if
  delta=[shot.endPoint[0]-shot.start[0],shot.endPoint[1]-shot.start[1],shot.endPoint[2]-shot.start[2]]
  point=[shot.start[0]+delta[0]*bestFraction,shot.start[1]+delta[1]*bestFraction,shot.start[2]+delta[2]*bestFraction]
  return Hit(best,applied,killed,point,qmath.VectorLength(delta)*bestFraction,awarded)
end function

/// Adapts `mq3.client.playable_targets.applyShot` to playable targets `applyDefaultShot`, returning its result for `state, shot, DEFAULT_DAMAGE, now`.
/// @param state Argument 1 of `mq3.client.playable_targets.applyShot`.
/// @param shot Argument 2 of `mq3.client.playable_targets.applyShot`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_targets.applyShot`.
function applyDefaultShot(state,shot,now)
  return applyShot(state,shot,DEFAULT_DAMAGE,now)
end function

// Absolute-time motion makes previews and contract captures reproducible.
/// @param state Mutable playable targets record/storage; this routine assigns `state.lastTime`.
/// @param now Current time used by this operation; it shares the clock domain of the compared timestamps.
function update(state,now)
  if state==void or now<0 then return fail("state and non-negative time are required") end if
  state.lastTime=now
  for each target in state.targets
    if not target.alive and now>=target.respawnAt then
      target.alive=true;target.health=target.maxHealth;target.respawnAt=0
    end if
    if target.alive then
      phase=(now*0.001)+(target.spawnIndex*1.61803398875)
      target.origin[0]=target.spawnOrigin[0]+trans.cos(phase)*DEFAULT_PATROL_RADIUS
      target.origin[1]=target.spawnOrigin[1]+trans.sin(phase)*DEFAULT_PATROL_RADIUS
      target.origin[2]=target.spawnOrigin[2]
    end if
  end for
  return activeCount(state)
end function
