// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native ownership/adapter for code/game/ai_main.c.
package mq3.game.ai_main
import mq3.game.bot_lifecycle as lifecycle
import mq3.game.bot_client_resources as clients
import mq3.game.bot_ai_frame as frames
import mq3.game.bot_ai_commands as commands
import mq3.game.bot_input as input
import mq3.compat.numeric as numeric
import mq3.compat.textnumbers as textnumbers
import std.string as strings

const PRT_MESSAGE=1
const PRT_WARNING=2
const PRT_ERROR=3
const PRT_FATAL=4
const PRT_EXIT=5
const GT_TOURNAMENT=1
const MAX_MATCHVARIABLES=8

/// `Action` record for ai main, containing `boundary`, `kind`, `subject`, `detail` and `number` and related fields.
struct Action boundary kind subject detail number dispatched end struct
/// `AreaInfo` record for ai main, containing `cluster`.
struct AreaInfo cluster end struct
/// `SessionGoal` record for ai main, containing `areanum`, `entitynum`, `flags`, `iteminfo` and `number` and related fields.
struct SessionGoal areanum entitynum flags iteminfo number origin mins maxs end struct
/// `SessionData` record for ai main, containing `decisionmaker`, `ltgtype`, `teammate` and `goal`.
struct SessionData decisionmaker ltgtype teammate goal end struct

/// `Services` record for ai main, containing `lifecycleState`, `frameServices`, `clientServices`, `commandServices` and `inputServices` and related fields.
struct Services
  lifecycleState
  frameServices
  clientServices
  commandServices
  inputServices
  sessions
  actions
  retailActive
  printFn
  traceFn
  entityInfoFn
  synonymContextFn
  initialChatFn
  pointAreaFn
  aasInitializedFn
  areaInfoFn
  clientFromNameFn
  exitLevelFn
  sendConsoleCommandFn
  cvarStringFn
  context
end struct

/// Create a `mq3.game.ai_main.SessionGoal` record, initializing `origin` as `[0.0,0.0,0.0]`, `mins` as `[0.0,0.0,0.0]` and `maxs` as `[0.0,0.0,0.0]`.
function emptyGoal() return SessionGoal(0,0,0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
/// Create a `mq3.game.ai_main.SessionData` record, initializing `goal` as `emptyGoal()`.
function emptySession() return SessionData(0,0,0,emptyGoal()) end function
/// Forward `bridgeShutdownClient` to `mq3.game.ai_main.BotAIShutdownClient` and return the delegated result.
/// @param state AI main state; accesses `aiMainServices`.
/// @param client Value passed as argument 1 to `typeof`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
function bridgeShutdownClient(state,client,restart) return BotAIShutdownClient(state.aiMainServices,client,restart) end function
/// Forward `bridgeScheduleFromFrame` to `mq3.game.ai_main.BotScheduleBotThink` and return the delegated result.
/// @param frameServices Frame services record; accesses `lifecycleState`.
function bridgeScheduleFromFrame(frameServices) return BotScheduleBotThink(frameServices.lifecycleState.aiMainServices) end function
/// Forward `bridgeInterbreeding` to `mq3.game.ai_main.BotInterbreeding` and return the delegated result.
/// @param frameServices Frame services record; accesses `lifecycleState`.
function bridgeInterbreeding(frameServices) return BotInterbreeding(frameServices.lifecycleState.aiMainServices) end function
/// Forward `bridgeScheduleFromClient` to `mq3.game.ai_main.BotScheduleBotThink` and return the delegated result.
/// @param clientServices Client services record; accesses `lifecycleState`.
function bridgeScheduleFromClient(clientServices) return BotScheduleBotThink(clientServices.lifecycleState.aiMainServices) end function
/// Forward `bridgeReadSession` to `mq3.game.ai_main.BotReadSessionData` and return the delegated result.
/// @param clientServices Client services record; accesses `lifecycleState`.
/// @param bot Bot AI state; accesses `client`.
function bridgeReadSession(clientServices,bot) return BotReadSessionData(clientServices.lifecycleState.aiMainServices,bot) end function
/// Forward `bridgeWriteSession` to `mq3.game.ai_main.BotWriteSessionData` and return the delegated result.
/// @param clientServices Client services record; accesses `lifecycleState`.
/// @param bot Bot AI state; accesses `client`.
function bridgeWriteSession(clientServices,bot) return BotWriteSessionData(clientServices.lifecycleState.aiMainServices,bot) end function
/// Forward `bridgeBotLibVar` to `mq3.game.bot_lifecycle.botLibVar` and return the delegated result.
/// @param clientServices Client services record; accesses `lifecycleState`.
/// @param name Name used to identify the requested entry.
/// @param value Value passed as argument 3 to `state.botLibVarSetFn`.
function bridgeBotLibVar(clientServices,name,value) return lifecycle.botLibVar(clientServices.lifecycleState,name,value) end function
/// Update `state.clientResources`, `state.aiMainServices` and `state.shutdownClientFn` during `create`.
/// @param state AI main state; accesses `clientResources`, `aiMainServices` and `shutdownClientFn`. May update `state.clientResources`, `state.aiMainServices` and `state.shutdownClientFn` in place.
function create(state)
  if state==void then return error(7910,"ai_main requires bot lifecycle state") end if
  frame=frames.create(state); client=clients.create(state); command=frame.commandServices; inp=frame.inputServices
  sessions=[];for index=0 to lifecycle.MAX_CLIENTS-1 sessions=sessions+[emptySession()] end for
  value=Services(state,frame,client,command,inp,sessions,[],false,void,void,void,void,void,void,void,void,void,void,void,void,void)
  state.clientResources=client;state.aiMainServices=value;state.shutdownClientFn=bridgeShutdownClient
  frame.commandServices=command;frame.inputServices=inp;frame.scheduleThinkFn=bridgeScheduleFromFrame;frame.interbreedFn=bridgeInterbreeding
  client.scheduleThinkFn=bridgeScheduleFromClient;client.readSessionFn=bridgeReadSession;client.writeSessionFn=bridgeWriteSession;client.botLibVarSetFn=bridgeBotLibVar
  return value
end function

/// Set `services.actions` to `services.actions+[event]` in `mq3.game.ai_main.emit`. Return paths include `event`.
/// @param services Host service callbacks; accesses `retailActive` and `actions`. May update `services.actions` in place.
/// @param boundary Initial value stored in `mq3.game.ai_main.Action.boundary`.
/// @param kind Initial value stored in `mq3.game.ai_main.Action.kind`.
/// @param subject Initial value stored in `mq3.game.ai_main.Action.subject`.
/// @param detail Initial value stored in `mq3.game.ai_main.Action.detail`.
/// @param number Initial value stored in `mq3.game.ai_main.Action.number`.
function emit(services,boundary,kind,subject,detail,number)
  dispatched=not services.retailActive;event=Action(boundary,kind,subject,detail,number,dispatched);services.actions=services.actions+[event];return event
end function
/// Require a bot AI callback and report the missing service name when absent.
/// @param callback Callback invoked by this operation.
/// @param label Label retained with the diagnostic or action record.
function need(callback,label) if callback==void then return error(7910,"ai_main requires "+label) end if;return callback end function
/// Validate the client slot and return an active bot state, or void when the slot has no active bot.
/// @param services Host service callbacks; accesses `lifecycleState`.
/// @param client Value passed as argument 1 to `typeof`.
function validBot(services,client)
  if typeof(client)!="int" or client<0 or client>=lifecycle.MAX_CLIENTS then return error(7910,"invalid bot client") end if
  bot=services.lifecycleState.botstates[client];if bot==void or not bot.inuse then return void end if;return bot
end function

// Botlib import boundaries from the first section of ai_main.c.
/// @param services Host service callbacks; accesses `printFn`.
/// @param type Initial value stored in `mq3.game.ai_main.Action.number`.
/// @param message Message text supplied to the diagnostic or chat operation.
function BotAI_Print(services,type,message)
  kind="message";if type==PRT_WARNING then kind="warning" else if type==PRT_ERROR then kind="error" else if type==PRT_FATAL then kind="fatal" else if type==PRT_EXIT then kind="exit" end if
  event=emit(services,"print",kind,-1,message,type)
  if event.dispatched then need(services.printFn,"print/error host")(services,type,message) end if
  return void
end function
/// Record or dispatch `"trace"` actions in `BotAI_Trace`. Return paths include `need(services.traceFn,"trace host")(services,start,mins,maxs,traceEnd,passent,contentmask)`.
/// @param services Host service callbacks; accesses `traceFn`.
/// @param start Operand used to evaluate the returned expression `need(services.traceFn,"trace host")(services,start,mins,maxs,traceEnd,passent,contentmask)`.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param traceEnd Operand used to evaluate the returned expression `need(services.traceFn,"trace host")(services,start,mins,maxs,traceEnd,passent,contentmask)`.
/// @param passent Initial value stored in `mq3.game.ai_main.Action.subject`.
/// @param contentmask Initial value stored in `mq3.game.ai_main.Action.number`.
function BotAI_Trace(services,start,mins,maxs,traceEnd,passent,contentmask)
  event=emit(services,"trace","box",passent,"",contentmask)
  if not event.dispatched then return void end if
  return need(services.traceFn,"trace host")(services,start,mins,maxs,traceEnd,passent,contentmask)
end function
/// Forward `BotAI_GetClientState` to `mq3.game.bot_ai_frame.getClientState` and return the delegated result.
/// @param services Host service callbacks; accesses `frameServices`.
/// @param clientNum Client slot number.
function BotAI_GetClientState(services,clientNum) return frames.getClientState(services.frameServices.frameLevel,clientNum) end function
/// Forward `BotAI_GetEntityState` to `mq3.game.bot_ai_frame.getEntityState` and return the delegated result.
/// @param services Host service callbacks; accesses `frameServices`.
/// @param entityNum Entity number in the game or AAS entity table.
function BotAI_GetEntityState(services,entityNum) return frames.getEntityState(services.frameServices.frameLevel,entityNum) end function
/// Forward `BotAI_GetSnapshotEntity` to `mq3.game.bot_ai_frame.getSnapshotEntity` and return the delegated result.
/// @param services Host service callbacks; accesses `frameServices`.
/// @param clientNum Client slot number.
/// @param sequence Value passed as argument 3 to `services.snapshotEntityFn`.
function BotAI_GetSnapshotEntity(services,clientNum,sequence) return frames.getSnapshotEntity(services.frameServices.frameLevel,services.frameServices,clientNum,sequence) end function
/// Record or dispatch `"chat"` actions in `BotAI_BotInitialChat`.
/// @param services Host service callbacks; accesses `synonymContextFn` and `initialChatFn`.
/// @param bot Bot AI state; accesses `client` and `cs`.
/// @param type Initial value stored in `mq3.game.ai_main.Action.detail`.
/// @param variables Chat substitution values in their numbered slots.
function BotAI_BotInitialChat(services,bot,type,variables)
  vars=[];for index=0 to MAX_MATCHVARIABLES-1 if index<len(variables) then vars=vars+[variables[index]] else vars=vars+[void] end if end for
  context=need(services.synonymContextFn,"BotSynonymContext")(services,bot)
  event=emit(services,"chat","initial",bot.client,type,context)
  if event.dispatched then need(services.initialChatFn,"BotInitialChat")(services,bot.cs,type,context,vars) end if
  return void
end function
/// Apply `mq3.game.bot_lifecycle.updateCvar`, `mq3.game.ai_main.need` and `mq3.game.ai_main.BotAI_Print` while evaluating `BotTestAAS`.
/// @param services Host service callbacks; accesses `lifecycleState`, `aasInitializedFn`, `pointAreaFn` and `areaInfoFn`.
/// @param origin World-space position as three coordinates.
function BotTestAAS(services,origin)
  lifecycle.updateCvar(services.lifecycleState,services.lifecycleState.testsolid,"bot_testsolid")
  lifecycle.updateCvar(services.lifecycleState,services.lifecycleState.testclusters,"bot_testclusters")
  if services.lifecycleState.testsolid.integer!=0 then
    if not need(services.aasInitializedFn,"AAS_Initialized")(services) then return void end if
    area=need(services.pointAreaFn,"BotPointAreaNum")(services,origin)
    if area!=0 then BotAI_Print(services,PRT_MESSAGE,"\remtpy area") else BotAI_Print(services,PRT_MESSAGE,"\r^1SOLID area") end if
  else if services.lifecycleState.testclusters.integer!=0 then
    if not need(services.aasInitializedFn,"AAS_Initialized")(services) then return void end if
    area=need(services.pointAreaFn,"BotPointAreaNum")(services,origin)
    if area==0 then BotAI_Print(services,PRT_MESSAGE,"\r^1Solid!                              ")
    else info=need(services.areaInfoFn,"AAS_AreaInfo")(services,area);BotAI_Print(services,PRT_MESSAGE,"\rarea "+str(area)+", cluster "+str(info.cluster)+"       ") end if
  end if
  return void
end function

// Direct native ownership delegates to the already isolated ai_main sections.
/// @param text Text to parse, format or deliver.
function RemoveColorEscapeSequences(text) return commands.removeColorEscapeSequences(text) end function
/// Forward `BotReportStatus` to `mq3.game.bot_ai_commands.reportStatus` and return the delegated result.
/// @param services Host service callbacks; accesses `commandServices`.
/// @param bot Bot AI state; accesses `gs` and `client`.
function BotReportStatus(services,bot) return commands.reportStatus(services.commandServices,bot) end function
/// Forward `BotSetInfoConfigString` to `mq3.game.bot_ai_commands.setInfoConfigString` and return the delegated result.
/// @param services Host service callbacks; accesses `commandServices`.
/// @param bot Bot AI state; accesses `gs` and `client`.
function BotSetInfoConfigString(services,bot) return commands.setInfoConfigString(services.commandServices,bot) end function
/// Forward `BotUpdateInfoConfigStrings` to `mq3.game.bot_ai_commands.updateInfoConfigStrings` and return the delegated result.
/// @param services Host service callbacks; accesses `commandServices`.
function BotUpdateInfoConfigStrings(services) return commands.updateInfoConfigStrings(services.commandServices) end function
/// Forward `BotTeamplayReport` to `mq3.game.bot_ai_commands.teamplayReport` and return the delegated result.
/// @param services Host service callbacks; accesses `commandServices`.
function BotTeamplayReport(services) return commands.teamplayReport(services.commandServices) end function
/// Forward `BotAI` to `mq3.game.bot_ai_commands.botAI` and return the delegated result.
/// @param services Host service callbacks; accesses `commandServices`.
/// @param client Value passed as argument 2 to `services.resetInputFn`.
/// @param thinktime Bot thinking interval in seconds.
function BotAI(services,client,thinktime) return commands.botAI(services.commandServices,client,thinktime) end function
/// Forward `AngleDifference` to `mq3.game.bot_input.angleDifference` and return the delegated result.
/// @param ang1 Value passed as argument 1 to `mq3.compat.numeric.fsub`.
/// @param ang2 Value passed as argument 2 to `mq3.compat.numeric.fsub`.
function AngleDifference(ang1,ang2) return input.angleDifference(ang1,ang2) end function
/// Forward `BotChangeViewAngle` to `mq3.game.bot_input.changeViewAngle` and return the delegated result.
/// @param angle Value passed as argument 1 to `mq3.shared.math.AngleNormalize360`.
/// @param ideal Value passed as argument 1 to `mq3.shared.math.AngleNormalize360`.
/// @param speed Requested movement speed.
function BotChangeViewAngle(angle,ideal,speed) return input.changeViewAngle(angle,ideal,speed) end function
/// Forward `BotChangeViewAngles` to `mq3.game.bot_input.changeViewAngles` and return the delegated result.
/// @param services Host service callbacks; accesses `inputServices`.
/// @param bot Bot AI state; accesses `idealViewangles`, `enemy`, `character`, `viewangles` and `viewanglespeed` and related fields. May update `bot.idealViewangles[0]`, `bot.viewangles[axis]` and `bot.idealViewangles[axis]` and additional fields in place.
/// @param thinktime Bot thinking interval in seconds.
function BotChangeViewAngles(services,bot,thinktime) return input.changeViewAngles(services.inputServices,bot,thinktime) end function
/// Forward `BotInputToUserCommand` to `mq3.game.bot_input.inputToUserCommand` and return the delegated result.
/// @param botInput Input record; accesses `actionflags`, `weapon`, `viewangles`, `dir` and `speed`. May update `botInput.actionflags` and `botInput.speed` in place.
/// @param command Command record; accesses `serverTime`, `buttons`, `angles`, `weapon` and `forwardmove` and related fields. May update `command.serverTime`, `command.buttons` and `command.angles` and additional fields in place.
/// @param deltaAngles Array or byte sequence accessed at `axis`.
/// @param time Time value in the units expected by this module.
function BotInputToUserCommand(botInput,command,deltaAngles,time) return input.inputToUserCommand(botInput,command,deltaAngles,time) end function
/// Forward `BotUpdateInput` to `mq3.game.bot_input.updateInput` and return the delegated result.
/// @param services Host service callbacks; accesses `inputServices`.
/// @param bot Bot AI state; accesses `viewangles`, `curPs` and `client`. May update `bot.viewangles[axis]` in place.
/// @param command Command record; accesses `buttons`.
/// @param time Time value in the units expected by this module.
/// @param elapsed Value passed as argument 1 to `mq3.compat.numeric.fdiv`.
function BotUpdateInput(services,bot,command,time,elapsed) return input.updateInput(services.inputServices,bot,command,time,elapsed) end function
/// Forward `BotAIRegularUpdate` to `mq3.game.bot_ai_frame.regularUpdate` and return the delegated result.
/// @param services Host service callbacks; accesses `frameServices`.
function BotAIRegularUpdate(services) return frames.regularUpdate(services.frameServices) end function
/// Set `services.frameServices.frameLevel` to `level` in `mq3.game.ai_main.BotAIStartFrame`. Return paths include `frames.startFrame(level,services.frameServices,time)`.
/// @param services Host service callbacks; accesses `frameServices`. May update `services.frameServices.frameLevel` in place.
/// @param level Game-level state; accesses `entities`.
/// @param time Time value in the units expected by this module.
function BotAIStartFrame(services,level,time) services.frameServices.frameLevel=level;return frames.startFrame(level,services.frameServices,time) end function
/// Forward `BotInitLibrary` to `mq3.game.bot_lifecycle.initLibrary` and return the delegated result.
/// @param services Host service callbacks; accesses `lifecycleState`.
function BotInitLibrary(services) return lifecycle.initLibrary(services.lifecycleState) end function
/// Forward `BotAISetup` to `mq3.game.bot_lifecycle.setup` and return the delegated result.
/// @param services Host service callbacks; accesses `lifecycleState`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
function BotAISetup(services,restart) return lifecycle.setup(services.lifecycleState,restart) end function
/// Forward `BotResetState` to `mq3.game.bot_lifecycle.resetState` and return the delegated result.
/// @param services Host service callbacks; accesses `lifecycleState`.
/// @param bot Bot AI state; accesses `checkpoints`, `patrolpoints`, `setupcount`, `walker` and `numKills` and related fields. May update `bot.setupcount`, `bot.checkpoints` and `bot.patrolpoints` and additional fields in place.
function BotResetState(services,bot) return lifecycle.resetState(services.lifecycleState,bot) end function
/// Forward `BotAILoadMap` to `mq3.game.bot_lifecycle.loadMap` and return the delegated result.
/// @param services Host service callbacks; accesses `lifecycleState`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
function BotAILoadMap(services,restart) return lifecycle.loadMap(services.lifecycleState,restart) end function
/// Forward `BotAIShutdown` to `mq3.game.bot_lifecycle.shutdown` and return the delegated result.
/// @param services Host service callbacks; accesses `lifecycleState`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
function BotAIShutdown(services,restart) return lifecycle.shutdown(services.lifecycleState,restart) end function
/// Forward `BotAISetupClient` to `mq3.game.bot_client_resources.setupClient` and return the delegated result.
/// @param services Host service callbacks; accesses `clientServices`.
/// @param client Value passed as argument 1 to `typeof`.
/// @param settings Settings record; accesses `characterfile`, `skill` and `team`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
function BotAISetupClient(services,client,settings,restart) return clients.setupClient(services.clientServices,client,settings,restart) end function
/// Forward `BotAIShutdownClient` to `mq3.game.bot_client_resources.shutdownClient` and return the delegated result.
/// @param services Host service callbacks; accesses `clientServices`.
/// @param client Value passed as argument 1 to `typeof`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
function BotAIShutdownClient(services,client,restart) return clients.shutdownClient(services.clientServices,client,restart) end function
/// Forward `BotInterbreedBots` to `mq3.game.bot_lifecycle.interbreedBots` and return the delegated result.
/// @param services Host service callbacks; accesses `lifecycleState`.
function BotInterbreedBots(services) return lifecycle.interbreedBots(services.lifecycleState) end function
/// Forward `BotWriteInterbreeded` to `mq3.game.bot_lifecycle.writeInterbreeded` and return the delegated result.
/// @param services Host service callbacks; accesses `lifecycleState`.
/// @param filename Filename supplied to the configured loader or file service.
function BotWriteInterbreeded(services,filename) return lifecycle.writeInterbreeded(services.lifecycleState,filename) end function
/// Forward `BotInterbreedEndMatch` to `mq3.game.bot_lifecycle.endMatch` and return the delegated result.
/// @param services Host service callbacks; accesses `lifecycleState`.
function BotInterbreedEndMatch(services) return lifecycle.endMatch(services.lifecycleState) end function

/// Record or dispatch `"game"` and `"console"` actions in `BotInterbreeding`.
/// @param services Host service callbacks; accesses `lifecycleState`, `commandServices`, `exitLevelFn` and `sendConsoleCommandFn`.
function BotInterbreeding(services)
  state=services.lifecycleState;lifecycle.updateCvar(state,state.interbreedchar,"bot_interbreedchar")
  if state.interbreedchar.string=="" then return false end if
  if services.commandServices.gametype!=GT_TOURNAMENT then
    lifecycle.setCvar(state,"g_gametype",str(GT_TOURNAMENT));event=emit(services,"game","exit-level",-1,"tournament",GT_TOURNAMENT)
    if event.dispatched then need(services.exitLevelFn,"ExitLevel")(services) end if;return false
  end if
  for index=0 to lifecycle.MAX_CLIENTS-1 bot=state.botstates[index];if bot!=void and bot.inuse then BotAIShutdownClient(services,bot.client,0) end if end for
  lifecycle.botLibVar(state,"bot_reloadcharacters","1")
  for index=0 to state.interbreedbots.integer-1
    command="addbot "+state.interbreedchar.string+" 4 free "+str(index*50)+" "+state.interbreedchar.string+str(index)+"\n"
    event=emit(services,"console","insert",index,command,index*50);if event.dispatched then need(services.sendConsoleCommandFn,"SendConsoleCommand")(services,command) end if
  end for
  lifecycle.setCvar(state,"bot_interbreedchar","");state.interbreed=true;return true
end function

/// Record or dispatch `"aas"` actions in `BotEntityInfo`. Return paths include `need(services.entityInfoFn,"AAS_EntityInfo")(services,entnum)`.
/// @param services Host service callbacks; accesses `entityInfoFn`.
/// @param entnum Entity number in the game or AAS entity table.
function BotEntityInfo(services,entnum)
  event=emit(services,"aas","entity-info",entnum,"",0);if not event.dispatched then return void end if
  return need(services.entityInfoFn,"AAS_EntityInfo")(services,entnum)
end function
/// Return `services.lifecycleState.numbots` for `NumBots`.
/// @param services Host service callbacks; accesses `lifecycleState`.
function NumBots(services) return services.lifecycleState.numbots end function
/// Apply `mq3.game.ai_main.need` while evaluating `BotTeamLeader`. Return paths include `other!=void and other.inuse`.
/// @param services Host service callbacks; accesses `clientFromNameFn` and `lifecycleState`.
/// @param bot Bot AI state; accesses `teamleader`.
function BotTeamLeader(services,bot)
  leader=need(services.clientFromNameFn,"ClientFromName")(services,bot.teamleader)
  if leader<0 or leader>=lifecycle.MAX_CLIENTS then return false end if
  other=services.lifecycleState.botstates[leader];return other!=void and other.inuse
end function
/// Set `services.frameServices.runtimes[index].botthinkResidual` to `numeric.trunc32(state.thinktime.integer*botnum/state.numbots)` in `mq3.game.ai_main.BotScheduleBotThink`. Return paths include `botnum`.
/// @param services Host service callbacks; accesses `lifecycleState` and `frameServices`. May update `services.frameServices.runtimes[index].botthinkResidual` in place.
function BotScheduleBotThink(services)
  state=services.lifecycleState;if state.numbots<=0 then return 0 end if;botnum=0
  for index=0 to lifecycle.MAX_CLIENTS-1
    bot=state.botstates[index];if bot==void or not bot.inuse then continue end if
    services.frameServices.runtimes[index].botthinkResidual=numeric.trunc32(state.thinktime.integer*botnum/state.numbots);botnum=botnum+1
  end for
  return botnum
end function

/// Serialize persistent bot task and goal state as the ordered space-separated session fields.
/// @param data Data record; accesses `goal`, `decisionmaker`, `ltgtype` and `teammate`.
function sessionText(data)
  goal=data.goal
  return str(data.decisionmaker)+" "+str(data.ltgtype)+" "+str(data.teammate)+" "+str(goal.areanum)+" "+str(goal.entitynum)+" "+str(goal.flags)+" "+str(goal.iteminfo)+" "+str(goal.number)+" "+textnumbers.fixed6(goal.origin[0])+" "+textnumbers.fixed6(goal.origin[1])+" "+textnumbers.fixed6(goal.origin[2])+" "+textnumbers.fixed6(goal.mins[0])+" "+textnumbers.fixed6(goal.mins[1])+" "+textnumbers.fixed6(goal.mins[2])+" "+textnumbers.fixed6(goal.maxs[0])+" "+textnumbers.fixed6(goal.maxs[1])+" "+textnumbers.fixed6(goal.maxs[2])
end function
/// Build the `mq3.game.ai_main.SessionData` result for `parseSession`. Return paths include `SessionData(toNumber(parts[0]),toNumber(parts[1]),toNumber(parts[2]),goal)`.
/// @param text Text to parse, format or deliver.
function parseSession(text)
  raw=strings.split(strings.trim(text)," ");parts=[];for each value in raw if value!="" then parts=parts+[value] end if end for
  if len(parts)<17 then return emptySession() end if
  goal=SessionGoal(toNumber(parts[3]),toNumber(parts[4]),toNumber(parts[5]),toNumber(parts[6]),toNumber(parts[7]),[toNumber(parts[8]),toNumber(parts[9]),toNumber(parts[10])],[toNumber(parts[11]),toNumber(parts[12]),toNumber(parts[13])],[toNumber(parts[14]),toNumber(parts[15]),toNumber(parts[16])])
  return SessionData(toNumber(parts[0]),toNumber(parts[1]),toNumber(parts[2]),goal)
end function
/// Apply `mq3.game.ai_main.sessionText` and `mq3.game.bot_lifecycle.setCvar` while evaluating `BotWriteSessionData`. Return paths include `text`.
/// @param services Host service callbacks; accesses `sessions` and `lifecycleState`.
/// @param bot Bot AI state; accesses `client`.
function BotWriteSessionData(services,bot)
  data=services.sessions[bot.client];text=sessionText(data);name="botsession"+str(bot.client);lifecycle.setCvar(services.lifecycleState,name,text);return text
end function
/// Set `services.sessions[bot.client]` to `data` in `mq3.game.ai_main.BotReadSessionData`. Return paths include `data`.
/// @param services Host service callbacks; accesses `cvarStringFn`, `lifecycleState` and `sessions`. May update `services.sessions[bot.client]` in place.
/// @param bot Bot AI state; accesses `client`.
function BotReadSessionData(services,bot)
  name="botsession"+str(bot.client);text="";if services.cvarStringFn!=void then text=services.cvarStringFn(services,name) else text=lifecycle.queryCvar(services.lifecycleState,name,1024) end if
  data=parseSession(text);services.sessions[bot.client]=data;return data
end function

