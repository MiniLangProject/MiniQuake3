// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Original positional, player-start and push/teleporter spawn functions.
package mq3.game.spawn_functions
import mq3.game.entities as game
import mq3.game.spawn_values as values
import mq3.game.triggers as triggers
import mq3.game.targets as targets
import mq3.game.map_targets as mapTargets
import mq3.game.hazards as hazards
import mq3.game.shooters as shooters
import mq3.game.portals as portals
import mq3.game.g_misc as gMisc
import mq3.game.g_mover as gMover
import mq3.game.g_target as gTarget
import mq3.game.g_trigger as gTrigger
import mq3.game.team_missionpack as teamMissionpack
import mq3.game.constants as c
import mq3.shared.math as q
import mq3.shared.directions as dirs
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnum
import mq3.compat.transcendental as crt
import mq3.collision.world as cm
import mq3.server.world as sv
import mq3.game.movement as movement
import std.string as strings
/// Forward `movedirVector` to `mq3.shared.directions.movedirVector` and return the delegated result.
/// @param angles Pitch, yaw and roll angles in degrees.
function movedirVector(angles)
  return dirs.movedirVector(angles)
end function
/// Set `ent.movedir` to `movedirVector(ent.s.angles)` and `ent.s.angles` to `[0.0,0.0,0.0]` in `mq3.game.spawn_functions.setMovedir`.
/// @param ent Game entity; accesses `movedir` and `s`. May update `ent.movedir` and `ent.s.angles` in place.
function setMovedir(ent)
  ent.movedir = movedirVector(ent.s.angles)
  ent.s.angles = [0.0,0.0,0.0]
  return void
end function
/// Update `ent.s.modelindex`, `ent.r.mins`, `ent.r.maxs` and `ent.r.bmodel` and related state during `setBrushModel`.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `s`, `r` and `slot`. May update `ent.s.modelindex`, `ent.r.mins` and `ent.r.maxs` and additional fields in place.
/// @param name Name used to identify the requested entry.
function setBrushModel(level,ent,name)
  if name == void or len(name) == 0 or name[0] != "*" then return error(485,"SV_SetBrushModel: invalid brush model name") end if
  ent.s.modelindex = textnum.atoi(decode(slice(bytes(name),1,len(bytes(name))-1)))
  handle = cm.inlineModel(level.scene.world,ent.s.modelindex); bounds = cm.modelBounds(level.scene.world,handle)
  ent.r.mins = bounds[0]; ent.r.maxs = bounds[1]; ent.r.bmodel = true; ent.r.contents = -1
  // SV_SetBrushModel links directly, without another game trap_LinkEntity call.
  game.syncSpatial(ent); sv.linkEntity(level.scene,ent.slot); ent.s.solid = ent.r.solid
  return void
end function
/// Set `ent.r.contents` to `0x40000000` and `ent.r.svFlags` to `1` in `mq3.game.spawn_functions.initTrigger`.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `s`, `model` and `r`. May update `ent.r.contents` and `ent.r.svFlags` in place.
function initTrigger(level,ent)
  if ent.s.angles[0] != 0 or ent.s.angles[1] != 0 or ent.s.angles[2] != 0 then setMovedir(ent) end if
  setBrushModel(level,ent,ent.model); ent.r.contents = 0x40000000; ent.r.svFlags = 1
  return void
end function
/// Update `ent.s.origin2` and `ent.s.origin2[2]` during `aimAtTarget`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `r`, `target` and `s`. May update `ent.s.origin2` and `ent.s.origin2[2]` in place.
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
/// Forward `runThink` to `mq3.game.entities.runThink` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `nextthink` and `think`. May update `ent.nextthink` in place.
function runThink(level,ent)
  return game.runThink(level,ent)
end function
/// Set `ent.flags` to `ent.flags | 0x2000` and `ent.flags` to `ent.flags | 0x4000` in `mq3.game.spawn_functions.playerDeathmatch`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `flags`. May update `ent.flags` in place.
function playerDeathmatch(level,ent)
  if values.getInt(level.spawner,"nobots","0")[1] != 0 then ent.flags = ent.flags | 0x2000 end if
  if values.getInt(level.spawner,"nohumans","0")[1] != 0 then ent.flags = ent.flags | 0x4000 end if
  return void
end function
/// Update `self.s.eType`, `self.enemy`, `self.use` and `self.think` and related state during `laserStart`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param self Entity receiving the callback; accesses `s`, `target`, `classname`, `enemy` and `use` and related fields. May update `self.s.eType`, `self.enemy` and `self.use` and additional fields in place.
function laserStart(level,self)
  self.s.eType = c.ET_BEAM
  if self.target != void then
    enemy = void; i = 0
    // G_Find(NULL, targetname, target) selects the first live matching entity.
    while i < level.num_entities
      ent = level.entities[i]; i = i+1
      if ent.inuse and ent.targetname != void and strings.equalsIgnoreCaseAscii(ent.targetname,self.target) then enemy = ent; break end if
    end while
    if enemy == void then
      targetName = self.target; position = game.vtos(level,self.s.origin)
      game.diagnostic(level,game.diagnosticArgument(self.classname)+" at "+position+": "+game.diagnosticArgument(targetName)+" is a bad target\n")
    end if
    self.enemy = enemy
  else
    setMovedir(self)
  end if
  self.use = hazards.laserUse; self.think = hazards.laserThink
  if self.damage == 0 then self.damage = 1 end if
  if (self.spawnflags & 1) != 0 then hazards.laserOn(level,self) else hazards.laserOff(level,self) end if
  return void
end function
/// Update `ent.use`, `ent.s.weapon`, `ent.random` and `ent.think` and related state during `initShooter`. Return paths include `game.link(level,ent)`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `use`, `s`, `random`, `target` and `think` and related fields. May update `ent.use`, `ent.s.weapon` and `ent.random` and additional fields in place.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function initShooter(level,ent,weapon)
  ent.use = shooters.use; ent.s.weapon = weapon
  shooters.registerItem(level,shooters.weaponItem(weapon)); setMovedir(ent)
  if ent.random == 0 then ent.random = 1.0 end if
  ent.random = n.f32(crt.sin(n.fdiv(n.fmul(n.f32(3.14159265358979323846),ent.random),180)))
  if ent.target != void then ent.think = shooters.finish; ent.nextthink = n.add32(level.time,500) end if
  return game.link(level,ent)
end function
/// Set `ent.classname` to `"info_player_deathmatch"` in `mq3.game.spawn_functions.dispatch`.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param ent Game entity; accesses `classname`. May update `ent.classname` in place.
function dispatch(level,ent)
  if gMover.dispatch(level,ent) then return true end if
  switch ent.classname
    case "info_player_start"
      ent.classname = "info_player_deathmatch"; playerDeathmatch(level,ent)
    end case
    case "info_player_deathmatch"
      playerDeathmatch(level,ent)
    end case
    case "info_null"
      gMisc.SP_info_null(level,ent)
    end case
    case "light"
      gMisc.SP_light(level,ent)
    end case
    case "func_group"
      game.free(level,ent)
    end case
    case "misc_model"
      gMisc.SP_misc_model(level,ent)
    end case
    case "info_notnull"
      gMisc.SP_info_notnull(level,ent)
    end case
    case "info_camp"
      gMisc.SP_info_camp(level,ent)
    end case
    case "target_position"
      gTarget.SP_target_position(level,ent)
    end case
    case "path_corner"
      gMover.SP_path_corner(level,ent)
    end case
    case "misc_teleporter_dest"
      gMisc.SP_misc_teleporter_dest(level,ent)
    end case
    case "info_player_intermission","team_CTF_redplayer","team_CTF_blueplayer","team_CTF_redspawn","team_CTF_bluespawn","item_botroam"
      // These original spawn functions have empty bodies.
    end case
    case "team_redobelisk"
      teamMissionpack.SP_team_redobelisk(level,ent)
    end case
    case "team_blueobelisk"
      teamMissionpack.SP_team_blueobelisk(level,ent)
    end case
    case "team_neutralobelisk"
      teamMissionpack.SP_team_neutralobelisk(level,ent)
    end case
    case "trigger_push"
      gTrigger.SP_trigger_push(level,ent)
    end case
    case "trigger_teleport"
      gTrigger.SP_trigger_teleport(level,ent)
    end case
    case "target_delay"
      gTarget.SP_target_delay(level,ent)
    end case
    case "target_relay"
      gTarget.SP_target_relay(level,ent)
    end case
    case "target_give"
      gTarget.SP_target_give(level,ent)
    end case
    case "target_remove_powerups"
      gTarget.SP_target_remove_powerups(level,ent)
    end case
    case "target_score"
      gTarget.SP_target_score(level,ent)
    end case
    case "target_print"
      gTarget.SP_target_print(level,ent)
    end case
    case "misc_portal_surface"
      gMisc.SP_misc_portal_surface(level,ent)
    end case
    case "misc_portal_camera"
      gMisc.SP_misc_portal_camera(level,ent)
    end case
    case "target_teleporter"
      gTarget.SP_target_teleporter(level,ent)
    end case
    case "trigger_multiple"
      gTrigger.SP_trigger_multiple(level,ent)
    end case
    case "trigger_always"
      gTrigger.SP_trigger_always(level,ent)
    end case
    case "target_speaker"
      gTarget.SP_target_speaker(level,ent)
    end case
    case "target_push"
      gTrigger.SP_target_push(level,ent)
    end case
    case "func_timer"
      gTrigger.SP_func_timer(level,ent)
    end case
    case "target_location"
      gTarget.SP_target_location(level,ent)
    end case
    case "trigger_hurt"
      gTrigger.SP_trigger_hurt(level,ent)
    end case
    case "target_kill"
      gTarget.SP_target_kill(level,ent)
    end case
    case "target_laser"
      gTarget.SP_target_laser(level,ent)
    end case
    case "shooter_rocket"
      gMisc.SP_shooter_rocket(level,ent)
    end case
    case "shooter_grenade"
      gMisc.SP_shooter_grenade(level,ent)
    end case
    case "shooter_plasma"
      gMisc.SP_shooter_plasma(level,ent)
    end case
    case default
      return false
    end case
  end switch
  return true
end function
