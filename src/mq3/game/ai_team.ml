// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native port of code/game/ai_team.c.  The classic CTF policies live in
// bot_team_helpers; this module supplies the complete game-mode dispatcher.
package mq3.game.ai_team
import mq3.game.bot_team_helpers as base
import mq3.game.bot_ai_headers as aiheaders
import mq3.compat.numeric as n
import mq3.shared.info as info
import std.string as strings

/// Maximum number of client slots represented by the original game protocol.
const MAX_CLIENTS=64
/// Team identifier selecting the red team/category.
const TEAM_RED=1
/// Team identifier selecting the blue team/category.
const TEAM_BLUE=2
/// Team identifier selecting the spectator team/category.
const TEAM_SPECTATOR=3
/// Game-mode identifier selecting team rules.
const GT_TEAM=3
/// Game-mode identifier selecting capture the flag rules.
const GT_CTF=4
/// Game-mode identifier selecting 1 fctf rules.
const GT_1FCTF=5
/// Game-mode identifier selecting obelisk rules.
const GT_OBELISK=6
/// Game-mode identifier selecting harvester rules.
const GT_HARVESTER=7
/// Capture-the-flag strategy identifier selecting agressive.
const CTFS_AGRESSIVE=aiheaders.CTFS_AGRESSIVE
/// Bot team-task preference bit indicating a preference for attacker.
const TEAMTP_ATTACKER=aiheaders.TEAMTP_ATTACKER
/// Bot team-task preference bit indicating a preference for defender.
const TEAMTP_DEFENDER=aiheaders.TEAMTP_DEFENDER

/// `Action` record for ai team, containing `kind`, `client`, `target`, `text` and `args` and related fields.
struct Action
  /// Discriminator selecting the recorded bot action or decision event.
  kind
  /// Client slot associated with the recorded team-order or team-chat action.
  client
  /// Target-name selector identifying entities activated by this entity.
  target
  /// Text payload supplied to the recorded command, chat, or host action.
  text
  /// Arguments attached to the recorded command or host action.
  args
  /// Nonzero when an action was deliberately withheld from dispatch.
  suppressed
end struct
/// `State` record for ai team, containing `helper`, `gametype`, `now`, `randomValue` and `maxclients` and related fields.
struct State
  /// Injected helper object used by the bot decision adapter.
  helper
  /// GT_* game-mode identifier used for team-leader strategy and distribution of team objectives.
  gametype
  /// Current clock value supplied to the bot decision step.
  now
  /// Deterministic random input supplied to the current bot decision.
  randomValue
  /// Configured number of client slots active in this game state.
  maxclients
  /// Name strings indexed by the corresponding state-table entries.
  names
  /// Configuration records associated with tracked clients or bot state.
  configs
  /// AAS travel times used to compare candidate routes or goals.
  travelTimes
  /// Recorded host actions emitted by bot decision logic.
  actions
  /// Nonzero when an action was deliberately withheld from dispatch.
  suppressed
  /// Nonzero when mission-pack rules and content are enabled.
  missionpack
  /// Injected callback for client state; invoked through the State service/state record.
  clientStateFn
  /// Injected callback for point area; invoked through the State service/state record.
  pointAreaFn
  /// Injected callback for travel time; invoked through the State service/state record.
  travelTimeFn
end struct

/// `Bot` record for ai team, containing `client`, `cs`, `teamleader`, `entergameTime` and `askteamleaderTime` and related fields.
struct Bot
  /// Client slot of the bot participating in team-strategy decisions.
  client
  /// Botlib chat-state handle owned by this bot.
  cs
  /// Name or identifier of the current bot-team leader.
  teamleader
  /// Timestamp at which this bot entered the game.
  entergameTime
  /// Deadline for the bot next request for a team leader.
  askteamleaderTime
  /// Time controlling when the bot may volunteer as team leader.
  becometeamleaderTime
  /// Number of teammates considered by the team decision logic.
  numteammates
  /// Client/entity currently carrying the flag of interest.
  flagcarrier
  /// Selected capture-the-flag team strategy.
  ctfstrategy
  /// Bot-tracked status of the neutral flag.
  neutralflagstatus
  /// Bot-tracked status of the red flag.
  redflagstatus
  /// Bot-tracked status of the blue flag.
  blueflagstatus
  /// Nonzero after a tracked flag status changes and needs processing.
  flagstatuschanged
  /// Nonzero when the team leader must issue new orders.
  forceorders
  /// Next time at which the bot team leader should issue orders.
  teamgiveordersTime
  /// Timestamp of the last flag capture observed by the bot.
  lastflagcaptureTime
end struct

/// Apply `mq3.game.bot_team_helpers.create` while evaluating `create`. Return paths include `state`.
function create()
  helper=base.create()
  state=State(helper,0,0.0,0.5,0,array(MAX_CLIENTS,""),array(MAX_CLIENTS,""),array(MAX_CLIENTS,1),[],false,true,void,void,void)
  helper.names=state.names;helper.configs=state.configs;helper.maxclients=state.maxclients;helper.context=state
  return state
end function

/// Create a `mq3.game.ai_team.Bot` record, initializing `client` from `client` and `flagcarrier` as `-1`.
/// @param client Initial value stored in `mq3.game.ai_team.Bot.client`.
function createBot(client)
  return Bot(client,0,"",0.0,0.0,0.0,0,-1,0,0,0,0,false,false,0.0,0.0)
end function

/// Set `state.actions` to `state.actions+[Action(kind,client,target,text,args,suppressed)]` in `mq3.game.ai_team.emit`.
/// @param state AI team state; accesses `actions`. May update `state.actions` in place.
/// @param kind Initial value stored in `mq3.game.ai_team.Action.kind`.
/// @param client Initial value stored in `mq3.game.ai_team.Action.client`.
/// @param target Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param text Text to parse, format or deliver.
/// @param args Initial value stored in `mq3.game.ai_team.Action.args`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function emit(state,kind,client,target,text,args,suppressed)
  state.actions=state.actions+[Action(kind,client,target,text,args,suppressed)]
  return void
end function

/// Update `state.helper.names`, `state.helper.configs`, `state.helper.maxclients` and `state.helper.gametype` and related state during `sync`.
/// @param state AI team state; accesses `helper`, `names`, `configs`, `maxclients` and `gametype`. May update `state.helper.names`, `state.helper.configs` and `state.helper.maxclients` and additional fields in place.
function sync(state)
  state.helper.names=state.names;state.helper.configs=state.configs;state.helper.maxclients=state.maxclients
  state.helper.gametype=state.gametype;state.helper.context=state
  return void
end function

/// Apply `mq3.shared.info.value` while evaluating `nameOf`. Return paths include `info.value(state.configs[client],"n")`.
/// @param state AI team state; accesses `names` and `configs`.
/// @param client Operand used to evaluate the returned expression `state.names[client]`.
function nameOf(state,client) if client<0 or client>=MAX_CLIENTS then return "" end if;if state.names[client]!="" then return state.names[client] end if;return info.value(state.configs[client],"n") end function
/// Apply `mq3.shared.info.value` while evaluating `sameTeam`. Return paths include `info.value(state.configs[bot.client],"t")==info.value(state.configs[client],"t")`.
/// @param state AI team state; accesses `configs`.
/// @param bot Bot AI state; accesses `client`.
/// @param client Operand used to evaluate the returned expression `info.value(state.configs[bot.client],"t")==info.value(state.configs[client],"t")`.
function sameTeam(state,bot,client) if client<0 or client>=MAX_CLIENTS then return false end if;return info.value(state.configs[bot.client],"t")==info.value(state.configs[client],"t") end function
/// Apply `mq3.shared.info.value` while evaluating `team`.
/// @param state AI team state; accesses `configs`.
/// @param bot Bot AI state; accesses `client`.
function team(state,bot) value=toNumber(info.value(state.configs[bot.client],"t"));if value==TEAM_RED or value==TEAM_BLUE then return value end if;return 0 end function

/// Apply `mq3.game.ai_team.nameOf` while evaluating `validTeamLeader`.
/// @param state AI team state; accesses `maxclients`.
/// @param bot Bot AI state; accesses `teamleader`.
function validTeamLeader(state,bot)
  if bot.teamleader=="" then return false end if
  if state.maxclients<=0 then return false end if
  wanted=strings.toLowerAscii(bot.teamleader)
  for index=0 to state.maxclients-1 if strings.toLowerAscii(nameOf(state,index))==wanted then return true end if end for
  return false
end function

/// Apply `mq3.game.ai_team.nameOf`, `mq3.shared.info.value` and `mq3.game.ai_team.sameTeam` while evaluating `numTeamMates`. Return paths include `count`.
/// @param state AI team state; accesses `maxclients` and `configs`.
/// @param bot Bot AI state; accesses `client`.
function numTeamMates(state,bot)
  count=0;limit=state.maxclients;if limit>MAX_CLIENTS then limit=MAX_CLIENTS end if
  if limit<=0 then return 0 end if
  for index=0 to limit-1
    if state.configs[index]=="" or nameOf(state,index)=="" then continue end if
    if toNumber(info.value(state.configs[index],"t"))==TEAM_SPECTATOR then continue end if
    if sameTeam(state,bot,index) then count=count+1 end if
  end for
  return count
end function

/// Use `state.clientStateFn`, `state.pointAreaFn` and `state.travelTimeFn` to perform `clientTravelTimeToGoal`. Return paths include `state.travelTimes[client]`.
/// @param state AI team state; accesses `clientStateFn`, `pointAreaFn`, `travelTimeFn` and `travelTimes`.
/// @param client Value passed as argument 2 to `state.clientStateFn`.
/// @param goalArea Destination AAS area number.
function clientTravelTimeToGoal(state,client,goalArea)
  if state.clientStateFn!=void and state.pointAreaFn!=void and state.travelTimeFn!=void then
    player=state.clientStateFn(state,client);area=state.pointAreaFn(state,player.origin)
    if area==0 then return 1 end if
    return state.travelTimeFn(state,area,player.origin,goalArea)
  end if
  if client<0 or client>=MAX_CLIENTS then return 1 end if
  return state.travelTimes[client]
end function

/// Apply `mq3.game.ai_team.nameOf`, `mq3.shared.info.value` and `mq3.game.ai_team.sameTeam` while evaluating `sortTeamMatesByBaseTravelTime`.
/// @param state AI team state; accesses `maxclients` and `configs`.
/// @param bot Bot AI state; accesses `client`.
/// @param maxTeamMates Value used by `sortTeamMatesByBaseTravelTime` in `if limit<=0 or maxTeamMates<=0 then return result end if`.
function sortTeamMatesByBaseTravelTime(state,bot,maxTeamMates)
  result=[];times=[];limit=state.maxclients;if limit>MAX_CLIENTS then limit=MAX_CLIENTS end if
  if limit<=0 or maxTeamMates<=0 then return result end if
  for client=0 to limit-1
    if nameOf(state,client)=="" or toNumber(info.value(state.configs[client],"t"))==TEAM_SPECTATOR or not sameTeam(state,bot,client) then continue end if
    value=clientTravelTimeToGoal(state,client,0);at=len(result)
    if len(result)>0 then for index=0 to len(result)-1 if value<times[index] then at=index;break end if end for end if
    result=result+[client];times=times+[value]
    index=len(result)-1
    while index>at result[index]=result[index-1];times[index]=times[index-1];index=index-1 end while
    result[at]=client;times[at]=value
    if len(result)>=maxTeamMates then break end if
  end for
  return result
end function

/// Apply `mq3.game.ai_team.sync` and `mq3.game.bot_team_helpers.setTeamMateTaskPreference` while evaluating `setTeamMateTaskPreference`. Return paths include `base.setTeamMateTaskPreference(state.helper,bot,teammate,preference)`.
/// @param state AI team state; accesses `helper`.
/// @param bot Value passed as argument 2 to `mq3.game.bot_team_helpers.setTeamMateTaskPreference`.
/// @param teammate Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`.
/// @param preference Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`.
function setTeamMateTaskPreference(state,bot,teammate,preference) sync(state);return base.setTeamMateTaskPreference(state.helper,bot,teammate,preference) end function
/// Apply `mq3.game.ai_team.sync`, `mq3.game.bot_team_helpers.getTeamMateTaskPreference` and `mq3.game.ai_team.nameOf` while evaluating `getTeamMateTaskPreference`. Return paths include `base.getTeamMateTaskPreference(state.helper,bot,teammate,nameOf(state,teammate))`.
/// @param state AI team state; accesses `helper`.
/// @param bot Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`.
/// @param teammate Operand used to evaluate the returned expression `state.preferences[teammate]`.
function getTeamMateTaskPreference(state,bot,teammate) sync(state);return base.getTeamMateTaskPreference(state.helper,bot,teammate,nameOf(state,teammate)) end function
/// Apply `mq3.game.ai_team.sync` and `mq3.game.bot_team_helpers.sortTeamMatesByTaskPreference` while evaluating `sortTeamMatesByTaskPreference`. Return paths include `base.sortTeamMatesByTaskPreference(state.helper,bot,teammates)`.
/// @param state AI team state; accesses `helper`.
/// @param bot Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`.
/// @param teammates Value used by `sortTeamMatesByTaskPreference` in `for each teammate in teammates`.
function sortTeamMatesByTaskPreference(state,bot,teammates) sync(state);return base.sortTeamMatesByTaskPreference(state.helper,bot,teammates) end function

/// Record or dispatch `"chat"` actions in `sayTeamOrderAlways`.
/// @param state AI team state; accesses `actions`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param toClient Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function sayTeamOrderAlways(state,bot,toClient,suppressed) emit(state,"chat",bot.client,toClient,"team-order",[],suppressed);return void end function
/// Record or dispatch `"consume-chat"` actions in `sayTeamOrder`.
/// @param state AI team state; accesses `missionpack`.
/// @param bot Bot AI state; accesses `client`.
/// @param toClient Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function sayTeamOrder(state,bot,toClient,suppressed) if state.missionpack then emit(state,"consume-chat",bot.client,toClient,"",[],suppressed) else sayTeamOrderAlways(state,bot,toClient,suppressed) end if;return void end function
/// Record or dispatch `"command"` actions in `voiceChat`.
/// @param state AI team state; accesses `actions`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param toClient Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param voice Value used by `voiceChat` in `command="vsay_team "+voice`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function voiceChat(state,bot,toClient,voice,suppressed) command="vsay_team "+voice;if toClient!=-1 then command="vtell "+str(toClient)+" "+voice end if;emit(state,"command",bot.client,toClient,command,[],suppressed);return void end function
/// Record or dispatch `"command"` actions in `voiceChatOnly`.
/// @param state AI team state; accesses `actions`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param toClient Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param voice Value used by `voiceChatOnly` in `command="vosay_team "+voice`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function voiceChatOnly(state,bot,toClient,voice,suppressed) command="vosay_team "+voice;if toClient!=-1 then command="votell "+str(toClient)+" "+voice end if;emit(state,"command",bot.client,toClient,command,[],suppressed);return void end function
/// Apply `mq3.game.ai_team.voiceChat` while evaluating `sayVoiceTeamOrder`.
/// @param state AI team state; accesses `missionpack`.
/// @param bot Bot AI state; accesses `client`.
/// @param toClient Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param voice Value used by `voiceChat` in `command="vsay_team "+voice`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function sayVoiceTeamOrder(state,bot,toClient,voice,suppressed) if state.missionpack then voiceChat(state,bot,toClient,voice,suppressed) end if;return void end function

/// Record or dispatch `"initial-chat"` actions in `order`.
/// @param state AI team state; accesses `actions`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param kind Text to parse, format or deliver.
/// @param toClient Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param args Initial value stored in `mq3.game.ai_team.Action.args`.
/// @param voice Value used by `voiceChat` in `command="vsay_team "+voice`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function order(state,bot,kind,toClient,args,voice,suppressed)
  emit(state,"initial-chat",bot.client,toClient,kind,args,suppressed);sayTeamOrder(state,bot,toClient,suppressed)
  if voice!="" then sayVoiceTeamOrder(state,bot,toClient,voice,suppressed) end if
  return void
end function

/// Forward `sorted` to `mq3.game.ai_team.sortTeamMatesByTaskPreference` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`.
function sorted(state,bot) return sortTeamMatesByTaskPreference(state,bot,sortTeamMatesByBaseTravelTime(state,bot,MAX_CLIENTS)) end function
/// Forward `rounded` to `mq3.compat.numeric.quotient` and return the delegated result.
/// @param count Number of entries or bytes processed by this call.
/// @param tenths Operand used to evaluate the returned expression `n.quotient(count*tenths+5,10)`.
function rounded(count,tenths) return n.quotient(count*tenths+5,10) end function

/// Apply `mq3.game.ai_team.sorted`, `mq3.game.ai_team.order` and `mq3.game.ai_team.nameOf` while evaluating `distribute`.
/// @param state AI team state; accesses `helper`.
/// @param bot Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`.
/// @param defendTenths Operand used to evaluate the returned expression `n.quotient(count*tenths+5,10)`.
/// @param attackTenths Operand used to evaluate the returned expression `n.quotient(count*tenths+5,10)`.
/// @param defendCap Value used by `distribute` in `if defenders>defendCap then defenders=defendCap end if`.
/// @param attackCap Value used by `distribute` in `if attackers>attackCap then attackers=attackCap end if`.
/// @param attackChat Text to parse, format or deliver.
/// @param attackVoice Value used by `voiceChat` in `command="vsay_team "+voice`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function distribute(state,bot,defendTenths,attackTenths,defendCap,attackCap,attackChat,attackVoice,suppressed)
  mates=sorted(state,bot);count=len(mates);if count<=1 then return void end if
  if count==2 then order(state,bot,"cmd_defendbase",mates[0],[nameOf(state,mates[0])],"defend",suppressed);order(state,bot,attackChat,mates[1],[nameOf(state,mates[1])],attackVoice,suppressed);return void end if
  if count==3 then
    order(state,bot,"cmd_defendbase",mates[0],[nameOf(state,mates[0])],"defend",suppressed)
    if defendTenths>=5 then order(state,bot,"cmd_defendbase",mates[1],[nameOf(state,mates[1])],"defend",suppressed) else order(state,bot,attackChat,mates[1],[nameOf(state,mates[1])],attackVoice,suppressed) end if
    order(state,bot,attackChat,mates[2],[nameOf(state,mates[2])],attackVoice,suppressed);return void
  end if
  defenders=rounded(count,defendTenths);attackers=rounded(count,attackTenths)
  if defenders>defendCap then defenders=defendCap end if;if attackers>attackCap then attackers=attackCap end if
  for index=0 to defenders-1 client=mates[index];order(state,bot,"cmd_defendbase",client,[nameOf(state,client)],"defend",suppressed) end for
  for index=0 to attackers-1 client=mates[count-index-1];order(state,bot,attackChat,client,[nameOf(state,client)],attackVoice,suppressed) end for
  return void
end function

/// Apply `mq3.game.ai_team.sorted`, `mq3.game.ai_team.order` and `mq3.game.ai_team.nameOf` while evaluating `oneFlagAtCenter`. Return paths include `distribute(state,bot,5,4,5,4,"cmd_getflag","getflag",suppressed)`.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function oneFlagAtCenter(state,bot,suppressed)
  mates=sorted(state,bot);count=len(mates);aggressive=(bot.ctfstrategy&CTFS_AGRESSIVE)!=0
  if count<=1 then return void end if
  if count==2 then order(state,bot,"cmd_defendbase",mates[0],[nameOf(state,mates[0])],"defend",suppressed);order(state,bot,"cmd_getflag",mates[1],[nameOf(state,mates[1])],"getflag",suppressed);return void end if
  if count==3 then
    order(state,bot,"cmd_defendbase",mates[0],[nameOf(state,mates[0])],"defend",suppressed)
    if aggressive then order(state,bot,"cmd_getflag",mates[1],[nameOf(state,mates[1])],"getflag",suppressed)
    else order(state,bot,"cmd_defendbase",mates[1],[nameOf(state,mates[1])],"",suppressed);sayVoiceTeamOrder(state,bot,mates[0],"defend",suppressed) end if
    order(state,bot,"cmd_getflag",mates[2],[nameOf(state,mates[2])],"getflag",suppressed);return void
  end if
  if aggressive then return distribute(state,bot,3,6,3,6,"cmd_getflag","getflag",suppressed) end if
  return distribute(state,bot,5,4,5,4,"cmd_getflag","getflag",suppressed)
end function
/// Forward `oneFlagEnemyDropped` to `mq3.game.ai_team.oneFlagAtCenter` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function oneFlagEnemyDropped(state,bot,suppressed) return oneFlagAtCenter(state,bot,suppressed) end function

/// Apply `mq3.game.ai_team.order` and `mq3.game.ai_team.nameOf` while evaluating `accompany`.
/// @param state AI team state; accesses `actions`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `flagcarrier` and `client`.
/// @param client Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function accompany(state,bot,client,suppressed)
  if bot.flagcarrier==-1 then return order(state,bot,"cmd_getflag",client,[nameOf(state,client)],"getflag",suppressed) end if
  if bot.flagcarrier==bot.client then return order(state,bot,"cmd_accompanyme",client,[nameOf(state,client)],"followme",suppressed) end if
  return order(state,bot,"cmd_accompany",client,[nameOf(state,client),nameOf(state,bot.flagcarrier)],"followflagcarrier",suppressed)
end function

/// Apply `mq3.game.ai_team.sorted`, `mq3.game.ai_team.order` and `mq3.game.ai_team.nameOf` while evaluating `oneFlagTeamHasFlag`.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy` and `flagcarrier`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function oneFlagTeamHasFlag(state,bot,suppressed)
  mates=sorted(state,bot);count=len(mates);if count<=1 then return void end if;aggressive=(bot.ctfstrategy&CTFS_AGRESSIVE)!=0
  if count==2 then other=mates[0];if other==bot.flagcarrier then other=mates[1] end if;if aggressive then return order(state,bot,"cmd_defendbase",other,[nameOf(state,other)],"defend",suppressed) end if;return order(state,bot,"cmd_attackenemybase",other,[nameOf(state,other)],"offense",suppressed) end if
  if count==3 then
    other=mates[0];if other==bot.flagcarrier then other=mates[1] end if;order(state,bot,"cmd_defendbase",other,[nameOf(state,other)],"defend",suppressed)
    other=mates[2];if other==bot.flagcarrier then other=mates[1] end if;return accompany(state,bot,other,suppressed)
  end if
  defendTenths=3;defendCap=3;attackTenths=7;attackCap=7;if aggressive then defendTenths=2;defendCap=2;attackTenths=8;attackCap=8 end if
  defenders=rounded(count,defendTenths);if defenders>defendCap then defenders=defendCap end if
  attackers=rounded(count,attackTenths);if attackers>attackCap then attackers=attackCap end if
  for index=0 to defenders-1 client=mates[index];if client==bot.flagcarrier then continue end if;order(state,bot,"cmd_defendbase",client,[nameOf(state,client)],"defend",suppressed) end for
  for index=0 to attackers-1 client=mates[count-index-1];if client==bot.flagcarrier then continue end if;accompany(state,bot,client,suppressed) end for
  return void
end function

/// Apply `mq3.game.ai_team.sorted`, `mq3.game.ai_team.order` and `mq3.game.ai_team.nameOf` while evaluating `oneFlagEnemyHasFlag`.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function oneFlagEnemyHasFlag(state,bot,suppressed)
  mates=sorted(state,bot);count=len(mates);if count<=1 then return void end if;aggressive=(bot.ctfstrategy&CTFS_AGRESSIVE)!=0
  if count==2 then order(state,bot,"cmd_defendbase",mates[0],[nameOf(state,mates[0])],"defend",suppressed);order(state,bot,"cmd_defendbase",mates[1],[nameOf(state,mates[1])],"defend",suppressed);return void end if
  if count==3 then order(state,bot,"cmd_defendbase",mates[0],[nameOf(state,mates[0])],"defend",suppressed);order(state,bot,"cmd_defendbase",mates[1],[nameOf(state,mates[1])],"defend",suppressed);if aggressive then order(state,bot,"cmd_returnflag",mates[2],[nameOf(state,mates[2])],"getflag",suppressed) else order(state,bot,"cmd_defendbase",mates[2],[nameOf(state,mates[2])],"defend",suppressed) end if;return void end if
  defendTenths=8;attackTenths=1;if aggressive then defendTenths=7;attackTenths=2 end if
  defenders=rounded(count,defendTenths);if defenders>8 then defenders=8 end if;attackers=rounded(count,attackTenths);if attackers>2 then attackers=2 end if
  for index=0 to defenders-1 client=mates[index];order(state,bot,"cmd_defendbase",client,[nameOf(state,client)],"defend",suppressed) end for
  for index=0 to attackers-1 client=mates[count-index-1];order(state,bot,"cmd_returnflag",client,[nameOf(state,client)],"getflag",suppressed) end for
  return void
end function

/// Apply `mq3.game.ai_team.oneFlagAtCenter`, `mq3.game.ai_team.oneFlagTeamHasFlag` and `mq3.game.ai_team.oneFlagEnemyHasFlag` while evaluating `oneFlagOrders`.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `neutralflagstatus`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function oneFlagOrders(state,bot,suppressed)
  if bot.neutralflagstatus==0 then return oneFlagAtCenter(state,bot,suppressed) end if
  if bot.neutralflagstatus==1 then return oneFlagTeamHasFlag(state,bot,suppressed) end if
  if bot.neutralflagstatus==2 then return oneFlagEnemyHasFlag(state,bot,suppressed) end if
  if bot.neutralflagstatus==3 then return oneFlagEnemyDropped(state,bot,suppressed) end if
  return void
end function

/// Apply `mq3.game.ai_team.distribute` while evaluating `obeliskOrders`. Return paths include `distribute(state,bot,5,4,5,4,"cmd_attackenemybase","offense",suppressed)`.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function obeliskOrders(state,bot,suppressed)
  if (bot.ctfstrategy&CTFS_AGRESSIVE)!=0 then return distribute(state,bot,3,7,3,7,"cmd_attackenemybase","offense",suppressed) end if
  return distribute(state,bot,5,4,5,4,"cmd_attackenemybase","offense",suppressed)
end function
/// Apply `mq3.game.ai_team.distribute` while evaluating `harvesterOrders`. Return paths include `distribute(state,bot,5,4,5,4,"cmd_harvest","offense",suppressed)`.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function harvesterOrders(state,bot,suppressed)
  if (bot.ctfstrategy&CTFS_AGRESSIVE)!=0 then return distribute(state,bot,3,7,3,7,"cmd_harvest","offense",suppressed) end if
  return distribute(state,bot,5,4,5,4,"cmd_harvest","offense",suppressed)
end function

/// Apply `mq3.game.ai_team.nameOf` and `mq3.game.ai_team.order` while evaluating `createGroup`.
/// @param state AI team state; accesses `names` and `configs`.
/// @param bot Bot AI state; accesses `client`.
/// @param mates Array or byte sequence accessed at `0` and `index`.
/// @param groupSize Value used by `createGroup` in `if groupSize<=1 then return void end if`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function createGroup(state,bot,mates,groupSize,suppressed)
  if groupSize<=1 then return void end if;leader=mates[0]
  for index=1 to groupSize-1 client=mates[index];kind="";args=[];if leader==bot.client then kind="cmd_accompanyme";args=[nameOf(state,client)] else kind="cmd_accompany";args=[nameOf(state,client),nameOf(state,leader)] end if;order(state,bot,kind,client,args,"",suppressed) end for
  return void
end function
/// Apply `mq3.game.ai_team.nameOf`, `mq3.shared.info.value` and `mq3.game.ai_team.sameTeam` while evaluating `teamOrders`.
/// @param state AI team state; accesses `maxclients` and `configs`.
/// @param bot Bot AI state; accesses `client`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function teamOrders(state,bot,suppressed)
  mates=[];if state.maxclients<=0 then return void end if;for index=0 to state.maxclients-1 if nameOf(state,index)!="" and toNumber(info.value(state.configs[index],"t"))!=TEAM_SPECTATOR and sameTeam(state,bot,index) then mates=mates+[index] end if end for
  count=len(mates);if count==3 then createGroup(state,bot,[mates[0],mates[1]],2,suppressed) else if count==4 then createGroup(state,bot,[mates[0],mates[1]],2,suppressed);createGroup(state,bot,[mates[2],mates[3]],2,suppressed) else if count==5 then createGroup(state,bot,[mates[0],mates[1]],2,suppressed);createGroup(state,bot,[mates[2],mates[3],mates[4]],3,suppressed) else if count>=6 and count<=10 then for index=0 to n.quotient(count,2)-1 createGroup(state,bot,[mates[index*2],mates[index*2+1]],2,suppressed) end for end if
  return void
end function

/// Record or dispatch `"default-defend"` actions in `findHumanTeamLeader`.
/// @param state AI team state; accesses `helper`. May update `state.helper.sameTeamFn` in place.
/// @param bot Bot AI state; accesses `teamleader` and `client`. May update `bot.teamleader` in place.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function findHumanTeamLeader(state,bot,suppressed)
  sync(state);state.helper.sameTeamFn=sameTeam
  for index=0 to MAX_CLIENTS-1
    if not state.helper.entityInUse[index] or (state.helper.entitySvFlags[index]&8)!=0 or state.helper.notLeader[index] or not sameTeam(state,bot,index) then continue end if
    bot.teamleader=nameOf(state,index);hasTask=false;if state.helper.setLastOrderedTaskFn!=void then hasTask=state.helper.setLastOrderedTaskFn(state.helper,bot) end if;if not hasTask then if state.helper.defendFn!=void then state.helper.defendFn(state.helper,bot,index,1) else emit(state,"default-defend",bot.client,index,"",[],suppressed) end if end if;return true
  end for
  return false
end function

/// Update `state.suppressed`, `state.helper.teamFn`, `state.helper.sortBaseFn` and `state.helper.initialChatFn` and related state during `ctfOrders`. Return paths include `base.ctfOrders(state.helper,bot,bot.redflagstatus,bot.blueflagstatus)`.
/// @param state AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.teamFn` and `state.helper.sortBaseFn` and additional fields in place.
/// @param bot Bot AI state; accesses `redflagstatus` and `blueflagstatus`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function ctfOrders(state,bot,suppressed)
  state.suppressed=suppressed
  sync(state);state.helper.teamFn=team;state.helper.sortBaseFn=sortCallback;state.helper.initialChatFn=chatCallback;state.helper.orderAlwaysFn=orderCallback
  return base.ctfOrders(state.helper,bot,bot.redflagstatus,bot.blueflagstatus)
end function
/// Forward `sortCallback` to `mq3.game.ai_team.sorted` and return the delegated result.
/// @param helper Helper record; accesses `context`.
/// @param bot Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`.
function sortCallback(helper,bot) return sorted(helper.context,bot) end function
/// Record or dispatch `"initial-chat"` actions in `chatCallback`.
/// @param helper Helper record; accesses `context`.
/// @param bot Bot AI state; accesses `client`.
/// @param kind Text to parse, format or deliver.
/// @param args Initial value stored in `mq3.game.ai_team.Action.args`.
function chatCallback(helper,bot,kind,args) emit(helper.context,"initial-chat",bot.client,-1,kind,args,helper.context.suppressed);return void end function
/// Record or dispatch `"consume-chat"` and `"chat"` actions in `orderCallback`.
/// @param helper Helper record; accesses `context`.
/// @param bot Bot AI state; accesses `client`.
/// @param target Initial value stored in `mq3.game.ai_team.Action.target`.
function orderCallback(helper,bot,target)
  state=helper.context
  if state.missionpack then emit(state,"consume-chat",bot.client,target,"",[],state.suppressed) else emit(state,"chat",bot.client,target,"team-order",[],state.suppressed) end if
  if state.missionpack and len(state.actions)>1 then
    prior=state.actions[len(state.actions)-2];voice=""
    if prior.kind=="initial-chat" then if prior.text=="cmd_defendbase" then voice="defend" else if prior.text=="cmd_getflag" then voice="getflag" else if prior.text=="cmd_accompanyme" then voice="followme" else if prior.text=="cmd_accompany" then voice="followflagcarrier" end if end if
    if voice!="" then voiceChat(state,bot,target,voice,state.suppressed) end if
  end if
  return void
end function

/// Record or dispatch `"initial-chat"` and `"enter-chat"` actions in `teamAI`.
/// @param state AI team state; accesses `gametype`, `now` and `randomValue`.
/// @param bot Bot AI state; accesses `askteamleaderTime`, `becometeamleaderTime`, `entergameTime`, `client` and `teamleader` and related fields. May update `bot.askteamleaderTime`, `bot.becometeamleaderTime` and `bot.teamleader` and additional fields in place.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function teamAI(state,bot,suppressed)
  if state.gametype<GT_TEAM then return void end if
  if not validTeamLeader(state,bot) then
    if not findHumanTeamLeader(state,bot,suppressed) then
      if bot.askteamleaderTime==0.0 and bot.becometeamleaderTime==0.0 then if bot.entergameTime+10.0>state.now then bot.askteamleaderTime=state.now+5.0+state.randomValue*10.0 else bot.becometeamleaderTime=state.now+5.0+state.randomValue*10.0 end if end if
      if bot.askteamleaderTime!=0.0 and bot.askteamleaderTime<state.now then emit(state,"initial-chat",bot.client,0,"whoisteamleader",[],suppressed);emit(state,"enter-chat",bot.client,0,"team",[],suppressed);bot.askteamleaderTime=0.0;bot.becometeamleaderTime=state.now+8.0+state.randomValue*10.0 end if
      if bot.becometeamleaderTime!=0.0 and bot.becometeamleaderTime<state.now then emit(state,"initial-chat",bot.client,0,"iamteamleader",[],suppressed);emit(state,"enter-chat",bot.client,0,"team",[],suppressed);sayVoiceTeamOrder(state,bot,-1,"startleader",suppressed);bot.teamleader=nameOf(state,bot.client);bot.becometeamleaderTime=0.0 end if
      return void
    end if
  end if
  bot.askteamleaderTime=0.0;bot.becometeamleaderTime=0.0;if strings.toLowerAscii(nameOf(state,bot.client))!=strings.toLowerAscii(bot.teamleader) then return void end if
  count=numTeamMates(state,bot)
  if state.gametype==GT_TEAM then if bot.numteammates!=count or bot.forceorders then bot.teamgiveordersTime=state.now;bot.numteammates=count;bot.forceorders=false end if;if bot.teamgiveordersTime!=0.0 and bot.teamgiveordersTime<state.now-5.0 then teamOrders(state,bot,suppressed);bot.teamgiveordersTime=state.now+120.0 end if;return void end if
  if state.gametype==GT_CTF or state.gametype==GT_1FCTF then
    if bot.numteammates!=count or bot.flagstatuschanged or bot.forceorders then bot.teamgiveordersTime=state.now;bot.numteammates=count;bot.flagstatuschanged=false;bot.forceorders=false end if
    if bot.lastflagcaptureTime<state.now-240.0 then bot.lastflagcaptureTime=state.now;if state.randomValue<0.4 then bot.ctfstrategy=bot.ctfstrategy^CTFS_AGRESSIVE;bot.teamgiveordersTime=state.now end if end if
    delay=3.0;if state.gametype==GT_1FCTF then delay=2.0 end if;if bot.teamgiveordersTime!=0.0 and bot.teamgiveordersTime<state.now-delay then if state.gametype==GT_CTF then ctfOrders(state,bot,suppressed) else oneFlagOrders(state,bot,suppressed) end if;bot.teamgiveordersTime=0.0 end if;return void
  end if
  if state.gametype==GT_OBELISK or state.gametype==GT_HARVESTER then if bot.numteammates!=count or bot.forceorders then bot.teamgiveordersTime=state.now;bot.numteammates=count;bot.forceorders=false end if;if bot.teamgiveordersTime!=0.0 and bot.teamgiveordersTime<state.now-5.0 then if state.gametype==GT_OBELISK then obeliskOrders(state,bot,suppressed) else harvesterOrders(state,bot,suppressed) end if;bot.teamgiveordersTime=state.now+30.0 end if end if
  return void
end function

// Original exported spellings retained for symbol-level port auditing.
/// @param state AI team state; accesses `maxclients`.
/// @param bot Bot AI state; accesses `teamleader`.
function BotValidTeamLeader(state,bot) return validTeamLeader(state,bot) end function
/// Forward `BotNumTeamMates` to `mq3.game.ai_team.numTeamMates` and return the delegated result.
/// @param state AI team state; accesses `maxclients` and `configs`.
/// @param bot Bot AI state; accesses `client`.
function BotNumTeamMates(state,bot) return numTeamMates(state,bot) end function
/// Forward `BotClientTravelTimeToGoal` to `mq3.game.ai_team.clientTravelTimeToGoal` and return the delegated result.
/// @param state AI team state; accesses `clientStateFn`, `pointAreaFn`, `travelTimeFn` and `travelTimes`.
/// @param client Value passed as argument 2 to `state.clientStateFn`.
/// @param goalArea Destination AAS area number.
function BotClientTravelTimeToGoal(state,client,goalArea) return clientTravelTimeToGoal(state,client,goalArea) end function
/// Forward `BotSortTeamMatesByBaseTravelTime` to `mq3.game.ai_team.sortTeamMatesByBaseTravelTime` and return the delegated result.
/// @param state AI team state; accesses `maxclients` and `configs`.
/// @param bot Bot AI state; accesses `client`.
/// @param maxTeamMates Value used by `sortTeamMatesByBaseTravelTime` in `if limit<=0 or maxTeamMates<=0 then return result end if`.
function BotSortTeamMatesByBaseTravelTime(state,bot,maxTeamMates) return sortTeamMatesByBaseTravelTime(state,bot,maxTeamMates) end function
/// Forward `BotSetTeamMateTaskPreference` to `mq3.game.ai_team.setTeamMateTaskPreference` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Value passed as argument 2 to `mq3.game.bot_team_helpers.setTeamMateTaskPreference`.
/// @param client Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`.
/// @param preference Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`.
function BotSetTeamMateTaskPreference(state,bot,client,preference) return setTeamMateTaskPreference(state,bot,client,preference) end function
/// Forward `BotGetTeamMateTaskPreference` to `mq3.game.ai_team.getTeamMateTaskPreference` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`.
/// @param client Operand used to evaluate the returned expression `state.preferences[teammate]`.
function BotGetTeamMateTaskPreference(state,bot,client) return getTeamMateTaskPreference(state,bot,client) end function
/// Forward `BotSortTeamMatesByTaskPreference` to `mq3.game.ai_team.sortTeamMatesByTaskPreference` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`.
/// @param mates Value used by `sortTeamMatesByTaskPreference` in `for each teammate in teammates`.
function BotSortTeamMatesByTaskPreference(state,bot,mates) return sortTeamMatesByTaskPreference(state,bot,mates) end function
/// Forward `BotSayTeamOrderAlways` to `mq3.game.ai_team.sayTeamOrderAlways` and return the delegated result.
/// @param state AI team state; accesses `actions`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param client Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotSayTeamOrderAlways(state,bot,client,suppressed) return sayTeamOrderAlways(state,bot,client,suppressed) end function
/// Forward `BotSayTeamOrder` to `mq3.game.ai_team.sayTeamOrder` and return the delegated result.
/// @param state AI team state; accesses `missionpack`.
/// @param bot Bot AI state; accesses `client`.
/// @param client Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotSayTeamOrder(state,bot,client,suppressed) return sayTeamOrder(state,bot,client,suppressed) end function
/// Forward `BotVoiceChat` to `mq3.game.ai_team.voiceChat` and return the delegated result.
/// @param state AI team state; accesses `actions`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param client Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param voice Value used by `voiceChat` in `command="vsay_team "+voice`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotVoiceChat(state,bot,client,voice,suppressed) return voiceChat(state,bot,client,voice,suppressed) end function
/// Forward `BotVoiceChatOnly` to `mq3.game.ai_team.voiceChatOnly` and return the delegated result.
/// @param state AI team state; accesses `actions`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param client Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param voice Value used by `voiceChatOnly` in `command="vosay_team "+voice`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotVoiceChatOnly(state,bot,client,voice,suppressed) return voiceChatOnly(state,bot,client,voice,suppressed) end function
/// Forward `BotSayVoiceTeamOrder` to `mq3.game.ai_team.sayVoiceTeamOrder` and return the delegated result.
/// @param state AI team state; accesses `missionpack`.
/// @param bot Bot AI state; accesses `client`.
/// @param client Initial value stored in `mq3.game.ai_team.Action.target`.
/// @param voice Value used by `voiceChat` in `command="vsay_team "+voice`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotSayVoiceTeamOrder(state,bot,client,voice,suppressed) return sayVoiceTeamOrder(state,bot,client,voice,suppressed) end function
/// Update `state.suppressed`, `state.helper.sortBaseFn`, `state.helper.initialChatFn` and `state.helper.orderAlwaysFn` during `BotCTFOrders_BothFlagsNotAtBase`. Return paths include `base.ctfOrdersBothFlagsNotAtBase(state.helper,bot)`.
/// @param state AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.sortBaseFn` and `state.helper.initialChatFn` and additional fields in place.
/// @param bot Bot AI state; accesses `numteammates`, `flagcarrier` and `client`.
function BotCTFOrders_BothFlagsNotAtBase(state,bot) state.suppressed=false;sync(state);state.helper.sortBaseFn=sortCallback;state.helper.initialChatFn=chatCallback;state.helper.orderAlwaysFn=orderCallback;return base.ctfOrdersBothFlagsNotAtBase(state.helper,bot) end function
/// Update `state.suppressed`, `state.helper.sortBaseFn`, `state.helper.initialChatFn` and `state.helper.orderAlwaysFn` during `BotCTFOrders_FlagNotAtBase`. Return paths include `base.ctfOrdersFlagNotAtBase(state.helper,bot)`.
/// @param state AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.sortBaseFn` and `state.helper.initialChatFn` and additional fields in place.
/// @param bot Bot AI state; accesses `ctfstrategy` and `numteammates`.
function BotCTFOrders_FlagNotAtBase(state,bot) state.suppressed=false;sync(state);state.helper.sortBaseFn=sortCallback;state.helper.initialChatFn=chatCallback;state.helper.orderAlwaysFn=orderCallback;return base.ctfOrdersFlagNotAtBase(state.helper,bot) end function
/// Update `state.suppressed`, `state.helper.sortBaseFn`, `state.helper.initialChatFn` and `state.helper.orderAlwaysFn` during `BotCTFOrders_EnemyFlagNotAtBase`. Return paths include `base.ctfOrdersEnemyFlagNotAtBase(state.helper,bot)`.
/// @param state AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.sortBaseFn` and `state.helper.initialChatFn` and additional fields in place.
/// @param bot Bot AI state; accesses `flagcarrier` and `client`.
function BotCTFOrders_EnemyFlagNotAtBase(state,bot) state.suppressed=false;sync(state);state.helper.sortBaseFn=sortCallback;state.helper.initialChatFn=chatCallback;state.helper.orderAlwaysFn=orderCallback;return base.ctfOrdersEnemyFlagNotAtBase(state.helper,bot) end function
/// Update `state.suppressed`, `state.helper.sortBaseFn`, `state.helper.initialChatFn` and `state.helper.orderAlwaysFn` during `BotCTFOrders_BothFlagsAtBase`. Return paths include `base.ctfOrdersBothFlagsAtBase(state.helper,bot)`.
/// @param state AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.sortBaseFn` and `state.helper.initialChatFn` and additional fields in place.
/// @param bot Bot AI state; accesses `ctfstrategy`.
function BotCTFOrders_BothFlagsAtBase(state,bot) state.suppressed=false;sync(state);state.helper.sortBaseFn=sortCallback;state.helper.initialChatFn=chatCallback;state.helper.orderAlwaysFn=orderCallback;return base.ctfOrdersBothFlagsAtBase(state.helper,bot) end function
/// Forward `BotCTFOrders` to `mq3.game.ai_team.ctfOrders` and return the delegated result.
/// @param state AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.teamFn` and `state.helper.sortBaseFn` and additional fields in place.
/// @param bot Bot AI state; accesses `redflagstatus` and `blueflagstatus`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotCTFOrders(state,bot,suppressed) return ctfOrders(state,bot,suppressed) end function
/// Forward `BotCreateGroup` to `mq3.game.ai_team.createGroup` and return the delegated result.
/// @param state AI team state; accesses `names` and `configs`.
/// @param bot Bot AI state; accesses `client`.
/// @param mates Array or byte sequence accessed at `0` and `index`.
/// @param size Size or capacity supplied to the buffer operation.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotCreateGroup(state,bot,mates,size,suppressed) return createGroup(state,bot,mates,size,suppressed) end function
/// Forward `BotTeamOrders` to `mq3.game.ai_team.teamOrders` and return the delegated result.
/// @param state AI team state; accesses `maxclients` and `configs`.
/// @param bot Bot AI state; accesses `client`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotTeamOrders(state,bot,suppressed) return teamOrders(state,bot,suppressed) end function
/// Forward `Bot1FCTFOrders_FlagAtCenter` to `mq3.game.ai_team.oneFlagAtCenter` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function Bot1FCTFOrders_FlagAtCenter(state,bot,suppressed) return oneFlagAtCenter(state,bot,suppressed) end function
/// Forward `Bot1FCTFOrders_TeamHasFlag` to `mq3.game.ai_team.oneFlagTeamHasFlag` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy` and `flagcarrier`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function Bot1FCTFOrders_TeamHasFlag(state,bot,suppressed) return oneFlagTeamHasFlag(state,bot,suppressed) end function
/// Forward `Bot1FCTFOrders_EnemyHasFlag` to `mq3.game.ai_team.oneFlagEnemyHasFlag` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function Bot1FCTFOrders_EnemyHasFlag(state,bot,suppressed) return oneFlagEnemyHasFlag(state,bot,suppressed) end function
/// Forward `Bot1FCTFOrders_EnemyDroppedFlag` to `mq3.game.ai_team.oneFlagEnemyDropped` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function Bot1FCTFOrders_EnemyDroppedFlag(state,bot,suppressed) return oneFlagEnemyDropped(state,bot,suppressed) end function
/// Forward `Bot1FCTFOrders` to `mq3.game.ai_team.oneFlagOrders` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `neutralflagstatus`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function Bot1FCTFOrders(state,bot,suppressed) return oneFlagOrders(state,bot,suppressed) end function
/// Forward `BotObeliskOrders` to `mq3.game.ai_team.obeliskOrders` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotObeliskOrders(state,bot,suppressed) return obeliskOrders(state,bot,suppressed) end function
/// Forward `BotHarvesterOrders` to `mq3.game.ai_team.harvesterOrders` and return the delegated result.
/// @param state AI team state; accesses `helper`.
/// @param bot Bot AI state; accesses `ctfstrategy`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotHarvesterOrders(state,bot,suppressed) return harvesterOrders(state,bot,suppressed) end function
/// Forward `FindHumanTeamLeader` to `mq3.game.ai_team.findHumanTeamLeader` and return the delegated result.
/// @param state AI team state; accesses `helper`. May update `state.helper.sameTeamFn` in place.
/// @param bot Bot AI state; accesses `teamleader` and `client`. May update `bot.teamleader` in place.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function FindHumanTeamLeader(state,bot,suppressed) return findHumanTeamLeader(state,bot,suppressed) end function
/// Forward `BotTeamAI` to `mq3.game.ai_team.teamAI` and return the delegated result.
/// @param state AI team state; accesses `gametype`, `now` and `randomValue`.
/// @param bot Bot AI state; accesses `askteamleaderTime`, `becometeamleaderTime`, `entergameTime`, `client` and `teamleader` and related fields. May update `bot.askteamleaderTime`, `bot.becometeamleaderTime` and `bot.teamleader` and additional fields in place.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotTeamAI(state,bot,suppressed) return teamAI(state,bot,suppressed) end function
