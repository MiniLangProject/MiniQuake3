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

/// Game-module VM command identifier selecting init.
const GAME_INIT = 0
/// Game-module VM command identifier selecting shutdown.
const GAME_SHUTDOWN = 1
/// Game-module VM command identifier selecting client connect.
const GAME_CLIENT_CONNECT = 2
/// Game-module VM command identifier selecting client begin.
const GAME_CLIENT_BEGIN = 3
/// Game-module VM command identifier selecting client user information changed.
const GAME_CLIENT_USERINFO_CHANGED = 4
/// Game-module VM command identifier selecting client disconnect.
const GAME_CLIENT_DISCONNECT = 5
/// Game-module VM command identifier selecting client command.
const GAME_CLIENT_COMMAND = 6
/// Game-module VM command identifier selecting client think.
const GAME_CLIENT_THINK = 7
/// Game-module VM command identifier selecting run frame.
const GAME_RUN_FRAME = 8
/// Game-module VM command identifier selecting console command.
const GAME_CONSOLE_COMMAND = 9
/// VM command requesting one bot-AI frame from the game module.
const BOTAI_START_FRAME = 10

// Runtime keeps the engine-owned inputs which native qagame obtains through
// traps.  Function slots default to the real port, while making the ABI switch
// independently differential-testable without replacing gameplay code.
struct Runtime
  /// Game-level state shared with the operation or runtime.
  level
  /// Map entity text supplied to game-module initialization.
  gmainEntityText
  /// Arguments supplied to the current game-module command dispatch.
  gmainArgv
  /// Caller context retained for game-module entry-point callbacks.
  gmainContext
  /// Injected callback for gmain init; invoked through the Runtime service/state record.
  gmainInitFn
  /// Injected callback for gmain shutdown; invoked through the Runtime service/state record.
  gmainShutdownFn
  /// Injected callback for gmain connect; invoked through the Runtime service/state record.
  gmainConnectFn
  /// Injected callback for gmain think; invoked through the Runtime service/state record.
  gmainThinkFn
  /// Injected callback for gmain user information; invoked through the Runtime service/state record.
  gmainUserinfoFn
  /// Injected callback for gmain disconnect; invoked through the Runtime service/state record.
  gmainDisconnectFn
  /// Injected callback for gmain begin; invoked through the Runtime service/state record.
  gmainBeginFn
  /// Injected callback for gmain command; invoked through the Runtime service/state record.
  gmainCommandFn
  /// Injected callback for gmain frame; invoked through the Runtime service/state record.
  gmainFrameFn
  /// Injected callback for gmain console; invoked through the Runtime service/state record.
  gmainConsoleFn
  /// Injected callback for gmain bot frame; invoked through the Runtime service/state record.
  gmainBotFrameFn
end struct

/// Read an indexed qagame argument, returning zero for an omitted argument and an error for a non-array argument list.
/// @param args Array or byte sequence accessed at `index`.
/// @param index Index of the entry to access.
function argument(args,index)
  if typeof(args) != "array" then return error(481,"qagame vmMain requires an argument array") end if
  if index < len(args) then return args[index] end if
  return 0
end function
/// Format a qagame diagnostic and reject output exceeding the original 1024-byte buffer including its terminator.
/// @param format C-style format string.
/// @param arguments Ordered arguments consumed by the call or formatter.
function formatted(format,arguments)
  text = shared.formatText(format,arguments)
  if len(bytes(text)) > 1023 then return error(481,"qagame diagnostic exceeds the original 1024-byte buffer") end if
  return text
end function

/// Format and deliver a qagame diagnostic through the installed game-print callback, rejecting a missing callback.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param format C-style format string.
/// @param arguments Ordered arguments consumed by the call or formatter.
function G_Printf(level,format,arguments)
  text = formatted(format,arguments)
  if level.gamePrintFn == void then return error(481,"G_Printf requires trap_Printf delivery") end if
  level.gamePrintFn(level,text); return void
end function
/// Construct qagame error 481 from the formatted diagnostic text.
/// @param level Not read by this implementation; retained in the `G_Error` signature.
/// @param format C-style format string.
/// @param arguments Ordered arguments consumed by the call or formatter.
function G_Error(level,format,arguments)
  return error(481,formatted(format,arguments))
end function
/// Forward `Com_Printf` to `mq3.game.g_main.G_Printf` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param format C-style format string.
/// @param arguments Ordered arguments consumed by the call or formatter.
function Com_Printf(level,format,arguments) return G_Printf(level,format,arguments) end function
/// Forward `Com_Error` to `mq3.game.g_main.G_Error` and return the delegated result.
/// @param level Value passed as argument 1 to `mq3.game.g_main.G_Error`.
/// @param code Not read by this implementation; retained in the `Com_Error` signature.
/// @param format C-style format string.
/// @param arguments Ordered arguments consumed by the call or formatter.
function Com_Error(level,code,format,arguments) return G_Error(level,format,arguments) end function

/// Return `cvars.moduleState(level).rows` for `gameCvarTable`.
/// @param level Game-level state; accesses `gameCvars`.
function gameCvarTable(level) return cvars.moduleState(level).rows end function
/// Forward `G_RegisterCvars` to `mq3.game.cvars.register` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `cvarSetFn`, `warmupModificationCount` and `warmupCvarModificationCount`. May update `level.warmupModificationCount` in place.
function G_RegisterCvars(level) return cvars.register(level) end function
/// Forward `G_UpdateCvars` to `mq3.game.cvars.update` and return the delegated result.
/// @param level Game-level state; accesses `serverCommandFn`.
function G_UpdateCvars(level) return cvars.update(level) end function
/// Forward `G_RemapTeamShaders` to `mq3.game.cvars.remapTeamShaders` and return the delegated result.
/// @param level Value passed as argument 1 to `mq3.game.cvars.remapTeamShaders`.
function G_RemapTeamShaders(level) return cvars.remapTeamShaders(level) end function
/// Forward `CheckCvars` to `mq3.game.cvar_maintenance.check` and return the delegated result.
/// @param level Game-level state; accesses `cvarMaintenance` and `cvarSetFn`.
function CheckCvars(level) return cvarMaintenance.check(level) end function
/// Forward `G_RunThink` to `mq3.game.entities.runThink` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `nextthink` and `think`. May update `ent.nextthink` in place.
function G_RunThink(level,ent) return game.runThink(level,ent) end function
/// Forward `G_RunFrame` to `mq3.game.frame.run` and return the delegated result.
/// @param level Game-level state; accesses `restarted`, `framenum`, `previousTime`, `time` and `updateCvarsFn` and related fields. May update `level.framenum`, `level.previousTime` and `level.time` in place.
/// @param levelTime Current server game time in milliseconds.
function G_RunFrame(level,levelTime) return frame.run(level,levelTime) end function
/// Forward `CheckTournament` to `mq3.game.tournament.check` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `numPlayingClients`, `tournamentAddFn`, `warmupCvarModificationCount` and `warmupModificationCount` and related fields. May update `level.warmupModificationCount` and `level.spawner.warmupTime` in place.
function CheckTournament(level) return tournament.check(level) end function
/// Forward `FindIntermissionPoint` to `mq3.game.player_spawns.findIntermission` and return the delegated result.
/// @param level Game-level state; accesses `intermission_origin` and `intermission_angle`. May update `level.intermission_origin` and `level.intermission_angle` in place.
function FindIntermissionPoint(level) return playerSpawns.findIntermission(level) end function
/// Forward `SortRanks` to `mq3.game.scores.compareRanks` and return the delegated result.
/// @param level Game-level state; accesses `clients`.
/// @param a Slot in the owning table or pool.
/// @param b Slot in the owning table or pool.
function SortRanks(level,a,b) return scores.compareRanks(level,a,b) end function
/// Forward `CalculateRanks` to `mq3.game.scores.calculateRanks` and return the delegated result.
/// @param level Game-level state; accesses `maxclients`, `follow1`, `follow2`, `numConnectedClients` and `numNonSpectatorClients` and related fields. May update `level.follow1`, `level.follow2` and `level.numConnectedClients` and additional fields in place.
function CalculateRanks(level) return scores.calculateRanks(level) end function
/// Forward `SendScoreboardMessageToAllClients` to `mq3.game.scores.sendAll` and return the delegated result.
/// @param level Game-level state; accesses `maxclients`, `clients` and `entities`.
function SendScoreboardMessageToAllClients(level) return scores.sendAll(level) end function
/// Forward `ScoreIsTied` to `mq3.game.scores.scoreIsTied` and return the delegated result.
/// @param level Game-level state; accesses `numPlayingClients`, `spawner`, `teamScores` and `sortedClients`.
function ScoreIsTied(level) return scores.scoreIsTied(level) end function
/// Forward `CheckExitRules` to `mq3.game.scores.checkExitRules` and return the delegated result.
/// @param level Game-level state; accesses `intermissiontime`, `intermissionQueued`, `time`, `timelimit` and `spawner` and related fields. May update `level.intermissionQueued` in place.
function CheckExitRules(level) return scores.checkExitRules(level) end function
/// Forward `LogExit` to `mq3.game.scores.logExit` and return the delegated result.
/// @param level Game-level state; accesses `intermissionQueued`, `time`, `spawner`, `numConnectedClients` and `teamScores` and related fields. May update `level.intermissionQueued` in place.
/// @param reason Reason text recorded with the operation.
function LogExit(level,reason) return scores.logExit(level,reason) end function
/// Forward `CheckIntermissionExit` to `mq3.game.scores.checkIntermissionExit` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `maxclientsCvar`, `clients`, `entities` and `time` and related fields. May update `level.readyToExit` and `level.exitTime` in place.
function CheckIntermissionExit(level) return scores.checkIntermissionExit(level) end function
/// Forward `CheckVote` to `mq3.game.votes.check` and return the delegated result.
/// @param level Game-level state; accesses `voteExecuteTime`, `time`, `voteString`, `voteTime` and `voteYes` and related fields. May update `level.voteExecuteTime` and `level.voteTime` in place.
function CheckVote(level) return votes.check(level) end function
/// Forward `CheckTeamVote` to `mq3.game.votes.checkTeam` and return the delegated result.
/// @param level Game-level state; accesses `teamVoteTime`, `time`, `teamVoteYes`, `numteamVotingClients` and `teamVoteString` and related fields. May update `level.teamVoteTime[offset]` in place.
/// @param team Team identifier used by the game rules.
function CheckTeamVote(level,team) return votes.checkTeam(level,team) end function
/// Forward `PrintTeam` to `mq3.game.votes.printTeam` and return the delegated result.
/// @param level Game-level state; accesses `maxclients` and `clients`.
/// @param team Team identifier used by the game rules.
/// @param message Message text supplied to the diagnostic or chat operation.
function PrintTeam(level,team,message) return votes.printTeam(level,team,message) end function
/// Forward `SetLeader` to `mq3.game.votes.setLeader` and return the delegated result.
/// @param level Game-level state; accesses `clients` and `maxclients`. May update `level.clients[current].teamLeader` and `level.clients[slot].teamLeader` in place.
/// @param team Team identifier used by the game rules.
/// @param client Slot in the owning table or pool.
function SetLeader(level,team,client) return votes.setLeader(level,team,client) end function
/// Forward `CheckTeamLeader` to `mq3.game.votes.checkTeamLeader` and return the delegated result.
/// @param level Game-level state; accesses `maxclients`, `clients` and `entities`. May update `level.clients[index].teamLeader` in place.
/// @param team Team identifier used by the game rules.
function CheckTeamLeader(level,team) return votes.checkTeamLeader(level,team) end function
/// Forward `AddTournamentPlayer` to `mq3.game.tournament.addPlayer` and return the delegated result.
/// @param level Game-level state; accesses `numPlayingClients`, `intermissiontime`, `maxclients`, `clients` and `spawner` and related fields. May update `level.spawner.warmupTime` in place.
function AddTournamentPlayer(level) return tournament.addPlayer(level) end function
/// Forward `RemoveTournamentLoser` to `mq3.game.tournament.removeLoser` and return the delegated result.
/// @param level Game-level state; accesses `numPlayingClients`, `clients` and `entities`.
function RemoveTournamentLoser(level) return tournament.removeLoser(level) end function
/// Forward `RemoveTournamentWinner` to `mq3.game.tournament.removeWinner` and return the delegated result.
/// @param level Game-level state; accesses `numPlayingClients`, `clients` and `entities`.
function RemoveTournamentWinner(level) return tournament.removeWinner(level) end function
/// Forward `AdjustTournamentScores` to `mq3.game.tournament.adjustScores` and return the delegated result.
/// @param level Game-level state; accesses `clients`. May update `level.clients[slot].wins` and `level.clients[slot].losses` in place.
function AdjustTournamentScores(level) return tournament.adjustScores(level) end function
/// Forward `MoveClientToIntermission` to `mq3.game.intermission.moveClient` and return the delegated result.
/// @param level Game-level state; accesses `intermission_origin` and `intermission_angle`.
/// @param ent Game entity; accesses `client`, `s` and `r`. May update `ent.s.origin[axis]`, `ent.client.ps.origin[axis]` and `ent.client.ps.viewangles[axis]` and additional fields in place.
function MoveClientToIntermission(level,ent) return intermission.moveClient(level,ent) end function
/// Forward `BeginIntermission` to `mq3.game.intermission.begin` and return the delegated result.
/// @param level Game-level state; accesses `intermissiontime`, `spawner`, `time`, `updateTournamentInfoFn` and `spawnVictoryPadsFn` and related fields. May update `level.intermissiontime` in place.
function BeginIntermission(level) return intermission.begin(level) end function
/// Forward `ExitLevel` to `mq3.game.intermission.exitLevel` and return the delegated result.
/// @param level Game-level state; accesses `botInterbreedEndMatchFn`, `botLifecycleState`, `spawner`, `restarted` and `consoleCommandFn` and related fields. May update `level.restarted`, `level.changemap` and `level.intermissiontime` and additional fields in place.
function ExitLevel(level) return intermission.exitLevel(level) end function
/// Forward `G_InitGame` to `mq3.game.lifecycle.init` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `randSeed`, `time`, `startTime` and `sndFry` and related fields. May update `level.spawner.parser`, `level.randSeed` and `level.time` and additional fields in place.
/// @param levelTime Current server game time in milliseconds.
/// @param randomSeed State used to initialize the deterministic random sequence.
/// @param restart Whether initialization or shutdown belongs to a map restart.
/// @param entityText Text to parse, format or deliver.
function G_InitGame(level,levelTime,randomSeed,restart,entityText) return lifecycle.init(level,levelTime,randomSeed,restart,entityText) end function
/// Forward `G_ShutdownGame` to `mq3.game.lifecycle.shutdown` and return the delegated result.
/// @param level Game-level state; accesses `logFile`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
function G_ShutdownGame(level,restart) return lifecycle.shutdown(level,restart) end function
/// Forward `G_LogPrintf` to `mq3.game.logging.write` and return the delegated result.
/// @param level Game-level state; accesses `time`, `dedicated`, `gamePrintFn`, `logFile` and `logWriteFn`.
/// @param format C-style format string.
/// @param arguments Ordered arguments consumed by the call or formatter.
function G_LogPrintf(level,format,arguments) return logging.write(level,formatted(format,arguments)) end function
/// Forward `G_FindTeams` to `mq3.game.initialization.findTeams` and return the delegated result.
/// @param level Game-level state; accesses `num_entities`, `entities` and `gamePrintFn`.
function G_FindTeams(level) return initialization.findTeams(level) end function

/// Forward `defaultInit` to `mq3.game.g_main.G_InitGame` and return the delegated result.
/// @param runtime G main runtime; accesses `level` and `gmainEntityText`.
/// @param a Current server game time in milliseconds.
/// @param b State used to initialize the deterministic random sequence.
/// @param c Whether initialization or shutdown belongs to a map restart.
function defaultInit(runtime,a,b,c) return G_InitGame(runtime.level,a,b,c,runtime.gmainEntityText) end function
/// Forward `defaultShutdown` to `mq3.game.g_main.G_ShutdownGame` and return the delegated result.
/// @param runtime G main runtime; accesses `level`.
/// @param a Whether initialization or shutdown belongs to a map restart.
function defaultShutdown(runtime,a) return G_ShutdownGame(runtime.level,a) end function
/// Forward `defaultConnect` to `mq3.game.g_client.ClientConnect` and return the delegated result.
/// @param runtime G main runtime; accesses `level`.
/// @param a Client slot number.
/// @param b Operand used to evaluate the returned expression `gClient.ClientConnect(runtime.level,a,b!=0,c!=0)`.
/// @param c Operand used to evaluate the returned expression `gClient.ClientConnect(runtime.level,a,b!=0,c!=0)`.
function defaultConnect(runtime,a,b,c) return gClient.ClientConnect(runtime.level,a,b!=0,c!=0) end function
/// Forward `defaultThink` to `mq3.game.client_active.think` and return the delegated result.
/// @param runtime G main runtime; accesses `level`.
/// @param a Client slot number.
function defaultThink(runtime,a) return clientActive.think(runtime.level,a) end function
/// Forward `defaultUserinfo` to `mq3.game.g_client.ClientUserinfoChanged` and return the delegated result.
/// @param runtime G main runtime; accesses `level`.
/// @param a Client slot number.
function defaultUserinfo(runtime,a) return gClient.ClientUserinfoChanged(runtime.level,a) end function
/// Forward `defaultDisconnect` to `mq3.game.g_client.ClientDisconnect` and return the delegated result.
/// @param runtime G main runtime; accesses `level`.
/// @param a Client slot number.
function defaultDisconnect(runtime,a) return gClient.ClientDisconnect(runtime.level,a) end function
/// Forward `defaultBegin` to `mq3.game.g_client.ClientBegin` and return the delegated result.
/// @param runtime G main runtime; accesses `level`.
/// @param a Client slot number.
function defaultBegin(runtime,a) return gClient.ClientBegin(runtime.level,a) end function
/// Forward `defaultCommand` to `mq3.game.client_commands.command` and return the delegated result.
/// @param runtime G main runtime; accesses `level` and `gmainArgv`.
/// @param a Client slot number.
function defaultCommand(runtime,a) return clientCommands.command(runtime.level,a,runtime.gmainArgv) end function
/// Forward `defaultFrame` to `mq3.game.g_main.G_RunFrame` and return the delegated result.
/// @param runtime G main runtime; accesses `level`.
/// @param a Current server game time in milliseconds.
function defaultFrame(runtime,a) return G_RunFrame(runtime.level,a) end function
/// Forward `defaultConsole` to `mq3.game.server_commands.command` and return the delegated result.
/// @param runtime G main runtime; accesses `level` and `gmainArgv`.
function defaultConsole(runtime) return serverCommands.command(runtime.level,runtime.gmainArgv) end function
/// Forward `defaultBotFrame` to `mq3.game.lifecycle.startBotFrame` and return the delegated result.
/// @param runtime G main runtime; accesses `level`.
/// @param a Time value in the units expected by this module.
function defaultBotFrame(runtime,a) return lifecycle.startBotFrame(runtime.level,a) end function

/// Create a `mq3.game.g_main.Runtime` record, initializing `level` from `level`, `gmainInitFn` as `defaultInit` and `gmainShutdownFn` as `defaultShutdown`.
/// @param level Initial value stored in `mq3.game.g_main.Runtime.level`.
function createRuntime(level)
  return Runtime(level,"",[],void,defaultInit,defaultShutdown,defaultConnect,defaultThink,defaultUserinfo,
    defaultDisconnect,defaultBegin,defaultCommand,defaultFrame,defaultConsole,defaultBotFrame)
end function

// vmMain -- the only qagame export.  The return values and command ordering
// match the pinned Baseq3 switch; unknown commands return -1.
/// @param runtime G main runtime; accesses `level`, `gmainInitFn`, `gmainShutdownFn`, `gmainConnectFn` and `gmainThinkFn` and related fields.
/// @param command Value used by `vmMain` in `if command == GAME_INIT then runtime.gmainInitFn(runtime,argument(args,0),argument(args,1),argument(args,2))`.
/// @param args Array or byte sequence accessed at `index`.
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
