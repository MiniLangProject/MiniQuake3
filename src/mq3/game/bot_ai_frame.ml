// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ai_main.c BotAIStartFrame scheduling and botlib state delivery.
// Goal selection, view/input generation and server-command interpretation stay
// behind callbacks until the corresponding decision-AI modules are ported.
package mq3.game.bot_ai_frame
import mq3.game.bot_lifecycle as botFrameLifecycle
import mq3.game.playerstate as playerstate
import mq3.game.entitystate as entitystate
import mq3.game.constants as c
import mq3.game.bot_input as botInput
import mq3.game.bot_ai_commands as botCommands
import mq3.compat.numeric as n

const MAX_CLIENTS = 64
const MAX_GENTITIES = 1024
const SVF_NOCLIENT = 1
const SOLID_BBOX = 1
const SOLID_BSP = 2

struct UserCommand
  serverTime
  buttons
  angles
  weapon
  forwardmove
  rightmove
  upmove
end struct

struct Runtime
  botthinkResidual
  lastucmd
end struct

struct BotEntityState
  origin
  angles
  oldOrigin
  mins
  maxs
  type
  flags
  solid
  groundent
  modelindex
  modelindex2
  frame
  event
  eventParm
  powerups
  legsAnim
  torsoAnim
  weapon
end struct

struct Services
  lifecycleState
  runtimes
  localTime
  botlibResidual
  lastBotThinkTime
  regularUpdateTime
  floattime
  checkSpawnFn
  updateCvarFn
  reportFn
  userCommandFn
  botLibVarSetFn
  cvarSetFn
  interbreedFn
  scheduleThinkFn
  botLibStartFrameFn
  aasInitializedFn
  updateEntityFn
  floatTimeFn
  updateEntityItemsFn
  aasTimeFn
  botAiFn
  updateInputFn
  snapshotEntityFn
  commandServices
  inputServices
  fightServices
  seekServices
  context
end struct

function create(state)
  if state == void then return error(498,"Bot AI frame requires lifecycle state") end if
  runtimes = []
  for index = 0 to MAX_CLIENTS-1
    runtimes = runtimes+[Runtime(0,UserCommand(0,0,[0,0,0],0,0,0,0))]
  end for
  services=Services(state,runtimes,0,0,0,0.0,0.0,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
  services.commandServices=botCommands.create(state); services.inputServices=botInput.create(); return services
end function

function need(callback,label)
  if callback == void then return error(498,"Bot AI frame requires "+label) end if
  return callback
end function

function validSlot(slot,limit,label)
  if typeof(slot) != "int" or slot < 0 or slot >= limit then return error(498,"Invalid "+label+" slot") end if
  return slot
end function

function getClientState(level,clientNum)
  validSlot(clientNum,MAX_CLIENTS,"client")
  ent = level.entities[clientNum]
  if not ent.inuse or ent.client == void then return [false,playerstate.create()] end if
  return [true,playerstate.copy(ent.client.ps)]
end function
function commandClientState(services,clientNum)
  return getClientState(services.frameLevel,clientNum)
end function

function getEntityState(level,entityNum)
  validSlot(entityNum,MAX_GENTITIES,"entity")
  ent = level.entities[entityNum]
  if not ent.inuse or not ent.r.linked or (ent.r.svFlags & SVF_NOCLIENT) != 0 then return [false,entitystate.create()] end if
  return [true,entitystate.copy(ent.s)]
end function

function getSnapshotEntity(level,services,clientNum,sequence)
  validSlot(clientNum,MAX_CLIENTS,"client")
  entNum = services.snapshotEntityFn(services,clientNum,sequence)
  if entNum == -1 then return [-1,entitystate.create()] end if
  return [n.add32(sequence,1),getEntityState(level,entNum)[1]]
end function

function botEntity(ent,index)
  angles = ent.r.currentAngles
  if index < MAX_CLIENTS then angles = ent.s.apos.trBase end if
  solid = SOLID_BBOX
  if ent.r.bmodel then solid = SOLID_BSP end if
  return BotEntityState([ent.r.currentOrigin[0],ent.r.currentOrigin[1],ent.r.currentOrigin[2]],
    [angles[0],angles[1],angles[2]],[ent.s.origin2[0],ent.s.origin2[1],ent.s.origin2[2]],
    [ent.r.mins[0],ent.r.mins[1],ent.r.mins[2]],[ent.r.maxs[0],ent.r.maxs[1],ent.r.maxs[2]],
    ent.s.eType,ent.s.eFlags,solid,ent.s.groundEntityNum,ent.s.modelindex,ent.s.modelindex2,
    ent.s.frame,ent.s.event,ent.s.eventParm,ent.s.powerups,ent.s.legsAnim,ent.s.torsoAnim,ent.s.weapon)
end function

function eligibleEntity(ent)
  if not ent.inuse or not ent.r.linked or (ent.r.svFlags & SVF_NOCLIENT) != 0 then return false end if
  if ent.s.eType == c.ET_MISSILE and ent.s.weapon != c.WP_GRAPPLING_HOOK then return false end if
  if ent.s.eType > c.ET_EVENTS then return false end if
  return true
end function

function regularUpdate(services)
  now = services.floatTimeFn(services)
  if services.regularUpdateTime < now then
    services.updateEntityItemsFn(services)
    services.regularUpdateTime = n.fadd(services.floatTimeFn(services),0.3)
  end if
  return void
end function

function activeBot(state,index)
  bot = state.botstates[index]
  return bot != void and bot.inuse
end function

function connected(level,index)
  return level.entities[index].client != void and level.entities[index].client.connected == 2
end function

function startFrame(level,services,time)
  if typeof(time) != "int" then return error(498,"Bot frame time must be an integer") end if
  state = services.lifecycleState
  if services.fightServices!=void then services.commandServices.fightServices=services.fightServices end if
  if services.seekServices!=void then services.commandServices.seekServices=services.seekServices end if
  services.commandServices.frameLevel=level
  if services.commandServices.getClientStateFn==void then services.commandServices.getClientStateFn=commandClientState end if
  services.checkSpawnFn(services)
  for each name in ["bot_rocketjump","bot_grapple","bot_fastchat","bot_nochat","bot_testrchat","bot_thinktime","bot_memorydump","bot_saveroutingcache","bot_pause","bot_report"]
    services.updateCvarFn(services,name)
  end for
  if state.report.integer != 0 then
    if services.reportFn!=void then services.reportFn(services) else botCommands.updateInfoConfigStrings(services.commandServices) end if
  end if
  if state.pause.integer != 0 then
    for index = 0 to MAX_CLIENTS-1
      if not activeBot(state,index) or not connected(level,index) then continue end if
      command = services.runtimes[index].lastucmd
      command.forwardmove = 0; command.rightmove = 0; command.upmove = 0; command.buttons = 0; command.serverTime = time
      services.userCommandFn(services,state.botstates[index].client,command)
    end for
    return true
  end if
  if state.memorydump.integer != 0 then
    services.botLibVarSetFn(services,"memorydump","1")
    services.cvarSetFn(services,"bot_memorydump","0")
  end if
  if state.saveroutingcache.integer != 0 then
    services.botLibVarSetFn(services,"saveroutingcache","1")
    services.cvarSetFn(services,"bot_saveroutingcache","0")
  end if
  services.interbreedFn(services)
  if state.thinktime.integer > 200 then services.cvarSetFn(services,"bot_thinktime","200") end if
  if state.thinktime.integer != services.lastBotThinkTime then
    services.lastBotThinkTime = state.thinktime.integer
    services.scheduleThinkFn(services)
  end if
  elapsed = n.add32(time,0-services.localTime); services.localTime = time
  services.botlibResidual = n.add32(services.botlibResidual,elapsed)
  thinktime = state.thinktime.integer
  if elapsed > thinktime then thinktime = elapsed end if
  if services.botlibResidual >= thinktime then
    services.botlibResidual = n.add32(services.botlibResidual,0-thinktime)
    services.botLibStartFrameFn(services,n.fdiv(time,1000.0))
    if not services.aasInitializedFn(services) then return false end if
    for index = 0 to MAX_GENTITIES-1
      ent = level.entities[index]
      if eligibleEntity(ent) then services.updateEntityFn(services,index,botEntity(ent,index))
      else services.updateEntityFn(services,index,void) end if
    end for
    regularUpdate(services)
  end if
  services.floattime = services.aasTimeFn(services)
  for index = 0 to MAX_CLIENTS-1
    if not activeBot(state,index) then continue end if
    runtime = services.runtimes[index]; runtime.botthinkResidual = n.add32(runtime.botthinkResidual,elapsed)
    if runtime.botthinkResidual >= thinktime then
      runtime.botthinkResidual = n.add32(runtime.botthinkResidual,0-thinktime)
      if not services.aasInitializedFn(services) then return false end if
      if connected(level,index) then
        if services.botAiFn!=void then services.botAiFn(services,index,n.fdiv(thinktime,1000.0))
        else botCommands.botAI(services.commandServices,index,n.fdiv(thinktime,1000.0)) end if
      end if
    end if
  end for
  for index = 0 to MAX_CLIENTS-1
    if not activeBot(state,index) or not connected(level,index) then continue end if
    if services.updateInputFn != void then services.updateInputFn(services,state.botstates[index],services.runtimes[index].lastucmd,time,elapsed)
    else botInput.updateInput(services.inputServices,state.botstates[index],services.runtimes[index].lastucmd,time,elapsed) end if
    services.userCommandFn(services,state.botstates[index].client,services.runtimes[index].lastucmd)
  end for
  return true
end function
