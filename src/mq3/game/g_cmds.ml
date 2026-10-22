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

struct Runtime level commandState end struct

function createRuntime(level)
  return Runtime(level,commands.create())
end function

function ConcatArgs(argv,start) return args.concat(argv,start) end function
function DeathmatchScoreboardMessage(level,ent) return scores.scoreboard(level,ent) end function
function Cmd_Score_f(level,ent) return scores.commandScore(level,ent) end function
function CheatsOk(level,ent) return utility.cheatsOk(level,ent) end function
function SanitizeString(text) return follow.sanitize(text) end function
function ClientNumberFromString(level,callerEnt,text) return follow.clientNumber(level,callerEnt,text) end function

function Cmd_Give_f(level,ent,argv) return utility.give(level,ent,argv) end function
function Cmd_God_f(level,ent) return utility.god(level,ent) end function
function Cmd_Notarget_f(level,ent) return utility.notarget(level,ent) end function
function Cmd_Noclip_f(level,ent) return utility.noclip(level,ent) end function
function Cmd_LevelShot_f(level,ent) return utility.levelshot(level,ent) end function
function Cmd_TeamTask_f(level,ent,argv) return utility.teamTask(level,ent,argv) end function
function Cmd_Kill_f(level,ent) return utility.kill(level,ent) end function
function BroadcastTeamChange(level,client,oldTeam) return sessions.broadcastTeamChange(level,client,oldTeam) end function
function SetTeam(level,ent,text) return teams.setTeam(level,ent,text) end function
function StopFollowing(level,ent) return teams.stopFollowing(level,ent) end function
function Cmd_Team_f(level,ent,argv) return teams.commandTeam(level,ent,argv) end function
function Cmd_Follow_f(level,ent,argv) return follow.follow(level,ent,argv) end function
function Cmd_FollowCycle_f(level,ent,direction) return follow.cycle(level,ent,direction) end function

function G_SayTo(level,ent,other,mode,color,name,message) return chat.sayTo(level,ent,other,mode,color,name,message) end function
function G_Say(level,ent,target,mode,text) return chat.say(level,ent,target,mode,text) end function
function Cmd_Say_f(level,ent,argv,mode,arg0) return chat.sayCommand(level,ent,argv,mode,arg0) end function
function Cmd_Tell_f(level,ent,argv) return chat.tellCommand(level,ent,argv) end function
function G_VoiceTo(level,ent,other,mode,id,voiceOnly) return chat.voiceTo(level,ent,other,mode,id,voiceOnly) end function
function G_Voice(level,ent,target,mode,id,voiceOnly) return chat.voice(level,ent,target,mode,id,voiceOnly) end function
function Cmd_Voice_f(level,ent,argv,mode,arg0,voiceOnly) return chat.voiceCommand(level,ent,argv,mode,arg0,voiceOnly) end function
function Cmd_VoiceTell_f(level,ent,argv,voiceOnly) return chat.voiceTellCommand(level,ent,argv,voiceOnly) end function
function Cmd_VoiceTaunt_f(level,ent) return chat.voiceTaunt(level,ent) end function
function Cmd_GameCommand_f(level,ent,argv) return chat.gameCommand(level,ent,argv) end function
function Cmd_Where_f(level,ent) return chat.where(level,ent) end function

function Cmd_CallVote_f(level,ent,argv) return voteCommands.callVote(level,ent,argv) end function
function Cmd_Vote_f(level,ent,argv) return voteCommands.castVote(level,ent,argv) end function
function Cmd_CallTeamVote_f(level,ent,argv) return voteCommands.callTeamVote(level,ent,argv) end function
function Cmd_TeamVote_f(level,ent,argv) return voteCommands.castTeamVote(level,ent,argv) end function
function Cmd_SetViewpos_f(level,ent,argv) return utility.setViewpos(level,ent,argv) end function
function Cmd_Stats_f(level,ent) return utility.stats(level,ent) end function

// GAME_CLIENT_COMMAND uses this entry after the server has tokenized the
// reliable command.  Keeping ClientCommand itself argv-based avoids a second
// tokenizer on the normal engine path.
function ClientCommand(level,clientNum,argv) return dispatch.command(level,clientNum,argv) end function

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
function ClientCommandText(runtime,clientNum,text)
  commands.tokenizeString(runtime.commandState,text)
  return ClientCommandState(runtime,clientNum,runtime.commandState)
end function
