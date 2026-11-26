// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/game/g_cmds.c symbol surface.  The original QAGame module
// stores level, g_entities and trap_Argv in globals.  MiniLang keeps those
// dependencies explicit: level owns the authoritative game state and argv is
// the token vector supplied by the engine command system.
package mq3.game.g_cmds

import mq3.game.client_commands as dispatch
import mq3.game.command_args as args
import mq3.game.chat_commands as chat
import mq3.game.follow_commands as follow
import mq3.game.scores as scores
import mq3.game.session as sessions
import mq3.game.team_changes as teams
import mq3.game.utility_commands as utility
import mq3.game.vote_commands as voteCommands
import mq3.qcommon.command_buffer as commands

/// `Runtime` record for g cmds, containing `level` and `commandState`.
struct Runtime level commandState end struct

/// Create a `mq3.game.g_cmds.Runtime` record, initializing `level` from `level` and `commandState` as `commands.create()`.
/// @param level Initial value stored in `mq3.game.g_cmds.Runtime.level`.
function createRuntime(level)
  return Runtime(level,commands.create())
end function

/// Forward `ConcatArgs` to `mq3.game.command_args.concat` and return the delegated result.
/// @param argv Command argument strings in their original order.
/// @param start Value used by `concat` in `index = start`.
function ConcatArgs(argv,start) return args.concat(argv,start) end function
/// Forward `DeathmatchScoreboardMessage` to `mq3.game.scores.scoreboard` and return the delegated result.
/// @param level Game-level state; accesses `numConnectedClients`, `sortedClients`, `time`, `entities` and `teamScores`.
/// @param ent Game entity; accesses `slot`.
function DeathmatchScoreboardMessage(level,ent) return scores.scoreboard(level,ent) end function
/// Forward `Cmd_Score_f` to `mq3.game.scores.commandScore` and return the delegated result.
/// @param level Game-level state; accesses `numConnectedClients`, `sortedClients`, `time`, `entities` and `teamScores`.
/// @param ent Game entity; accesses `slot`.
function Cmd_Score_f(level,ent) return scores.commandScore(level,ent) end function
/// Forward `CheatsOk` to `mq3.game.utility_commands.cheatsOk` and return the delegated result.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `health`.
function CheatsOk(level,ent) return utility.cheatsOk(level,ent) end function
/// Forward `SanitizeString` to `mq3.game.follow_commands.sanitize` and return the delegated result.
/// @param text Text to parse, format or deliver.
function SanitizeString(text) return follow.sanitize(text) end function
/// Forward `ClientNumberFromString` to `mq3.game.follow_commands.clientNumber` and return the delegated result.
/// @param level Game-level state; accesses `maxclients` and `clients`.
/// @param callerEnt Game entity; accesses `slot`.
/// @param text Text to parse, format or deliver.
function ClientNumberFromString(level,callerEnt,text) return follow.clientNumber(level,callerEnt,text) end function

/// Forward `Cmd_Give_f` to `mq3.game.utility_commands.give` and return the delegated result.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `client`, `health` and `r`. May update `ent.health`, `ent.client.ps.stats[c.STAT_WEAPONS]` and `ent.client.ps.ammo[index]` and additional fields in place.
/// @param argv Command argument strings in their original order.
function Cmd_Give_f(level,ent,argv) return utility.give(level,ent,argv) end function
/// Forward `Cmd_God_f` to `mq3.game.utility_commands.god` and return the delegated result.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `flags`. May update `ent.flags` in place.
function Cmd_God_f(level,ent) return utility.god(level,ent) end function
/// Forward `Cmd_Notarget_f` to `mq3.game.utility_commands.notarget` and return the delegated result.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `flags`. May update `ent.flags` in place.
function Cmd_Notarget_f(level,ent) return utility.notarget(level,ent) end function
/// Forward `Cmd_Noclip_f` to `mq3.game.utility_commands.noclip` and return the delegated result.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `client`. May update `ent.client.noclip` in place.
function Cmd_Noclip_f(level,ent) return utility.noclip(level,ent) end function
/// Forward `Cmd_LevelShot_f` to `mq3.game.utility_commands.levelshot` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `health`.
function Cmd_LevelShot_f(level,ent) return utility.levelshot(level,ent) end function
/// Forward `Cmd_TeamTask_f` to `mq3.game.utility_commands.teamTask` and return the delegated result.
/// @param level Game-level state; accesses `userinfoFn` and `userinfoSetFn`.
/// @param ent Game entity; accesses `client`.
/// @param argv Command argument strings in their original order.
function Cmd_TeamTask_f(level,ent,argv) return utility.teamTask(level,ent,argv) end function
/// Forward `Cmd_Kill_f` to `mq3.game.utility_commands.kill` and return the delegated result.
/// @param level Game-level state; accesses `intermissiontime`, `time`, `scene`, `maxclients` and `clients` and related fields. May update `level.deathAnimIndex` in place.
/// @param ent Game entity; accesses `client`, `health` and `flags`. May update `ent.flags`, `ent.client.ps.stats[c.STAT_HEALTH]` and `ent.health` in place.
function Cmd_Kill_f(level,ent) return utility.kill(level,ent) end function
/// Forward `BroadcastTeamChange` to `mq3.game.session.broadcastTeamChange` and return the delegated result.
/// @param level Game-level state; accesses `serverCommandFn`.
/// @param client Client state; accesses `team` and `netname`.
/// @param oldTeam Value used by `broadcastTeamChange` in `else if client.team == 3 and oldTeam != 3 then suffix = " joined the spectators.\n\""`.
function BroadcastTeamChange(level,client,oldTeam) return sessions.broadcastTeamChange(level,client,oldTeam) end function
/// Forward `SetTeam` to `mq3.game.team_changes.setTeam` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `teamForceBalance`, `numNonSpectatorClients`, `maxGameClients` and `time` and related fields. May update `level.playerDieFn` in place.
/// @param ent Game entity; accesses `client`, `flags` and `health`. May update `ent.flags` and `ent.health` in place.
/// @param text Text to parse, format or deliver.
function SetTeam(level,ent,text) return teams.setTeam(level,ent,text) end function
/// Forward `StopFollowing` to `mq3.game.team_changes.stopFollowing` and return the delegated result.
/// @param level Value passed as argument 1 to `mq3.game.team_changes.stopFollowing`.
/// @param ent Game entity; accesses `client`, `slot` and `r`. May update `ent.r.svFlags` in place.
function StopFollowing(level,ent) return teams.stopFollowing(level,ent) end function
/// Forward `Cmd_Team_f` to `mq3.game.team_changes.commandTeam` and return the delegated result.
/// @param level Game-level state; accesses `time` and `spawner`.
/// @param ent Game entity; accesses `client` and `slot`. May update `ent.client.switchTeamTime` in place.
/// @param argv Command argument strings in their original order.
function Cmd_Team_f(level,ent,argv) return teams.commandTeam(level,ent,argv) end function
/// Forward `Cmd_Follow_f` to `mq3.game.follow_commands.follow` and return the delegated result.
/// @param level Game-level state; accesses `clients` and `spawner`.
/// @param ent Game entity; accesses `client`. May update `ent.client.spectatorState` and `ent.client.spectatorClient` in place.
/// @param argv Command argument strings in their original order.
function Cmd_Follow_f(level,ent,argv) return follow.follow(level,ent,argv) end function
/// Forward `Cmd_FollowCycle_f` to `mq3.game.follow_commands.cycle` and return the delegated result.
/// @param level Game-level state; accesses `spawner`, `maxclients` and `clients`.
/// @param ent Game entity; accesses `client`. May update `ent.client.spectatorClient` and `ent.client.spectatorState` in place.
/// @param direction Value passed as argument 2 to `mq3.compat.numeric.add32`.
function Cmd_FollowCycle_f(level,ent,direction) return follow.cycle(level,ent,direction) end function

/// Forward `G_SayTo` to `mq3.game.chat_commands.sayTo` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent First record; accesses `client`.
/// @param other Other record; accesses `inuse`, `client` and `slot`.
/// @param mode Value used by `sayTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param color Operand used to evaluate the returned expression `chatServerCommand(level,other.slot,command+" \""+name+"^"+decode(bytes([color & 255]))+message+"\"")`.
/// @param name Name used to identify the requested entry.
/// @param message Message text supplied to the diagnostic or chat operation.
function G_SayTo(level,ent,other,mode,color,name,message) return chat.sayTo(level,ent,other,mode,color,name,message) end function
/// Forward `G_Say` to `mq3.game.chat_commands.say` and return the delegated result.
/// @param level Game-level state; accesses `dedicated` and `entities`.
/// @param ent Game entity; accesses `client`.
/// @param target Target record; accesses `client`.
/// @param mode Value used by `sayTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param text Text to parse, format or deliver.
function G_Say(level,ent,target,mode,text) return chat.say(level,ent,target,mode,text) end function
/// Forward `Cmd_Say_f` to `mq3.game.chat_commands.sayCommand` and return the delegated result.
/// @param level Game-level state; accesses `dedicated` and `entities`.
/// @param ent Game entity; accesses `client`.
/// @param argv Command argument strings in their original order.
/// @param mode Value used by `sayTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param arg0 Value used by `sayCommand` in `if len(argv) < 2 and not arg0 then return void end if`.
function Cmd_Say_f(level,ent,argv,mode,arg0) return chat.sayCommand(level,ent,argv,mode,arg0) end function
/// Forward `Cmd_Tell_f` to `mq3.game.chat_commands.tellCommand` and return the delegated result.
/// @param level Game-level state; accesses `entities`.
/// @param ent Game entity; accesses `r`.
/// @param argv Command argument strings in their original order.
function Cmd_Tell_f(level,ent,argv) return chat.tellCommand(level,ent,argv) end function
/// Forward `G_VoiceTo` to `mq3.game.chat_commands.voiceTo` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `s`.
/// @param other Other record; accesses `inuse`, `client` and `slot`.
/// @param mode Value used by `voiceTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param id Operand used to evaluate the returned expression `chatServerCommand(level,other.slot,command+" "+str(chatVoiceOnly(voiceOnly))+" "+str(n.i32(ent.s.number))+" "+str(color)+" "+id)`.
/// @param voiceOnly Whether to emit voice without the accompanying text message.
function G_VoiceTo(level,ent,other,mode,id,voiceOnly) return chat.voiceTo(level,ent,other,mode,id,voiceOnly) end function
/// Forward `G_Voice` to `mq3.game.chat_commands.voice` and return the delegated result.
/// @param level Game-level state; accesses `dedicated` and `entities`.
/// @param ent Game entity; accesses `s`.
/// @param target Other record; accesses `inuse`, `client` and `slot`.
/// @param mode Value used by `voiceTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param id Text to parse, format or deliver.
/// @param voiceOnly Whether to emit voice without the accompanying text message.
function G_Voice(level,ent,target,mode,id,voiceOnly) return chat.voice(level,ent,target,mode,id,voiceOnly) end function
/// Forward `Cmd_Voice_f` to `mq3.game.chat_commands.voiceCommand` and return the delegated result.
/// @param level Game-level state; accesses `dedicated` and `entities`.
/// @param ent Game entity; accesses `s`.
/// @param argv Command argument strings in their original order.
/// @param mode Value used by `voiceTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param arg0 Value used by `voiceCommand` in `if len(argv) < 2 and not arg0 then return void end if`.
/// @param voiceOnly Whether to emit voice without the accompanying text message.
function Cmd_Voice_f(level,ent,argv,mode,arg0,voiceOnly) return chat.voiceCommand(level,ent,argv,mode,arg0,voiceOnly) end function
/// Forward `Cmd_VoiceTell_f` to `mq3.game.chat_commands.voiceTellCommand` and return the delegated result.
/// @param level Game-level state; accesses `entities`.
/// @param ent Game entity; accesses `r`.
/// @param argv Command argument strings in their original order.
/// @param voiceOnly Whether to emit voice without the accompanying text message.
function Cmd_VoiceTell_f(level,ent,argv,voiceOnly) return chat.voiceTellCommand(level,ent,argv,voiceOnly) end function
/// Forward `Cmd_VoiceTaunt_f` to `mq3.game.chat_commands.voiceTaunt` and return the delegated result.
/// @param level Game-level state; accesses `entities` and `time`.
/// @param ent Game entity; accesses `client`, `enemy`, `s` and `r`. May update `ent.enemy` and `ent.client.lastkilled_client` in place.
function Cmd_VoiceTaunt_f(level,ent) return chat.voiceTaunt(level,ent) end function
/// Forward `Cmd_GameCommand_f` to `mq3.game.chat_commands.gameCommand` and return the delegated result.
/// @param level Game-level state; accesses `entities`.
/// @param ent Game entity; accesses `client`.
/// @param argv Command argument strings in their original order.
function Cmd_GameCommand_f(level,ent,argv) return chat.gameCommand(level,ent,argv) end function
/// Forward `Cmd_Where_f` to `mq3.game.chat_commands.where` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param ent Game entity; accesses `s` and `slot`.
function Cmd_Where_f(level,ent) return chat.where(level,ent) end function

/// Forward `Cmd_CallVote_f` to `mq3.game.vote_commands.callVote` and return the delegated result.
/// @param level Game-level state; accesses `allowVote`, `voteTime`, `voteExecuteTime`, `voteString` and `voteDisplayString` and related fields. May update `level.voteExecuteTime`, `level.voteString` and `level.voteDisplayString` and additional fields in place.
/// @param ent Game entity; accesses `slot` and `client`.
/// @param argv Command argument strings in their original order.
function Cmd_CallVote_f(level,ent,argv) return voteCommands.callVote(level,ent,argv) end function
/// Forward `Cmd_Vote_f` to `mq3.game.vote_commands.castVote` and return the delegated result.
/// @param level Game-level state; accesses `voteTime`, `voteYes` and `voteNo`. May update `level.voteYes` and `level.voteNo` in place.
/// @param ent Game entity; accesses `slot` and `client`.
/// @param argv Command argument strings in their original order.
function Cmd_Vote_f(level,ent,argv) return voteCommands.castVote(level,ent,argv) end function
/// Forward `Cmd_CallTeamVote_f` to `mq3.game.vote_commands.callTeamVote` and return the delegated result.
/// @param level Game-level state; accesses `allowVote`, `teamVoteTime`, `maxclients`, `entities` and `clients` and related fields. May update `level.teamVoteString[offset]`, `level.teamVoteTime[offset]` and `level.teamVoteYes[offset]` and additional fields in place.
/// @param ent Game entity; accesses `slot` and `client`.
/// @param argv Command argument strings in their original order.
function Cmd_CallTeamVote_f(level,ent,argv) return voteCommands.callTeamVote(level,ent,argv) end function
/// Forward `Cmd_TeamVote_f` to `mq3.game.vote_commands.castTeamVote` and return the delegated result.
/// @param level Game-level state; accesses `teamVoteTime`, `teamVoteYes` and `teamVoteNo`. May update `level.teamVoteYes[offset]` and `level.teamVoteNo[offset]` in place.
/// @param ent Game entity; accesses `slot` and `client`.
/// @param argv Command argument strings in their original order.
function Cmd_TeamVote_f(level,ent,argv) return voteCommands.castTeamVote(level,ent,argv) end function
/// Forward `Cmd_SetViewpos_f` to `mq3.game.utility_commands.setViewpos` and return the delegated result.
/// @param level Game-level state; accesses `cheats`.
/// @param ent Game entity; accesses `slot`.
/// @param argv Command argument strings in their original order.
function Cmd_SetViewpos_f(level,ent,argv) return utility.setViewpos(level,ent,argv) end function
/// Forward `Cmd_Stats_f` to `mq3.game.utility_commands.stats` and return the delegated result.
/// @param level Value passed as argument 1 to `mq3.game.utility_commands.stats`.
/// @param ent Value passed as argument 2 to `mq3.game.utility_commands.stats`.
function Cmd_Stats_f(level,ent) return utility.stats(level,ent) end function

// GAME_CLIENT_COMMAND uses this entry after the server has tokenized the
// reliable command.  Keeping ClientCommand itself argv-based avoids a second
// tokenizer on the normal engine path.
/// @param level Game-level state; accesses `entities` and `intermissiontime`.
/// @param clientNum Client slot number.
/// @param argv Command argument strings in their original order.
function ClientCommand(level,clientNum,argv) return dispatch.command(level,clientNum,argv) end function

/// Apply `mq3.qcommon.command_buffer.argc`, `mq3.qcommon.command_buffer.argv` and `mq3.game.g_cmds.ClientCommand` while evaluating `ClientCommandState`. Return paths include `ClientCommand(runtime.level,clientNum,argv)`.
/// @param runtime G cmds runtime; accesses `level`.
/// @param clientNum Client slot number.
/// @param commandState Command buffer state; accesses `argv`.
function ClientCommandState(runtime,clientNum,commandState)
  argv = []
  for index = 0 to commands.argc(commandState)-1
    argv = argv+[commands.argv(commandState,index)]
  end for
  return ClientCommand(runtime.level,clientNum,argv)
end function

// Productive server adapter for a raw reliable command.  It deliberately uses
// the shared Cmd_TokenizeString implementation, then invokes the same QAGame
// entry as VM GAME_CLIENT_COMMAND.
/// @param runtime G cmds runtime; accesses `commandState`.
/// @param clientNum Client slot number.
/// @param text Text to parse, format or deliver.
function ClientCommandText(runtime,clientNum,text)
  commands.tokenizeString(runtime.commandState,text)
  return ClientCommandState(runtime,clientNum,runtime.commandState)
end function
