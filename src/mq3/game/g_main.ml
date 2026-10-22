// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/game/g_main.c surface.  This is the productive qagame module
// boundary; the split implementation modules below contain the tested bodies.
package mq3.game.g_main
import mq3.game.lifecycle as lifecycle
import mq3.game.frame as frame
import mq3.game.entities as game
import mq3.game.cvars as cvars
import mq3.game.cvar_maintenance as cvarMaintenance
import mq3.game.tournament as tournament
import mq3.game.player_spawns as playerSpawns
import mq3.game.scores as scores
import mq3.game.votes as votes
import mq3.game.intermission as intermission
import mq3.game.logging as logging
import mq3.game.initialization as initialization
import mq3.game.g_client as gClient
import mq3.game.client_active as clientActive
import mq3.game.client_commands as clientCommands
import mq3.game.server_commands as serverCommands
import mq3.shared.q_shared_runtime as shared

const GAME_INIT = 0
const GAME_SHUTDOWN = 1
const GAME_CLIENT_CONNECT = 2
const GAME_CLIENT_BEGIN = 3
const GAME_CLIENT_USERINFO_CHANGED = 4
const GAME_CLIENT_DISCONNECT = 5
const GAME_CLIENT_COMMAND = 6
const GAME_CLIENT_THINK = 7
const GAME_RUN_FRAME = 8
const GAME_CONSOLE_COMMAND = 9
const BOTAI_START_FRAME = 10

// Runtime keeps the engine-owned inputs which native qagame obtains through
// traps.  Function slots default to the real port, while making the ABI switch
// independently differential-testable without replacing gameplay code.
struct Runtime
  level
  gmainEntityText
  gmainArgv
  gmainContext
  gmainInitFn
  gmainShutdownFn
  gmainConnectFn
  gmainThinkFn
  gmainUserinfoFn
  gmainDisconnectFn
  gmainBeginFn
  gmainCommandFn
  gmainFrameFn
  gmainConsoleFn
  gmainBotFrameFn
end struct

function argument(args,index)
  if typeof(args) != "array" then return error(481,"qagame vmMain requires an argument array") end if
  if index < len(args) then return args[index] end if
  return 0
end function
function formatted(format,arguments)
  text = shared.formatText(format,arguments)
  if len(bytes(text)) > 1023 then return error(481,"qagame diagnostic exceeds the original 1024-byte buffer") end if
  return text
end function

function G_Printf(level,format,arguments)
  text = formatted(format,arguments)
  if level.gamePrintFn == void then return error(481,"G_Printf requires trap_Printf delivery") end if
  level.gamePrintFn(level,text); return void
end function
function G_Error(level,format,arguments)
  return error(481,formatted(format,arguments))
end function
function Com_Printf(level,format,arguments) return G_Printf(level,format,arguments) end function
function Com_Error(level,code,format,arguments) return G_Error(level,format,arguments) end function

function gameCvarTable(level) return cvars.moduleState(level).rows end function
function G_RegisterCvars(level) return cvars.register(level) end function
function G_UpdateCvars(level) return cvars.update(level) end function
function G_RemapTeamShaders(level) return cvars.remapTeamShaders(level) end function
function CheckCvars(level) return cvarMaintenance.check(level) end function
function G_RunThink(level,ent) return game.runThink(level,ent) end function
function G_RunFrame(level,levelTime) return frame.run(level,levelTime) end function
function CheckTournament(level) return tournament.check(level) end function
function FindIntermissionPoint(level) return playerSpawns.findIntermission(level) end function
function SortRanks(level,a,b) return scores.compareRanks(level,a,b) end function
function CalculateRanks(level) return scores.calculateRanks(level) end function
function SendScoreboardMessageToAllClients(level) return scores.sendAll(level) end function
function ScoreIsTied(level) return scores.scoreIsTied(level) end function
function CheckExitRules(level) return scores.checkExitRules(level) end function
function LogExit(level,reason) return scores.logExit(level,reason) end function
function CheckIntermissionExit(level) return scores.checkIntermissionExit(level) end function
function CheckVote(level) return votes.check(level) end function
function CheckTeamVote(level,team) return votes.checkTeam(level,team) end function
function PrintTeam(level,team,message) return votes.printTeam(level,team,message) end function
function SetLeader(level,team,client) return votes.setLeader(level,team,client) end function
function CheckTeamLeader(level,team) return votes.checkTeamLeader(level,team) end function
function AddTournamentPlayer(level) return tournament.addPlayer(level) end function
function RemoveTournamentLoser(level) return tournament.removeLoser(level) end function
function RemoveTournamentWinner(level) return tournament.removeWinner(level) end function
function AdjustTournamentScores(level) return tournament.adjustScores(level) end function
function MoveClientToIntermission(level,ent) return intermission.moveClient(level,ent) end function
function BeginIntermission(level) return intermission.begin(level) end function
function ExitLevel(level) return intermission.exitLevel(level) end function
function G_InitGame(level,levelTime,randomSeed,restart,entityText) return lifecycle.init(level,levelTime,randomSeed,restart,entityText) end function
function G_ShutdownGame(level,restart) return lifecycle.shutdown(level,restart) end function
function G_LogPrintf(level,format,arguments) return logging.write(level,formatted(format,arguments)) end function
function G_FindTeams(level) return initialization.findTeams(level) end function

function defaultInit(runtime,a,b,c) return G_InitGame(runtime.level,a,b,c,runtime.gmainEntityText) end function
function defaultShutdown(runtime,a) return G_ShutdownGame(runtime.level,a) end function
function defaultConnect(runtime,a,b,c) return gClient.ClientConnect(runtime.level,a,b!=0,c!=0) end function
function defaultThink(runtime,a) return clientActive.think(runtime.level,a) end function
function defaultUserinfo(runtime,a) return gClient.ClientUserinfoChanged(runtime.level,a) end function
function defaultDisconnect(runtime,a) return gClient.ClientDisconnect(runtime.level,a) end function
function defaultBegin(runtime,a) return gClient.ClientBegin(runtime.level,a) end function
function defaultCommand(runtime,a) return clientCommands.command(runtime.level,a,runtime.gmainArgv) end function
function defaultFrame(runtime,a) return G_RunFrame(runtime.level,a) end function
function defaultConsole(runtime) return serverCommands.command(runtime.level,runtime.gmainArgv) end function
function defaultBotFrame(runtime,a) return lifecycle.startBotFrame(runtime.level,a) end function

function createRuntime(level)
  return Runtime(level,"",[],void,defaultInit,defaultShutdown,defaultConnect,defaultThink,defaultUserinfo,
    defaultDisconnect,defaultBegin,defaultCommand,defaultFrame,defaultConsole,defaultBotFrame)
end function

// vmMain -- the only qagame export.  The return values and command ordering
// match the pinned Baseq3 switch; unknown commands return -1.
function vmMain(runtime,command,args)
  if runtime == void or runtime.level == void then return error(481,"qagame vmMain requires an attached runtime") end if
  if command == GAME_INIT then runtime.gmainInitFn(runtime,argument(args,0),argument(args,1),argument(args,2)); return 0 end if
  if command == GAME_SHUTDOWN then runtime.gmainShutdownFn(runtime,argument(args,0)); return 0 end if
  if command == GAME_CLIENT_CONNECT then return runtime.gmainConnectFn(runtime,argument(args,0),argument(args,1),argument(args,2)) end if
  if command == GAME_CLIENT_THINK then runtime.gmainThinkFn(runtime,argument(args,0)); return 0 end if
  if command == GAME_CLIENT_USERINFO_CHANGED then runtime.gmainUserinfoFn(runtime,argument(args,0)); return 0 end if
  if command == GAME_CLIENT_DISCONNECT then runtime.gmainDisconnectFn(runtime,argument(args,0)); return 0 end if
  if command == GAME_CLIENT_BEGIN then runtime.gmainBeginFn(runtime,argument(args,0)); return 0 end if
  if command == GAME_CLIENT_COMMAND then runtime.gmainCommandFn(runtime,argument(args,0)); return 0 end if
  if command == GAME_RUN_FRAME then runtime.gmainFrameFn(runtime,argument(args,0)); return 0 end if
  if command == GAME_CONSOLE_COMMAND then return runtime.gmainConsoleFn(runtime) end if
  if command == BOTAI_START_FRAME then return runtime.gmainBotFrameFn(runtime,argument(args,0)) end if
  return -1
end function
