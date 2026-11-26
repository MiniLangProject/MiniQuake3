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

/// Maximum number of client slots represented by the original game protocol.
const MAX_CLIENTS = 64
/// Maximum number of entity slots represented by the original game protocol.
const MAX_GENTITIES = 1024
/// Server entity-flag bit controlling noclient.
const SVF_NOCLIENT = 1
/// Bot entity-solid category indicating an explicit bounding box.
const SOLID_BBOX = 1
/// Bot entity-solid category indicating a BSP brush model.
const SOLID_BSP = 2

/// `UserCommand` record for bot ai frame, containing `serverTime`, `buttons`, `angles`, `weapon` and `forwardmove` and related fields.
struct UserCommand
  /// Server timestamp carried by the current user command.
  serverTime
  /// Button bits from the current user command.
  buttons
  /// Orientation angles used by the entity or movement operation.
  angles
  /// Selected or reported weapon identifier.
  weapon
  /// Requested forward/backward movement component.
  forwardmove
  /// Requested right/left movement component.
  rightmove
  /// Requested upward/downward movement component.
  upmove
end struct

/// `Runtime` record for bot ai frame, containing `botthinkResidual` and `lastucmd`.
struct Runtime
  /// Accumulated time not yet consumed by a bot thinking step.
  botthinkResidual
  /// User command generated or observed during the preceding bot frame.
  lastucmd
end struct

/// `BotEntityState` record for bot ai frame, containing `origin`, `angles`, `oldOrigin`, `mins` and `maxs` and related fields.
struct BotEntityState
  /// Entity world-space position sent to botlib during the AI frame update.
  origin
  /// Orientation angles used by the entity or movement operation.
  angles
  /// Previously recorded origin, used to compare or interpolate movement.
  oldOrigin
  /// Lower local entity bound sent to botlib during the AI frame update.
  mins
  /// Upper local entity bound sent to botlib during the AI frame update.
  maxs
  /// Entity category forwarded to botlib world-state updates.
  type
  /// Entity flags forwarded to botlib world-state updates.
  flags
  /// Encoded collision representation advertised by the entity state.
  solid
  /// Entity identifier currently supporting the bot or movement state.
  groundent
  /// Primary model index referenced by the entity snapshot.
  modelindex
  /// Secondary model index referenced by the entity snapshot.
  modelindex2
  /// Model animation frame forwarded to botlib.
  frame
  /// Transient event identifier associated with the entity or snapshot.
  event
  /// Parameter accompanying the current entity event.
  eventParm
  /// Powerup state or expiration values indexed by PW_* identifiers.
  powerups
  /// Leg-animation identifier including its restart toggle bit.
  legsAnim
  /// Torso-animation identifier including its restart toggle bit.
  torsoAnim
  /// Selected or reported weapon identifier.
  weapon
end struct

/// `Services` record for bot ai frame, containing `lifecycleState`, `runtimes`, `localTime`, `botlibResidual` and `lastBotThinkTime` and related fields.
struct Services
  /// State shared by bot allocation, setup, shutdown, and frame processing.
  lifecycleState
  /// Runtime instances used to execute bot decision logic.
  runtimes
  /// Local clock value maintained by the bot runtime adapter.
  localTime
  /// Accumulated time not yet consumed by a botlib update.
  botlibResidual
  /// Timestamp at which bot thinking last ran.
  lastBotThinkTime
  /// Deadline for the next periodic bot-state update.
  regularUpdateTime
  /// Current game time represented in seconds for botlib/AI calculations.
  floattime
  /// Injected callback for check spawn; invoked through the Services service/state record.
  checkSpawnFn
  /// Injected callback for update console variable; invoked through the Services service/state record.
  updateCvarFn
  /// Injected callback for report; invoked through the Services service/state record.
  reportFn
  /// Injected callback for user command; invoked through the Services service/state record.
  userCommandFn
  /// Injected callback for bot lib var set; invoked through the Services service/state record.
  botLibVarSetFn
  /// Injected callback for console variable set; invoked through the Services service/state record.
  cvarSetFn
  /// Injected callback for interbreed; invoked through the Services service/state record.
  interbreedFn
  /// Injected callback for schedule think; invoked through the Services service/state record.
  scheduleThinkFn
  /// Injected callback for bot lib start frame; invoked through the Services service/state record.
  botLibStartFrameFn
  /// Injected callback for AAS initialized; invoked through the Services service/state record.
  aasInitializedFn
  /// Injected callback for update entity; invoked through the Services service/state record.
  updateEntityFn
  /// Injected callback for float time; invoked through the Services service/state record.
  floatTimeFn
  /// Injected callback for update entity items; invoked through the Services service/state record.
  updateEntityItemsFn
  /// Injected callback for AAS time; invoked through the Services service/state record.
  aasTimeFn
  /// Injected callback for bot ai; invoked through the Services service/state record.
  botAiFn
  /// Injected callback for update input; invoked through the Services service/state record.
  updateInputFn
  /// Injected callback for snapshot entity; invoked through the Services service/state record.
  snapshotEntityFn
  /// Callbacks used to deliver or process game commands.
  commandServices
  /// Callbacks used to translate bot decisions into input commands.
  inputServices
  /// Callbacks and shared state used by the bot fight node.
  fightServices
  /// Callbacks used by the bot seek/goal-acquisition node.
  seekServices
  /// Opaque caller-supplied context available to bot frame scheduling, entity updates, clock, and
  /// user-command callbacks.
  context
end struct

/// Apply `mq3.game.bot_ai_commands.create` and `mq3.game.bot_input.create` while evaluating `create`. Return paths include `services`.
/// @param state Initial value stored in `mq3.game.bot_ai_frame.Services.lifecycleState`.
function create(state)
  if state == void then return error(498,"Bot AI frame requires lifecycle state") end if
  runtimes = []
  for index = 0 to MAX_CLIENTS-1
    runtimes = runtimes+[Runtime(0,UserCommand(0,0,[0,0,0],0,0,0,0))]
  end for
  services=Services(state,runtimes,0,0,0,0.0,0.0,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
  services.commandServices=botCommands.create(state); services.inputServices=botInput.create(); return services
end function

/// Require a bot frame service callback and identify a missing service in the resulting error.
/// @param callback Callback invoked by this operation.
/// @param label Label retained with the diagnostic or action record.
function need(callback,label)
  if callback == void then return error(498,"Bot AI frame requires "+label) end if
  return callback
end function

/// Require an integer bot-frame slot within the specified table limit.
/// @param slot Slot in the owning table or pool.
/// @param limit Value used by `validSlot` in `if typeof(slot) != "int" or slot < 0 or slot >= limit then return error(498,"Invalid "+label+" slot") end if`.
/// @param label Label retained with the diagnostic or action record.
function validSlot(slot,limit,label)
  if typeof(slot) != "int" or slot < 0 or slot >= limit then return error(498,"Invalid "+label+" slot") end if
  return slot
end function

/// Apply `mq3.game.bot_ai_frame.validSlot`, `mq3.game.playerstate.create` and `mq3.game.playerstate.copy` while evaluating `getClientState`. Return paths include `[true,playerstate.copy(ent.client.ps)]`.
/// @param level Game-level state; accesses `entities`.
/// @param clientNum Client slot number.
function getClientState(level,clientNum)
  validSlot(clientNum,MAX_CLIENTS,"client")
  ent = level.entities[clientNum]
  if not ent.inuse or ent.client == void then return [false,playerstate.create()] end if
  return [true,playerstate.copy(ent.client.ps)]
end function
/// Forward `commandClientState` to `mq3.game.bot_ai_frame.getClientState` and return the delegated result.
/// @param services Host service callbacks; accesses `frameLevel`.
/// @param clientNum Client slot number.
function commandClientState(services,clientNum)
  return getClientState(services.frameLevel,clientNum)
end function

/// Apply `mq3.game.bot_ai_frame.validSlot`, `mq3.game.entitystate.create` and `mq3.game.entitystate.copy` while evaluating `getEntityState`. Return paths include `[true,entitystate.copy(ent.s)]`.
/// @param level Game-level state; accesses `entities`.
/// @param entityNum Entity number in the game or AAS entity table.
function getEntityState(level,entityNum)
  validSlot(entityNum,MAX_GENTITIES,"entity")
  ent = level.entities[entityNum]
  if not ent.inuse or not ent.r.linked or (ent.r.svFlags & SVF_NOCLIENT) != 0 then return [false,entitystate.create()] end if
  return [true,entitystate.copy(ent.s)]
end function

/// Use `services.snapshotEntityFn` to perform `getSnapshotEntity`. Return paths include `[n.add32(sequence,1),getEntityState(level,entNum)[1]]`.
/// @param level Game-level state; accesses `entities`.
/// @param services Host service callbacks; accesses `snapshotEntityFn`.
/// @param clientNum Client slot number.
/// @param sequence Value passed as argument 3 to `services.snapshotEntityFn`.
function getSnapshotEntity(level,services,clientNum,sequence)
  validSlot(clientNum,MAX_CLIENTS,"client")
  entNum = services.snapshotEntityFn(services,clientNum,sequence)
  if entNum == -1 then return [-1,entitystate.create()] end if
  return [n.add32(sequence,1),getEntityState(level,entNum)[1]]
end function

/// Build the `mq3.game.bot_ai_frame.BotEntityState` result for `botEntity`.
/// @param ent Game entity; accesses `r` and `s`.
/// @param index Index of the entry to access.
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

/// Select linked, client-visible entities for bot perception, excluding ordinary missiles and event-only entities.
/// @param ent Game entity; accesses `inuse`, `r` and `s`.
function eligibleEntity(ent)
  if not ent.inuse or not ent.r.linked or (ent.r.svFlags & SVF_NOCLIENT) != 0 then return false end if
  if ent.s.eType == c.ET_MISSILE and ent.s.weapon != c.WP_GRAPPLING_HOOK then return false end if
  if ent.s.eType > c.ET_EVENTS then return false end if
  return true
end function

/// Set `services.regularUpdateTime` to `n.fadd(services.floatTimeFn(services),0.3)` in `mq3.game.bot_ai_frame.regularUpdate`.
/// @param services Host service callbacks; accesses `floatTimeFn`, `regularUpdateTime` and `updateEntityItemsFn`. May update `services.regularUpdateTime` in place.
function regularUpdate(services)
  now = services.floatTimeFn(services)
  if services.regularUpdateTime < now then
    services.updateEntityItemsFn(services)
    services.regularUpdateTime = n.fadd(services.floatTimeFn(services),0.3)
  end if
  return void
end function

/// Check whether the selected bot-state entry exists and is marked in use.
/// @param state Bot AI frame state; accesses `botstates`.
/// @param index Index of the entry to access.
function activeBot(state,index)
  bot = state.botstates[index]
  return bot != void and bot.inuse
end function

/// Test `level.entities[index].client != void and level.entities[index].client.connected == 2` as the condition for `connected`.
/// @param level Game-level state; accesses `entities`.
/// @param index Index of the entry to access.
function connected(level,index)
  return level.entities[index].client != void and level.entities[index].client.connected == 2
end function

/// Update `services.commandServices.fightServices`, `services.commandServices.seekServices`, `services.commandServices.frameLevel` and `services.commandServices.getClientStateFn` and related state during `startFrame`.
/// @param level Game-level state; accesses `entities`.
/// @param services Host service callbacks; accesses `lifecycleState`, `fightServices`, `commandServices`, `seekServices` and `checkSpawnFn` and related fields. May update `services.commandServices.fightServices`, `services.commandServices.seekServices` and `services.commandServices.frameLevel` and additional fields in place.
/// @param time Time value in the units expected by this module.
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
