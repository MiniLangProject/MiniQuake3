// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 G_RunFrame orchestration. Entity-list diagnostics remain a boundary.
package mq3.game.frame
import mq3.game.entities as game
import mq3.game.spawn_functions as funcs
import mq3.game.constants as c
import mq3.game.g_missile as completeMissiles
import mq3.game.bodies as bodies
import mq3.game.g_items as gItems
import mq3.game.g_mover as gMover
import mq3.game.client_active as clientActive
import mq3.game.client_frame as clientFrame
import mq3.game.scores as scores
import mq3.game.tournament as tournament
import mq3.game.votes as votes
import mq3.game.team_status as teamStatus
import mq3.game.cvar_maintenance as cvarMaintenance
import mq3.game.cvars as cvars
import mq3.game.bot_clients as botClients
import mq3.compat.numeric as n
/// Use `level.runEntityFn` to perform `runEntities`.
/// @param level Game-level state; accesses `num_entities`, `entities`, `time` and `runEntityFn`.
function runEntities(level)
  i = 0
  while i < level.num_entities
    ent = level.entities[i]; slot = i; i = i+1
    if not ent.inuse then continue end if
    if n.i32(level.time-ent.eventTime) > 300 then
      if ent.s.event != 0 then
        ent.s.event = 0
        if ent.client != void then ent.client.ps.externalEvent = 0 end if
      end if
      if ent.freeAfterEvent then game.free(level,ent); continue
      else if ent.unlinkAfterEvent then ent.unlinkAfterEvent = false; game.unlink(level,ent) end if
    end if
    if ent.freeAfterEvent then continue end if
    if not ent.r.linked and ent.neverFree then continue end if
    kind = 0
    if ent.s.eType == c.ET_MISSILE then kind = 1
    else if ent.s.eType == c.ET_ITEM or ent.physicsObject then kind = 2
    else if ent.s.eType == c.ET_MOVER then kind = 3
    else if slot < 64 then kind = 4 end if
    if kind != 0 then
      if kind == 1 and level.runEntityFn == void then completeMissiles.G_RunMissile(level,ent)
      else if kind == 2 and ent.s.eType == c.ET_ITEM and level.runEntityFn == void then gItems.G_RunItem(level,ent)
      else if kind == 2 and ent.s.eType != c.ET_ITEM and ent.classname == "bodyque" and level.runEntityFn == void then bodies.run(level,ent)
      else if kind == 3 and level.runEntityFn == void then gMover.G_RunMover(level,ent)
      else if kind == 4 and level.runEntityFn == void then clientActive.runClient(level,ent)
      else
        if level.runEntityFn == void then return error(488,"Entity frame requires unported item/mover/client handler") end if
        level.runEntityFn(level,kind,ent)
      end if
    else
      funcs.runThink(level,ent)
    end if
  end while
  return void
end function

/// Use `level.frameStageFn` to perform `stage`.
/// @param level Game-level state; accesses `frameStageFn`.
/// @param kind Value passed as argument 2 to `level.frameStageFn`.
/// @param arg Value passed as argument 3 to `level.frameStageFn`.
function stage(level,kind,arg)
  if level.frameStageFn == void then return error(488,"G_RunFrame requires frame maintenance boundaries") end if
  level.frameStageFn(level,kind,arg)
  return void
end function

/// Update `level.framenum`, `level.previousTime` and `level.time` during `run`.
/// @param level Game-level state; accesses `restarted`, `framenum`, `previousTime`, `time` and `updateCvarsFn` and related fields. May update `level.framenum`, `level.previousTime` and `level.time` in place.
/// @param levelTime Current server game time in milliseconds.
function run(level,levelTime)
  if level.restarted then return void end if
  level.framenum = n.add32(level.framenum,1)
  level.previousTime = level.time; level.time = n.i32(levelTime)
  if level.updateCvarsFn != void then level.updateCvarsFn(level) else cvars.update(level) end if
  if level.lifecycleState != void and level.lifecycleState.botClients != void then
    botClients.checkBotSpawn(level,level.lifecycleState.botClients)
  end if
  runEntities(level)

  if level.maxclients < 0 or level.maxclients > 64 then return error(488,"Invalid frame client limit") end if
  index = 0
  while index < level.maxclients
    ent = level.entities[index]; index = index+1
    if ent.inuse then
      if level.clientEndFrameFn != void then level.clientEndFrameFn(level,ent) else clientFrame.endFrame(level,ent) end if
    end if
  end while

  tournament.check(level)
  scores.checkExitRules(level)
  teamStatus.check(level); votes.check(level); votes.checkTeam(level,c.TEAM_RED); votes.checkTeam(level,c.TEAM_BLUE); cvarMaintenance.check(level)
  if level.listEntity != 0 then
    index = 0
    while index < 1024
      stage(level,6,index); index = index+1
    end while
    if level.cvarSetFn == void then return error(488,"Entity listing requires Cvar delivery") end if
    level.cvarSetFn(level,"g_listEntity","0")
  end if
  return void
end function
