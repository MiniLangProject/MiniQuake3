// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Original positional, player-start and push/teleporter spawn functions.
package mq3.game.spawn_functions
import mq3.game.entities as game
import mq3.game.spawn_values as values
import mq3.game.triggers as triggers
import mq3.game.constants as c
import mq3.shared.math as q
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import mq3.compat.transcendental as crt
import mq3.collision.world as cm
import mq3.server.world as sv
function setMovedir(ent)
  angles = ent.s.angles
  if angles[0] == 0 and angles[2] == 0 and angles[1] == -1 then ent.movedir = [0.0,0.0,1.0]
  else if angles[0] == 0 and angles[2] == 0 and angles[1] == -2 then ent.movedir = [0.0,0.0,-1.0]
  else
    axes = q.AngleVectors(angles); ent.movedir = axes[0]
  end if
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
    case default
      return false
    end case
  end switch
  return true
end function
