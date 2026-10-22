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

struct Action boundary kind subject detail number dispatched end struct
struct AreaInfo cluster end struct
struct SessionGoal areanum entitynum flags iteminfo number origin mins maxs end struct
struct SessionData decisionmaker ltgtype teammate goal end struct

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

function emptyGoal() return SessionGoal(0,0,0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
function emptySession() return SessionData(0,0,0,emptyGoal()) end function
function bridgeShutdownClient(state,client,restart) return BotAIShutdownClient(state.aiMainServices,client,restart) end function
function bridgeScheduleFromFrame(frameServices) return BotScheduleBotThink(frameServices.lifecycleState.aiMainServices) end function
function bridgeInterbreeding(frameServices) return BotInterbreeding(frameServices.lifecycleState.aiMainServices) end function
function bridgeScheduleFromClient(clientServices) return BotScheduleBotThink(clientServices.lifecycleState.aiMainServices) end function
function bridgeReadSession(clientServices,bot) return BotReadSessionData(clientServices.lifecycleState.aiMainServices,bot) end function
function bridgeWriteSession(clientServices,bot) return BotWriteSessionData(clientServices.lifecycleState.aiMainServices,bot) end function
function bridgeBotLibVar(clientServices,name,value) return lifecycle.botLibVar(clientServices.lifecycleState,name,value) end function
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

function emit(services,boundary,kind,subject,detail,number)
  dispatched=not services.retailActive;event=Action(boundary,kind,subject,detail,number,dispatched);services.actions=services.actions+[event];return event
end function
function need(callback,label) if callback==void then return error(7910,"ai_main requires "+label) end if;return callback end function
function validBot(services,client)
  if typeof(client)!="int" or client<0 or client>=lifecycle.MAX_CLIENTS then return error(7910,"invalid bot client") end if
  bot=services.lifecycleState.botstates[client];if bot==void or not bot.inuse then return void end if;return bot
end function

// Botlib import boundaries from the first section of ai_main.c.
function BotAI_Print(services,type,message)
  kind="message";if type==PRT_WARNING then kind="warning" else if type==PRT_ERROR then kind="error" else if type==PRT_FATAL then kind="fatal" else if type==PRT_EXIT then kind="exit" end if
  event=emit(services,"print",kind,-1,message,type)
  if event.dispatched then need(services.printFn,"print/error host")(services,type,message) end if
  return void
end function
function BotAI_Trace(services,start,mins,maxs,traceEnd,passent,contentmask)
  event=emit(services,"trace","box",passent,"",contentmask)
  if not event.dispatched then return void end if
  return need(services.traceFn,"trace host")(services,start,mins,maxs,traceEnd,passent,contentmask)
end function
function BotAI_GetClientState(services,clientNum) return frames.getClientState(services.frameServices.frameLevel,clientNum) end function
function BotAI_GetEntityState(services,entityNum) return frames.getEntityState(services.frameServices.frameLevel,entityNum) end function
function BotAI_GetSnapshotEntity(services,clientNum,sequence) return frames.getSnapshotEntity(services.frameServices.frameLevel,services.frameServices,clientNum,sequence) end function
function BotAI_BotInitialChat(services,bot,type,variables)
  vars=[];for index=0 to MAX_MATCHVARIABLES-1 if index<len(variables) then vars=vars+[variables[index]] else vars=vars+[void] end if end for
  context=need(services.synonymContextFn,"BotSynonymContext")(services,bot)
  event=emit(services,"chat","initial",bot.client,type,context)
  if event.dispatched then need(services.initialChatFn,"BotInitialChat")(services,bot.cs,type,context,vars) end if
  return void
end function
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
function RemoveColorEscapeSequences(text) return commands.removeColorEscapeSequences(text) end function
function BotReportStatus(services,bot) return commands.reportStatus(services.commandServices,bot) end function
function BotSetInfoConfigString(services,bot) return commands.setInfoConfigString(services.commandServices,bot) end function
function BotUpdateInfoConfigStrings(services) return commands.updateInfoConfigStrings(services.commandServices) end function
function BotTeamplayReport(services) return commands.teamplayReport(services.commandServices) end function
function BotAI(services,client,thinktime) return commands.botAI(services.commandServices,client,thinktime) end function
function AngleDifference(ang1,ang2) return input.angleDifference(ang1,ang2) end function
function BotChangeViewAngle(angle,ideal,speed) return input.changeViewAngle(angle,ideal,speed) end function
function BotChangeViewAngles(services,bot,thinktime) return input.changeViewAngles(services.inputServices,bot,thinktime) end function
function BotInputToUserCommand(botInput,command,deltaAngles,time) return input.inputToUserCommand(botInput,command,deltaAngles,time) end function
function BotUpdateInput(services,bot,command,time,elapsed) return input.updateInput(services.inputServices,bot,command,time,elapsed) end function
function BotAIRegularUpdate(services) return frames.regularUpdate(services.frameServices) end function
function BotAIStartFrame(services,level,time) services.frameServices.frameLevel=level;return frames.startFrame(level,services.frameServices,time) end function
function BotInitLibrary(services) return lifecycle.initLibrary(services.lifecycleState) end function
function BotAISetup(services,restart) return lifecycle.setup(services.lifecycleState,restart) end function
function BotResetState(services,bot) return lifecycle.resetState(services.lifecycleState,bot) end function
function BotAILoadMap(services,restart) return lifecycle.loadMap(services.lifecycleState,restart) end function
function BotAIShutdown(services,restart) return lifecycle.shutdown(services.lifecycleState,restart) end function
function BotAISetupClient(services,client,settings,restart) return clients.setupClient(services.clientServices,client,settings,restart) end function
function BotAIShutdownClient(services,client,restart) return clients.shutdownClient(services.clientServices,client,restart) end function
function BotInterbreedBots(services) return lifecycle.interbreedBots(services.lifecycleState) end function
function BotWriteInterbreeded(services,filename) return lifecycle.writeInterbreeded(services.lifecycleState,filename) end function
function BotInterbreedEndMatch(services) return lifecycle.endMatch(services.lifecycleState) end function

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

function BotEntityInfo(services,entnum)
  event=emit(services,"aas","entity-info",entnum,"",0);if not event.dispatched then return void end if
  return need(services.entityInfoFn,"AAS_EntityInfo")(services,entnum)
end function
function NumBots(services) return services.lifecycleState.numbots end function
function BotTeamLeader(services,bot)
  leader=need(services.clientFromNameFn,"ClientFromName")(services,bot.teamleader)
  if leader<0 or leader>=lifecycle.MAX_CLIENTS then return false end if
  other=services.lifecycleState.botstates[leader];return other!=void and other.inuse
end function
function BotScheduleBotThink(services)
  state=services.lifecycleState;if state.numbots<=0 then return 0 end if;botnum=0
  for index=0 to lifecycle.MAX_CLIENTS-1
    bot=state.botstates[index];if bot==void or not bot.inuse then continue end if
    services.frameServices.runtimes[index].botthinkResidual=numeric.trunc32(state.thinktime.integer*botnum/state.numbots);botnum=botnum+1
  end for
  return botnum
end function

function sessionText(data)
  goal=data.goal
  return str(data.decisionmaker)+" "+str(data.ltgtype)+" "+str(data.teammate)+" "+str(goal.areanum)+" "+str(goal.entitynum)+" "+str(goal.flags)+" "+str(goal.iteminfo)+" "+str(goal.number)+" "+textnumbers.fixed6(goal.origin[0])+" "+textnumbers.fixed6(goal.origin[1])+" "+textnumbers.fixed6(goal.origin[2])+" "+textnumbers.fixed6(goal.mins[0])+" "+textnumbers.fixed6(goal.mins[1])+" "+textnumbers.fixed6(goal.mins[2])+" "+textnumbers.fixed6(goal.maxs[0])+" "+textnumbers.fixed6(goal.maxs[1])+" "+textnumbers.fixed6(goal.maxs[2])
end function
function parseSession(text)
  raw=strings.split(strings.trim(text)," ");parts=[];for each value in raw if value!="" then parts=parts+[value] end if end for
  if len(parts)<17 then return emptySession() end if
  goal=SessionGoal(toNumber(parts[3]),toNumber(parts[4]),toNumber(parts[5]),toNumber(parts[6]),toNumber(parts[7]),[toNumber(parts[8]),toNumber(parts[9]),toNumber(parts[10])],[toNumber(parts[11]),toNumber(parts[12]),toNumber(parts[13])],[toNumber(parts[14]),toNumber(parts[15]),toNumber(parts[16])])
  return SessionData(toNumber(parts[0]),toNumber(parts[1]),toNumber(parts[2]),goal)
end function
function BotWriteSessionData(services,bot)
  data=services.sessions[bot.client];text=sessionText(data);name="botsession"+str(bot.client);lifecycle.setCvar(services.lifecycleState,name,text);return text
end function
function BotReadSessionData(services,bot)
  name="botsession"+str(bot.client);text="";if services.cvarStringFn!=void then text=services.cvarStringFn(services,name) else text=lifecycle.queryCvar(services.lifecycleState,name,1024) end if
  data=parseSession(text);services.sessions[bot.client]=data;return data
end function

