// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 g_cmds.c chat, voice, taunts, game orders and position reporting.
package mq3.game.chat_commands
import mq3.game.command_args as commandArgs
import mq3.game.entities as game
import mq3.game.team_status as teamStatus
import mq3.game.team_bonuses as teamBonuses
import mq3.game.constants as c
import mq3.shared.info as infoStrings
import mq3.compat.textnumbers as textnum
import mq3.compat.numeric as n

const SAY_ALL = 0
const SAY_TEAM = 1
const SAY_TELL = 2
const SVF_BOT = 0x00000008
const COLOR_GREEN = 50
const COLOR_CYAN = 53
const COLOR_MAGENTA = 54

/// Require and return a client state for a chat command.
/// @param ent Game entity; accesses `client`.
function chatClient(ent)
  if ent == void or ent.client == void then return error(498,"Chat requires a client entity") end if
  return ent.client
end function
/// Require the game spawner and return its game type for chat routing.
/// @param level Game-level state; accesses `spawner`.
function chatGametype(level)
  if level.spawner == void then return error(498,"Chat requires game spawn state") end if
  return level.spawner.gametype
end function
/// Validate the chat client range against the native sixty-four-client capacity.
/// @param level Game-level state; accesses `maxclients`.
function chatClientLimit(level)
  if level.maxclients < 0 or level.maxclients > 64 then return error(498,"Invalid chat client range") end if
  return level.maxclients
end function
/// Use `level.serverCommandFn` to perform `chatServerCommand`.
/// @param level Game-level state; accesses `serverCommandFn`.
/// @param slot Slot in the owning table or pool.
/// @param text Text to parse, format or deliver.
function chatServerCommand(level,slot,text)
  if level.serverCommandFn == void then return error(498,"Chat requires server-command delivery") end if
  level.serverCommandFn(level,slot,text); return void
end function
/// Use `level.gameLogFn` to perform `chatLog`.
/// @param level Game-level state; accesses `gameLogFn`.
/// @param text Text to parse, format or deliver.
function chatLog(level,text)
  if level.gameLogFn == void then return error(498,"Chat requires game-log delivery") end if
  level.gameLogFn(level,text); return void
end function
/// Use `level.gamePrintFn` to perform `chatPrint`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param text Text to parse, format or deliver.
function chatPrint(level,text)
  if level.gamePrintFn == void then return error(498,"Chat requires game-print delivery") end if
  level.gamePrintFn(level,text); return void
end function
/// Apply `mq3.shared.info.textBytes`, `mq3.game.chat_commands.chatPrint` and `mq3.shared.info.copy` while evaluating `chatFormattedCopy`. Return paths include `infoStrings.copy(text,capacity)`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param text Text to parse, format or deliver.
/// @param capacity Maximum number of entries to allocate or retain.
function chatFormattedCopy(level,text,capacity)
  size = len(infoStrings.textBytes(text))
  if size >= 32000 then return error(498,"Chat format exceeds native temporary storage") end if
  if size >= capacity then chatPrint(level,"Com_sprintf: overflow of "+str(size)+" in "+str(capacity)+"\n") end if
  return infoStrings.copy(text,capacity)
end function
/// Apply `mq3.game.team_bonuses.sameTeam`, `mq3.game.chat_commands.chatGametype` and `mq3.game.chat_commands.chatClient` while evaluating `sayTo`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent First record; accesses `client`.
/// @param other Other record; accesses `inuse`, `client` and `slot`.
/// @param mode Value used by `sayTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param color Operand used to evaluate the returned expression `chatServerCommand(level,other.slot,command+" \""+name+"^"+decode(bytes([color & 255]))+message+"\"")`.
/// @param name Name used to identify the requested entry.
/// @param message Message text supplied to the diagnostic or chat operation.
function sayTo(level,ent,other,mode,color,name,message)
  if other == void then return void end if
  if not other.inuse or other.client == void then return void end if
  if other.client.connected != 2 then return void end if
  if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if
  if chatGametype(level) == 1 and other.client.team == 0 and chatClient(ent).team != 0 then return void end if
  command = "chat"
  if mode == SAY_TEAM then command = "tchat" end if
  return chatServerCommand(level,other.slot,command+" \""+name+"^"+decode(bytes([color & 255]))+message+"\"")
end function
/// Apply `mq3.game.chat_commands.chatClient`, `mq3.game.chat_commands.chatGametype` and `mq3.shared.info.textBytes` while evaluating `say`.
/// @param level Game-level state; accesses `dedicated` and `entities`.
/// @param ent Game entity; accesses `client`.
/// @param target Target record; accesses `client`.
/// @param mode Value used by `sayTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param chatText Text to parse, format or deliver.
function say(level,ent,target,mode,chatText)
  chatClient(ent); gametype = chatGametype(level); infoStrings.textBytes(chatText)
  if gametype < 3 and mode == SAY_TEAM then mode = SAY_ALL end if
  ec = decode(bytes([25])); name = ""; color = COLOR_GREEN
  if mode == SAY_TEAM then
    chatLog(level,"sayteam: "+chatClient(ent).netname+": "+chatText+"\n")
    location = teamStatus.getLocationMsg(level,ent,64)
    name = ec+"("+chatClient(ent).netname+"^7"+ec+")"
    if location != void then name = name+" ("+location+")" end if
    name = name+ec+": "; color = COLOR_CYAN
  else if mode == SAY_TELL then
    location = void
    if target != void and gametype >= 3 then
      if target.client == void then return error(498,"Team tell target has no native client") end if
      if target.client.team == chatClient(ent).team then location = teamStatus.getLocationMsg(level,ent,64) end if
    end if
    name = ec+"["+chatClient(ent).netname+"^7"+ec+"]"
    if location != void then name = name+" ("+location+")" end if
    name = name+ec+": "; color = COLOR_MAGENTA
  else
    chatLog(level,"say: "+chatClient(ent).netname+": "+chatText+"\n")
    name = chatClient(ent).netname+"^7"+ec+": "
  end if
  name = chatFormattedCopy(level,name,64); text = infoStrings.copy(chatText,150)
  if target != void then return sayTo(level,ent,target,mode,color,name,text) end if
  if level.dedicated != 0 then chatPrint(level,name+text+"\n") end if
  index = 0
  while index < chatClientLimit(level)
    other = level.entities[index]; index = index+1; sayTo(level,ent,other,mode,color,name,text)
  end while
  return void
end function
/// Apply `mq3.game.chat_commands.say` and `mq3.game.command_args.concat` while evaluating `sayCommand`. Return paths include `say(level,ent,void,mode,commandArgs.concat(argv,start))`.
/// @param level Game-level state; accesses `dedicated` and `entities`.
/// @param ent Game entity; accesses `client`.
/// @param argv Command argument strings in their original order.
/// @param mode Value used by `sayTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param arg0 Value used by `sayCommand` in `if len(argv) < 2 and not arg0 then return void end if`.
function sayCommand(level,ent,argv,mode,arg0)
  if len(argv) < 2 and not arg0 then return void end if
  start = 1
  if arg0 then start = 0 end if
  return say(level,ent,void,mode,commandArgs.concat(argv,start))
end function
/// Apply `mq3.game.command_args.argument`, `mq3.game.chat_commands.chatClientLimit` and `mq3.game.command_args.concat` while evaluating `tellCommand`.
/// @param level Game-level state; accesses `entities`.
/// @param ent Game entity; accesses `r`.
/// @param argv Command argument strings in their original order.
function tellCommand(level,ent,argv)
  if len(argv) < 2 then return void end if
  slot = textnum.atoi(commandArgs.argument(argv,1,1024))
  if slot < 0 or slot >= chatClientLimit(level) then return void end if
  target = level.entities[slot]
  if target == void or not target.inuse or target.client == void then return void end if
  text = commandArgs.concat(argv,2); client = chatClient(ent)
  chatLog(level,"tell: "+client.netname+" to "+target.client.netname+": "+text+"\n")
  say(level,ent,target,SAY_TELL,text)
  if ent != target and (ent.r.svFlags & SVF_BOT) == 0 then say(level,ent,ent,SAY_TELL,text) end if
  return void
end function
/// Preserve an integer voice-only value or convert a truth value to one or zero.
/// @param value Value passed as argument 1 to `typeof`.
function chatVoiceOnly(value)
  // qboolean is an int in C and direct callers can retain a noncanonical value.
  if typeof(value) == "int" then return n.i32(value) end if
  if value then return 1 end if
  return 0
end function
/// Apply `mq3.game.team_bonuses.sameTeam`, `mq3.game.chat_commands.chatGametype` and `mq3.game.chat_commands.chatServerCommand` while evaluating `voiceTo`.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `s`.
/// @param other Other record; accesses `inuse`, `client` and `slot`.
/// @param mode Value used by `voiceTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param id Operand used to evaluate the returned expression `chatServerCommand(level,other.slot,command+" "+str(chatVoiceOnly(voiceOnly))+" "+str(n.i32(ent.s.number))+" "+str(color)+" "+id)`.
/// @param voiceOnly Whether to emit voice without the accompanying text message.
function voiceTo(level,ent,other,mode,id,voiceOnly)
  if other == void then return void end if
  if not other.inuse or other.client == void then return void end if
  // G_VoiceTo deliberately does not test pers.connected.
  if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if
  if chatGametype(level) == 1 then return void end if
  color = COLOR_GREEN; command = "vchat"
  if mode == SAY_TEAM then color = COLOR_CYAN; command = "vtchat"
  else if mode == SAY_TELL then color = COLOR_MAGENTA; command = "vtell" end if
  return chatServerCommand(level,other.slot,command+" "+str(chatVoiceOnly(voiceOnly))+" "+str(n.i32(ent.s.number))+" "+str(color)+" "+id)
end function
/// Apply `mq3.game.chat_commands.chatGametype`, `mq3.shared.info.textBytes` and `mq3.game.chat_commands.voiceTo` while evaluating `voice`.
/// @param level Game-level state; accesses `dedicated` and `entities`.
/// @param ent Game entity; accesses `s`.
/// @param target Other record; accesses `inuse`, `client` and `slot`.
/// @param mode Value used by `voiceTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param id Text to parse, format or deliver.
/// @param voiceOnly Whether to emit voice without the accompanying text message.
function voice(level,ent,target,mode,id,voiceOnly)
  if chatGametype(level) < 3 and mode == SAY_TEAM then mode = SAY_ALL end if
  infoStrings.textBytes(id)
  if target != void then return voiceTo(level,ent,target,mode,id,voiceOnly) end if
  if level.dedicated != 0 then chatPrint(level,"voice: "+chatClient(ent).netname+" "+id+"\n") end if
  index = 0
  while index < chatClientLimit(level)
    other = level.entities[index]; index = index+1; voiceTo(level,ent,other,mode,id,voiceOnly)
  end while
  return void
end function
/// Apply `mq3.game.chat_commands.voice` and `mq3.game.command_args.concat` while evaluating `voiceCommand`. Return paths include `voice(level,ent,void,mode,commandArgs.concat(argv,start),voiceOnly)`.
/// @param level Game-level state; accesses `dedicated` and `entities`.
/// @param ent Game entity; accesses `s`.
/// @param argv Command argument strings in their original order.
/// @param mode Value used by `voiceTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`.
/// @param arg0 Value used by `voiceCommand` in `if len(argv) < 2 and not arg0 then return void end if`.
/// @param voiceOnly Whether to emit voice without the accompanying text message.
function voiceCommand(level,ent,argv,mode,arg0,voiceOnly)
  if len(argv) < 2 and not arg0 then return void end if
  start = 1
  if arg0 then start = 0 end if
  return voice(level,ent,void,mode,commandArgs.concat(argv,start),voiceOnly)
end function
/// Apply `mq3.game.command_args.argument`, `mq3.game.chat_commands.chatClientLimit` and `mq3.game.command_args.concat` while evaluating `voiceTellCommand`.
/// @param level Game-level state; accesses `entities`.
/// @param ent Game entity; accesses `r`.
/// @param argv Command argument strings in their original order.
/// @param voiceOnly Whether to emit voice without the accompanying text message.
function voiceTellCommand(level,ent,argv,voiceOnly)
  if len(argv) < 2 then return void end if
  slot = textnum.atoi(commandArgs.argument(argv,1,1024))
  if slot < 0 or slot >= chatClientLimit(level) then return void end if
  target = level.entities[slot]
  if target == void or not target.inuse or target.client == void then return void end if
  id = commandArgs.concat(argv,2); client = chatClient(ent)
  chatLog(level,"vtell: "+client.netname+" to "+target.client.netname+": "+id+"\n")
  voice(level,ent,target,SAY_TELL,id,voiceOnly)
  if ent != target and (ent.r.svFlags & SVF_BOT) == 0 then voice(level,ent,ent,SAY_TELL,id,voiceOnly) end if
  return void
end function
/// Set `ent.enemy` to `void` and `ent.client.lastkilled_client` to `-1` in `mq3.game.chat_commands.voiceTaunt`. Return paths include `voice(level,ent,void,SAY_ALL,"taunt",false)`.
/// @param level Game-level state; accesses `entities` and `time`.
/// @param ent Game entity; accesses `client`, `enemy`, `s` and `r`. May update `ent.enemy` and `ent.client.lastkilled_client` in place.
function voiceTaunt(level,ent)
  if ent.client == void then return void end if
  if ent.enemy != void and ent.enemy.client != void and ent.enemy.client.lastkilled_client == ent.s.number then
    if (ent.enemy.r.svFlags & SVF_BOT) == 0 then voice(level,ent,ent.enemy,SAY_TELL,"death_insult",false) end if
    if (ent.r.svFlags & SVF_BOT) == 0 then voice(level,ent,ent,SAY_TELL,"death_insult",false) end if
    ent.enemy = void; return void
  end if
  slot = ent.client.lastkilled_client
  if slot >= 0 and slot != ent.s.number then
    // Original pointer addition outside the entity array has no valid result.
    if slot >= 1024 then return error(498,"Voice taunt victim exceeds native entity storage") end if
    who = level.entities[slot]
    if who.client != void then
      id = "kill_insult"
      if who.client.lasthurt_mod == c.MOD_GAUNTLET then id = "kill_gauntlet" end if
      if (who.r.svFlags & SVF_BOT) == 0 then voice(level,ent,who,SAY_TELL,id,false) end if
      if (ent.r.svFlags & SVF_BOT) == 0 then voice(level,ent,ent,SAY_TELL,id,false) end if
      ent.client.lastkilled_client = -1; return void
    end if
  end if
  if chatGametype(level) >= 3 then
    index = 0
    while index < 64
      who = level.entities[index]; index = index+1
      if who.client != void and who != ent and who.client.team == ent.client.team then
        if who.client.rewardTime > level.time then
          if (who.r.svFlags & SVF_BOT) == 0 then voice(level,ent,who,SAY_TELL,"praise",false) end if
          if (ent.r.svFlags & SVF_BOT) == 0 then voice(level,ent,ent,SAY_TELL,"praise",false) end if
          return void
        end if
      end if
    end while
  end if
  return voice(level,ent,void,SAY_ALL,"taunt",false)
end function
/// Apply `mq3.game.command_args.argument` and `mq3.game.chat_commands.say` while evaluating `gameCommand`.
/// @param level Game-level state; accesses `entities`.
/// @param ent Game entity; accesses `client`.
/// @param argv Command argument strings in their original order.
function gameCommand(level,ent,argv)
  player = textnum.atoi(commandArgs.argument(argv,1,1024)); order = textnum.atoi(commandArgs.argument(argv,2,1024))
  if player < 0 or player >= 64 then return void end if
  if order < 0 or order > 7 then return void end if
  // The original > instead of >= guard admits a one-past-array pointer read.
  if order == 7 then return error(498,"Game order exceeds native gc_orders storage") end if
  orders = ["hold your position","hold this position","come here","cover me","guard location","search and destroy","report"]
  say(level,ent,level.entities[player],SAY_TELL,orders[order]); say(level,ent,ent,SAY_TELL,orders[order]); return void
end function
/// Apply `mq3.game.entities.vtos` and `mq3.game.chat_commands.chatServerCommand` while evaluating `where`. Return paths include `chatServerCommand(level,ent.slot,"print \""+text+"\n\"")`.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param ent Game entity; accesses `s` and `slot`.
function where(level,ent)
  text = game.vtos(level,ent.s.origin)
  return chatServerCommand(level,ent.slot,"print \""+text+"\n\"")
end function
