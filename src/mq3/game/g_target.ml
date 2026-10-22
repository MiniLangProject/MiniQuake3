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

function Use_Target_Give(level,ent,other,activator) return mapTargets.giveUse(level,ent,other,activator) end function
function SP_target_give(level,ent) mapTargets.giveSpawn(level,ent); ent.use = Use_Target_Give; return void end function
function Use_target_remove_powerups(level,ent,other,activator) return mapTargets.removePowerupsUse(level,ent,other,activator) end function
function SP_target_remove_powerups(level,ent) mapTargets.removePowerupsSpawn(level,ent); ent.use = Use_target_remove_powerups; return void end function

function Think_Target_Delay(level,ent) return targets.delayThink(level,ent) end function
function Use_Target_Delay(level,ent,other,activator)
  ent.nextthink = targets.delayTime(level,ent); ent.think = Think_Target_Delay; ent.activator = activator; return void
end function
function SP_target_delay(level,ent)
  value = values.getFloat(level.spawner,"delay","0"); ent.wait = value[1]
  if not value[0] then ent.wait = values.getFloat(level.spawner,"wait","1")[1] end if
  if ent.wait == 0 then ent.wait = 1.0 end if
  ent.use = Use_Target_Delay
  return void
end function

function Use_Target_Score(level,ent,other,activator) return mapTargets.scoreUse(level,ent,other,activator) end function
function SP_target_score(level,ent)
  mapTargets.scoreSpawn(level,ent); ent.use = Use_Target_Score; return void
end function
function Use_Target_Print(level,ent,other,activator) return mapTargets.printUse(level,ent,other,activator) end function
function SP_target_print(level,ent)
  mapTargets.printSpawn(level,ent); ent.use = Use_Target_Print; return void
end function

function Use_Target_Speaker(level,ent,other,activator) return targets.speakerUse(level,ent,other,activator) end function
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

function target_laser_think(level,self) return hazards.laserThink(level,self) end function
function target_laser_on(level,self)
  if self.activator == void then self.activator = self end if
  return target_laser_think(level,self)
end function
function target_laser_off(level,self) return hazards.laserOff(level,self) end function
function target_laser_use(level,self,other,activator) return hazards.laserUse(level,self,other,activator) end function
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
function SP_target_laser(level,self)
  self.think = target_laser_start; self.nextthink = n.add32(level.time,100); return void
end function

function target_teleporter_use(level,self,other,activator) return targets.teleporterUse(level,self,other,activator) end function
function SP_target_teleporter(level,self)
  if self.targetname == void then
    game.diagnostic(level,"untargeted "+game.diagnosticArgument(self.classname)+" at "+game.vtos(level,self.s.origin)+"\n")
  end if
  self.use = target_teleporter_use; return void
end function

function target_relay_use(level,self,other,activator) return targets.relayUse(level,self,other,activator) end function
function SP_target_relay(level,self) self.use = target_relay_use; return void end function
function target_kill_use(level,self,other,activator) return hazards.killUse(level,self,other,activator) end function
function SP_target_kill(level,self) self.use = target_kill_use; return void end function
function SP_target_position(level,self) game.setOrigin(self,self.s.origin); return void end function
function target_location_linkup(level,ent) return targets.locationLinkup(level,ent) end function
function SP_target_location(level,self)
  self.think = target_location_linkup; self.nextthink = n.add32(level.time,200)
  game.setOrigin(self,self.s.origin); return void
end function
