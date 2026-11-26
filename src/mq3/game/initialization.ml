// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 G_FindTeams groups item entities and multipart movers after spawning.
package mq3.game.initialization
import mq3.shared.info as initializationInfo

/// Use `level.gamePrintFn` to perform `findTeams`.
/// @param level Game-level state; accesses `num_entities`, `entities` and `gamePrintFn`.
function findTeams(level)
  if level.num_entities < 0 or level.num_entities > 1024 then return error(485,"FindTeams entity range exceeds original storage") end if
  teams = 0; members = 0; index = 1
  while index < level.num_entities
    master = level.entities[index]; index = index+1
    if not master.inuse or master.team == void or (master.flags & 0x400) != 0 then continue end if
    initializationInfo.textBytes(master.team)
    master.teammaster = master; teams = teams+1; members = members+1
    other = index
    while other < level.num_entities
      slave = level.entities[other]; other = other+1
      if not slave.inuse or slave.team == void or (slave.flags & 0x400) != 0 then continue end if
      initializationInfo.textBytes(slave.team)
      if master.team == slave.team then
        members = members+1; slave.teamchain = master.teamchain; master.teamchain = slave
        slave.teammaster = master; slave.flags = slave.flags | 0x400
        if slave.targetname != void then master.targetname = slave.targetname; slave.targetname = void end if
      end if
    end while
  end while
  if level.gamePrintFn == void then return error(485,"FindTeams requires game diagnostic delivery") end if
  level.gamePrintFn(level,str(teams)+" teams with "+str(members)+" entities\n"); return void
end function
