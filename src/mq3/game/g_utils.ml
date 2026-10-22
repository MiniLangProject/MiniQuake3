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

const MAXCHOICES = 32

function nativeText(text)
  if text == void then return void end if
  if typeof(text) != "string" then return error(477,"G_Find requires a native string field") end if
  data = bytes(text); length = 0
  while length < len(data) and data[length] != 0
    length = length+1
  end while
  return decode(slice(data,0,length))
end function

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

function AddRemap(level,oldShader,newShader,timeOffset)
  return targets.addRemap(level,oldShader,newShader,timeOffset)
end function

function BuildShaderStateConfig(level)
  return targets.shaderState(level)
end function

function G_FindConfigstringIndex(level,name,start,max,create)
  return values.configIndex(level.spawner,name,start,max,create)
end function

function G_ModelIndex(level,name)
  return values.modelIndex(level.spawner,name)
end function

function G_SoundIndex(level,name)
  return values.soundIndex(level.spawner,name)
end function

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

function G_PickTarget(level,targetname)
  return game.pickTarget(level,targetname)
end function

function G_UseTargets(level,ent,activator)
  return targets.useTargets(level,ent,activator)
end function

function tv(x,y,z)
  // MiniLang arrays are owned values, so the native eight-slot scratch-ring
  // lifetime is unnecessary while the visible values remain identical.
  return [n.f32(x),n.f32(y),n.f32(z)]
end function

function vtos(level,vector)
  return game.vtos(level,vector)
end function

function G_SetMovedir(angles,movedir)
  result = directions.movedirVector(angles)
  for axis = 0 to 2
    movedir[axis] = result[axis]; angles[axis] = 0.0
  end for
  return void
end function

function vectoyaw(vector)
  yaw = 0.0
  if vector[1] != 0 or vector[0] != 0 then
    if vector[0] != 0 then yaw = q.atanDegrees(vector[1],vector[0])
    else if vector[1] > 0 then yaw = 90.0 else yaw = 270.0 end if
    if yaw < 0 then yaw = n.fadd(yaw,360.0) end if
  end if
  return yaw
end function

function G_InitGentity(ent)
  return game.initEntity(ent)
end function

function G_Spawn(level)
  return game.spawn(level)
end function

function G_EntitiesFree(level)
  return game.entitiesFree(level)
end function

function G_FreeEntity(level,ent)
  return game.free(level,ent)
end function

function G_TempEntity(level,origin,event)
  return game.tempEntity(level,origin,event)
end function

function G_KillBox(level,ent)
  return teleport.killBox(level,ent)
end function

function G_AddPredictableEvent(level,ent,event,eventParm)
  if ent.client == void then return void end if
  state = ent.client.ps; slot = state.eventSequence & 1
  state.events[slot] = event; state.eventParms[slot] = eventParm
  state.eventSequence = n.add32(state.eventSequence,1)
  return void
end function

function G_AddEvent(level,ent,event,eventParm)
  if event == 0 then
    game.diagnostic(level,"G_AddEvent: zero event added for entity "+str(ent.s.number)+"\n")
    return void
  end if
  return events.add(level,ent,event,eventParm)
end function

function G_Sound(level,ent,channel,soundIndex)
  return events.sound(level,ent,channel,soundIndex)
end function

function G_SetOrigin(ent,origin)
  return game.setOrigin(ent,origin)
end function

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
