// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete ai_vcmd.c voice-command state transitions and host boundaries.
package mq3.game.bot_voice_commands
import std.string as strings
import mq3.shared.info as info
import mq3.compat.textnumbers as textnum

const MAX_CLIENTS=64
const MAX_MESSAGE_SIZE=256
const SAY_ALL=0
const CHAT_TEAM=1
const CHAT_TELL=2
const TEAM_RED=1
const TEAM_BLUE=2
const GT_CTF=4
const GT_1FCTF=5
const GT_OBELISK=6
const GT_HARVESTER=7
const LTG_TEAMACCOMPANY=2
const LTG_DEFENDKEYAREA=3
const LTG_GETFLAG=4
const LTG_RETURNFLAG=6
const LTG_CAMPORDER=8
const LTG_HARVEST=12
const LTG_ATTACKENEMYBASE=13
const TEAMTP_DEFENDER=1
const TEAMTP_ATTACKER=2
const ACTION_AFFIRMATIVE=0x0100000
const TEAM_ACCOMPANY_TIME=600.0
const TEAM_DEFENDKEYAREA_TIME=600.0
const TEAM_CAMP_TIME=600.0
const TEAM_ATTACKENEMYBASE_TIME=600.0
const TEAM_HARVEST_TIME=120.0
const CTF_GETFLAG_TIME=600.0
const CTF_RETURNFLAG_TIME=180.0

struct Goal entitynum areanum origin mins maxs tag end struct
struct EntityInfo valid origin end struct
struct HostAction kind client channel text value dispatched end struct
struct Bot
  client
  cs
  team
  teamleader
  decisionmaker
  ordered
  orderTime
  teammessageTime
  ltgtype
  teamgoalTime
  teamgoal
  harvestawayTime
  attackawayTime
  defendawayTime
  leadTime
  lastgoalLtgtype
  teammate
  arriveTime
  teammatevisibleTime
  formationDist
  rushbaseawayTime
end struct
struct State
  gametype
  missionpack
  teamplay
  now
  randomValue
  redFlag
  blueFlag
  neutralFlag
  redObelisk
  blueObelisk
  names
  easyNames
  entityInfos
  pointAreas
  taskPreferences
  clientTeams
  notLeader
  flagCarrier
  timeIndex
  timeValues
  actions
  hostActionFn
end struct

function goal(entitynum,areanum,origin,mins,maxs,tag) return Goal(entitynum,areanum,origin,mins,maxs,tag) end function
function emptyGoal() return goal(-1,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0) end function
function copyGoal(value) return goal(value.entitynum,value.areanum,value.origin+[ ],value.mins+[ ],value.maxs+[ ],value.tag) end function
function createBot(client)
  return Bot(client,client,TEAM_RED,"",0,false,0.0,0.0,0,0.0,emptyGoal(),0.0,0.0,0.0,0.0,0,-1,0.0,0.0,0.0,0.0)
end function
function create()
  zero=emptyGoal();infos=[];areas=[]
  for index=0 to MAX_CLIENTS-1 infos=infos+[EntityInfo(false,[0.0,0.0,0.0])];areas=areas+[0] end for
  return State(0,true,true,100.0,0.25,copyGoal(zero),copyGoal(zero),copyGoal(zero),copyGoal(zero),copyGoal(zero),array(MAX_CLIENTS,""),array(MAX_CLIENTS,""),infos,areas,array(MAX_CLIENTS,0),array(MAX_CLIENTS,0),array(MAX_CLIENTS,false),-1,0,[],[],void)
end function

function floatTime(state)
  if state.timeIndex<len(state.timeValues) then value=state.timeValues[state.timeIndex];state.timeIndex=state.timeIndex+1;return value end if
  return state.now
end function
function emit(state,kind,client,channel,text,value,retailActive)
  action=HostAction(kind,client,channel,text,value,not retailActive);state.actions=state.actions+[action]
  if not retailActive and state.hostActionFn!=void then state.hostActionFn(state,action) end if
  return action
end function
function setStatus(state,bot,retailActive) emit(state,"team-status",bot.client,0,"",bot.ltgtype,retailActive);return void end function
function remember(state,bot,retailActive) emit(state,"remember-task",bot.client,0,"",bot.ltgtype,retailActive);return void end function
function initialChat(state,bot,chat,arg,retailActive) emit(state,"initial-chat",bot.client,0,chat,arg,retailActive);return void end function
function enterChat(state,bot,client,channel,retailActive) emit(state,"enter-chat",client,channel,"",bot.cs,retailActive);return void end function
function voiceOnly(state,bot,client,text,retailActive) emit(state,"voice-only",client,0,text,bot.client,retailActive);return void end function
function orderedTiming(state,bot,client,ltg,duration)
  bot.decisionmaker=client;bot.ordered=true;bot.orderTime=floatTime(state)
  bot.teammessageTime=floatTime(state)+2.0*state.randomValue;bot.ltgtype=ltg;bot.teamgoalTime=floatTime(state)+duration
  return void
end function

// BotVoiceChat_GetFlag
function getFlag(state,bot,client,mode,retailActive)
  if state.gametype==GT_CTF then
    if state.redFlag.areanum==0 or state.blueFlag.areanum==0 then return void end if
  else if state.missionpack and state.gametype==GT_1FCTF then
    if state.neutralFlag.areanum==0 or state.redFlag.areanum==0 or state.blueFlag.areanum==0 then return void end if
  else return void end if
  orderedTiming(state,bot,client,LTG_GETFLAG,CTF_GETFLAG_TIME)
  if state.gametype==GT_CTF then other=TEAM_RED;if bot.team==TEAM_RED then other=TEAM_BLUE end if;emit(state,"alternate-route",bot.client,0,"",other,retailActive) end if
  setStatus(state,bot,retailActive);remember(state,bot,retailActive);return void
end function

// BotVoiceChat_Offense
function offense(state,bot,client,mode,retailActive)
  if state.gametype==GT_CTF or (state.missionpack and state.gametype==GT_1FCTF) then return getFlag(state,bot,client,mode,retailActive) end if
  if state.missionpack and state.gametype==GT_HARVESTER then orderedTiming(state,bot,client,LTG_HARVEST,TEAM_HARVEST_TIME);bot.harvestawayTime=0.0
  else orderedTiming(state,bot,client,LTG_ATTACKENEMYBASE,TEAM_ATTACKENEMYBASE_TIME);bot.attackawayTime=0.0 end if
  setStatus(state,bot,retailActive);remember(state,bot,retailActive);return void
end function

// BotVoiceChat_Defend and BotVoiceChat_DefendFlag
function defend(state,bot,client,mode,retailActive)
  selected=void
  if state.missionpack and (state.gametype==GT_OBELISK or state.gametype==GT_HARVESTER) then
    if bot.team==TEAM_RED then selected=state.redObelisk else if bot.team==TEAM_BLUE then selected=state.blueObelisk else return void end if
  else if state.gametype==GT_CTF or (state.missionpack and state.gametype==GT_1FCTF) then
    if bot.team==TEAM_RED then selected=state.redFlag else if bot.team==TEAM_BLUE then selected=state.blueFlag else return void end if
  else return void end if
  bot.teamgoal=copyGoal(selected);orderedTiming(state,bot,client,LTG_DEFENDKEYAREA,TEAM_DEFENDKEYAREA_TIME);bot.defendawayTime=0.0
  setStatus(state,bot,retailActive);remember(state,bot,retailActive);return void
end function
function defendFlag(state,bot,client,mode,retailActive) return defend(state,bot,client,mode,retailActive) end function

// BotVoiceChat_Patrol
function patrol(state,bot,client,mode,retailActive)
  bot.decisionmaker=client;bot.ltgtype=0;bot.leadTime=0.0;bot.lastgoalLtgtype=0
  initialChat(state,bot,"dismissed","",retailActive);enterChat(state,bot,client,CHAT_TELL,retailActive);voiceOnly(state,bot,-1,"onpatrol",retailActive);setStatus(state,bot,retailActive);return void
end function

function resolveClientGoal(state,bot,client)
  bot.teamgoal.entitynum=-1
  if client>=0 and client<len(state.entityInfos) then ent=state.entityInfos[client]
    if ent.valid then area=state.pointAreas[client];if area!=0 then bot.teamgoal=goal(client,area,ent.origin+[ ],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0) end if end if
  end if
  return bot.teamgoal.entitynum>=0
end function
function easyName(state,client) if client>=0 and client<len(state.easyNames) and state.easyNames[client]!="" then return state.easyNames[client] end if;if client>=0 and client<len(state.names) then return state.names[client] end if;return "" end function

// BotVoiceChat_Camp
function camp(state,bot,client,mode,retailActive)
  if not resolveClientGoal(state,bot,client) then initialChat(state,bot,"whereareyou",easyName(state,client),retailActive);enterChat(state,bot,client,CHAT_TELL,retailActive);return void end if
  orderedTiming(state,bot,client,LTG_CAMPORDER,TEAM_CAMP_TIME);bot.teammate=client;bot.arriveTime=0.0
  setStatus(state,bot,retailActive);remember(state,bot,retailActive);return void
end function

// BotVoiceChat_FollowMe and BotVoiceChat_FollowFlagCarrier
function followMe(state,bot,client,mode,retailActive)
  if not resolveClientGoal(state,bot,client) then initialChat(state,bot,"whereareyou",easyName(state,client),retailActive);enterChat(state,bot,client,CHAT_TELL,retailActive);return void end if
  bot.decisionmaker=client;bot.ordered=true;bot.orderTime=floatTime(state);bot.teammate=client;bot.teammatevisibleTime=floatTime(state)
  bot.teammessageTime=floatTime(state)+2.0*state.randomValue;bot.teamgoalTime=floatTime(state)+TEAM_ACCOMPANY_TIME;bot.ltgtype=LTG_TEAMACCOMPANY;bot.formationDist=112.0;bot.arriveTime=0.0
  setStatus(state,bot,retailActive);remember(state,bot,retailActive);return void
end function
function followFlagCarrier(state,bot,client,mode,retailActive) if state.flagCarrier>=0 then return followMe(state,bot,state.flagCarrier,mode,retailActive) end if;return void end function

// BotVoiceChat_ReturnFlag
function returnFlag(state,bot,client,mode,retailActive)
  if state.gametype!=GT_CTF and (not state.missionpack or state.gametype!=GT_1FCTF) then return void end if
  orderedTiming(state,bot,client,LTG_RETURNFLAG,CTF_RETURNFLAG_TIME);bot.rushbaseawayTime=0.0;setStatus(state,bot,retailActive);return void
end function

// BotVoiceChat_StartLeader, BotVoiceChat_StopLeader, BotVoiceChat_WhoIsLeader
function startLeader(state,bot,client,mode,retailActive) if client>=0 and client<len(state.names) then bot.teamleader=info.copy(state.names[client],36) end if;return void end function
function stopLeader(state,bot,client,mode,retailActive)
  if client>=0 and client<len(state.names) and strings.toLowerAscii(bot.teamleader)==strings.toLowerAscii(state.names[client]) then bot.teamleader="";state.notLeader[client]=true end if;return void
end function
function whoIsLeader(state,bot,client,mode,retailActive)
  if not state.teamplay then return void end if
  if bot.client>=0 and bot.client<len(state.names) and strings.toLowerAscii(state.names[bot.client])==strings.toLowerAscii(bot.teamleader) then initialChat(state,bot,"iamteamleader","",retailActive);enterChat(state,bot,0,CHAT_TEAM,retailActive);voiceOnly(state,bot,-1,"startleader",retailActive) end if
  return void
end function

// BotVoiceChat_WantOnDefense and BotVoiceChat_WantOnOffense
function wantOnDefense(state,bot,client,mode,retailActive)
  preference=state.taskPreferences[client];preference=(preference & ~TEAMTP_ATTACKER) | TEAMTP_DEFENDER;state.taskPreferences[client]=preference
  initialChat(state,bot,"keepinmind",easyName(state,client),retailActive);enterChat(state,bot,client,CHAT_TELL,retailActive);voiceOnly(state,bot,client,"yes",retailActive);emit(state,"ea-action",bot.client,0,"",ACTION_AFFIRMATIVE,retailActive);return void
end function
function wantOnOffense(state,bot,client,mode,retailActive)
  preference=state.taskPreferences[client];preference=(preference & ~TEAMTP_DEFENDER) | TEAMTP_ATTACKER;state.taskPreferences[client]=preference
  initialChat(state,bot,"keepinmind",easyName(state,client),retailActive);enterChat(state,bot,client,CHAT_TELL,retailActive);voiceOnly(state,bot,client,"yes",retailActive);emit(state,"ea-action",bot.client,0,"",ACTION_AFFIRMATIVE,retailActive);return void
end function
// BotVoiceChat_Dummy
function dummy(state,bot,client,mode,retailActive) return void end function

function tokensLikeOriginal(text)
  data=bytes(info.copy(text,MAX_MESSAGE_SIZE));parts=[];at=0
  for field=0 to 2
    start=at;while at<len(data) and data[at]>32 at=at+1 end while;parts=parts+[decode(slice(data,start,at-start))]
    while at<len(data) and data[at]<=32 at=at+1 end while
  end for
  parts=parts+[decode(slice(data,at,len(data)-at))];return parts
end function
function sameTeam(bot,client,state) return client>=0 and client<MAX_CLIENTS and bot.team==state.clientTeams[client] end function

// BotVoiceChatCommand.
function voiceChatCommand(state,bot,mode,voiceChat,retailActive)
  if not state.teamplay or mode==SAY_ALL then return false end if
  parts=tokensLikeOriginal(voiceChat);if len(parts)<4 then return false end if
  voiceOnlyValue=textnum.atoi(parts[0]);client=textnum.atoi(parts[1]);color=textnum.atoi(parts[2]);cmd=strings.toLowerAscii(parts[3])
  // Keep both parsed-but-unused native fields live in the translation.
  voiceOnlyValue=voiceOnlyValue+0;color=color+0
  if not sameTeam(bot,client,state) then return false end if
  if cmd=="getflag" then getFlag(state,bot,client,mode,retailActive)
  else if cmd=="offense" then offense(state,bot,client,mode,retailActive)
  else if cmd=="defend" then defend(state,bot,client,mode,retailActive)
  else if cmd=="defendflag" then defendFlag(state,bot,client,mode,retailActive)
  else if cmd=="patrol" then patrol(state,bot,client,mode,retailActive)
  else if cmd=="camp" then camp(state,bot,client,mode,retailActive)
  else if cmd=="followme" then followMe(state,bot,client,mode,retailActive)
  else if cmd=="followflagcarrier" then followFlagCarrier(state,bot,client,mode,retailActive)
  else if cmd=="returnflag" then returnFlag(state,bot,client,mode,retailActive)
  else if cmd=="startleader" then startLeader(state,bot,client,mode,retailActive)
  else if cmd=="stopleader" then stopLeader(state,bot,client,mode,retailActive)
  else if cmd=="whoisleader" then whoIsLeader(state,bot,client,mode,retailActive)
  else if cmd=="wantondefense" then wantOnDefense(state,bot,client,mode,retailActive)
  else if cmd=="wantonoffense" then wantOnOffense(state,bot,client,mode,retailActive)
  else return false end if
  return true
end function

function setClientTeam(state,client,team) state.clientTeams[client]=team;return void end function
