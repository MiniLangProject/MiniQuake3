// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ai_team.c team enumeration and task-preference helpers.
package mq3.game.bot_team_helpers
import mq3.shared.info as info
import std.string as strings
import mq3.compat.numeric as n
import mq3.game.bot_ai_headers as aiheaders

/// Maximum number of client slots represented by the original game protocol.
const MAX_CLIENTS=64
/// Team identifier selecting the spectator team/category.
const TEAM_SPECTATOR=3
/// Bot team-task preference bit indicating a preference for attacker.
const TEAMTP_ATTACKER=aiheaders.TEAMTP_ATTACKER
/// Bot team-task preference bit indicating a preference for defender.
const TEAMTP_DEFENDER=aiheaders.TEAMTP_DEFENDER
/// Capture-the-flag strategy identifier selecting agressive.
const CTFS_AGRESSIVE=aiheaders.CTFS_AGRESSIVE

/// `State` record for bot team helpers, containing `names`, `preferenceNames`, `preferences`, `configs` and `maxclients` and related fields.
struct State
  /// Name strings indexed by the corresponding state-table entries.
  names
  /// Names of the supported bot team-task preferences.
  preferenceNames
  /// Stored bot team-task preference values.
  preferences
  /// Configuration records associated with tracked clients or bot state.
  configs
  /// Configured number of client slots active in this game state.
  maxclients
  /// Injected callback for same team; invoked through the State service/state record.
  sameTeamFn
  /// Injected callback for client from name; invoked through the State service/state record.
  clientFromNameFn
  /// Injected callback for get chat message; invoked through the State service/state record.
  getChatMessageFn
  /// Injected callback for queue console message; invoked through the State service/state record.
  queueConsoleMessageFn
  /// Injected callback for enter chat; invoked through the State service/state record.
  enterChatFn
  /// Injected callback for team; invoked through the State service/state record.
  teamFn
  /// Injected callback for capture the flag both at base; invoked through the State service/state
  /// record.
  ctfBothAtBaseFn
  /// Injected callback for capture the flag enemy not at base; invoked through the State service/state
  /// record.
  ctfEnemyNotAtBaseFn
  /// Injected callback for capture the flag own not at base; invoked through the State service/state
  /// record.
  ctfOwnNotAtBaseFn
  /// Injected callback for capture the flag both not at base; invoked through the State service/state
  /// record.
  ctfBothNotAtBaseFn
  /// Injected callback for initial chat; invoked through the State service/state record.
  initialChatFn
  /// Injected callback for order always; invoked through the State service/state record.
  orderAlwaysFn
  /// Per-entity markers identifying allocated game entity slots.
  entityInUse
  /// Server entity flags indexed by entity number.
  entitySvFlags
  /// Markers identifying clients excluded from team-leader selection.
  notLeader
  /// Injected callback for set last ordered task; invoked through the State service/state record.
  setLastOrderedTaskFn
  /// Injected callback for defend; invoked through the State service/state record.
  defendFn
  /// GT_* game-mode identifier used for team orders and capture-the-flag helper decisions.
  gametype
  /// Injected callback for get client pm type; invoked through the State service/state record.
  getClientPmTypeFn
  /// Opaque caller-supplied context available to bot team lookup, ordering, and team-chat callbacks.
  context
  /// Injected callback for sort base; invoked through the State service/state record.
  sortBaseFn
end struct

/// Initialize team preferences and client tables and install the four CTF flag-state order callbacks.
function create()
  state=State(array(MAX_CLIENTS,""),array(MAX_CLIENTS,""),array(MAX_CLIENTS,0),array(MAX_CLIENTS,""),0,void,void,void,void,void,void,void,void,void,void,void,void,array(MAX_CLIENTS,false),array(MAX_CLIENTS,0),array(MAX_CLIENTS,false),void,void,0,void,void,void)
  state.ctfBothNotAtBaseFn=ctfOrdersBothFlagsNotAtBase;state.ctfOwnNotAtBaseFn=ctfOrdersFlagNotAtBase
  state.ctfEnemyNotAtBaseFn=ctfOrdersEnemyFlagNotAtBase;state.ctfBothAtBaseFn=ctfOrdersBothFlagsAtBase;return state
end function

/// Use `state.clientFromNameFn` to perform `validTeamLeader`.
/// @param state Bot team helpers state; accesses `clientFromNameFn` and `names`.
/// @param bot Bot AI state; accesses `teamleader`.
function validTeamLeader(state,bot)
  if bot.teamleader=="" then return false end if
  if state.clientFromNameFn!=void then return state.clientFromNameFn(state,bot.teamleader)!=-1 end if
  wanted=strings.toLowerAscii(bot.teamleader)
  for index=0 to MAX_CLIENTS-1 if strings.toLowerAscii(state.names[index])==wanted then return true end if end for
  return false
end function

/// Use `state.sameTeamFn` to perform `numTeamMates`. Return paths include `count`.
/// @param state Bot team helpers state; accesses `maxclients`, `configs` and `sameTeamFn`.
/// @param bot Value passed as argument 2 to `state.sameTeamFn`.
function numTeamMates(state,bot)
  limit=state.maxclients;if limit>MAX_CLIENTS then limit=MAX_CLIENTS end if
  count=0
  for index=0 to limit-1
    value=state.configs[index]
    if value=="" or info.value(value,"n")=="" then continue end if
    if toNumber(info.value(value,"t"))==TEAM_SPECTATOR then continue end if
    if state.sameTeamFn(state,bot,index) then count=count+1 end if
  end for
  return count
end function

/// Set `state.preferences[teammate]` to `preference` and `state.preferenceNames[teammate]` to `state.names[teammate]` in `mq3.game.bot_team_helpers.setTeamMateTaskPreference`.
/// @param state Bot team helpers state; accesses `preferences`, `preferenceNames` and `names`. May update `state.preferences[teammate]` and `state.preferenceNames[teammate]` in place.
/// @param bot Not read by this implementation; retained in the `setTeamMateTaskPreference` signature.
/// @param teammate Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`.
/// @param preference Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`.
function setTeamMateTaskPreference(state,bot,teammate,preference)
  state.preferences[teammate]=preference
  state.preferenceNames[teammate]=state.names[teammate]
  return void
end function

/// Read a teammate's saved task preference only when the current player name still matches its owner.
/// @param state Bot team helpers state; accesses `preferences` and `preferenceNames`.
/// @param bot Not read by this implementation; retained in the `getTeamMateTaskPreference` signature.
/// @param teammate Operand used to evaluate the returned expression `state.preferences[teammate]`.
/// @param currentName Value passed as argument 1 to `std.string.toLowerAscii`.
function getTeamMateTaskPreference(state,bot,teammate,currentName)
  if state.preferences[teammate]==0 then return 0 end if
  if strings.toLowerAscii(currentName)!=strings.toLowerAscii(state.preferenceNames[teammate]) then return 0 end if
  return state.preferences[teammate]
end function

/// Apply `mq3.game.bot_team_helpers.getTeamMateTaskPreference` while evaluating `sortTeamMatesByTaskPreference`. Return paths include `defenders+roamers+attackers`.
/// @param state Bot team helpers state; accesses `names`.
/// @param bot Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`.
/// @param teammates Value used by `sortTeamMatesByTaskPreference` in `for each teammate in teammates`.
function sortTeamMatesByTaskPreference(state,bot,teammates)
  defenders=[];attackers=[];roamers=[]
  for each teammate in teammates
    preference=getTeamMateTaskPreference(state,bot,teammate,state.names[teammate])
    if (preference & TEAMTP_DEFENDER)!=0 then defenders=defenders+[teammate]
    else if (preference & TEAMTP_ATTACKER)!=0 then attackers=attackers+[teammate]
    else roamers=roamers+[teammate] end if
  end for
  return defenders+roamers+attackers
end function

/// Use `state.getChatMessageFn`, `state.queueConsoleMessageFn` and `state.enterChatFn` to perform `sayTeamOrderAlways`.
/// @param state Bot team helpers state; accesses `getChatMessageFn`, `names`, `queueConsoleMessageFn` and `enterChatFn`.
/// @param bot Bot AI state; accesses `client` and `cs`.
/// @param toClient Value passed as argument 3 to `state.enterChatFn`.
function sayTeamOrderAlways(state,bot,toClient)
  if bot.client==toClient then
    message=state.getChatMessageFn(state,bot.cs)
    escape=decode(bytes([25]));teamchat=escape+"("+state.names[bot.client]+escape+")"+escape+": "+message
    state.queueConsoleMessageFn(state,bot.cs,1,teamchat)
  else state.enterChatFn(state,bot.cs,toClient,2) end if
  return void
end function

/// Forward `sayTeamOrder` to `mq3.game.bot_team_helpers.sayTeamOrderAlways` and return the delegated result.
/// @param state Bot team helpers state; accesses `getChatMessageFn`, `names`, `queueConsoleMessageFn` and `enterChatFn`.
/// @param bot Bot AI state; accesses `client` and `cs`.
/// @param toClient Value passed as argument 3 to `state.enterChatFn`.
function sayTeamOrder(state,bot,toClient) return sayTeamOrderAlways(state,bot,toClient) end function
// These are intentional no-ops in the original baseq3 build; their bodies only
// contain missionpack commands when MISSIONPACK is defined.
/// @param state Not read by this implementation; retained in the `voiceChat` signature.
/// @param bot Not read by this implementation; retained in the `voiceChat` signature.
/// @param toClient Not read by this implementation; retained in the `voiceChat` signature.
/// @param voicechat Not read by this implementation; retained in the `voiceChat` signature.
function voiceChat(state,bot,toClient,voicechat) return void end function
/// Return `void` for `voiceChatOnly`.
/// @param state Not read by this implementation; retained in the `voiceChatOnly` signature.
/// @param bot Not read by this implementation; retained in the `voiceChatOnly` signature.
/// @param toClient Not read by this implementation; retained in the `voiceChatOnly` signature.
/// @param voicechat Not read by this implementation; retained in the `voiceChatOnly` signature.
function voiceChatOnly(state,bot,toClient,voicechat) return void end function
/// Return `void` for `sayVoiceTeamOrder`.
/// @param state Not read by this implementation; retained in the `sayVoiceTeamOrder` signature.
/// @param bot Not read by this implementation; retained in the `sayVoiceTeamOrder` signature.
/// @param toClient Not read by this implementation; retained in the `sayVoiceTeamOrder` signature.
/// @param voicechat Not read by this implementation; retained in the `sayVoiceTeamOrder` signature.
function sayVoiceTeamOrder(state,bot,toClient,voicechat) return void end function

/// Use `state.teamFn`, `state.ctfBothAtBaseFn` and `state.ctfEnemyNotAtBaseFn` to perform `ctfOrders`.
/// @param state Bot team helpers state; accesses `teamFn`, `ctfBothAtBaseFn`, `ctfEnemyNotAtBaseFn`, `ctfOwnNotAtBaseFn` and `ctfBothNotAtBaseFn`.
/// @param bot Value passed as argument 2 to `state.teamFn`.
/// @param redFlagStatus Value used by `ctfOrders` in `if state.teamFn(state,bot)==1 then flagStatus=redFlagStatus*2+blueFlagStatus else flagStatus=blueFlagStatus*2+re...`.
/// @param blueFlagStatus Value used by `ctfOrders` in `if state.teamFn(state,bot)==1 then flagStatus=redFlagStatus*2+blueFlagStatus else flagStatus=blueFlagStatus*2+re...`.
function ctfOrders(state,bot,redFlagStatus,blueFlagStatus)
  flagStatus=0
  if state.teamFn(state,bot)==1 then flagStatus=redFlagStatus*2+blueFlagStatus else flagStatus=blueFlagStatus*2+redFlagStatus end if
  if flagStatus==0 then state.ctfBothAtBaseFn(state,bot)
  else if flagStatus==1 then state.ctfEnemyNotAtBaseFn(state,bot)
  else if flagStatus==2 then state.ctfOwnNotAtBaseFn(state,bot)
  else if flagStatus==3 then state.ctfBothNotAtBaseFn(state,bot) end if
  return void
end function

/// Use `state.initialChatFn` and `state.orderAlwaysFn` to perform `createGroup`.
/// @param state Bot team helpers state; accesses `names`, `initialChatFn` and `orderAlwaysFn`.
/// @param bot Bot AI state; accesses `client`.
/// @param teammates Array or byte sequence accessed at `0` and `index`.
/// @param groupSize Value used by `createGroup` in `if groupSize<=1 then return void end if`.
function createGroup(state,bot,teammates,groupSize)
  if groupSize<=1 then return void end if
  leaderName=state.names[teammates[0]]
  for index=1 to groupSize-1
    teammate=teammates[index];name=state.names[teammate]
    if teammates[0]==bot.client then state.initialChatFn(state,bot,"cmd_accompanyme",[name])
    else state.initialChatFn(state,bot,"cmd_accompany",[name,leaderName]) end if
    if state.orderAlwaysFn!=void then state.orderAlwaysFn(state,bot,teammate) else sayTeamOrderAlways(state,bot,teammate) end if
  end for
  return void
end function

/// Set `bot.teamleader` to `state.names[index]` in `mq3.game.bot_team_helpers.findHumanTeamLeader`.
/// @param state Bot team helpers state; accesses `entityInUse`, `entitySvFlags`, `notLeader`, `sameTeamFn` and `names` and related fields.
/// @param bot Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place.
function findHumanTeamLeader(state,bot)
  for index=0 to MAX_CLIENTS-1
    if not state.entityInUse[index] then continue end if
    if (state.entitySvFlags[index] & 8)!=0 then continue end if
    if state.notLeader[index] then continue end if
    if not state.sameTeamFn(state,bot,index) then continue end if
    bot.teamleader=state.names[index]
    if not state.setLastOrderedTaskFn(state,bot) then state.defendFn(state,bot,index,1) end if
    return true
  end for
  return false
end function

/// Use `state.initialChatFn` and `state.orderAlwaysFn` to perform `deliverOrder`.
/// @param state Bot team helpers state; accesses `initialChatFn` and `orderAlwaysFn`.
/// @param bot Bot AI state; accesses `client` and `cs`.
/// @param kind Value passed as argument 3 to `state.initialChatFn`.
/// @param args Value passed as argument 4 to `state.initialChatFn`.
/// @param toClient Value passed as argument 3 to `state.enterChatFn`.
function deliverOrder(state,bot,kind,args,toClient)
  state.initialChatFn(state,bot,kind,args)
  if state.orderAlwaysFn!=void then state.orderAlwaysFn(state,bot,toClient) else sayTeamOrder(state,bot,toClient) end if
  return void
end function

/// Use `state.sortBaseFn` to perform `ctfOrdersBothFlagsAtBase`.
/// @param state Bot team helpers state; accesses `sortBaseFn` and `names`.
/// @param bot Bot AI state; accesses `ctfstrategy`.
function ctfOrdersBothFlagsAtBase(state,bot)
  if state.sortBaseFn==void then return error(495,"CTF orders require base-travel sorting") end if
  teammates=sortTeamMatesByTaskPreference(state,bot,state.sortBaseFn(state,bot));numteammates=len(teammates)
  aggressive=(bot.ctfstrategy&CTFS_AGRESSIVE)!=0
  if numteammates==1 then return void end if
  if numteammates==2 then
    deliverOrder(state,bot,"cmd_defendbase",[state.names[teammates[0]]],teammates[0])
    deliverOrder(state,bot,"cmd_getflag",[state.names[teammates[1]]],teammates[1]);return void
  end if
  if numteammates==3 then
    deliverOrder(state,bot,"cmd_defendbase",[state.names[teammates[0]]],teammates[0])
    if not aggressive then deliverOrder(state,bot,"cmd_defendbase",[state.names[teammates[1]]],teammates[1])
    else deliverOrder(state,bot,"cmd_getflag",[state.names[teammates[1]]],teammates[1]) end if
    deliverOrder(state,bot,"cmd_getflag",[state.names[teammates[2]]],teammates[2]);return void
  end if
  defenders=0;attackers=0
  if aggressive then
    defenders=n.quotient(numteammates*4+5,10);attackers=n.quotient(numteammates*5+5,10)
    if defenders>4 then defenders=4 end if;if attackers>5 then attackers=5 end if
  else
    defenders=n.quotient(numteammates*5+5,10);attackers=n.quotient(numteammates*4+5,10)
    if defenders>5 then defenders=5 end if;if attackers>4 then attackers=4 end if
  end if
  for index=0 to defenders-1 deliverOrder(state,bot,"cmd_defendbase",[state.names[teammates[index]]],teammates[index]) end for
  for index=0 to attackers-1 teammate=teammates[numteammates-index-1];deliverOrder(state,bot,"cmd_getflag",[state.names[teammate]],teammate) end for
  return void
end function

/// Use `state.sortBaseFn`, `state.initialChatFn` and `state.orderAlwaysFn` to perform `ctfOrdersBothFlagsNotAtBase`.
/// @param state Bot team helpers state; accesses `sortBaseFn`, `names`, `initialChatFn` and `orderAlwaysFn`.
/// @param bot Bot AI state; accesses `numteammates`, `flagcarrier` and `client`.
function ctfOrdersBothFlagsNotAtBase(state,bot)
  if state.sortBaseFn==void then return error(495,"CTF orders require base-travel sorting") end if
  teammates=sortTeamMatesByTaskPreference(state,bot,state.sortBaseFn(state,bot));numteammates=len(teammates)
  if bot.numteammates==1 then return void end if
  if bot.numteammates==2 then
    other=teammates[0];if other==bot.flagcarrier then other=teammates[1] end if
    deliverOrder(state,bot,"cmd_getflag",[state.names[other]],other);return void
  end if
  if bot.numteammates==3 then
    other=teammates[0];if other==bot.flagcarrier then other=teammates[1] end if;name=state.names[other]
    if bot.flagcarrier!=-1 then
      if bot.flagcarrier==bot.client then state.initialChatFn(state,bot,"cmd_accompanyme",[name])
      else state.initialChatFn(state,bot,"cmd_accompany",[name,state.names[bot.flagcarrier]]) end if
    else state.initialChatFn(state,bot,"cmd_getflag",[name]) end if
    if state.orderAlwaysFn!=void then state.orderAlwaysFn(state,bot,other) else sayTeamOrder(state,bot,other) end if
    other=teammates[2];if other==bot.flagcarrier then other=teammates[1] end if
    deliverOrder(state,bot,"cmd_getflag",[state.names[other]],other);return void
  end if
  defenders=n.quotient(numteammates*4+5,10);if defenders>4 then defenders=4 end if
  attackers=n.quotient(numteammates*5+5,10);if attackers>5 then attackers=5 end if
  for index=0 to defenders-1
    teammate=teammates[index];if teammate==bot.flagcarrier then continue end if;name=state.names[teammate]
    if bot.flagcarrier!=-1 then
      if bot.flagcarrier==bot.client then state.initialChatFn(state,bot,"cmd_accompanyme",[name])
      else state.initialChatFn(state,bot,"cmd_accompany",[name,state.names[bot.flagcarrier]]) end if
    else state.initialChatFn(state,bot,"cmd_getflag",[name]) end if
    if state.orderAlwaysFn!=void then state.orderAlwaysFn(state,bot,teammate) else sayTeamOrder(state,bot,teammate) end if
  end for
  for index=0 to attackers-1
    teammate=teammates[numteammates-index-1];if teammate==bot.flagcarrier then continue end if
    deliverOrder(state,bot,"cmd_getflag",[state.names[teammate]],teammate)
  end for
  return void
end function

/// Use `state.sortBaseFn` to perform `ctfOrdersFlagNotAtBase`.
/// @param state Bot team helpers state; accesses `sortBaseFn` and `names`.
/// @param bot Bot AI state; accesses `ctfstrategy` and `numteammates`.
function ctfOrdersFlagNotAtBase(state,bot)
  if state.sortBaseFn==void then return error(495,"CTF orders require base-travel sorting") end if
  teammates=sortTeamMatesByTaskPreference(state,bot,state.sortBaseFn(state,bot));numteammates=len(teammates)
  aggressive=(bot.ctfstrategy&CTFS_AGRESSIVE)!=0
  if bot.numteammates==1 then return void end if
  if bot.numteammates==2 then
    if aggressive then deliverOrder(state,bot,"cmd_getflag",[state.names[teammates[0]]],teammates[0])
    else deliverOrder(state,bot,"cmd_defendbase",[state.names[teammates[0]]],teammates[0]) end if
    deliverOrder(state,bot,"cmd_getflag",[state.names[teammates[1]]],teammates[1]);return void
  end if
  if bot.numteammates==3 then
    deliverOrder(state,bot,"cmd_defendbase",[state.names[teammates[0]]],teammates[0])
    deliverOrder(state,bot,"cmd_getflag",[state.names[teammates[1]]],teammates[1])
    deliverOrder(state,bot,"cmd_getflag",[state.names[teammates[2]]],teammates[2]);return void
  end if
  defenders=0;defenderCap=0;attackerCap=0
  if aggressive then defenders=n.quotient(numteammates*2+5,10);defenderCap=2;attackerCap=7
  else defenders=n.quotient(numteammates*3+5,10);defenderCap=3;attackerCap=6 end if
  attackers=n.quotient(numteammates*7+5,10)
  if defenders>defenderCap then defenders=defenderCap end if;if attackers>attackerCap then attackers=attackerCap end if
  for index=0 to defenders-1 deliverOrder(state,bot,"cmd_defendbase",[state.names[teammates[index]]],teammates[index]) end for
  for index=0 to attackers-1 teammate=teammates[numteammates-index-1];deliverOrder(state,bot,"cmd_getflag",[state.names[teammate]],teammate) end for
  return void
end function

/// Use `state.sortBaseFn` to perform `ctfOrdersEnemyFlagNotAtBase`.
/// @param state Bot team helpers state; accesses `sortBaseFn` and `names`.
/// @param bot Bot AI state; accesses `flagcarrier` and `client`.
function ctfOrdersEnemyFlagNotAtBase(state,bot)
  if state.sortBaseFn==void then return error(495,"CTF orders require base-travel sorting") end if
  teammates=sortTeamMatesByTaskPreference(state,bot,state.sortBaseFn(state,bot));numteammates=len(teammates)
  if numteammates==1 then return void end if
  if numteammates==2 then
    other=teammates[0];if other==bot.flagcarrier then other=teammates[1] end if
    deliverOrder(state,bot,"cmd_defendbase",[state.names[other]],other);return void
  end if
  if numteammates==3 then
    other=teammates[0];if other==bot.flagcarrier then other=teammates[1] end if
    deliverOrder(state,bot,"cmd_defendbase",[state.names[other]],other)
    other=teammates[2];if other==bot.flagcarrier then other=teammates[1] end if
    deliverOrder(state,bot,"cmd_defendbase",[state.names[other]],other);return void
  end if
  defenders=n.quotient(numteammates*6+5,10);if defenders>6 then defenders=6 end if
  attackers=n.quotient(numteammates*3+5,10);if attackers>3 then attackers=3 end if
  for index=0 to defenders-1
    teammate=teammates[index];if teammate==bot.flagcarrier then continue end if
    deliverOrder(state,bot,"cmd_defendbase",[state.names[teammate]],teammate)
  end for
  for index=0 to attackers-1
    teammate=teammates[numteammates-index-1];if teammate==bot.flagcarrier then continue end if
    if bot.flagcarrier==-1 then deliverOrder(state,bot,"cmd_getflag",[state.names[teammate]],teammate)
    else if bot.flagcarrier==bot.client then deliverOrder(state,bot,"cmd_accompanyme",[state.names[teammate]],teammate)
    else deliverOrder(state,bot,"cmd_accompany",[state.names[teammate],state.names[bot.flagcarrier]],teammate) end if
  end for
  return void
end function

/// Apply `mq3.shared.info.value` while evaluating `team`.
/// @param state Bot team helpers state; accesses `configs`.
/// @param bot Bot AI state; accesses `client`.
function team(state,bot)
  if bot.client<0 or bot.client>=MAX_CLIENTS then return 0 end if
  value=toNumber(info.value(state.configs[bot.client],"t"))
  if value==1 or value==2 then return value end if
  return 0
end function
/// Apply `mq3.game.bot_team_helpers.team` while evaluating `oppositeTeam`.
/// @param state Bot team helpers state; accesses `configs`.
/// @param bot Bot AI state; accesses `client`.
function oppositeTeam(state,bot) value=team(state,bot);if value==1 then return 2 end if;if value==2 then return 1 end if;return 0 end function
/// Apply `mq3.shared.info.value` while evaluating `sameTeam`.
/// @param state Bot team helpers state; accesses `gametype` and `configs`.
/// @param bot Bot AI state; accesses `client`.
/// @param entityNumber Entity number in the game entity table.
function sameTeam(state,bot,entityNumber)
  if bot.client<0 or bot.client>=MAX_CLIENTS or entityNumber<0 or entityNumber>=MAX_CLIENTS then return false end if
  if state.gametype<3 then return false end if
  return toNumber(info.value(state.configs[bot.client],"t"))==toNumber(info.value(state.configs[entityNumber],"t"))
end function
/// Remove Quake color codes and nonprintable bytes from a client name used in team commands.
/// @param text Text to parse, format or deliver.
function cleanClientText(text)
  data=bytes(text);result=[];index=0
  while index<len(data)
    value=data[index]
    if value==94 and index+1<len(data) and data[index+1]!=94 then index=index+2;continue end if
    if value>=32 and value<=126 then result=result+[value] end if
    index=index+1
  end while
  return decode(bytes(result))
end function
/// Apply `mq3.shared.info.value` and `mq3.game.bot_team_helpers.cleanClientText` while evaluating `clientFromName`. Return paths include `-1`.
/// @param state Bot team helpers state; accesses `maxclients` and `configs`.
/// @param name Name used to identify the requested entry.
function clientFromName(state,name)
  limit=state.maxclients;if limit>MAX_CLIENTS then limit=MAX_CLIENTS end if
  wanted=strings.toLowerAscii(name)
  for index=0 to limit-1
    if strings.toLowerAscii(info.value(cleanClientText(state.configs[index]),"n"))==wanted then return index end if
  end for
  return -1
end function
/// Apply `mq3.game.bot_team_helpers.sameTeam`, `mq3.shared.info.value` and `mq3.game.bot_team_helpers.cleanClientText` while evaluating `clientOnSameTeamFromName`. Return paths include `-1`.
/// @param state Bot team helpers state; accesses `maxclients` and `configs`.
/// @param bot Bot AI state; accesses `client`.
/// @param name Name used to identify the requested entry.
function clientOnSameTeamFromName(state,bot,name)
  limit=state.maxclients;if limit>MAX_CLIENTS then limit=MAX_CLIENTS end if
  wanted=strings.toLowerAscii(name)
  for index=0 to limit-1
    if not sameTeam(state,bot,index) then continue end if
    if strings.toLowerAscii(info.value(cleanClientText(state.configs[index]),"n"))==wanted then return index end if
  end for
  return -1
end function
/// Use `state.getClientPmTypeFn` to perform `entityIsDead`.
/// @param state Bot team helpers state; accesses `getClientPmTypeFn`.
/// @param entityNumber Entity number in the game entity table.
function entityIsDead(state,entityNumber)
  if entityNumber>=0 and entityNumber<MAX_CLIENTS then return state.getClientPmTypeFn(state,entityNumber)!=0 end if
  return false
end function
