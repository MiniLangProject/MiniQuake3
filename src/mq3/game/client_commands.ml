// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete Baseq3 ClientCommand dispatch. The engine supplies tokenized argv.
package mq3.game.client_commands
import mq3.game.command_args as commandArgs
import mq3.game.chat_commands as chat
import mq3.game.utility_commands as utility
import mq3.game.scores as scores
import mq3.game.follow_commands as followCommands
import mq3.game.team_changes as teamChanges
import mq3.game.vote_commands as voteCommands
import mq3.game.votes as votes
import std.string as strings

/// Apply `mq3.game.command_args.argument`, `mq3.game.chat_commands.sayCommand` and `mq3.game.chat_commands.tellCommand` while evaluating `command`.
/// @param level Game-level state; accesses `entities` and `intermissiontime`.
/// @param clientNum Client slot number.
/// @param argv Command argument strings in their original order.
function command(level,clientNum,argv)
  if clientNum < 0 or clientNum >= 64 then return error(488,"Invalid client command slot") end if
  ent = level.entities[clientNum]
  // The native game returns before trap_Argv when the client is not bound yet.
  if ent.client == void then return void end if
  cmd = commandArgs.argument(argv,0,1024)
  if strings.equalsIgnoreCaseAscii(cmd,"say") then return chat.sayCommand(level,ent,argv,0,false) end if
  if strings.equalsIgnoreCaseAscii(cmd,"say_team") then return chat.sayCommand(level,ent,argv,1,false) end if
  if strings.equalsIgnoreCaseAscii(cmd,"tell") then return chat.tellCommand(level,ent,argv) end if
  if strings.equalsIgnoreCaseAscii(cmd,"vsay") then return chat.voiceCommand(level,ent,argv,0,false,false) end if
  if strings.equalsIgnoreCaseAscii(cmd,"vsay_team") then return chat.voiceCommand(level,ent,argv,1,false,false) end if
  if strings.equalsIgnoreCaseAscii(cmd,"vtell") then return chat.voiceTellCommand(level,ent,argv,false) end if
  if strings.equalsIgnoreCaseAscii(cmd,"vosay") then return chat.voiceCommand(level,ent,argv,0,false,true) end if
  if strings.equalsIgnoreCaseAscii(cmd,"vosay_team") then return chat.voiceCommand(level,ent,argv,1,false,true) end if
  if strings.equalsIgnoreCaseAscii(cmd,"votell") then return chat.voiceTellCommand(level,ent,argv,true) end if
  if strings.equalsIgnoreCaseAscii(cmd,"vtaunt") then return chat.voiceTaunt(level,ent) end if
  if strings.equalsIgnoreCaseAscii(cmd,"score") then return scores.commandScore(level,ent) end if
  // Every other command becomes public chat, including argv[0], at intermission.
  if level.intermissiontime != 0 then return chat.sayCommand(level,ent,argv,0,true) end if
  if strings.equalsIgnoreCaseAscii(cmd,"give") then return utility.give(level,ent,argv) end if
  if strings.equalsIgnoreCaseAscii(cmd,"god") then return utility.god(level,ent) end if
  if strings.equalsIgnoreCaseAscii(cmd,"notarget") then return utility.notarget(level,ent) end if
  if strings.equalsIgnoreCaseAscii(cmd,"noclip") then return utility.noclip(level,ent) end if
  if strings.equalsIgnoreCaseAscii(cmd,"kill") then return utility.kill(level,ent) end if
  if strings.equalsIgnoreCaseAscii(cmd,"teamtask") then return utility.teamTask(level,ent,argv) end if
  if strings.equalsIgnoreCaseAscii(cmd,"levelshot") then return utility.levelshot(level,ent) end if
  if strings.equalsIgnoreCaseAscii(cmd,"follow") then return followCommands.follow(level,ent,argv) end if
  if strings.equalsIgnoreCaseAscii(cmd,"follownext") then return followCommands.cycle(level,ent,1) end if
  if strings.equalsIgnoreCaseAscii(cmd,"followprev") then return followCommands.cycle(level,ent,-1) end if
  if strings.equalsIgnoreCaseAscii(cmd,"team") then return teamChanges.commandTeam(level,ent,argv) end if
  if strings.equalsIgnoreCaseAscii(cmd,"where") then return chat.where(level,ent) end if
  if strings.equalsIgnoreCaseAscii(cmd,"callvote") then return voteCommands.callVote(level,ent,argv) end if
  if strings.equalsIgnoreCaseAscii(cmd,"vote") then return voteCommands.castVote(level,ent,argv) end if
  if strings.equalsIgnoreCaseAscii(cmd,"callteamvote") then return voteCommands.callTeamVote(level,ent,argv) end if
  if strings.equalsIgnoreCaseAscii(cmd,"teamvote") then return voteCommands.castTeamVote(level,ent,argv) end if
  if strings.equalsIgnoreCaseAscii(cmd,"gc") then return chat.gameCommand(level,ent,argv) end if
  if strings.equalsIgnoreCaseAscii(cmd,"setviewpos") then return utility.setViewpos(level,ent,argv) end if
  if strings.equalsIgnoreCaseAscii(cmd,"stats") then return utility.stats(level,ent) end if
  votes.send(level,clientNum,"print \"unknown cmd "+cmd+"\n\""); return void
end function
