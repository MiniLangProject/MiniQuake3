// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete typed facade for code/game/g_utils.c.  The original C globals are
// represented by the live Level/Spawner objects used by the productive game.
package mq3.game.g_utils
import mq3.game.entities as game
import mq3.game.spawn_values as values
import mq3.game.targets as targets
import mq3.game.events as events
import mq3.game.teleport as teleport
import mq3.game.constants as c
import mq3.game.movement as movement
import mq3.shared.directions as directions
import mq3.shared.math as q
import mq3.compat.numeric as n

/// Maximum number of candidate choices collected before a random selection.
const MAXCHOICES = 32

/// Read a native string through its first zero byte and reject non-string values while preserving void.
/// @param text Text to parse, format or deliver.
function nativeText(text)
  if text == void then return void end if
  if typeof(text) != "string" then return error(477,"G_Find requires a native string field") end if
  data = bytes(text); length = 0
  while length < len(data) and data[length] != 0
    length = length+1
  end while
  return decode(slice(data,0,length))
end function

/// Apply `mq3.game.g_utils.nativeText` while evaluating `namesEqual`.
/// @param first Text to parse, format or deliver.
/// @param second Text to parse, format or deliver.
function namesEqual(first,second)
  first = nativeText(first); second = nativeText(second)
  if first == void or second == void then return false end if
  left = bytes(first); right = bytes(second); index = 0
  while index < 99999
    a = 0; b = 0
    if index < len(left) then a = left[index] end if
    if index < len(right) then b = right[index] end if
    if a >= 97 and a <= 122 then a = a-32 end if
    if b >= 97 and b <= 122 then b = b-32 end if
    if a != b then return false end if
    if a == 0 then return true end if
    index = index+1
  end while
  return true
end function

/// Select a supported string field from a typed game entity and reject unsupported field names.
/// @param ent Game entity; accesses `classname`, `target`, `targetname`, `model` and `model2` and related fields.
/// @param field Value used by `stringField` in `switch field`.
function stringField(ent,field)
  switch field
    case "classname" return ent.classname end case
    case "target" return ent.target end case
    case "targetname" return ent.targetname end case
    case "model" return ent.model end case
    case "model2" return ent.model2 end case
    case "message" return ent.message end case
    case "team" return ent.team end case
    case "targetShaderName" return ent.targetShaderName end case
    case "targetShaderNewName" return ent.targetShaderNewName end case
    case default return error(477,"Unsupported typed G_Find field") end case
  end switch
end function

/// Forward `AddRemap` to `mq3.game.targets.addRemap` and return the delegated result.
/// @param level Game-level state; accesses `shaderRemaps`. May update `level.shaderRemaps` in place.
/// @param oldShader Value passed as argument 1 to `std.string.equalsIgnoreCaseAscii`.
/// @param newShader Value passed as argument 1 to `bytes`.
/// @param timeOffset Time value in the units expected by this module.
function AddRemap(level,oldShader,newShader,timeOffset)
  return targets.addRemap(level,oldShader,newShader,timeOffset)
end function

/// Forward `BuildShaderStateConfig` to `mq3.game.targets.shaderState` and return the delegated result.
/// @param level Game-level state; accesses `shaderRemaps`.
function BuildShaderStateConfig(level)
  return targets.shaderState(level)
end function

/// Forward `G_FindConfigstringIndex` to `mq3.game.spawn_values.configIndex` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param name Name used to identify the requested entry.
/// @param start Value used by `configIndex` in `if start < 0 or capacity < 1 or start+capacity > 1024 then return error(485,"Invalid configstring range") end if`.
/// @param max Maximum number of entries to allocate or retain.
/// @param create Value used by `configIndex` in `if not create then return 0 end if`.
function G_FindConfigstringIndex(level,name,start,max,create)
  return values.configIndex(level.spawner,name,start,max,create)
end function

/// Forward `G_ModelIndex` to `mq3.game.spawn_values.modelIndex` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param name Name used to identify the requested entry.
function G_ModelIndex(level,name)
  return values.modelIndex(level.spawner,name)
end function

/// Forward `G_SoundIndex` to `mq3.game.spawn_values.soundIndex` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param name Name used to identify the requested entry.
function G_SoundIndex(level,name)
  return values.soundIndex(level.spawner,name)
end function

/// Use `level.serverCommandFn` to perform `G_TeamCommand`.
/// @param level Game-level state; accesses `maxclients`, `clients` and `serverCommandFn`.
/// @param team Team identifier used by the game rules.
/// @param cmd Text to parse, format or deliver.
function G_TeamCommand(level,team,cmd)
  message = void; formatted = false; slot = 0
  while true
    if typeof(level.maxclients) != "int" or level.maxclients < 0 or level.maxclients > 64 then return error(477,"G_TeamCommand exceeds native client storage") end if
    if slot >= level.maxclients then break end if
    client = level.clients[slot]
    if client.connected == 2 and client.team == team then
      if not formatted then
        message = nativeText(cmd)
        if message == void then message = "(null)" end if
        formatted = true
      end if
      if level.serverCommandFn == void then return error(477,"G_TeamCommand requires a server-command sink") end if
      level.serverCommandFn(level,slot,message)
    end if
    slot = slot+1
  end while
  return void
end function

/// Apply `mq3.game.g_utils.namesEqual` and `mq3.game.g_utils.stringField` while evaluating `G_Find`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param cursor Cursor record; accesses `slot`.
/// @param field Value used by `stringField` in `switch field`.
/// @param match Text to parse, format or deliver.
function G_Find(level,cursor,field,match)
  index = 0
  if cursor != void then
    if cursor.slot < 0 or cursor.slot >= level.num_entities or level.entities[cursor.slot] != cursor then return error(477,"G_Find start is outside the native entity array") end if
    index = cursor.slot+1
  end if
  while index < level.num_entities
    ent = level.entities[index]; index = index+1
    if ent.inuse and namesEqual(stringField(ent,field),match) then return ent end if
  end while
  return void
end function

/// Forward `G_PickTarget` to `mq3.game.entities.pickTarget` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`.
/// @param targetname Name used to identify the requested entry.
function G_PickTarget(level,targetname)
  return game.pickTarget(level,targetname)
end function

/// Forward `G_UseTargets` to `mq3.game.targets.useTargets` and return the delegated result.
/// @param level Game-level state; accesses `time`, `spawner`, `num_entities` and `entities`.
/// @param ent Game entity; accesses `targetShaderName`, `targetShaderNewName`, `target` and `inuse`.
/// @param activator Entity responsible for activating the target.
function G_UseTargets(level,ent,activator)
  return targets.useTargets(level,ent,activator)
end function

/// Return a new array `[n.f32(x),n.f32(y),n.f32(z)]` for `tv`.
/// @param x Value passed as argument 1 to `mq3.compat.numeric.f32`.
/// @param y Value passed as argument 1 to `mq3.compat.numeric.f32`.
/// @param z Value passed as argument 1 to `mq3.compat.numeric.f32`.
function tv(x,y,z)
  // MiniLang arrays are owned values, so the native eight-slot scratch-ring
  // lifetime is unnecessary while the visible values remain identical.
  return [n.f32(x),n.f32(y),n.f32(z)]
end function

/// Forward `vtos` to `mq3.game.entities.vtos` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param vector Three-component array; components 0, 1 and 2 are used in their stored order.
function vtos(level,vector)
  return game.vtos(level,vector)
end function

/// Set `movedir[axis]` to `result[axis]` and `angles[axis]` to `0.0` in `mq3.game.g_utils.G_SetMovedir`.
/// @param angles Pitch, yaw and roll angles in degrees. Entries may be updated in place.
/// @param movedir Array or byte sequence accessed at `axis`. Entries are written in place.
function G_SetMovedir(angles,movedir)
  result = directions.movedirVector(angles)
  for axis = 0 to 2
    movedir[axis] = result[axis]; angles[axis] = 0.0
  end for
  return void
end function

/// Convert the horizontal vector direction to yaw in the nonnegative degree range.
/// @param vector Array or byte sequence accessed at `1` and `0`.
function vectoyaw(vector)
  yaw = 0.0
  if vector[1] != 0 or vector[0] != 0 then
    if vector[0] != 0 then yaw = q.atanDegrees(vector[1],vector[0])
    else if vector[1] > 0 then yaw = 90.0 else yaw = 270.0 end if
    if yaw < 0 then yaw = n.fadd(yaw,360.0) end if
  end if
  return yaw
end function

/// Forward `G_InitGentity` to `mq3.game.entities.initEntity` and return the delegated result.
/// @param ent Game entity; accesses `inuse`, `classname`, `s`, `slot` and `r`. May update `ent.inuse`, `ent.classname` and `ent.s.number` and additional fields in place.
function G_InitGentity(ent)
  return game.initEntity(ent)
end function

/// Forward `G_Spawn` to `mq3.game.entities.spawn` and return the delegated result.
/// @param level Game-level state; accesses `num_entities`, `entities`, `startTime` and `time`. May update `level.num_entities` in place.
function G_Spawn(level)
  return game.spawn(level)
end function

/// Forward `G_EntitiesFree` to `mq3.game.entities.entitiesFree` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
function G_EntitiesFree(level)
  return game.entitiesFree(level)
end function

/// Forward `G_FreeEntity` to `mq3.game.entities.free` and return the delegated result.
/// @param level Game-level state; accesses `scene` and `time`. May update `level.scene.entities[ent.slot]` in place.
/// @param ent Game entity; accesses `neverFree`, `r`, `slot`, `s` and `client` and related fields. May update `ent.r`, `ent.s` and `ent.client` and additional fields in place.
function G_FreeEntity(level,ent)
  return game.free(level,ent)
end function

/// Forward `G_TempEntity` to `mq3.game.entities.tempEntity` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param origin World-space position as three coordinates.
/// @param event Player or entity event identifier.
function G_TempEntity(level,origin,event)
  return game.tempEntity(level,origin,event)
end function

/// Forward `G_KillBox` to `mq3.game.teleport.killBox` and return the delegated result.
/// @param level Game-level state; accesses `scene`, `entities` and `damageFn`.
/// @param ent Game entity; accesses `client` and `r`.
function G_KillBox(level,ent)
  return teleport.killBox(level,ent)
end function

/// Append a predictable event and parameter to the client player-state ring and increment its event sequence.
/// @param level Not read by this implementation; retained in the `G_AddPredictableEvent` signature.
/// @param ent Game entity; accesses `client`.
/// @param event Player or entity event identifier.
/// @param eventParm Integer parameter stored alongside the player event.
function G_AddPredictableEvent(level,ent,event,eventParm)
  if ent.client == void then return void end if
  state = ent.client.ps; slot = state.eventSequence & 1
  state.events[slot] = event; state.eventParms[slot] = eventParm
  state.eventSequence = n.add32(state.eventSequence,1)
  return void
end function

/// Apply `mq3.game.entities.diagnostic` and `mq3.game.events.add` while evaluating `G_AddEvent`. Return paths include `events.add(level,ent,event,eventParm)`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param ent Game entity; accesses `s`.
/// @param event Player or entity event identifier.
/// @param eventParm Integer parameter stored alongside the player event.
function G_AddEvent(level,ent,event,eventParm)
  if event == 0 then
    game.diagnostic(level,"G_AddEvent: zero event added for entity "+str(ent.s.number)+"\n")
    return void
  end if
  return events.add(level,ent,event,eventParm)
end function

/// Forward `G_Sound` to `mq3.game.events.sound` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `r`.
/// @param channel Channel identifier for the requested action.
/// @param soundIndex Index of the entry to access.
function G_Sound(level,ent,channel,soundIndex)
  return events.sound(level,ent,channel,soundIndex)
end function

/// Forward `G_SetOrigin` to `mq3.game.entities.setOrigin` and return the delegated result.
/// @param ent Game entity; accesses `s` and `r`. May update `ent.s.pos.trBase`, `ent.s.pos.trType` and `ent.s.pos.trTime` and additional fields in place.
/// @param origin World-space position as three coordinates.
function G_SetOrigin(ent,origin)
  return game.setOrigin(ent,origin)
end function

/// Apply `mq3.game.movement.copy` while evaluating `DebugLine`. Return paths include `createFn(context,color,points)`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param finish Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param color Value passed as argument 2 to `createFn`.
/// @param createFn Operand used to evaluate the returned expression `createFn(context,color,points)`.
/// @param context Context forwarded to the configured host callbacks.
function DebugLine(start,finish,color,createFn,context)
  if createFn == void then return error(477,"DebugLine requires a debug-polygon sink") end if
  points = [movement.copy(start),movement.copy(start),movement.copy(finish),movement.copy(finish)]
  dir = [n.fsub(finish[0],start[0]),n.fsub(finish[1],start[1]),n.fsub(finish[2],start[2])]
  q.VectorNormalize(dir); dot = q.DotProduct(dir,[0.0,0.0,1.0])
  cross = [0.0,0.0,0.0]
  if dot > 0.99 or dot < -0.99 then cross = [1.0,0.0,0.0]
  else cross = q.CrossProduct(dir,[0.0,0.0,1.0]) end if
  q.VectorNormalize(cross)
  points[0] = q.VectorMA(points[0],2.0,cross); points[1] = q.VectorMA(points[1],-2.0,cross)
  points[2] = q.VectorMA(points[2],-2.0,cross); points[3] = q.VectorMA(points[3],2.0,cross)
  return createFn(context,color,points)
end function
