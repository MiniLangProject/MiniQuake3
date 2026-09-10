// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ai_team.c team enumeration and task-preference helpers.
package mq3.game.bot_team_helpers
import mq3.shared.info as info
import std.string as strings
import mq3.compat.numeric as n

const MAX_CLIENTS=64
const TEAM_SPECTATOR=3
const TEAMTP_ATTACKER=1
const TEAMTP_DEFENDER=2
const CTFS_AGRESSIVE=1

struct State
  names
  preferenceNames
  preferences
  configs
  maxclients
  sameTeamFn
  clientFromNameFn
  getChatMessageFn
  queueConsoleMessageFn
  enterChatFn
  teamFn
  ctfBothAtBaseFn
  ctfEnemyNotAtBaseFn
  ctfOwnNotAtBaseFn
  ctfBothNotAtBaseFn
  initialChatFn
  orderAlwaysFn
  entityInUse
  entitySvFlags
  notLeader
  setLastOrderedTaskFn
  defendFn
  gametype
  getClientPmTypeFn
  context
  sortBaseFn
end struct

function create()
  state=State(array(MAX_CLIENTS,""),array(MAX_CLIENTS,""),array(MAX_CLIENTS,0),array(MAX_CLIENTS,""),0,void,void,void,void,void,void,void,void,void,void,void,void,array(MAX_CLIENTS,false),array(MAX_CLIENTS,0),array(MAX_CLIENTS,false),void,void,0,void,void,void)
  state.ctfBothNotAtBaseFn=ctfOrdersBothFlagsNotAtBase;state.ctfOwnNotAtBaseFn=ctfOrdersFlagNotAtBase
  state.ctfEnemyNotAtBaseFn=ctfOrdersEnemyFlagNotAtBase;state.ctfBothAtBaseFn=ctfOrdersBothFlagsAtBase;return state
end function

function validTeamLeader(state,bot)
  if bot.teamleader=="" then return false end if
  if state.clientFromNameFn!=void then return state.clientFromNameFn(state,bot.teamleader)!=-1 end if
  wanted=strings.toLowerAscii(bot.teamleader)
  for index=0 to MAX_CLIENTS-1 if strings.toLowerAscii(state.names[index])==wanted then return true end if end for
  return false
end function

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

function setTeamMateTaskPreference(state,bot,teammate,preference)
  state.preferences[teammate]=preference
  state.preferenceNames[teammate]=state.names[teammate]
  return void
end function

function getTeamMateTaskPreference(state,bot,teammate,currentName)
  if state.preferences[teammate]==0 then return 0 end if
  if strings.toLowerAscii(currentName)!=strings.toLowerAscii(state.preferenceNames[teammate]) then return 0 end if
  return state.preferences[teammate]
end function

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

function sayTeamOrderAlways(state,bot,toClient)
  if bot.client==toClient then
    message=state.getChatMessageFn(state,bot.cs)
    escape=decode(bytes([25]));teamchat=escape+"("+state.names[bot.client]+escape+")"+escape+": "+message
    state.queueConsoleMessageFn(state,bot.cs,1,teamchat)
  else state.enterChatFn(state,bot.cs,toClient,2) end if
  return void
end function

function sayTeamOrder(state,bot,toClient) return sayTeamOrderAlways(state,bot,toClient) end function
// These are intentional no-ops in the original baseq3 build; their bodies only
// contain missionpack commands when MISSIONPACK is defined.
function voiceChat(state,bot,toClient,voicechat) return void end function
function voiceChatOnly(state,bot,toClient,voicechat) return void end function
function sayVoiceTeamOrder(state,bot,toClient,voicechat) return void end function

function ctfOrders(state,bot,redFlagStatus,blueFlagStatus)
  flagStatus=0
  if state.teamFn(state,bot)==1 then flagStatus=redFlagStatus*2+blueFlagStatus else flagStatus=blueFlagStatus*2+redFlagStatus end if
  if flagStatus==0 then state.ctfBothAtBaseFn(state,bot)
  else if flagStatus==1 then state.ctfEnemyNotAtBaseFn(state,bot)
  else if flagStatus==2 then state.ctfOwnNotAtBaseFn(state,bot)
  else if flagStatus==3 then state.ctfBothNotAtBaseFn(state,bot) end if
  return void
end function

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

function deliverOrder(state,bot,kind,args,toClient)
  state.initialChatFn(state,bot,kind,args)
  if state.orderAlwaysFn!=void then state.orderAlwaysFn(state,bot,toClient) else sayTeamOrder(state,bot,toClient) end if
  return void
end function

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

function team(state,bot)
  if bot.client<0 or bot.client>=MAX_CLIENTS then return 0 end if
  value=toNumber(info.value(state.configs[bot.client],"t"))
  if value==1 or value==2 then return value end if
  return 0
end function
function oppositeTeam(state,bot) value=team(state,bot);if value==1 then return 2 end if;if value==2 then return 1 end if;return 0 end function
function sameTeam(state,bot,entityNumber)
  if bot.client<0 or bot.client>=MAX_CLIENTS or entityNumber<0 or entityNumber>=MAX_CLIENTS then return false end if
  if state.gametype<3 then return false end if
  return toNumber(info.value(state.configs[bot.client],"t"))==toNumber(info.value(state.configs[entityNumber],"t"))
end function
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
function clientFromName(state,name)
  limit=state.maxclients;if limit>MAX_CLIENTS then limit=MAX_CLIENTS end if
  wanted=strings.toLowerAscii(name)
  for index=0 to limit-1
    if strings.toLowerAscii(info.value(cleanClientText(state.configs[index]),"n"))==wanted then return index end if
  end for
  return -1
end function
function clientOnSameTeamFromName(state,bot,name)
  limit=state.maxclients;if limit>MAX_CLIENTS then limit=MAX_CLIENTS end if
  wanted=strings.toLowerAscii(name)
  for index=0 to limit-1
    if not sameTeam(state,bot,index) then continue end if
    if strings.toLowerAscii(info.value(cleanClientText(state.configs[index]),"n"))==wanted then return index end if
  end for
  return -1
end function
function entityIsDead(state,entityNumber)
  if entityNumber>=0 and entityNumber<MAX_CLIENTS then return state.getClientPmTypeFn(state,entityNumber)!=0 end if
  return false
end function
