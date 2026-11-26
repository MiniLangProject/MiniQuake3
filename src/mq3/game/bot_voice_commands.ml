// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete ai_vcmd.c voice-command state transitions and host boundaries.
package mq3.game.bot_voice_commands
import std.string as strings
import mq3.shared.info as info
import mq3.compat.textnumbers as textnum

/// Maximum number of client slots represented by the original game protocol.
const MAX_CLIENTS=64
/// Upper bound on message size represented by mq3.game.bot_voice_commands.
const MAX_MESSAGE_SIZE=256
/// Chat delivery mode selecting all recipients.
const SAY_ALL=0
/// Chat-state value or flag selecting team.
const CHAT_TEAM=1
/// Chat-state value or flag selecting tell.
const CHAT_TELL=2
/// Team identifier selecting the red team/category.
const TEAM_RED=1
/// Team identifier selecting the blue team/category.
const TEAM_BLUE=2
/// Game-mode identifier selecting capture the flag rules.
const GT_CTF=4
/// Game-mode identifier selecting 1 fctf rules.
const GT_1FCTF=5
/// Game-mode identifier selecting obelisk rules.
const GT_OBELISK=6
/// Game-mode identifier selecting harvester rules.
const GT_HARVESTER=7
/// Long-term bot goal identifier selecting teamaccompany behavior.
const LTG_TEAMACCOMPANY=2
/// Long-term bot goal identifier selecting defend a key area behavior.
const LTG_DEFENDKEYAREA=3
/// Long-term bot goal identifier selecting capture the flag behavior.
const LTG_GETFLAG=4
/// Long-term bot goal identifier selecting return the flag behavior.
const LTG_RETURNFLAG=6
/// Long-term bot goal identifier selecting follow a camp order behavior.
const LTG_CAMPORDER=8
/// Long-term bot goal identifier selecting harvest behavior.
const LTG_HARVEST=12
/// Long-term bot goal identifier selecting attackenemybase behavior.
const LTG_ATTACKENEMYBASE=13
/// Bot team-task preference bit indicating a preference for defender.
const TEAMTP_DEFENDER=1
/// Bot team-task preference bit indicating a preference for attacker.
const TEAMTP_ATTACKER=2
/// Bot input-action bit requesting affirmative.
const ACTION_AFFIRMATIVE=0x0100000
/// Duration in seconds allowed for the bot team task to accompany.
const TEAM_ACCOMPANY_TIME=600.0
/// Duration in seconds allowed for the bot team task to defend a key area.
const TEAM_DEFENDKEYAREA_TIME=600.0
/// Duration in seconds allowed for the bot team task to camp.
const TEAM_CAMP_TIME=600.0
/// Duration in seconds allowed for the bot team task to attackenemybase.
const TEAM_ATTACKENEMYBASE_TIME=600.0
/// Duration in seconds allowed for the bot team task to harvest.
const TEAM_HARVEST_TIME=120.0
/// Capture-the-flag scoring or timing parameter for capture the flag time.
const CTF_GETFLAG_TIME=600.0
/// Capture-the-flag scoring or timing parameter for return the flag time.
const CTF_RETURNFLAG_TIME=180.0

/// `Goal` record for bot voice commands, containing `entitynum`, `areanum`, `origin`, `mins` and `maxs` and related fields.
struct Goal
  /// Entity number associated with the goal selected by a bot voice command.
  entitynum
  /// AAS area containing the bot or spatial goal.
  areanum
  /// World-space target position of the goal selected by a bot voice command.
  origin
  /// Lower local bounding-box corner of the goal selected by a bot voice command.
  mins
  /// Upper local bounding-box corner of the goal selected by a bot voice command.
  maxs
  /// Identifier identifying the voice-command navigation goal.
  tag
end struct
/// `EntityInfo` record for bot voice commands, containing `valid` and `origin`.
struct EntityInfo
  /// True when entity information was found for resolving a bot voice command.
  valid
  /// Position returned for an entity referenced by a bot voice command.
  origin
end struct
/// `HostAction` record for bot voice commands, containing `kind`, `client`, `channel`, `text` and `value` and related fields.
struct HostAction
  /// Discriminator selecting the recorded bot action or decision event.
  kind
  /// Client slot associated with the host action produced by a voice command.
  client
  /// Delivery channel selected for the host chat/message action.
  channel
  /// Text payload supplied to the recorded command, chat, or host action.
  text
  /// Numeric/result payload supplied to the recorded host action.
  value
  /// Nonzero after the action has been delivered to its host callback.
  dispatched
end struct
/// `Bot` record for bot voice commands, containing `client`, `cs`, `team`, `teamleader` and `decisionmaker` and related fields.
struct Bot
  /// Client slot of the bot receiving and interpreting voice commands.
  client
  /// Botlib chat-state handle owned by this bot.
  cs
  /// Team assignment associated with the client, bot, or action.
  team
  /// Name or identifier of the current bot-team leader.
  teamleader
  /// Client/entity currently responsible for the bot team decisions.
  decisionmaker
  /// Nonzero when a teammate explicitly ordered the current team task.
  ordered
  /// Timestamp at which the bot order was received.
  orderTime
  /// Time controlling the next bot team message.
  teammessageTime
  /// Current long-term goal category selected from the LTG_* constants.
  ltgtype
  /// Deadline associated with the current cooperative team goal.
  teamgoalTime
  /// Navigation goal associated with the bot current team task.
  teamgoal
  /// Time controlling temporary excursions from a harvesting goal.
  harvestawayTime
  /// Time controlling temporary excursions from an attack-base goal.
  attackawayTime
  /// Time controlling how long the bot may leave its defense goal.
  defendawayTime
  /// Deadline associated with leading a teammate toward a goal.
  leadTime
  /// Long-term goal type retained from the preceding team task.
  lastgoalLtgtype
  /// Teammate entity/client selected for the current cooperative task.
  teammate
  /// Timestamp at which the bot arrived at the current team goal.
  arriveTime
  /// Last time the teammate associated with the task was visible.
  teammatevisibleTime
  /// Desired separation from the teammate or formation leader.
  formationDist
  /// Time controlling temporary excursions from a rush-base goal.
  rushbaseawayTime
end struct
/// `State` record for bot voice commands, containing `gametype`, `missionpack`, `teamplay`, `now` and `randomValue` and related fields.
struct State
  /// GT_* game-mode identifier used for interpreting voice orders for the active team game.
  gametype
  /// Nonzero when mission-pack rules and content are enabled.
  missionpack
  /// Nonzero when the active game mode uses teams.
  teamplay
  /// Current clock value supplied to the bot decision step.
  now
  /// Deterministic random input supplied to the current bot decision.
  randomValue
  /// Goal/entity reference for the red flag.
  redFlag
  /// Goal/entity reference for the blue flag.
  blueFlag
  /// Goal/entity reference for the neutral flag.
  neutralFlag
  /// Goal/entity reference for the red team obelisk.
  redObelisk
  /// Goal/entity reference for the blue team obelisk.
  blueObelisk
  /// Name strings indexed by the corresponding state-table entries.
  names
  /// Simplified names used to match bot/player command references.
  easyNames
  /// Botlib entity-information records used for tactical queries.
  entityInfos
  /// AAS area results associated with sampled world points.
  pointAreas
  /// Team-task preference values indexed by client or category.
  taskPreferences
  /// Team assignments indexed by client slot.
  clientTeams
  /// Markers identifying clients excluded from team-leader selection.
  notLeader
  /// Client/entity currently carrying the flag of interest.
  flagCarrier
  /// Next position in the supplied deterministic time sequence.
  timeIndex
  /// Deterministic clock values supplied to the bot/game adapter.
  timeValues
  /// Recorded host actions emitted by bot decision logic.
  actions
  /// Injected callback for host action; invoked through the State service/state record.
  hostActionFn
end struct

/// Create a `mq3.game.bot_voice_commands.Goal` record, initializing `entitynum` from `entitynum`, `areanum` from `areanum` and `origin` from `origin`.
/// @param entitynum Initial value stored in `mq3.game.bot_voice_commands.Goal.entitynum`.
/// @param areanum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param tag Initial value stored in `mq3.game.bot_voice_commands.Goal.tag`.
function goal(entitynum,areanum,origin,mins,maxs,tag) return Goal(entitynum,areanum,origin,mins,maxs,tag) end function
/// Forward `emptyGoal` to `mq3.game.bot_voice_commands.goal` and return the delegated result.
function emptyGoal() return goal(-1,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0) end function
/// Forward `copyGoal` to `mq3.game.bot_voice_commands.goal` and return the delegated result.
/// @param value Value record; accesses `entitynum`, `areanum`, `origin`, `mins` and `maxs` and related fields.
function copyGoal(value) return goal(value.entitynum,value.areanum,value.origin+[ ],value.mins+[ ],value.maxs+[ ],value.tag) end function
/// Create a `mq3.game.bot_voice_commands.Bot` record, initializing `client` from `client`, `cs` from `client` and `team` as `TEAM_RED`.
/// @param client Initial value stored in `mq3.game.bot_voice_commands.Bot.client`.
function createBot(client)
  return Bot(client,client,TEAM_RED,"",0,false,0.0,0.0,0,0.0,emptyGoal(),0.0,0.0,0.0,0.0,0,-1,0.0,0.0,0.0,0.0)
end function
/// Build the `mq3.game.bot_voice_commands.State` result for `create`.
function create()
  zero=emptyGoal();infos=[];areas=[]
  for index=0 to MAX_CLIENTS-1 infos=infos+[EntityInfo(false,[0.0,0.0,0.0])];areas=areas+[0] end for
  return State(0,true,true,100.0,0.25,copyGoal(zero),copyGoal(zero),copyGoal(zero),copyGoal(zero),copyGoal(zero),array(MAX_CLIENTS,""),array(MAX_CLIENTS,""),infos,areas,array(MAX_CLIENTS,0),array(MAX_CLIENTS,0),array(MAX_CLIENTS,false),-1,0,[],[],void)
end function

/// Set `state.timeIndex` to `state.timeIndex+1` in `mq3.game.bot_voice_commands.floatTime`. Return paths include `state.now`.
/// @param state Bot voice commands state; accesses `timeIndex`, `timeValues` and `now`. May update `state.timeIndex` in place.
function floatTime(state)
  if state.timeIndex<len(state.timeValues) then value=state.timeValues[state.timeIndex];state.timeIndex=state.timeIndex+1;return value end if
  return state.now
end function
/// Set `state.actions` to `state.actions+[action]` in `mq3.game.bot_voice_commands.emit`. Return paths include `action`.
/// @param state Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param kind Initial value stored in `mq3.game.bot_voice_commands.HostAction.kind`.
/// @param client Initial value stored in `mq3.game.bot_voice_commands.HostAction.client`.
/// @param channel Channel identifier for the requested action.
/// @param text Text to parse, format or deliver.
/// @param value Initial value stored in `mq3.game.bot_voice_commands.HostAction.value`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function emit(state,kind,client,channel,text,value,retailActive)
  action=HostAction(kind,client,channel,text,value,not retailActive);state.actions=state.actions+[action]
  if not retailActive and state.hostActionFn!=void then state.hostActionFn(state,action) end if
  return action
end function
/// Record or dispatch `"team-status"` actions in `setStatus`.
/// @param state Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client` and `ltgtype`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function setStatus(state,bot,retailActive) emit(state,"team-status",bot.client,0,"",bot.ltgtype,retailActive);return void end function
/// Record or dispatch `"remember-task"` actions in `remember`.
/// @param state Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client` and `ltgtype`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function remember(state,bot,retailActive) emit(state,"remember-task",bot.client,0,"",bot.ltgtype,retailActive);return void end function
/// Record or dispatch `"initial-chat"` actions in `initialChat`.
/// @param state Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param chat Text to parse, format or deliver.
/// @param arg Initial value stored in `mq3.game.bot_voice_commands.HostAction.value`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function initialChat(state,bot,chat,arg,retailActive) emit(state,"initial-chat",bot.client,0,chat,arg,retailActive);return void end function
/// Record or dispatch `"enter-chat"` actions in `enterChat`.
/// @param state Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `cs`.
/// @param client Initial value stored in `mq3.game.bot_voice_commands.HostAction.client`.
/// @param channel Channel identifier for the requested action.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function enterChat(state,bot,client,channel,retailActive) emit(state,"enter-chat",client,channel,"",bot.cs,retailActive);return void end function
/// Record or dispatch `"voice-only"` actions in `voiceOnly`.
/// @param state Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param client Initial value stored in `mq3.game.bot_voice_commands.HostAction.client`.
/// @param text Text to parse, format or deliver.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function voiceOnly(state,bot,client,text,retailActive) emit(state,"voice-only",client,0,text,bot.client,retailActive);return void end function
/// Update `bot.decisionmaker`, `bot.ordered`, `bot.orderTime` and `bot.teammessageTime` and related state during `orderedTiming`.
/// @param state Bot voice commands state; accesses `randomValue`.
/// @param bot Bot AI state; accesses `decisionmaker`, `ordered`, `orderTime`, `teammessageTime` and `ltgtype` and related fields. May update `bot.decisionmaker`, `bot.ordered` and `bot.orderTime` and additional fields in place.
/// @param client Value used by `orderedTiming` in `bot.decisionmaker=client`.
/// @param ltg Value used by `orderedTiming` in `bot.ltgtype=ltg`.
/// @param duration Value used by `orderedTiming` in `bot.teamgoalTime=floatTime(state)+duration`.
function orderedTiming(state,bot,client,ltg,duration)
  bot.decisionmaker=client;bot.ordered=true;bot.orderTime=floatTime(state)
  bot.teammessageTime=floatTime(state)+2.0*state.randomValue;bot.ltgtype=ltg;bot.teamgoalTime=floatTime(state)+duration
  return void
end function

// BotVoiceChat_GetFlag
/// @param state Bot voice commands state; accesses `gametype`, `redFlag`, `blueFlag`, `missionpack` and `neutralFlag`.
/// @param bot Bot AI state; accesses `team` and `client`.
/// @param client Value used by `orderedTiming` in `bot.decisionmaker=client`.
/// @param mode Not read by this implementation; retained in the `getFlag` signature.
/// @param retailActive Whether the retail integration owns side-effect delivery.
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
/// @param state Bot voice commands state; accesses `gametype` and `missionpack`.
/// @param bot Bot AI state; accesses `harvestawayTime` and `attackawayTime`. May update `bot.harvestawayTime` and `bot.attackawayTime` in place.
/// @param client Value used by `orderedTiming` in `bot.decisionmaker=client`.
/// @param mode Value passed as argument 4 to `mq3.game.bot_voice_commands.getFlag`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function offense(state,bot,client,mode,retailActive)
  if state.gametype==GT_CTF or (state.missionpack and state.gametype==GT_1FCTF) then return getFlag(state,bot,client,mode,retailActive) end if
  if state.missionpack and state.gametype==GT_HARVESTER then orderedTiming(state,bot,client,LTG_HARVEST,TEAM_HARVEST_TIME);bot.harvestawayTime=0.0
  else orderedTiming(state,bot,client,LTG_ATTACKENEMYBASE,TEAM_ATTACKENEMYBASE_TIME);bot.attackawayTime=0.0 end if
  setStatus(state,bot,retailActive);remember(state,bot,retailActive);return void
end function

// BotVoiceChat_Defend and BotVoiceChat_DefendFlag
/// @param state Bot voice commands state; accesses `missionpack`, `gametype`, `redObelisk`, `blueObelisk` and `redFlag` and related fields.
/// @param bot Bot AI state; accesses `team`, `teamgoal` and `defendawayTime`. May update `bot.teamgoal` and `bot.defendawayTime` in place.
/// @param client Value used by `orderedTiming` in `bot.decisionmaker=client`.
/// @param mode Not read by this implementation; retained in the `defend` signature.
/// @param retailActive Whether the retail integration owns side-effect delivery.
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
/// Forward `defendFlag` to `mq3.game.bot_voice_commands.defend` and return the delegated result.
/// @param state Bot voice commands state; accesses `missionpack`, `gametype`, `redObelisk`, `blueObelisk` and `redFlag` and related fields.
/// @param bot Bot AI state; accesses `team`, `teamgoal` and `defendawayTime`. May update `bot.teamgoal` and `bot.defendawayTime` in place.
/// @param client Value used by `orderedTiming` in `bot.decisionmaker=client`.
/// @param mode Value passed as argument 4 to `mq3.game.bot_voice_commands.defend`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function defendFlag(state,bot,client,mode,retailActive) return defend(state,bot,client,mode,retailActive) end function

// BotVoiceChat_Patrol
/// @param state Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `decisionmaker`, `ltgtype`, `leadTime` and `lastgoalLtgtype`. May update `bot.decisionmaker`, `bot.ltgtype` and `bot.leadTime` and additional fields in place.
/// @param client Initial value stored in `mq3.game.bot_voice_commands.HostAction.client`.
/// @param mode Not read by this implementation; retained in the `patrol` signature.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function patrol(state,bot,client,mode,retailActive)
  bot.decisionmaker=client;bot.ltgtype=0;bot.leadTime=0.0;bot.lastgoalLtgtype=0
  initialChat(state,bot,"dismissed","",retailActive);enterChat(state,bot,client,CHAT_TELL,retailActive);voiceOnly(state,bot,-1,"onpatrol",retailActive);setStatus(state,bot,retailActive);return void
end function

/// Update `bot.teamgoal.entitynum` and `bot.teamgoal` during `resolveClientGoal`. Return paths include `bot.teamgoal.entitynum>=0`.
/// @param state Bot voice commands state; accesses `entityInfos` and `pointAreas`.
/// @param bot Bot AI state; accesses `teamgoal`. May update `bot.teamgoal.entitynum` and `bot.teamgoal` in place.
/// @param client Initial value stored in `mq3.game.bot_voice_commands.Goal.entitynum`.
function resolveClientGoal(state,bot,client)
  bot.teamgoal.entitynum=-1
  if client>=0 and client<len(state.entityInfos) then ent=state.entityInfos[client]
    if ent.valid then area=state.pointAreas[client];if area!=0 then bot.teamgoal=goal(client,area,ent.origin+[ ],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0) end if end if
  end if
  return bot.teamgoal.entitynum>=0
end function
/// Prefer the simplified voice-command player name and fall back to the normal name for the client slot.
/// @param state Bot voice commands state; accesses `easyNames` and `names`.
/// @param client Operand used to evaluate the returned expression `state.easyNames[client]`.
function easyName(state,client) if client>=0 and client<len(state.easyNames) and state.easyNames[client]!="" then return state.easyNames[client] end if;if client>=0 and client<len(state.names) then return state.names[client] end if;return "" end function

// BotVoiceChat_Camp
/// @param state Bot voice commands state; accesses `entityInfos` and `pointAreas`.
/// @param bot Bot AI state; accesses `teammate` and `arriveTime`. May update `bot.teammate` and `bot.arriveTime` in place.
/// @param client Initial value stored in `mq3.game.bot_voice_commands.Goal.entitynum`.
/// @param mode Not read by this implementation; retained in the `camp` signature.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function camp(state,bot,client,mode,retailActive)
  if not resolveClientGoal(state,bot,client) then initialChat(state,bot,"whereareyou",easyName(state,client),retailActive);enterChat(state,bot,client,CHAT_TELL,retailActive);return void end if
  orderedTiming(state,bot,client,LTG_CAMPORDER,TEAM_CAMP_TIME);bot.teammate=client;bot.arriveTime=0.0
  setStatus(state,bot,retailActive);remember(state,bot,retailActive);return void
end function

// BotVoiceChat_FollowMe and BotVoiceChat_FollowFlagCarrier
/// @param state Bot voice commands state; accesses `randomValue`.
/// @param bot Bot AI state; accesses `decisionmaker`, `ordered`, `orderTime`, `teammate` and `teammatevisibleTime` and related fields. May update `bot.decisionmaker`, `bot.ordered` and `bot.orderTime` and additional fields in place.
/// @param client Initial value stored in `mq3.game.bot_voice_commands.Goal.entitynum`.
/// @param mode Not read by this implementation; retained in the `followMe` signature.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function followMe(state,bot,client,mode,retailActive)
  if not resolveClientGoal(state,bot,client) then initialChat(state,bot,"whereareyou",easyName(state,client),retailActive);enterChat(state,bot,client,CHAT_TELL,retailActive);return void end if
  bot.decisionmaker=client;bot.ordered=true;bot.orderTime=floatTime(state);bot.teammate=client;bot.teammatevisibleTime=floatTime(state)
  bot.teammessageTime=floatTime(state)+2.0*state.randomValue;bot.teamgoalTime=floatTime(state)+TEAM_ACCOMPANY_TIME;bot.ltgtype=LTG_TEAMACCOMPANY;bot.formationDist=112.0;bot.arriveTime=0.0
  setStatus(state,bot,retailActive);remember(state,bot,retailActive);return void
end function
/// Apply `mq3.game.bot_voice_commands.followMe` while evaluating `followFlagCarrier`.
/// @param state Bot voice commands state; accesses `flagCarrier`.
/// @param bot Bot AI state; accesses `decisionmaker`, `ordered`, `orderTime`, `teammate` and `teammatevisibleTime` and related fields. May update `bot.decisionmaker`, `bot.ordered` and `bot.orderTime` and additional fields in place.
/// @param client Not read by this implementation; retained in the `followFlagCarrier` signature.
/// @param mode Value passed as argument 4 to `mq3.game.bot_voice_commands.followMe`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function followFlagCarrier(state,bot,client,mode,retailActive) if state.flagCarrier>=0 then return followMe(state,bot,state.flagCarrier,mode,retailActive) end if;return void end function

// BotVoiceChat_ReturnFlag
/// @param state Bot voice commands state; accesses `gametype` and `missionpack`.
/// @param bot Bot AI state; accesses `rushbaseawayTime`. May update `bot.rushbaseawayTime` in place.
/// @param client Value used by `orderedTiming` in `bot.decisionmaker=client`.
/// @param mode Not read by this implementation; retained in the `returnFlag` signature.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function returnFlag(state,bot,client,mode,retailActive)
  if state.gametype!=GT_CTF and (not state.missionpack or state.gametype!=GT_1FCTF) then return void end if
  orderedTiming(state,bot,client,LTG_RETURNFLAG,CTF_RETURNFLAG_TIME);bot.rushbaseawayTime=0.0;setStatus(state,bot,retailActive);return void
end function

// BotVoiceChat_StartLeader, BotVoiceChat_StopLeader, BotVoiceChat_WhoIsLeader
/// @param state Bot voice commands state; accesses `names`.
/// @param bot Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place.
/// @param client Value used by `startLeader` in `if client>=0 and client<len(state.names) then bot.teamleader=info.copy(state.names[client],36) end if`.
/// @param mode Not read by this implementation; retained in the `startLeader` signature.
/// @param retailActive Not read by this implementation; retained in the `startLeader` signature.
function startLeader(state,bot,client,mode,retailActive) if client>=0 and client<len(state.names) then bot.teamleader=info.copy(state.names[client],36) end if;return void end function
/// Set `bot.teamleader` to `""` and `state.notLeader[client]` to `true` in `mq3.game.bot_voice_commands.stopLeader`.
/// @param state Bot voice commands state; accesses `names` and `notLeader`. May update `state.notLeader[client]` in place.
/// @param bot Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place.
/// @param client Value used by `stopLeader` in `if client>=0 and client<len(state.names) and strings.toLowerAscii(bot.teamleader)==strings.toLowerAscii(state.na...`.
/// @param mode Not read by this implementation; retained in the `stopLeader` signature.
/// @param retailActive Not read by this implementation; retained in the `stopLeader` signature.
function stopLeader(state,bot,client,mode,retailActive)
  if client>=0 and client<len(state.names) and strings.toLowerAscii(bot.teamleader)==strings.toLowerAscii(state.names[client]) then bot.teamleader="";state.notLeader[client]=true end if;return void
end function
/// Apply `mq3.game.bot_voice_commands.initialChat`, `mq3.game.bot_voice_commands.enterChat` and `mq3.game.bot_voice_commands.voiceOnly` while evaluating `whoIsLeader`.
/// @param state Bot voice commands state; accesses `teamplay` and `names`.
/// @param bot Bot AI state; accesses `client` and `teamleader`.
/// @param client Value used by `whoIsLeader` in `if bot.client>=0 and bot.client<len(state.names) and strings.toLowerAscii(state.names[bot.client])==strings.toLo...`.
/// @param mode Not read by this implementation; retained in the `whoIsLeader` signature.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function whoIsLeader(state,bot,client,mode,retailActive)
  if not state.teamplay then return void end if
  if bot.client>=0 and bot.client<len(state.names) and strings.toLowerAscii(state.names[bot.client])==strings.toLowerAscii(bot.teamleader) then initialChat(state,bot,"iamteamleader","",retailActive);enterChat(state,bot,0,CHAT_TEAM,retailActive);voiceOnly(state,bot,-1,"startleader",retailActive) end if
  return void
end function

// BotVoiceChat_WantOnDefense and BotVoiceChat_WantOnOffense
/// @param state Bot voice commands state; accesses `taskPreferences`. May update `state.taskPreferences[client]` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param client Operand used to evaluate the returned expression `state.easyNames[client]`.
/// @param mode Not read by this implementation; retained in the `wantOnDefense` signature.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function wantOnDefense(state,bot,client,mode,retailActive)
  preference=state.taskPreferences[client];preference=(preference & ~TEAMTP_ATTACKER) | TEAMTP_DEFENDER;state.taskPreferences[client]=preference
  initialChat(state,bot,"keepinmind",easyName(state,client),retailActive);enterChat(state,bot,client,CHAT_TELL,retailActive);voiceOnly(state,bot,client,"yes",retailActive);emit(state,"ea-action",bot.client,0,"",ACTION_AFFIRMATIVE,retailActive);return void
end function
/// Record or dispatch `"ea-action"` actions in `wantOnOffense`.
/// @param state Bot voice commands state; accesses `taskPreferences`. May update `state.taskPreferences[client]` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param client Operand used to evaluate the returned expression `state.easyNames[client]`.
/// @param mode Not read by this implementation; retained in the `wantOnOffense` signature.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function wantOnOffense(state,bot,client,mode,retailActive)
  preference=state.taskPreferences[client];preference=(preference & ~TEAMTP_DEFENDER) | TEAMTP_ATTACKER;state.taskPreferences[client]=preference
  initialChat(state,bot,"keepinmind",easyName(state,client),retailActive);enterChat(state,bot,client,CHAT_TELL,retailActive);voiceOnly(state,bot,client,"yes",retailActive);emit(state,"ea-action",bot.client,0,"",ACTION_AFFIRMATIVE,retailActive);return void
end function
// BotVoiceChat_Dummy
/// @param state Not read by this implementation; retained in the `dummy` signature.
/// @param bot Not read by this implementation; retained in the `dummy` signature.
/// @param client Not read by this implementation; retained in the `dummy` signature.
/// @param mode Not read by this implementation; retained in the `dummy` signature.
/// @param retailActive Not read by this implementation; retained in the `dummy` signature.
function dummy(state,bot,client,mode,retailActive) return void end function

/// Apply `mq3.shared.info.copy` while evaluating `tokensLikeOriginal`. Return paths include `parts`.
/// @param text Text to parse, format or deliver.
function tokensLikeOriginal(text)
  data=bytes(info.copy(text,MAX_MESSAGE_SIZE));parts=[];at=0
  for field=0 to 2
    start=at;while at<len(data) and data[at]>32 at=at+1 end while;parts=parts+[decode(slice(data,start,at-start))]
    while at<len(data) and data[at]<=32 at=at+1 end while
  end for
  parts=parts+[decode(slice(data,at,len(data)-at))];return parts
end function
/// Test `client>=0 and client<MAX_CLIENTS and bot.team==state.clientTeams[client]` as the condition for `sameTeam`.
/// @param bot Bot AI state; accesses `team`.
/// @param client Operand used to evaluate the returned expression `client>=0 and client<MAX_CLIENTS and bot.team==state.clientTeams[client]`.
/// @param state Bot voice commands state; accesses `clientTeams`.
function sameTeam(bot,client,state) return client>=0 and client<MAX_CLIENTS and bot.team==state.clientTeams[client] end function

// BotVoiceChatCommand.
/// @param state Bot voice commands state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `team`.
/// @param mode Value passed as argument 4 to `mq3.game.bot_voice_commands.getFlag`.
/// @param voiceChat Text to parse, format or deliver.
/// @param retailActive Whether the retail integration owns side-effect delivery.
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

/// Set `state.clientTeams[client]` to `team` in `mq3.game.bot_voice_commands.setClientTeam`.
/// @param state Bot voice commands state; accesses `clientTeams`. May update `state.clientTeams[client]` in place.
/// @param client Value used by `setClientTeam` in `state.clientTeams[client]=team`.
/// @param team Team identifier used by the game rules.
function setClientTeam(state,client,team) state.clientTeams[client]=team;return void end function
