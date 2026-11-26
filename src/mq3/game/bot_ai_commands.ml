// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// ai_main.c server-command ingestion and bot status/configstring projection.
package mq3.game.bot_ai_commands
import mq3.game.bot_lifecycle as commandBots
import mq3.game.playerstate as ps
import mq3.shared.info as info
import mq3.game.bot_fight_state as fight
import mq3.game.bot_seek_state as seek

/// Console-message category for ordinary engine messages.
const CMS_NORMAL=0
/// Console-message category for chat text supplied to bot chat processing.
const CMS_CHAT=1
/// Game-mode identifier selecting capture the flag rules.
const GT_CTF=4
/// Team identifier selecting the red team/category.
const TEAM_RED=1
/// Team identifier selecting the blue team/category.
const TEAM_BLUE=2
/// Long-term bot goal identifier selecting teamhelp behavior.
const LTG_TEAMHELP=1
/// Long-term bot goal identifier selecting teamaccompany behavior.
const LTG_TEAMACCOMPANY=2
/// Long-term bot goal identifier selecting defend a key area behavior.
const LTG_DEFENDKEYAREA=3
/// Long-term bot goal identifier selecting capture the flag behavior.
const LTG_GETFLAG=4
/// Long-term bot goal identifier selecting rush the base behavior.
const LTG_RUSHBASE=5
/// Long-term bot goal identifier selecting return the flag behavior.
const LTG_RETURNFLAG=6
/// Long-term bot goal identifier selecting camp behavior.
const LTG_CAMP=7
/// Long-term bot goal identifier selecting follow a camp order behavior.
const LTG_CAMPORDER=8
/// Long-term bot goal identifier selecting patrol behavior.
const LTG_PATROL=9
/// Long-term bot goal identifier selecting getitem behavior.
const LTG_GETITEM=10
/// Long-term bot goal identifier selecting kill behavior.
const LTG_KILL=11
/// Long-term bot goal identifier selecting harvest behavior.
const LTG_HARVEST=12
/// Long-term bot goal identifier selecting attackenemybase behavior.
const LTG_ATTACKENEMYBASE=13
/// Upper bound on nodeswitches represented by mq3.game.bot_ai_commands.
const MAX_NODESWITCHES=50

/// `Services` record for bot ai commands, containing `lifecycleState`, `frameLevel`, `maxclients`, `gametype` and `resetInputFn` and related fields.
struct Services
  /// State shared by bot allocation, setup, shutdown, and frame processing.
  lifecycleState
  /// Game-level state supplied to bot frame processing.
  frameLevel
  /// Configured number of client slots active in this game state.
  maxclients
  /// GT_* game-mode identifier used for bot command processing and mode-specific player information.
  gametype
  /// Injected callback for reset input; invoked through the Services service/state record.
  resetInputFn
  /// Injected callback for get client state; invoked through the Services service/state record.
  getClientStateFn
  /// Injected callback for next server command; invoked through the Services service/state record.
  nextServerCommandFn
  /// Injected callback for queue message; invoked through the Services service/state record.
  queueMessageFn
  /// Injected callback for deathmatch setup; invoked through the Services service/state record.
  deathmatchSetupFn
  /// Injected callback for diagnostic; invoked through the Services service/state record.
  diagnosticFn
  /// Injected callback for client name; invoked through the Services service/state record.
  clientNameFn
  /// Injected callback for easy client name; invoked through the Services service/state record.
  easyClientNameFn
  /// Injected callback for goal name; invoked through the Services service/state record.
  goalNameFn
  /// Injected callback for top goal number; invoked through the Services service/state record.
  topGoalNumberFn
  /// Injected callback for carrying flag; invoked through the Services service/state record.
  carryingFlagFn
  /// Injected callback for team; invoked through the Services service/state record.
  teamFn
  /// Injected callback for get player config; invoked through the Services service/state record.
  getPlayerConfigFn
  /// Injected callback for set bot info; invoked through the Services service/state record.
  setBotInfoFn
  /// Injected callback for print; invoked through the Services service/state record.
  printFn
  /// Callbacks and shared state used by the bot fight node.
  fightServices
  /// Callbacks used by the bot seek/goal-acquisition node.
  seekServices
  /// Injected callback for node step; invoked through the Services service/state record.
  nodeStepFn
  /// Opaque caller-supplied context available to bot command processing, client-state lookup, and
  /// diagnostic callbacks.
  context
end struct
/// Create a `mq3.game.bot_ai_commands.Services` record, initializing `lifecycleState` from `state`, `maxclients` as `64` and `nodeStepFn` as `battleNodeStep`.
/// @param state Initial value stored in `mq3.game.bot_ai_commands.Services.lifecycleState`.
function create(state)
  return Services(state,void,64,0,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,battleNodeStep,void)
end function
/// Apply `mq3.game.bot_seek_state.runNode` and `mq3.game.bot_fight_state.runNode` while evaluating `battleNodeStep`. Return paths include `fight.runNode(services.fightServices,bot)`.
/// @param services Host service callbacks; accesses `seekServices` and `fightServices`.
/// @param bot Bot AI state; accesses `aiNode`.
function battleNodeStep(services,bot)
  if services.seekServices!=void then return seek.runNode(services.seekServices,bot) end if
  if services.fightServices==void then return error(499,"Bot AI battle services are not configured") end if
  return fight.runNode(services.fightServices,bot)
end function
/// Remove Quake color escape pairs and DEL bytes from bot command text.
/// @param text Text to parse, format or deliver.
function removeColorEscapeSequences(text)
  source=bytes(text);output=[];index=0
  while index<len(source)
    value=source[index]
    if value==94 and index+1<len(source) and source[index+1]!=0 and source[index+1]!=94 then index=index+2;continue end if
    // MSVC uses signed char: 0x80..0xff do not compare greater than 0x7e.
    if value==127 then index=index+1;continue end if
    output=output+[value];index=index+1
  end while
  return decode(bytes(output))
end function
/// Remove the outer byte pair from quoted bot command text, returning empty text for a short input.
/// @param text Text to parse, format or deliver.
function unquote(text)
  data=bytes(text);if len(data)<2 then return "" end if
  output=[];for index=1 to len(data)-2 output=output+[data[index]] end for;return decode(bytes(output))
end function
/// Use `services.nodeStepFn` to perform `runNodes`.
/// @param services Host service callbacks; accesses `nodeStepFn`.
/// @param bot Bot AI state; accesses `aiNode` and `inuse`.
function runNodes(services,bot)
  if bot.aiNode==0 then return true end if
  if services.nodeStepFn==void then return error(499,"Bot AI node has no dispatcher: "+str(bot.aiNode)) end if
  for index=0 to MAX_NODESWITCHES-1
    if services.nodeStepFn(services,bot) then return true end if
    if not bot.inuse then return true end if
  end for
  return error(499,"Bot switched more than "+str(MAX_NODESWITCHES)+" AI nodes")
end function
/// Use `services.resetInputFn`, `services.diagnosticFn` and `services.getClientStateFn` to perform `botAI`. Return paths include `runNodes(services,bot)`.
/// @param services Host service callbacks; accesses `resetInputFn`, `lifecycleState`, `diagnosticFn`, `getClientStateFn` and `nextServerCommandFn` and related fields.
/// @param client Value passed as argument 2 to `services.resetInputFn`.
/// @param thinktime Not read by this implementation; retained in the `botAI` signature.
function botAI(services,client,thinktime)
  services.resetInputFn(services,client)
  bot=services.lifecycleState.botstates[client]
  if bot==void or not bot.inuse then if services.diagnosticFn!=void then services.diagnosticFn(services,client) end if return false end if
  pair=services.getClientStateFn(services,client);if pair[0] then bot.curPs=pair[1] else bot.curPs=ps.create() end if
  while true
    command=services.nextServerCommandFn(services,client);if command==void then break end if
    data=bytes(command);split=-1;for index=0 to len(data)-1 if data[index]==32 then split=index;break end if end for
    if split<0 then continue end if
    nameBytes=[];for index=0 to split-1 nameBytes=nameBytes+[data[index]] end for
    argBytes=[];for index=split+1 to len(data)-1 argBytes=argBytes+[data[index]] end for
    name=decode(bytes(nameBytes));args=removeColorEscapeSequences(decode(bytes(argBytes)))
    if name=="print" then services.queueMessageFn(services,bot.cs,CMS_NORMAL,unquote(args))
    else if name=="chat" or name=="tchat" then services.queueMessageFn(services,bot.cs,CMS_CHAT,unquote(args)) end if
  end while
  services.deathmatchSetupFn(services);return runNodes(services,bot)
end function
/// Right-pad bot diagnostic text with spaces until its byte length is at least twenty.
/// @param text Text to parse, format or deliver.
function pad20(text) result=text;while len(bytes(result))<20 result=result+" " end while;return result end function
/// Use `services.easyClientNameFn`, `services.goalNameFn` and `services.clientNameFn` to perform `action`. Return paths include `+services.goalNameFn(services,roamingGoal)`.
/// @param services Host service callbacks; accesses `easyClientNameFn`, `goalNameFn` and `clientNameFn`.
/// @param bot Bot AI state; accesses `ltgtype`, `teammate`, `teamgoalNumber` and `teamgoalEntitynum`.
/// @param roamingGoal Value passed as argument 2 to `services.goalNameFn`.
function action(services,bot,roamingGoal)
  if bot.ltgtype==LTG_TEAMHELP then return "helping "+services.easyClientNameFn(services,bot.teammate) end if
  if bot.ltgtype==LTG_TEAMACCOMPANY then return "accompanying "+services.easyClientNameFn(services,bot.teammate) end if
  if bot.ltgtype==LTG_DEFENDKEYAREA then return "defending "+services.goalNameFn(services,bot.teamgoalNumber) end if
  if bot.ltgtype==LTG_GETITEM then return "getting item "+services.goalNameFn(services,bot.teamgoalNumber) end if
  if bot.ltgtype==LTG_KILL then return "killing "+services.clientNameFn(services,bot.teamgoalEntitynum) end if
  if bot.ltgtype==LTG_CAMP or bot.ltgtype==LTG_CAMPORDER then return "camping" end if
  if bot.ltgtype==LTG_PATROL then return "patrolling" end if
  if bot.ltgtype==LTG_GETFLAG then return "capturing flag" end if
  if bot.ltgtype==LTG_RUSHBASE then return "rushing base" end if
  if bot.ltgtype==LTG_RETURNFLAG then return "returning flag" end if
  if bot.ltgtype==LTG_ATTACKENEMYBASE then return "attacking the enemy base" end if
  if bot.ltgtype==LTG_HARVEST then return "harvesting" end if
  return "roaming "+services.goalNameFn(services,roamingGoal)
end function
/// Use `services.clientNameFn` to perform `leader`.
/// @param services Host service callbacks; accesses `clientNameFn`.
/// @param bot Bot AI state; accesses `client` and `teamleader`.
function leader(services,bot) if services.clientNameFn(services,bot.client)==bot.teamleader then return "L" end if return " " end function
/// Use `services.carryingFlagFn` and `services.teamFn` to perform `carrying`.
/// @param services Host service callbacks; accesses `gametype`, `carryingFlagFn` and `teamFn`.
/// @param bot Value passed as argument 2 to `services.carryingFlagFn`.
/// @param colored Value used by `carrying` in `if not colored then return "F " end if`.
function carrying(services,bot,colored)
  if services.gametype!=GT_CTF or not services.carryingFlagFn(services,bot) then return "  " end if
  if not colored then return "F " end if
  if services.teamFn(services,bot)==TEAM_RED then return "^1F " end if return "^4F "
end function
/// Use `services.topGoalNumberFn` and `services.setBotInfoFn` to perform `setInfoConfigString`.
/// @param services Host service callbacks; accesses `topGoalNumberFn` and `setBotInfoFn`.
/// @param bot Bot AI state; accesses `gs` and `client`.
function setInfoConfigString(services,bot)
  top=services.topGoalNumberFn(services,bot.gs);value="l\\"+leader(services,bot)+"\\c\\"+carrying(services,bot,false)+"\\a\\"+action(services,bot,top)
  services.setBotInfoFn(services,bot.client,value);return value
end function
/// Use `services.getPlayerConfigFn` to perform `updateInfoConfigStrings`. Return paths include `count`.
/// @param services Host service callbacks; accesses `maxclients`, `lifecycleState` and `getPlayerConfigFn`.
function updateInfoConfigStrings(services)
  count=0;limit=services.maxclients;if limit>64 then limit=64 end if
  for index=0 to limit-1
    bot=services.lifecycleState.botstates[index];if bot==void or not bot.inuse then continue end if
    value=services.getPlayerConfigFn(services,index);if value=="" or info.value(value,"n")=="" then continue end if
    setInfoConfigString(services,bot);count=count+1
  end for
  return count
end function
/// Use `services.topGoalNumberFn`, `services.clientNameFn` and `services.printFn` to perform `reportStatus`. Return paths include `line`.
/// @param services Host service callbacks; accesses `topGoalNumberFn`, `clientNameFn` and `printFn`.
/// @param bot Bot AI state; accesses `gs` and `client`.
function reportStatus(services,bot)
  top=services.topGoalNumberFn(services,bot.gs);name=services.clientNameFn(services,bot.client)
  line=pad20(name)+leader(services,bot)+carrying(services,bot,true)+": "+action(services,bot,top)+"\n"
  services.printFn(services,line);return line
end function
/// Use `services.printFn` and `services.getPlayerConfigFn` to perform `teamplayReport`.
/// @param services Host service callbacks; accesses `printFn`, `maxclients`, `lifecycleState` and `getPlayerConfigFn`.
function teamplayReport(services)
  services.printFn(services,"^1RED\n");limit=services.maxclients;if limit>64 then limit=64 end if
  for index=0 to limit-1 bot=services.lifecycleState.botstates[index];if bot==void or not bot.inuse then continue end if;value=services.getPlayerConfigFn(services,index);if value!="" and info.value(value,"n")!="" and toNumber(info.value(value,"t"))==TEAM_RED then reportStatus(services,bot) end if end for
  services.printFn(services,"^4BLUE\n")
  for index=0 to limit-1 bot=services.lifecycleState.botstates[index];if bot==void or not bot.inuse then continue end if;value=services.getPlayerConfigFn(services,index);if value!="" and info.value(value,"n")!="" and toNumber(info.value(value,"t"))==TEAM_BLUE then reportStatus(services,bot) end if end for
  return void
end function
