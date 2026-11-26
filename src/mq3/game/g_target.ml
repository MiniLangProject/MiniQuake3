// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete C-named g_target.c facade used by the productive spawn/frame paths.
package mq3.game.g_target
import mq3.game.entities as game
import mq3.game.spawn_values as values
import mq3.game.targets as targets
import mq3.game.map_targets as mapTargets
import mq3.game.hazards as hazards
import mq3.game.constants as c
import mq3.game.movement as movement
import mq3.shared.directions as dirs
import mq3.compat.numeric as n
import std.string as strings

/// Forward `Use_Target_Give` to `mq3.game.map_targets.giveUse` and return the delegated result.
/// @param level Game-level state; accesses `entities`.
/// @param ent Game entity; accesses `target`.
/// @param other Value passed as argument 3 to `mq3.game.map_targets.giveUse`.
/// @param activator Entity responsible for activating the target.
function Use_Target_Give(level,ent,other,activator) return mapTargets.giveUse(level,ent,other,activator) end function
/// Set `ent.use` to `Use_Target_Give` in `mq3.game.g_target.SP_target_give`.
/// @param level Value passed as argument 1 to `mq3.game.map_targets.giveSpawn`.
/// @param ent Game entity; accesses `use`. May update `ent.use` in place.
function SP_target_give(level,ent) mapTargets.giveSpawn(level,ent); ent.use = Use_Target_Give; return void end function
/// Forward `Use_target_remove_powerups` to `mq3.game.map_targets.removePowerupsUse` and return the delegated result.
/// @param level Game-level state; accesses `teamMessageFn`.
/// @param ent Value passed as argument 2 to `mq3.game.map_targets.removePowerupsUse`.
/// @param other Value passed as argument 3 to `mq3.game.map_targets.removePowerupsUse`.
/// @param activator Entity responsible for activating the target.
function Use_target_remove_powerups(level,ent,other,activator) return mapTargets.removePowerupsUse(level,ent,other,activator) end function
/// Set `ent.use` to `Use_target_remove_powerups` in `mq3.game.g_target.SP_target_remove_powerups`.
/// @param level Value passed as argument 1 to `mq3.game.map_targets.removePowerupsSpawn`.
/// @param ent Game entity; accesses `use`. May update `ent.use` in place.
function SP_target_remove_powerups(level,ent) mapTargets.removePowerupsSpawn(level,ent); ent.use = Use_target_remove_powerups; return void end function

/// Forward `Think_Target_Delay` to `mq3.game.targets.delayThink` and return the delegated result.
/// @param level Game-level state; accesses `time`, `spawner`, `num_entities` and `entities`.
/// @param ent Game entity; accesses `activator`.
function Think_Target_Delay(level,ent) return targets.delayThink(level,ent) end function
/// Update `ent.nextthink`, `ent.think` and `ent.activator` during `Use_Target_Delay`.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `nextthink`, `think` and `activator`. May update `ent.nextthink`, `ent.think` and `ent.activator` in place.
/// @param other Not read by this implementation; retained in the `Use_Target_Delay` signature.
/// @param activator Entity responsible for activating the target.
function Use_Target_Delay(level,ent,other,activator)
  ent.nextthink = targets.delayTime(level,ent); ent.think = Think_Target_Delay; ent.activator = activator; return void
end function
/// Update `ent.wait` and `ent.use` during `SP_target_delay`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `wait` and `use`. May update `ent.wait` and `ent.use` in place.
function SP_target_delay(level,ent)
  value = values.getFloat(level.spawner,"delay","0"); ent.wait = value[1]
  if not value[0] then ent.wait = values.getFloat(level.spawner,"wait","1")[1] end if
  if ent.wait == 0 then ent.wait = 1.0 end if
  ent.use = Use_Target_Delay
  return void
end function

/// Forward `Use_Target_Score` to `mq3.game.map_targets.scoreUse` and return the delegated result.
/// @param level Game-level state; accesses `spawner` and `teamScores`. May update `level.teamScores[team]` in place.
/// @param ent Game entity; accesses `r` and `count`.
/// @param other Value passed as argument 3 to `mq3.game.map_targets.scoreUse`.
/// @param activator Entity responsible for activating the target.
function Use_Target_Score(level,ent,other,activator) return mapTargets.scoreUse(level,ent,other,activator) end function
/// Set `ent.use` to `Use_Target_Score` in `mq3.game.g_target.SP_target_score`.
/// @param level Value passed as argument 1 to `mq3.game.map_targets.scoreSpawn`.
/// @param ent Game entity; accesses `use`. May update `ent.use` in place.
function SP_target_score(level,ent)
  mapTargets.scoreSpawn(level,ent); ent.use = Use_Target_Score; return void
end function
/// Forward `Use_Target_Print` to `mq3.game.map_targets.printUse` and return the delegated result.
/// @param level Game-level state; accesses `entities`.
/// @param ent Game entity; accesses `spawnflags`.
/// @param other Value passed as argument 3 to `mq3.game.map_targets.printUse`.
/// @param activator Entity responsible for activating the target.
function Use_Target_Print(level,ent,other,activator) return mapTargets.printUse(level,ent,other,activator) end function
/// Set `ent.use` to `Use_Target_Print` in `mq3.game.g_target.SP_target_print`.
/// @param level Value passed as argument 1 to `mq3.game.map_targets.printSpawn`.
/// @param ent Game entity; accesses `use`. May update `ent.use` in place.
function SP_target_print(level,ent)
  mapTargets.printSpawn(level,ent); ent.use = Use_Target_Print; return void
end function

/// Forward `Use_Target_Speaker` to `mq3.game.targets.speakerUse` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `spawnflags`, `s` and `noise_index`. May update `ent.s.loopSound` in place.
/// @param other Value passed as argument 3 to `mq3.game.targets.speakerUse`.
/// @param activator Entity responsible for activating the target.
function Use_Target_Speaker(level,ent,other,activator) return targets.speakerUse(level,ent,other,activator) end function
/// Update `ent.wait`, `ent.random`, `ent.spawnflags` and `ent.noise_index` and related state during `SP_target_speaker`. Return paths include `game.link(level,ent)`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `wait`, `random`, `spawnflags`, `noise_index` and `s` and related fields. May update `ent.wait`, `ent.random` and `ent.spawnflags` and additional fields in place.
function SP_target_speaker(level,ent)
  ent.wait = values.getFloat(level.spawner,"wait","0")[1]
  ent.random = values.getFloat(level.spawner,"random","0")[1]
  noise = values.getString(level.spawner,"noise","NOSOUND")
  if not noise[0] then return error(489,"target_speaker without a noise key") end if
  name = noise[1]
  if len(name) > 0 and name[0] == "*" then ent.spawnflags = ent.spawnflags | 8 end if
  if strings.indexOf(name,".wav",0) < 0 then name = name+".wav" end if
  data = bytes(name)
  if len(data) > 63 then name = decode(slice(data,0,63)) end if
  ent.noise_index = values.soundIndex(level.spawner,name)
  ent.s.eType = c.ET_SPEAKER; ent.s.eventParm = ent.noise_index
  ent.s.frame = n.trunc32(n.fmul(ent.wait,10)); ent.s.clientNum = n.trunc32(n.fmul(ent.random,10))
  if (ent.spawnflags & 1) != 0 then ent.s.loopSound = ent.noise_index end if
  ent.use = Use_Target_Speaker
  if (ent.spawnflags & 4) != 0 then ent.r.svFlags = ent.r.svFlags | 32 end if
  ent.s.pos.trBase = movement.copy(ent.s.origin)
  return game.link(level,ent)
end function

/// Forward `target_laser_think` to `mq3.game.hazards.laserThink` and return the delegated result.
/// @param level Game-level state; accesses `entities` and `time`.
/// @param self Entity receiving the callback; accesses `enemy`, `movedir`, `s`, `activator` and `damage` and related fields. May update `self.movedir`, `self.s.origin2` and `self.nextthink` in place.
function target_laser_think(level,self) return hazards.laserThink(level,self) end function
/// Set `self.activator` to `self` in `mq3.game.g_target.target_laser_on`. Return paths include `target_laser_think(level,self)`.
/// @param level Game-level state; accesses `entities` and `time`.
/// @param self Entity receiving the callback; accesses `activator`. May update `self.activator` in place.
function target_laser_on(level,self)
  if self.activator == void then self.activator = self end if
  return target_laser_think(level,self)
end function
/// Forward `target_laser_off` to `mq3.game.hazards.laserOff` and return the delegated result.
/// @param level Game-level state; accesses `scene`.
/// @param self Entity receiving the callback; accesses `nextthink`. May update `self.nextthink` in place.
function target_laser_off(level,self) return hazards.laserOff(level,self) end function
/// Forward `target_laser_use` to `mq3.game.hazards.laserUse` and return the delegated result.
/// @param level Game-level state; accesses `scene`.
/// @param self Entity receiving the callback; accesses `activator` and `nextthink`. May update `self.activator` in place.
/// @param other Value passed as argument 3 to `mq3.game.hazards.laserUse`.
/// @param activator Entity responsible for activating the target.
function target_laser_use(level,self,other,activator) return hazards.laserUse(level,self,other,activator) end function
/// Update `self.s.eType`, `self.enemy`, `self.movedir` and `self.s.angles` and related state during `target_laser_start`.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param self Entity receiving the callback; accesses `s`, `target`, `classname`, `enemy` and `movedir` and related fields. May update `self.s.eType`, `self.enemy` and `self.movedir` and additional fields in place.
function target_laser_start(level,self)
  self.s.eType = c.ET_BEAM
  if self.target != void then
    enemy = void; i = 0
    while i < level.num_entities
      ent = level.entities[i]; i = i+1
      if ent.inuse and ent.targetname != void and strings.equalsIgnoreCaseAscii(ent.targetname,self.target) then enemy = ent; break end if
    end while
    if enemy == void then
      game.diagnostic(level,game.diagnosticArgument(self.classname)+" at "+game.vtos(level,self.s.origin)+": "+game.diagnosticArgument(self.target)+" is a bad target\n")
    end if
    self.enemy = enemy
  else
    self.movedir = dirs.movedirVector(self.s.angles); self.s.angles = [0.0,0.0,0.0]
  end if
  self.use = target_laser_use; self.think = target_laser_think
  if self.damage == 0 then self.damage = 1 end if
  if (self.spawnflags & 1) != 0 then target_laser_on(level,self) else target_laser_off(level,self) end if
  return void
end function
/// Set `self.think` to `target_laser_start` and `self.nextthink` to `n.add32(level.time,100)` in `mq3.game.g_target.SP_target_laser`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `think` and `nextthink`. May update `self.think` and `self.nextthink` in place.
function SP_target_laser(level,self)
  self.think = target_laser_start; self.nextthink = n.add32(level.time,100); return void
end function

/// Forward `target_teleporter_use` to `mq3.game.targets.teleporterUse` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`.
/// @param self Game entity; accesses `target`.
/// @param other Value passed as argument 3 to `mq3.game.targets.teleporterUse`.
/// @param activator Entity responsible for activating the target.
function target_teleporter_use(level,self,other,activator) return targets.teleporterUse(level,self,other,activator) end function
/// Set `self.use` to `target_teleporter_use` in `mq3.game.g_target.SP_target_teleporter`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param self Entity receiving the callback; accesses `targetname`, `classname`, `s` and `use`. May update `self.use` in place.
function SP_target_teleporter(level,self)
  if self.targetname == void then
    game.diagnostic(level,"untargeted "+game.diagnosticArgument(self.classname)+" at "+game.vtos(level,self.s.origin)+"\n")
  end if
  self.use = target_teleporter_use; return void
end function

/// Forward `target_relay_use` to `mq3.game.targets.relayUse` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`, `num_entities` and `entities`.
/// @param self Game entity; accesses `spawnflags` and `target`.
/// @param other Value passed as argument 3 to `mq3.game.targets.relayUse`.
/// @param activator Entity responsible for activating the target.
function target_relay_use(level,self,other,activator) return targets.relayUse(level,self,other,activator) end function
/// Set `self.use` to `target_relay_use` in `mq3.game.g_target.SP_target_relay`.
/// @param level Not read by this implementation; retained in the `SP_target_relay` signature.
/// @param self Entity receiving the callback; accesses `use`. May update `self.use` in place.
function SP_target_relay(level,self) self.use = target_relay_use; return void end function
/// Forward `target_kill_use` to `mq3.game.hazards.killUse` and return the delegated result.
/// @param level Game-level state; accesses `intermissionQueued`, `time`, `entities`, `obeliskAttackFn` and `knockback` and related fields.
/// @param self Value passed as argument 2 to `mq3.game.hazards.killUse`.
/// @param other Value passed as argument 3 to `mq3.game.hazards.killUse`.
/// @param activator Entity responsible for activating the target.
function target_kill_use(level,self,other,activator) return hazards.killUse(level,self,other,activator) end function
/// Set `self.use` to `target_kill_use` in `mq3.game.g_target.SP_target_kill`.
/// @param level Not read by this implementation; retained in the `SP_target_kill` signature.
/// @param self Entity receiving the callback; accesses `use`. May update `self.use` in place.
function SP_target_kill(level,self) self.use = target_kill_use; return void end function
/// Apply `mq3.game.entities.setOrigin` while evaluating `SP_target_position`.
/// @param level Not read by this implementation; retained in the `SP_target_position` signature.
/// @param self Entity receiving the callback; accesses `s`.
function SP_target_position(level,self) game.setOrigin(self,self.s.origin); return void end function
/// Forward `target_location_linkup` to `mq3.game.targets.locationLinkup` and return the delegated result.
/// @param level Game-level state; accesses `locationLinked`, `locationHead`, `spawner`, `num_entities` and `entities`. May update `level.locationLinked` and `level.locationHead` in place.
/// @param ent Value passed as argument 2 to `mq3.game.targets.locationLinkup`.
function target_location_linkup(level,ent) return targets.locationLinkup(level,ent) end function
/// Set `self.think` to `target_location_linkup` and `self.nextthink` to `n.add32(level.time,200)` in `mq3.game.g_target.SP_target_location`.
/// @param level Game-level state; accesses `time`.
/// @param self Entity receiving the callback; accesses `think`, `nextthink` and `s`. May update `self.think` and `self.nextthink` in place.
function SP_target_location(level,self)
  self.think = target_location_linkup; self.nextthink = n.add32(level.time,200)
  game.setOrigin(self,self.s.origin); return void
end function
