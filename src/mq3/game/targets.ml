// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
package mq3.game.targets
import mq3.game.entities as game
import mq3.game.teleport as teleport
import mq3.game.spawn_values as values
import mq3.game.events as events
import mq3.game.constants as c
import mq3.game.movement as movement
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import std.string as strings
function addRemap(level,oldShader,newShader,time)
  // Original strcpy overflows MAX_QPATH for larger names; reject that input.
  for each remap in level.shaderRemaps
    if strings.equalsIgnoreCaseAscii(oldShader,remap[0]) then
      if len(bytes(newShader)) >= 64 then return error(487,"Shader remap name exceeds MAX_QPATH") end if
      remap[1] = newShader; remap[2] = time; return void
    end if
  end for
  if len(level.shaderRemaps) < 128 then
    if len(bytes(oldShader)) >= 64 or len(bytes(newShader)) >= 64 then return error(487,"Shader remap name exceeds MAX_QPATH") end if
    level.shaderRemaps = level.shaderRemaps+[[oldShader,newShader,time]]
  end if
  return void
end function
function shaderState(level)
  result = ""
  for each remap in level.shaderRemaps
    row = remap[0]+"="+remap[1]+":"+textnum.fixed2(remap[2])+"@"
    // Com_sprintf's destination has 133 bytes; Q_strcat truncates at 4095.
    data = bytes(row); size = len(data)
    if size > 132 then size = 132 end if
    row = decode(slice(data,0,size)); data = bytes(result+row); size = len(data)
    if size > 4095 then size = 4095 end if
    result = decode(slice(data,0,size))
  end for
  return result
end function
function useTargets(level,ent,activator)
  if ent == void then return void end if
  if ent.targetShaderName != void and ent.targetShaderNewName != void then
    addRemap(level,ent.targetShaderName,ent.targetShaderNewName,n.f32(level.time*0.001))
    values.setConfig(level.spawner,24,shaderState(level))
  end if
  if ent.target == void then return void end if
  i = 0
  // G_Find searches the live entity range after each callback.
  while i < level.num_entities
    target = level.entities[i]; i = i+1
    if not target.inuse or target.targetname == void or ent.target == void then continue end if
    if not strings.equalsIgnoreCaseAscii(target.targetname,ent.target) then continue end if
    if target != ent and target.use != void then target.use(level,target,ent,activator) end if
    if not ent.inuse then return void end if
  end while
  return void
end function
function delayTime(level,ent)
  // random() divides in float; crandom() and the rest use C double literals.
  randomValue = n.fdiv(game.random(level),32767)
  time = level.time+(ent.wait+ent.random*(2.0*(randomValue-0.5)))*1000
  return textnum.truncDouble32(time)
end function
function delayThink(level,ent)
  return useTargets(level,ent,ent.activator)
end function
function delayUse(level,ent,other,activator)
  ent.nextthink = delayTime(level,ent); ent.think = delayThink; ent.activator = activator
  return void
end function
function teamAllowed(ent,activator)
  if activator.client != void then
    if (ent.spawnflags & 1) != 0 and activator.client.team != 1 then return false end if
    if (ent.spawnflags & 2) != 0 and activator.client.team != 2 then return false end if
  end if
  return true
end function
function relayUse(level,ent,other,activator)
  if not teamAllowed(ent,activator) then return void end if
  if (ent.spawnflags & 4) != 0 then
    target = game.pickTarget(level,ent.target)
    if target != void and target.use != void then target.use(level,target,ent,activator) end if
    return void
  end if
  return useTargets(level,ent,activator)
end function
function teleporterUse(level,ent,other,activator)
  if activator.client == void then return void end if
  target = game.pickTarget(level,ent.target)
  if target != void then teleport.player(level,activator,target.s.origin,target.s.angles)
  else game.diagnostic(level,"Couldn't find teleporter destination\n") end if
  return void
end function
function multiWait(level,ent)
  ent.nextthink = 0
  return void
end function
function multiTrigger(level,ent,activator)
  ent.activator = activator
  if ent.nextthink != 0 then return void end if
  if not teamAllowed(ent,activator) then return void end if
  useTargets(level,ent,ent.activator)
  if ent.wait > 0 then
    ent.think = multiWait; ent.nextthink = delayTime(level,ent)
  else
    ent.touch = void; ent.nextthink = n.add32(level.time,100); ent.think = game.free
  end if
  return void
end function
function multiUse(level,ent,other,activator)
  return multiTrigger(level,ent,activator)
end function
function multiTouch(level,ent,other,trace)
  if other.client != void then multiTrigger(level,ent,other) end if
  return void
end function
function alwaysThink(level,ent)
  useTargets(level,ent,ent); game.free(level,ent)
  return void
end function
function speakerUse(level,ent,other,activator)
  if (ent.spawnflags & 3) != 0 then
    if ent.s.loopSound != 0 then ent.s.loopSound = 0 else ent.s.loopSound = ent.noise_index end if
  else if (ent.spawnflags & 8) != 0 then
    events.add(level,activator,c.EV_GENERAL_SOUND,ent.noise_index)
  else if (ent.spawnflags & 4) != 0 then
    events.add(level,ent,c.EV_GLOBAL_SOUND,ent.noise_index)
  else
    events.add(level,ent,c.EV_GENERAL_SOUND,ent.noise_index)
  end if
  return void
end function
function pushUse(level,ent,other,activator)
  if activator.client == void then return void end if
  if activator.client.ps.pm_type != c.PM_NORMAL or activator.client.ps.powerups[c.PW_FLIGHT] != 0 then return void end if
  activator.client.ps.velocity = movement.copy(ent.s.origin2)
  if activator.fly_sound_debounce_time < level.time then
    activator.fly_sound_debounce_time = n.add32(level.time,1500); events.sound(level,activator,0,ent.noise_index)
  end if
  return void
end function
function timerThink(level,ent)
  useTargets(level,ent,ent.activator)
  randomValue = n.fdiv(game.random(level),32767)
  ent.nextthink = textnum.truncDouble32(level.time+1000*(ent.wait+(2.0*(randomValue-0.5))*ent.random))
  return void
end function
function timerUse(level,ent,other,activator)
  ent.activator = activator
  if ent.nextthink != 0 then ent.nextthink = 0; return void end if
  return timerThink(level,ent)
end function
function locationLinkup(level,ent)
  if level.locationLinked then return void end if
  level.locationLinked = true; level.locationHead = void; values.setConfig(level.spawner,608,"unknown")
  i = 0; number = 1
  while i < level.num_entities
    location = level.entities[i]; i = i+1
    // The original loop deliberately has no inuse filter and no MAX_LOCATIONS cap.
    if location.classname != void and strings.equalsIgnoreCaseAscii(location.classname,"target_location") then
      location.health = number; values.setConfig(level.spawner,608+number,location.message); number = number+1
      location.nextTrain = level.locationHead; level.locationHead = location
    end if
  end while
  return void
end function
