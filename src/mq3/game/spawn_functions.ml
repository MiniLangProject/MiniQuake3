// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Original positional, player-start and push/teleporter spawn functions.
package mq3.game.spawn_functions
import mq3.game.entities as game
import mq3.game.spawn_values as values
import mq3.game.triggers as triggers
import mq3.game.targets as targets
import mq3.game.hazards as hazards
import mq3.game.constants as c
import mq3.shared.math as q
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import mq3.compat.transcendental as crt
import mq3.collision.world as cm
import mq3.server.world as sv
import mq3.game.movement as movement
import std.string as strings
function movedirVector(angles)
  if angles[0] == 0 and angles[2] == 0 and angles[1] == -1 then return [0.0,0.0,1.0] end if
  if angles[0] == 0 and angles[2] == 0 and angles[1] == -2 then return [0.0,0.0,-1.0] end if
  axes = q.AngleVectors(angles); return axes[0]
end function
function setMovedir(ent)
  ent.movedir = movedirVector(ent.s.angles)
  ent.s.angles = [0.0,0.0,0.0]
  return void
end function
function setBrushModel(level,ent,name)
  if name == void or len(name) == 0 or name[0] != "*" then return error(485,"SV_SetBrushModel: invalid brush model name") end if
  ent.s.modelindex = textnum.atoi(decode(slice(bytes(name),1,len(bytes(name))-1)))
  handle = cm.inlineModel(level.scene.world,ent.s.modelindex); bounds = cm.modelBounds(level.scene.world,handle)
  ent.r.mins = bounds[0]; ent.r.maxs = bounds[1]; ent.r.bmodel = true; ent.r.contents = -1
  // SV_SetBrushModel links directly, without another game trap_LinkEntity call.
  game.syncSpatial(ent); sv.linkEntity(level.scene,ent.slot); ent.s.solid = ent.r.solid
  return void
end function
function initTrigger(level,ent)
  if ent.s.angles[0] != 0 or ent.s.angles[1] != 0 or ent.s.angles[2] != 0 then setMovedir(ent) end if
  setBrushModel(level,ent,ent.model); ent.r.contents = 0x40000000; ent.r.svFlags = 1
  return void
end function
function aimAtTarget(level,ent)
  origin = array(3,0.0)
  for axis = 0 to 2
    origin[axis] = n.fmul(n.fadd(ent.r.absmin[axis],ent.r.absmax[axis]),0.5)
  end for
  target = game.pickTarget(level,ent.target)
  if target == void then game.free(level,ent); return void end if
  height = n.fsub(target.s.origin[2],origin[2]); gravity = level.spawner.gravity
  // .5 is a C double literal; division and sqrt precede the float store.
  ratio = 0.0
  if gravity == 0 then ratio = n.fdiv(height,gravity) else ratio = height/(0.5*gravity) end if
  time = n.f32(crt.sqrt(ratio))
  if time == 0 then game.free(level,ent); return void end if
  ent.s.origin2 = [n.fsub(target.s.origin[0],origin[0]),n.fsub(target.s.origin[1],origin[1]),0.0]
  distance = q.VectorNormalize(ent.s.origin2); forward = n.fdiv(distance,time)
  ent.s.origin2 = q.VectorScale(ent.s.origin2,forward); ent.s.origin2[2] = n.fmul(time,gravity)
  return void
end function
function runThink(level,ent)
  thinktime = n.f32(ent.nextthink)
  if thinktime <= 0 or thinktime > n.f32(level.time) then return void end if
  ent.nextthink = 0
  if ent.think == void then return error(485,"NULL ent->think") end if
  ent.think(level,ent)
  return void
end function
function playerDeathmatch(level,ent)
  if values.getInt(level.spawner,"nobots","0")[1] != 0 then ent.flags = ent.flags | 0x2000 end if
  if values.getInt(level.spawner,"nohumans","0")[1] != 0 then ent.flags = ent.flags | 0x4000 end if
  return void
end function
function dispatch(level,ent)
  switch ent.classname
    case "info_player_start"
      ent.classname = "info_player_deathmatch"; playerDeathmatch(level,ent)
    end case
    case "info_player_deathmatch"
      playerDeathmatch(level,ent)
    end case
    case "info_null","light","func_group","misc_model"
      game.free(level,ent)
    end case
    case "info_notnull","info_camp","target_position"
      game.setOrigin(ent,ent.s.origin)
    end case
    case "path_corner"
      if ent.targetname == void then game.free(level,ent) end if
    end case
    case "info_player_intermission","misc_teleporter_dest","team_CTF_redplayer","team_CTF_blueplayer","team_CTF_redspawn","team_CTF_bluespawn","item_botroam"
      // These original spawn functions have empty bodies.
    end case
    case "trigger_push","trigger_teleport"
      initTrigger(level,ent)
      if ent.classname == "trigger_push" then
        ent.r.svFlags = ent.r.svFlags & ~1; values.soundIndex(level.spawner,"sound/world/jumppad.wav")
        ent.s.eType = c.ET_PUSH_TRIGGER; ent.touch = triggers.pushTouch; ent.think = aimAtTarget; ent.nextthink = n.add32(level.time,100)
      else
        if (ent.spawnflags & 1) != 0 then ent.r.svFlags = ent.r.svFlags | 1 else ent.r.svFlags = ent.r.svFlags & ~1 end if
        values.soundIndex(level.spawner,"sound/world/jumppad.wav"); ent.s.eType = c.ET_TELEPORT_TRIGGER; ent.touch = triggers.teleporterTouch
      end if
      game.link(level,ent)
    end case
    case "target_delay"
      value = values.getFloat(level.spawner,"delay","0"); ent.wait = value[1]
      if not value[0] then ent.wait = values.getFloat(level.spawner,"wait","1")[1] end if
      if ent.wait == 0 then ent.wait = 1.0 end if
      ent.use = targets.delayUse
    end case
    case "target_relay"
      ent.use = targets.relayUse
    end case
    case "target_teleporter"
      ent.use = targets.teleporterUse
    end case
    case "trigger_multiple"
      ent.wait = values.getFloat(level.spawner,"wait","0.5")[1]; ent.random = values.getFloat(level.spawner,"random","0")[1]
      if ent.random >= ent.wait and ent.wait >= 0 then ent.random = n.fsub(ent.wait,100) end if
      ent.touch = targets.multiTouch; ent.use = targets.multiUse; initTrigger(level,ent); game.link(level,ent)
    end case
    case "trigger_always"
      ent.nextthink = n.add32(level.time,300); ent.think = targets.alwaysThink
    end case
    case "target_speaker"
      ent.wait = values.getFloat(level.spawner,"wait","0")[1]; ent.random = values.getFloat(level.spawner,"random","0")[1]
      noise = values.getString(level.spawner,"noise","NOSOUND")
      if not noise[0] then return error(489,"target_speaker without a noise key") end if
      name = noise[1]
      if len(name) > 0 and name[0] == "*" then ent.spawnflags = ent.spawnflags | 8 end if
      if strings.indexOf(name,".wav",0) < 0 then name = name+".wav" end if
      data = bytes(name)
      if len(data) > 63 then name = decode(slice(data,0,63)) end if
      ent.noise_index = values.soundIndex(level.spawner,name); ent.s.eType = c.ET_SPEAKER; ent.s.eventParm = ent.noise_index
      ent.s.frame = n.trunc32(n.fmul(ent.wait,10)); ent.s.clientNum = n.trunc32(n.fmul(ent.random,10))
      if (ent.spawnflags & 1) != 0 then ent.s.loopSound = ent.noise_index end if
      ent.use = targets.speakerUse
      if (ent.spawnflags & 4) != 0 then ent.r.svFlags = ent.r.svFlags | 32 end if
      ent.s.pos.trBase = movement.copy(ent.s.origin); game.link(level,ent)
    end case
    case "target_push"
      if ent.speed == 0 then ent.speed = 1000.0 end if
      ent.s.origin2 = movedirVector(ent.s.angles); ent.s.angles = [0.0,0.0,0.0]; ent.s.origin2 = q.VectorScale(ent.s.origin2,ent.speed)
      if (ent.spawnflags & 1) != 0 then ent.noise_index = values.soundIndex(level.spawner,"sound/world/jumppad.wav")
      else ent.noise_index = values.soundIndex(level.spawner,"sound/misc/windfly.wav") end if
      if ent.target != void then
        ent.r.absmin = movement.copy(ent.s.origin); ent.r.absmax = movement.copy(ent.s.origin); ent.think = aimAtTarget; ent.nextthink = n.add32(level.time,100)
      end if
      ent.use = targets.pushUse
    end case
    case "func_timer"
      ent.random = values.getFloat(level.spawner,"random","1")[1]; ent.wait = values.getFloat(level.spawner,"wait","1")[1]
      ent.use = targets.timerUse; ent.think = targets.timerThink
      if ent.random >= ent.wait then ent.random = n.fsub(ent.wait,100) end if
      if (ent.spawnflags & 1) != 0 then ent.nextthink = n.add32(level.time,100); ent.activator = ent end if
      ent.r.svFlags = 1
    end case
    case "target_location"
      ent.think = targets.locationLinkup; ent.nextthink = n.add32(level.time,200); game.setOrigin(ent,ent.s.origin)
    end case
    case "trigger_hurt"
      initTrigger(level,ent); ent.noise_index = values.soundIndex(level.spawner,"sound/world/electro.wav"); ent.touch = hazards.hurtTouch
      if ent.damage == 0 then ent.damage = 5 end if
      ent.r.contents = 0x40000000
      if (ent.spawnflags & 2) != 0 then ent.use = hazards.hurtUse end if
      if (ent.spawnflags & 1) == 0 then game.link(level,ent) end if
    end case
    case "target_kill"
      ent.use = hazards.killUse
    end case
    case default
      return false
    end case
  end switch
  return true
end function
