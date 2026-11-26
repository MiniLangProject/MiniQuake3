// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete code/game/ai_cmd.c command matching and team-order state machine.
package mq3.game.bot_command_matches
import mq3.game.game_headers as headers

import mq3.botlib.ai_chat_matches as chat
import std.string as strings
import mq3.compat.numeric as n

/// Maximum number of client slots represented by the original game protocol.
const MAX_CLIENTS=64
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
/// Chat-state value or flag selecting team.
const CHAT_TEAM=1
/// Chat-state value or flag selecting tell.
const CHAT_TELL=2
/// Bot message-matching context bit enabling misc patterns.
const MTCONTEXT_MISC=headers.MTCONTEXT_MISC
/// Bot message-matching context bit enabling initialteamchat patterns.
const MTCONTEXT_INITIALTEAMCHAT=headers.MTCONTEXT_INITIALTEAMCHAT
/// Bot message-matching context bit enabling time patterns.
const MTCONTEXT_TIME=headers.MTCONTEXT_TIME
/// Bot message-matching context bit enabling teammate patterns.
const MTCONTEXT_TEAMMATE=headers.MTCONTEXT_TEAMMATE
/// Bot message-matching context bit enabling addressee patterns.
const MTCONTEXT_ADDRESSEE=headers.MTCONTEXT_ADDRESSEE
/// Bot message-matching context bit enabling patrolkeyarea patterns.
const MTCONTEXT_PATROLKEYAREA=headers.MTCONTEXT_PATROLKEYAREA
/// Bot message-matching context bit enabling replychat patterns.
const MTCONTEXT_REPLYCHAT=headers.MTCONTEXT_REPLYCHAT
/// Bot message-matching context bit enabling capture the flag patterns.
const MTCONTEXT_CTF=headers.MTCONTEXT_CTF
/// Bot chat-message type used to recognize or dispatch newleader messages.
const MSG_NEWLEADER=headers.MSG_NEWLEADER
/// Bot chat-message type used to recognize or dispatch entergame messages.
const MSG_ENTERGAME=headers.MSG_ENTERGAME
/// Bot chat-message type used to recognize or dispatch help messages.
const MSG_HELP=headers.MSG_HELP
/// Bot chat-message type used to recognize or dispatch accompany messages.
const MSG_ACCOMPANY=headers.MSG_ACCOMPANY
/// Bot chat-message type used to recognize or dispatch defend a key area messages.
const MSG_DEFENDKEYAREA=headers.MSG_DEFENDKEYAREA
/// Bot chat-message type used to recognize or dispatch rush the base messages.
const MSG_RUSHBASE=headers.MSG_RUSHBASE
/// Bot chat-message type used to recognize or dispatch capture the flag messages.
const MSG_GETFLAG=headers.MSG_GETFLAG
/// Bot chat-message type used to recognize or dispatch startteamleadership messages.
const MSG_STARTTEAMLEADERSHIP=headers.MSG_STARTTEAMLEADERSHIP
/// Bot chat-message type used to recognize or dispatch stopteamleadership messages.
const MSG_STOPTEAMLEADERSHIP=headers.MSG_STOPTEAMLEADERSHIP
/// Bot chat-message type used to recognize or dispatch whoisteamlaeder messages.
const MSG_WHOISTEAMLAEDER=headers.MSG_WHOISTEAMLAEDER
/// Bot chat-message type used to recognize or dispatch wait messages.
const MSG_WAIT=headers.MSG_WAIT
/// Bot chat-message type used to recognize or dispatch whatareyoudoing messages.
const MSG_WHATAREYOUDOING=headers.MSG_WHATAREYOUDOING
/// Bot chat-message type used to recognize or dispatch joinsubteam messages.
const MSG_JOINSUBTEAM=headers.MSG_JOINSUBTEAM
/// Bot chat-message type used to recognize or dispatch leavesubteam messages.
const MSG_LEAVESUBTEAM=headers.MSG_LEAVESUBTEAM
/// Bot chat-message type used to recognize or dispatch createnewformation messages.
const MSG_CREATENEWFORMATION=headers.MSG_CREATENEWFORMATION
/// Bot chat-message type used to recognize or dispatch formationposition messages.
const MSG_FORMATIONPOSITION=headers.MSG_FORMATIONPOSITION
/// Bot chat-message type used to recognize or dispatch formationspace messages.
const MSG_FORMATIONSPACE=headers.MSG_FORMATIONSPACE
/// Bot chat-message type used to recognize or dispatch doformation messages.
const MSG_DOFORMATION=headers.MSG_DOFORMATION
/// Bot chat-message type used to recognize or dispatch dismiss messages.
const MSG_DISMISS=headers.MSG_DISMISS
/// Bot chat-message type used to recognize or dispatch camp messages.
const MSG_CAMP=headers.MSG_CAMP
/// Bot chat-message type used to recognize or dispatch checkpoint messages.
const MSG_CHECKPOINT=headers.MSG_CHECKPOINT
/// Bot chat-message type used to recognize or dispatch patrol messages.
const MSG_PATROL=headers.MSG_PATROL
/// Bot chat-message type used to recognize or dispatch leadtheway messages.
const MSG_LEADTHEWAY=headers.MSG_LEADTHEWAY
/// Bot chat-message type used to recognize or dispatch getitem messages.
const MSG_GETITEM=headers.MSG_GETITEM
/// Bot chat-message type used to recognize or dispatch kill messages.
const MSG_KILL=headers.MSG_KILL
/// Bot chat-message type used to recognize or dispatch whereareyou messages.
const MSG_WHEREAREYOU=headers.MSG_WHEREAREYOU
/// Bot chat-message type used to recognize or dispatch return the flag messages.
const MSG_RETURNFLAG=headers.MSG_RETURNFLAG
/// Bot chat-message type used to recognize or dispatch whatismycommand messages.
const MSG_WHATISMYCOMMAND=headers.MSG_WHATISMYCOMMAND
/// Bot chat-message type used to recognize or dispatch whichteam messages.
const MSG_WHICHTEAM=headers.MSG_WHICHTEAM
/// Bot chat-message type used to recognize or dispatch taskpreference messages.
const MSG_TASKPREFERENCE=headers.MSG_TASKPREFERENCE
/// Bot chat-message type used to recognize or dispatch attackenemybase messages.
const MSG_ATTACKENEMYBASE=headers.MSG_ATTACKENEMYBASE
/// Bot chat-message type used to recognize or dispatch harvest messages.
const MSG_HARVEST=headers.MSG_HARVEST
/// Bot chat-message type used to recognize or dispatch suicide messages.
const MSG_SUICIDE=headers.MSG_SUICIDE
/// Bot chat-message type used to recognize or dispatch me messages.
const MSG_ME=headers.MSG_ME
/// Bot chat-message type used to recognize or dispatch everyone messages.
const MSG_EVERYONE=headers.MSG_EVERYONE
/// Bot chat-message type used to recognize or dispatch multiplenames messages.
const MSG_MULTIPLENAMES=headers.MSG_MULTIPLENAMES
/// Bot chat-message type used to recognize or dispatch minutes messages.
const MSG_MINUTES=headers.MSG_MINUTES
/// Bot chat-message type used to recognize or dispatch seconds messages.
const MSG_SECONDS=headers.MSG_SECONDS
/// Bot chat-message type used to recognize or dispatch forever messages.
const MSG_FOREVER=headers.MSG_FOREVER
/// Bot chat-message type used to recognize or dispatch foralongtime messages.
const MSG_FORALONGTIME=headers.MSG_FORALONGTIME
/// Bot chat-message type used to recognize or dispatch forawhile messages.
const MSG_FORAWHILE=headers.MSG_FORAWHILE
/// Bot chat-message type used to recognize or dispatch chattell messages.
const MSG_CHATTELL=headers.MSG_CHATTELL
/// Bot chat-message type used to recognize or dispatch capture the flag messages.
const MSG_CTF=headers.MSG_CTF
/// Bot chat-match subtype flag used to refine nearitem instructions.
const ST_NEARITEM=headers.ST_NEARITEM
/// Bot chat-match subtype flag used to refine addressed instructions.
const ST_ADDRESSED=headers.ST_ADDRESSED
/// Bot chat-match subtype flag used to refine feet instructions.
const ST_FEET=headers.ST_FEET
/// Bot chat-match subtype flag used to refine time instructions.
const ST_TIME=headers.ST_TIME
/// Bot chat-match subtype flag used to refine here instructions.
const ST_HERE=headers.ST_HERE
/// Bot chat-match subtype flag used to refine there instructions.
const ST_THERE=headers.ST_THERE
/// Bot chat-match subtype flag used to refine i instructions.
const ST_I=headers.ST_I
/// Bot chat-match subtype flag used to refine more instructions.
const ST_MORE=headers.ST_MORE
/// Bot chat-match subtype flag used to refine back instructions.
const ST_BACK=headers.ST_BACK
/// Bot chat-match subtype flag used to refine reverse instructions.
const ST_REVERSE=headers.ST_REVERSE
/// Bot chat-match subtype flag used to refine someone instructions.
const ST_SOMEONE=headers.ST_SOMEONE
/// Bot chat-match subtype flag used to refine gotflag instructions.
const ST_GOTFLAG=headers.ST_GOTFLAG
/// Bot chat-match subtype flag used to refine capturedflag instructions.
const ST_CAPTUREDFLAG=headers.ST_CAPTUREDFLAG
/// Bot chat-match subtype flag used to refine returnedflag instructions.
const ST_RETURNEDFLAG=headers.ST_RETURNEDFLAG
/// Bot chat-match subtype flag used to refine 1 fctfgotflag instructions.
const ST_1FCTFGOTFLAG=headers.ST_1FCTFGOTFLAG
/// Bot chat-match subtype flag used to refine defender instructions.
const ST_DEFENDER=headers.ST_DEFENDER
/// Bot chat-match subtype flag used to refine attacker instructions.
const ST_ATTACKER=headers.ST_ATTACKER
/// Bot chat-match subtype flag used to refine roamer instructions.
const ST_ROAMER=headers.ST_ROAMER
/// Chat-match variable slot containing a player network name.
const NETNAME=headers.NETNAME
/// Chat-match variable slot containing a flag reference.
const FLAG=headers.FLAG
/// Chat-match variable slot containing the intended recipient.
const ADDRESSEE=headers.ADDRESSEE
/// Chat-match variable slot containing an item reference.
const ITEM=headers.ITEM
/// Chat-match variable slot containing the selected teammate.
const TEAMMATE=headers.TEAMMATE
/// Chat-match variable slot containing a team name.
const TEAMNAME=headers.TEAMNAME
/// Chat-match variable slot containing the selected enemy.
const ENEMY=headers.ENEMY
/// Chat-match variable slot containing an area to defend or visit.
const KEYAREA=headers.KEYAREA
/// Chat-match variable slot containing a position reference.
const POSITION=headers.POSITION
/// Chat-match variable slot containing a numeric argument.
const NUMBER=headers.NUMBER
/// Chat-match variable slot containing a duration or time.
const TIME=headers.TIME
/// Chat-match variable slot containing a named subject.
const NAME=headers.NAME
/// Chat-match variable slot retaining the remaining argument text.
const MORE=headers.MORE
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
/// Bot team-task preference bit indicating a preference for defender.
const TEAMTP_DEFENDER=1
/// Bot team-task preference bit indicating a preference for attacker.
const TEAMTP_ATTACKER=2
/// Patrol behavior flag enabling loop.
const PATROL_LOOP=1
/// Patrol behavior flag enabling reverse.
const PATROL_REVERSE=2

/// `Goal` record for bot command matches, containing `number`, `entitynum`, `areanum`, `origin` and `mins` and related fields.
struct Goal
  /// Botlib goal number identifying this navigation target.
  number
  /// Entity number associated with the goal selected by a matched bot text command.
  entitynum
  /// AAS area containing the bot or spatial goal.
  areanum
  /// World-space target position of the goal selected by a matched bot text command.
  origin
  /// Lower local bounding-box corner of the goal selected by a matched bot text command.
  mins
  /// Upper local bounding-box corner of the goal selected by a matched bot text command.
  maxs
  /// GFL_* flags describing this bot navigation goal.
  flags
  /// Name used to refer to this navigation goal or waypoint in bot orders.
  name
end struct
/// `Waypoint` record for bot command matches, containing `name` and `goal`.
struct Waypoint
  /// Name used to refer to this navigation goal or waypoint in bot orders.
  name
  /// Navigation or activation goal associated with the current task.
  goal
end struct
/// `EntityInfo` record for bot command matches, containing `valid` and `origin`.
struct EntityInfo
  /// True when entity information was found for resolving a matched text command.
  valid
  /// Position returned for an entity referenced by a matched text command.
  origin
end struct
/// `HostAction` record for bot command matches, containing `kind`, `client`, `channel`, `text` and `arg` and related fields.
struct HostAction
  /// Discriminator selecting the recorded bot action or decision event.
  kind
  /// Client slot associated with the host action produced by a matched text order.
  client
  /// Delivery channel selected for the host chat/message action.
  channel
  /// Text payload supplied to the recorded command, chat, or host action.
  text
  /// Additional argument attached to a host action.
  arg
  /// Numeric/result payload supplied to the recorded host action.
  value
  /// Nonzero when an action was deliberately withheld from dispatch.
  suppressed
end struct
/// `Bot` record for bot command matches, containing `client`, `entitynum`, `cs`, `team` and `origin` and related fields.
struct Bot
  /// Client slot of the bot receiving and interpreting text commands.
  client
  /// Entity number of the bot interpreting a matched text order.
  entitynum
  /// Botlib chat-state handle owned by this bot.
  cs
  /// Team assignment associated with the client, bot, or action.
  team
  /// Current bot position used to resolve locations and goals in text commands.
  origin
  /// Eye position used as the origin of visibility and aiming queries.
  eye
  /// AAS area containing the bot or spatial goal.
  areanum
  /// Name of the bot current cooperative subteam.
  subteam
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
  /// Deadline associated with the current cooperative team goal.
  teamgoalTime
  /// Current long-term goal category selected from the LTG_* constants.
  ltgtype
  /// Long-term goal type retained from the preceding team task.
  lastgoalLtgtype
  /// Deadline associated with leading a teammate toward a goal.
  leadTime
  /// Client/entity identifier of the teammate being led.
  leadTeammate
  /// Navigation goal toward which the bot is leading a teammate.
  leadTeamgoal
  /// Last time the teammate being led was visible.
  leadvisibleTime
  /// Time controlling the next message to the teammate being led.
  leadmessageTime
  /// Teammate entity/client selected for the current cooperative task.
  teammate
  /// Last time the teammate associated with the task was visible.
  teammatevisibleTime
  /// Desired separation from the teammate or formation leader.
  formationDist
  /// Timestamp at which the bot arrived at the current team goal.
  arriveTime
  /// Time controlling how long the bot may leave its defense goal.
  defendawayTime
  /// Time controlling temporary excursions from an attack-base goal.
  attackawayTime
  /// Time controlling temporary excursions from a harvesting goal.
  harvestawayTime
  /// Time controlling temporary excursions from a rush-base goal.
  rushbaseawayTime
  /// Navigation goal associated with the bot current team task.
  teamgoal
  /// Patrol goals traversed by the bot patrol behavior.
  patrolpoints
  /// Patrol goal currently being approached.
  curpatrolpoint
  /// PATROL_* behavior flags associated with the current patrol route.
  patrolflags
  /// Linked or indexed checkpoint goals available to the bot.
  checkpoints
  /// Nonzero when the team leader must issue new orders.
  forceorders
  /// Bot-tracked status of the red flag.
  redflagstatus
  /// Bot-tracked status of the blue flag.
  blueflagstatus
  /// Client/entity currently carrying the flag of interest.
  flagcarrier
  /// Nonzero after a tracked flag status changes and needs processing.
  flagstatuschanged
  /// Timestamp of the last flag capture observed by the bot.
  lastflagcaptureTime
end struct
/// `State` record for bot command matches, containing `teamplay`, `missionpack`, `gametype`, `now` and `randomValue` and related fields.
struct State
  /// Nonzero when the active game mode uses teams.
  teamplay
  /// Nonzero when mission-pack rules and content are enabled.
  missionpack
  /// GT_* game-mode identifier used for matching text orders to supported team objectives.
  gametype
  /// Current clock value supplied to the bot decision step.
  now
  /// Deterministic random input supplied to the current bot decision.
  randomValue
  /// Configured number of client slots active in this game state.
  maxclients
  /// Name strings indexed by the corresponding state-table entries.
  names
  /// Team identifiers indexed by tracked clients.
  teams
  /// Configuration records associated with tracked clients or bot state.
  configs
  /// Botlib entity-information records used for tactical queries.
  entityInfos
  /// AAS area results associated with sampled world points.
  pointAreas
  /// Pickup goals available to bot decision logic.
  itemGoals
  /// Team-task preference values indexed by client or category.
  taskPreferences
  /// Names of the supported bot team-task preferences.
  preferenceNames
  /// Markers identifying clients excluded from team-leader selection.
  notleader
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
  /// Goal/entity reference for the neutral harvester obelisk.
  neutralObelisk
  /// Shared match-processing state used by bot command/chat matching.
  matchState
  /// Recorded host actions emitted by bot decision logic.
  actions
  /// Injected callback for host action; invoked through the State service/state record.
  hostActionFn
  /// Injected callback for trace visible; invoked through the State service/state record.
  traceVisibleFn
  /// Injected callback for travel time; invoked through the State service/state record.
  travelTimeFn
end struct

/// Create a `mq3.game.bot_command_matches.Goal` record, initializing `number` from `number`, `entitynum` from `entitynum` and `areanum` from `areanum`.
/// @param number Initial value stored in `mq3.game.bot_command_matches.Goal.number`.
/// @param entitynum Initial value stored in `mq3.game.bot_command_matches.Goal.entitynum`.
/// @param areanum AAS area number; zero denotes no area.
/// @param origin World-space position as three coordinates.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param flags Initial value stored in `mq3.game.bot_command_matches.Goal.flags`.
/// @param name Name used to identify the requested entry.
function goal(number,entitynum,areanum,origin,mins,maxs,flags,name) return Goal(number,entitynum,areanum,origin,mins,maxs,flags,name) end function
/// Forward `emptyGoal` to `mq3.game.bot_command_matches.goal` and return the delegated result.
function emptyGoal() return goal(0,-1,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,"") end function
/// Forward `copyGoal` to `mq3.game.bot_command_matches.goal` and return the delegated result.
/// @param value Value record; accesses `number`, `entitynum`, `areanum`, `origin` and `mins` and related fields.
function copyGoal(value) return goal(value.number,value.entitynum,value.areanum,value.origin+[ ],value.mins+[ ],value.maxs+[ ],value.flags,value.name) end function
/// Build the `mq3.game.bot_command_matches.Bot` result for `createBot`.
/// @param client Initial value stored in `mq3.game.bot_command_matches.Bot.client`.
function createBot(client)
  g=emptyGoal();return Bot(client,client,client,TEAM_RED,[0.0,0.0,0.0],[0.0,0.0,0.0],0,"","",-1,false,0.0,0.0,0.0,0,0,0.0,-1,copyGoal(g),0.0,0.0,-1,0.0,100.0,0.0,0.0,0.0,0.0,0.0,copyGoal(g),[],void,0,[],false,0,0,-1,0,0.0)
end function
/// Build the `mq3.game.bot_command_matches.State` result for `create`.
/// @param matchState Initial value stored in `mq3.game.bot_command_matches.State.matchState`.
function create(matchState)
  infos=[];areas=[];for i=0 to MAX_CLIENTS-1 infos=infos+[EntityInfo(false,[0.0,0.0,0.0])];areas=areas+[0] end for
  g=emptyGoal();return State(true,true,0,100.0,0.25,8,array(MAX_CLIENTS,""),array(MAX_CLIENTS,0),array(MAX_CLIENTS,""),infos,areas,[],array(MAX_CLIENTS,0),array(MAX_CLIENTS,""),array(MAX_CLIENTS,false),copyGoal(g),copyGoal(g),copyGoal(g),copyGoal(g),copyGoal(g),copyGoal(g),matchState,[],void,void,void)
end function
/// Set `state.actions` to `state.actions+[action]` in `mq3.game.bot_command_matches.emit`. Return paths include `action`.
/// @param state Bot command matches state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param kind Initial value stored in `mq3.game.bot_command_matches.HostAction.kind`.
/// @param client Initial value stored in `mq3.game.bot_command_matches.HostAction.client`.
/// @param channel Channel identifier for the requested action.
/// @param text Text to parse, format or deliver.
/// @param arg Initial value stored in `mq3.game.bot_command_matches.HostAction.arg`.
/// @param value Initial value stored in `mq3.game.bot_command_matches.HostAction.value`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function emit(state,kind,client,channel,text,arg,value,suppressed)
  action=HostAction(kind,client,channel,text,arg,value,suppressed);state.actions=state.actions+[action];if not suppressed and state.hostActionFn!=void then state.hostActionFn(state,action) end if;return action
end function
/// Forward `variable` to `mq3.botlib.ai_chat_matches.matchVariable` and return the delegated result.
/// @param match Parsed match record; accesses `offsets`, `lengths` and `string`.
/// @param index Index of the entry to access.
function variable(match,index) return chat.matchVariable(match,index,256) end function
/// Forward `find` to `mq3.botlib.ai_chat_matches.findMatch` and return the delegated result.
/// @param state Bot command matches state; accesses `matchState`.
/// @param value Value passed as argument 1 to `bytes`.
/// @param context Bit mask selecting the bot-chat contexts accepted by this operation.
function find(state,value,context) return chat.findMatch(state.matchState,value,context) end function
/// Return the result of `strings.toLowerAscii(value)` for `lower`.
/// @param value Value passed as argument 1 to `std.string.toLowerAscii`.
function lower(value) return strings.toLowerAscii(value) end function
/// Test `chat.stringContains(value,needle,false)>=0` as the condition for `containsFold`.
/// @param value Value passed as argument 1 to `bytes`.
/// @param needle Text or value to search for.
function containsFold(value,needle) return chat.stringContains(value,needle,false)>=0 end function
/// Read the command-matching player-name table, using an empty string for an invalid client slot.
/// @param state Bot command matches state; accesses `names`.
/// @param client Operand used to evaluate the returned expression `state.names[client]`.
function clientName(state,client) if client>=0 and client<len(state.names) then return state.names[client] end if;return "" end function
/// Test `client>=0 and client<len(state.teams) and state.teams[client]==bot.team` as the condition for `sameTeam`.
/// @param state Bot command matches state; accesses `teams`.
/// @param bot Bot AI state; accesses `team`.
/// @param client Operand used to evaluate the returned expression `client>=0 and client<len(state.teams) and state.teams[client]==bot.team`.
function sameTeam(state,bot,client) return client>=0 and client<len(state.teams) and state.teams[client]==bot.team end function

// BotPrintTeamGoal
/// @param state Bot command matches state; accesses `now`.
/// @param bot Bot AI state; accesses `ltgtype`, `client` and `teamgoalTime`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotPrintTeamGoal(state,bot,suppressed)
  labels=["regular goal","help a team mate","accompany a team mate","defend a key area","get the flag","rush to base","return the flag","camp","camp","patrol","get an item","kill someone","harvest","attack enemy base"]
  label="regular goal";if bot.ltgtype>=1 and bot.ltgtype<len(labels) then label=labels[bot.ltgtype] end if;emit(state,"debug-goal",bot.client,0,label,"",bot.teamgoalTime-state.now,suppressed);return void
end function
// BotGetItemTeamGoal
/// @param state Bot command matches state; accesses `itemGoals`.
/// @param goalname Value passed as argument 1 to `std.string.toLowerAscii`.
function BotGetItemTeamGoal(state,goalname)
  if goalname=="" then return void end if;wanted=lower(goalname);for each candidate in state.itemGoals if lower(candidate.name)==wanted and (candidate.flags&1)==0 then return copyGoal(candidate) end if end for;return void
end function
// BotGetMessageTeamGoal
/// @param state Bot command matches state; accesses `itemGoals`.
/// @param bot Bot AI state; accesses `checkpoints`.
/// @param goalname Value passed as argument 1 to `std.string.toLowerAscii`.
function BotGetMessageTeamGoal(state,bot,goalname)
  found=BotGetItemTeamGoal(state,goalname);if found!=void then return found end if;wanted=lower(goalname);for each waypoint in bot.checkpoints if lower(waypoint.name)==wanted then return copyGoal(waypoint.goal) end if end for;return void
end function
// BotGetTime
/// @param state Bot command matches state; accesses `now`.
/// @param match Parsed match record; accesses `subtype`.
function BotGetTime(state,match)
  if (match.subtype&ST_TIME)==0 then return 0.0 end if;timematch=find(state,variable(match,TIME),MTCONTEXT_TIME);if timematch==void or timematch is error then return 0.0 end if
  seconds=0.0;if timematch.type==MSG_FOREVER then seconds=99999999.0 else if timematch.type==MSG_FORAWHILE then seconds=600.0 else if timematch.type==MSG_FORALONGTIME then seconds=1800.0 else value=toNumber(variable(timematch,TIME));if timematch.type==MSG_MINUTES then seconds=value*60.0 else if timematch.type==MSG_SECONDS then seconds=value end if end if
  if seconds>0.0 then return state.now+seconds end if;return 0.0
end function
// FindClientByName
/// @param state Bot command matches state; accesses `maxclients` and `names`.
/// @param name Name used to identify the requested entry.
function FindClientByName(state,name)
  limit=state.maxclients;if limit>MAX_CLIENTS then limit=MAX_CLIENTS end if;wanted=lower(name);for i=0 to limit-1 if lower(state.names[i])==wanted then return i end if end for;for i=0 to limit-1 if containsFold(state.names[i],name) then return i end if end for;return -1
end function
// FindEnemyByName
/// @param state Bot command matches state; accesses `maxclients` and `names`.
/// @param bot Bot AI state; accesses `team`.
/// @param name Name used to identify the requested entry.
function FindEnemyByName(state,bot,name)
  limit=state.maxclients;if limit>MAX_CLIENTS then limit=MAX_CLIENTS end if;wanted=lower(name);for i=0 to limit-1 if not sameTeam(state,bot,i) and lower(state.names[i])==wanted then return i end if end for;for i=0 to limit-1 if not sameTeam(state,bot,i) and containsFold(state.names[i],name) then return i end if end for;return -1
end function
// NumPlayersOnSameTeam (the i+1 test preserves the original game's indexing behavior).
/// @param state Bot command matches state; accesses `maxclients` and `configs`.
/// @param bot Bot AI state; accesses `team`.
function NumPlayersOnSameTeam(state,bot)
  limit=state.maxclients;if limit>MAX_CLIENTS then limit=MAX_CLIENTS end if;count=0;for i=0 to limit-1 if state.configs[i]!="" and sameTeam(state,bot,i+1) then count=count+1 end if end for;return count
end function
/// Apply `mq3.game.bot_command_matches.goal` and `mq3.game.bot_command_matches.clientName` while evaluating `pointGoal`.
/// @param state Bot command matches state; accesses `entityInfos` and `pointAreas`.
/// @param client Initial value stored in `mq3.game.bot_command_matches.Goal.entitynum`.
function pointGoal(state,client) if client<0 or client>=MAX_CLIENTS then return void end if;entity=state.entityInfos[client];area=state.pointAreas[client];if not entity.valid or area==0 then return void end if;return goal(0,client,area,entity.origin+[ ],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,clientName(state,client)) end function
/// Record or dispatch `"team-status"` actions in `order`.
/// @param state Bot command matches state; accesses `now` and `randomValue`.
/// @param bot Bot AI state; accesses `decisionmaker`, `ordered`, `orderTime`, `teammessageTime` and `ltgtype` and related fields. May update `bot.decisionmaker`, `bot.ordered` and `bot.orderTime` and additional fields in place.
/// @param client Value used by `order` in `bot.decisionmaker=client`.
/// @param ltg Initial value stored in `mq3.game.bot_command_matches.HostAction.value`.
/// @param duration Value used by `order` in `bot.teamgoalTime=state.now+duration`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function order(state,bot,client,ltg,duration,suppressed)
  bot.decisionmaker=client;bot.ordered=true;bot.orderTime=state.now;bot.teammessageTime=state.now+2.0*state.randomValue;bot.ltgtype=ltg;bot.teamgoalTime=state.now+duration;emit(state,"team-status",bot.client,0,"","",ltg,suppressed);return void
end function
/// Record or dispatch `"remember-task"` actions in `remember`.
/// @param state Bot command matches state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client` and `ltgtype`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function remember(state,bot,suppressed) emit(state,"remember-task",bot.client,0,"","",bot.ltgtype,suppressed);return void end function
/// Record or dispatch `"initial-chat"` actions in `initial`.
/// @param state Bot command matches state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param key Lookup key or field name used by the operation.
/// @param arg Initial value stored in `mq3.game.bot_command_matches.HostAction.arg`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function initial(state,bot,key,arg,suppressed) emit(state,"initial-chat",bot.client,0,key,arg,0,suppressed);return void end function
/// Record or dispatch `"enter-chat"` actions in `enter`.
/// @param state Bot command matches state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `cs`.
/// @param client Initial value stored in `mq3.game.bot_command_matches.HostAction.client`.
/// @param channel Channel identifier for the requested action.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function enter(state,bot,client,channel,suppressed) emit(state,"enter-chat",client,channel,"","",bot.cs,suppressed);return void end function

// BotGetPatrolWaypoints
/// @param state Bot command matches state; accesses `matchState`.
/// @param bot Bot AI state; accesses `client`, `patrolpoints`, `curpatrolpoint` and `patrolflags`. May update `bot.patrolpoints`, `bot.curpatrolpoint` and `bot.patrolflags` in place.
/// @param match Parsed match record; accesses `offsets`, `lengths` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotGetPatrolWaypoints(state,bot,match,suppressed)
  remaining=variable(match,KEYAREA);points=[];flags=0
  while true
    part=find(state,remaining,MTCONTEXT_PATROLKEYAREA);if part==void or part is error then emit(state,"say-team",bot.client,CHAT_TEAM,"what do you say?","",0,suppressed);bot.patrolpoints=[];return false end if
    name=variable(part,KEYAREA);g=BotGetMessageTeamGoal(state,bot,name);if g==void then bot.patrolpoints=[];return false end if;points=points+[Waypoint(name,g)]
    if (part.subtype&ST_BACK)!=0 then flags=PATROL_LOOP;break else if (part.subtype&ST_REVERSE)!=0 then flags=PATROL_REVERSE;break else if (part.subtype&ST_MORE)!=0 then remaining=variable(part,MORE) else break end if
  end while
  if len(points)<2 then emit(state,"say-team",bot.client,CHAT_TEAM,"I need more key points to patrol\n","",0,suppressed);return false end if;bot.patrolpoints=points;bot.curpatrolpoint=points[0];bot.patrolflags=flags;return true
end function
// BotAddressedToBot
/// @param state Bot command matches state; accesses `randomValue`.
/// @param bot Bot AI state; accesses `client` and `subteam`.
/// @param match Parsed match record; accesses `subtype` and `string`.
function BotAddressedToBot(state,bot,match)
  sender=FindClientByName(state,variable(match,NETNAME));if not sameTeam(state,bot,sender) then return false end if
  if (match.subtype&ST_ADDRESSED)!=0 then
    remaining=variable(match,ADDRESSEE);while true addressee=find(state,remaining,MTCONTEXT_ADDRESSEE);if addressee==void or addressee is error then return false end if;if addressee.type==MSG_EVERYONE then return true end if;name=variable(addressee,TEAMMATE);if name!="" and (containsFold(clientName(state,bot.client),name) or containsFold(bot.subteam,name)) then return true end if;if addressee.type!=MSG_MULTIPLENAMES then return false end if;remaining=variable(addressee,MORE) end while
  end if
  tell=find(state,match.string,MTCONTEXT_REPLYCHAT);if tell!=void and not (tell is error) and tell.type==MSG_CHATTELL then return true end if;players=NumPlayersOnSameTeam(state,bot)-1;if players<=0 then return true end if;return state.randomValue<=1.0/players
end function
// BotGPSToPosition
/// @param value Value passed as argument 1 to `bytes`.
function BotGPSToPosition(value)
  data=bytes(value);at=0;position=[];for axis=0 to 2 while at<len(data) and data[at]==32 at=at+1 end while;sign=1;if at<len(data) and data[at]==45 then sign=-1;at=at+1 end if;number=0;while at<len(data) and data[at]>=48 and data[at]<=57 number=number*10+data[at]-48;at=at+1 end while;if at<len(data) and data[at]!=32 then at=at+1 end if;position=position+[1.0*sign*number] end for;return position
end function

// BotMatch_HelpAccompany
/// @param state Bot command matches state; accesses `teamplay` and `now`.
/// @param bot Bot AI state; accesses `client`, `teamgoal`, `teammate`, `teammatevisibleTime` and `ltgtype` and related fields. May update `bot.teamgoal`, `bot.teammate` and `bot.teammatevisibleTime` and additional fields in place.
/// @param match Parsed match record; accesses `subtype` and `type`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_HelpAccompany(state,bot,match,suppressed)
  if not state.teamplay or not BotAddressedToBot(state,bot,match) then return void end if;who=variable(match,TEAMMATE);tm=find(state,who,MTCONTEXT_TEAMMATE);sender=FindClientByName(state,variable(match,NETNAME));client=FindClientByName(state,who);other=true;if tm!=void and not (tm is error) and tm.type==MSG_ME then client=sender;other=false end if;if client==bot.client then return void end if;if client<0 then initial(state,bot,"whois",who,suppressed);enter(state,bot,sender,CHAT_TELL,suppressed);return void end if;if not sameTeam(state,bot,client) then return void end if
  g=pointGoal(state,client);if g==void and (match.subtype&ST_NEARITEM)!=0 then g=BotGetMessageTeamGoal(state,bot,variable(match,ITEM)) end if;if g==void then if other then initial(state,bot,"whereis",who,suppressed) else initial(state,bot,"whereareyou",variable(match,NETNAME),suppressed) end if;enter(state,bot,sender,CHAT_TEAM,suppressed);return void end if
  bot.teamgoal=g;bot.teammate=client;order(state,bot,sender,LTG_TEAMHELP,60.0,suppressed);bot.teammatevisibleTime=state.now;custom=BotGetTime(state,match);if match.type==MSG_ACCOMPANY then bot.ltgtype=LTG_TEAMACCOMPANY;bot.teamgoalTime=state.now+600.0;bot.formationDist=112.0;bot.arriveTime=0.0;remember(state,bot,suppressed) end if;if custom>0.0 then bot.teamgoalTime=custom end if;return void
end function
/// Set `bot.teamgoal` to `g` in `mq3.game.bot_command_matches.goalOrder`.
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `teamgoal`. May update `bot.teamgoal` in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param varIndex Index of the entry to access.
/// @param ltg Initial value stored in `mq3.game.bot_command_matches.HostAction.value`.
/// @param duration Value used by `order` in `bot.teamgoalTime=state.now+duration`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function goalOrder(state,bot,match,varIndex,ltg,duration,suppressed)
  if not state.teamplay or not BotAddressedToBot(state,bot,match) then return false end if;g=BotGetMessageTeamGoal(state,bot,variable(match,varIndex));if g==void then return false end if;bot.teamgoal=g;client=FindClientByName(state,variable(match,NETNAME));order(state,bot,client,ltg,duration,suppressed);remember(state,bot,suppressed);return true
end function
// BotMatch_DefendKeyArea
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `teamgoalTime` and `defendawayTime`. May update `bot.teamgoalTime` and `bot.defendawayTime` in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_DefendKeyArea(state,bot,match,suppressed) if goalOrder(state,bot,match,KEYAREA,LTG_DEFENDKEYAREA,600.0,suppressed) then custom=BotGetTime(state,match);if custom>0.0 then bot.teamgoalTime=custom end if;bot.defendawayTime=0.0 end if;return void end function
// BotMatch_GetItem
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `teamgoal`. May update `bot.teamgoal` in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_GetItem(state,bot,match,suppressed) goalOrder(state,bot,match,ITEM,LTG_GETITEM,60.0,suppressed);return void end function
// BotMatch_Camp
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `client`, `entitynum`, `areanum`, `origin` and `teamgoal` and related fields. May update `bot.teamgoal`, `bot.teamgoalTime` and `bot.arriveTime` in place.
/// @param match Parsed match record; accesses `subtype`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_Camp(state,bot,match,suppressed)
  if not state.teamplay or not BotAddressedToBot(state,bot,match) then return void end if;client=FindClientByName(state,variable(match,NETNAME));if client<0 then initial(state,bot,"whois",variable(match,NETNAME),suppressed);enter(state,bot,bot.client,CHAT_TEAM,suppressed);return void end if
  g=void;if (match.subtype&ST_THERE)!=0 then g=goal(0,bot.entitynum,bot.areanum,bot.origin+[ ],[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,"") else if (match.subtype&ST_HERE)!=0 then if client==bot.client then return void end if;g=pointGoal(state,client) else g=BotGetMessageTeamGoal(state,bot,variable(match,KEYAREA)) end if;if g==void then return void end if;bot.teamgoal=g;order(state,bot,client,LTG_CAMPORDER,600.0,suppressed);custom=BotGetTime(state,match);if custom>0.0 then bot.teamgoalTime=custom end if;bot.arriveTime=0.0;remember(state,bot,suppressed);return void
end function
// BotMatch_Patrol
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `teamgoalTime`. May update `bot.teamgoalTime` in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_Patrol(state,bot,match,suppressed) client=-1;if state.teamplay and BotAddressedToBot(state,bot,match) and BotGetPatrolWaypoints(state,bot,match,suppressed) then client=FindClientByName(state,variable(match,NETNAME));order(state,bot,client,LTG_PATROL,600.0,suppressed);custom=BotGetTime(state,match);if custom>0.0 then bot.teamgoalTime=custom end if;remember(state,bot,suppressed) end if;return void end function
/// Require valid AAS areas for the flag or obelisk objectives used by the requested team task.
/// @param state Bot command matches state; accesses `redFlag`, `blueFlag`, `neutralObelisk`, `redObelisk` and `blueObelisk`.
/// @param kind Value used by `objectiveReady` in `if kind==LTG_GETFLAG then return state.redFlag.areanum!=0 and state.blueFlag.areanum!=0 end if`.
function objectiveReady(state,kind) if kind==LTG_GETFLAG then return state.redFlag.areanum!=0 and state.blueFlag.areanum!=0 end if;if kind==LTG_HARVEST then return state.neutralObelisk.areanum!=0 and state.redObelisk.areanum!=0 and state.blueObelisk.areanum!=0 end if;return state.redObelisk.areanum!=0 and state.blueObelisk.areanum!=0 end function
// BotMatch_GetFlag
/// @param state Bot command matches state; accesses `gametype`.
/// @param bot Bot AI state; accesses `client` and `team`.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_GetFlag(state,bot,match,suppressed) if (state.gametype!=GT_CTF and state.gametype!=GT_1FCTF) or not objectiveReady(state,LTG_GETFLAG) or not BotAddressedToBot(state,bot,match) then return void end if;order(state,bot,FindClientByName(state,variable(match,NETNAME)),LTG_GETFLAG,600.0,suppressed);if state.gametype==GT_CTF then emit(state,"alternate-route",bot.client,0,"","",3-bot.team,suppressed) end if;remember(state,bot,suppressed);return void end function
// BotMatch_AttackEnemyBase
/// @param state Bot command matches state; accesses `gametype`.
/// @param bot Bot AI state; accesses `attackawayTime`. May update `bot.attackawayTime` in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_AttackEnemyBase(state,bot,match,suppressed) if state.gametype==GT_CTF then BotMatch_GetFlag(state,bot,match,suppressed);return void end if;if (state.gametype!=GT_1FCTF and state.gametype!=GT_OBELISK and state.gametype!=GT_HARVESTER) or not objectiveReady(state,LTG_ATTACKENEMYBASE) or not BotAddressedToBot(state,bot,match) then return void end if;order(state,bot,FindClientByName(state,variable(match,NETNAME)),LTG_ATTACKENEMYBASE,600.0,suppressed);bot.attackawayTime=0.0;remember(state,bot,suppressed);return void end function
// BotMatch_Harvest
/// @param state Bot command matches state; accesses `gametype`.
/// @param bot Bot AI state; accesses `harvestawayTime`. May update `bot.harvestawayTime` in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_Harvest(state,bot,match,suppressed) if state.gametype!=GT_HARVESTER or not objectiveReady(state,LTG_HARVEST) or not BotAddressedToBot(state,bot,match) then return void end if;order(state,bot,FindClientByName(state,variable(match,NETNAME)),LTG_HARVEST,120.0,suppressed);bot.harvestawayTime=0.0;remember(state,bot,suppressed);return void end function
// BotMatch_RushBase
/// @param state Bot command matches state; accesses `gametype`.
/// @param bot Bot AI state; accesses `rushbaseawayTime`. May update `bot.rushbaseawayTime` in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_RushBase(state,bot,match,suppressed) if state.gametype!=GT_CTF and state.gametype!=GT_1FCTF and state.gametype!=GT_HARVESTER then return void end if;if not BotAddressedToBot(state,bot,match) then return void end if;order(state,bot,FindClientByName(state,variable(match,NETNAME)),LTG_RUSHBASE,120.0,suppressed);bot.rushbaseawayTime=0.0;return void end function
// BotMatch_TaskPreference
/// @param state Bot command matches state; accesses `taskPreferences`, `preferenceNames` and `names`. May update `state.taskPreferences[client]` and `state.preferenceNames[client]` in place.
/// @param bot Bot AI state; accesses `client` and `teamleader`.
/// @param match Parsed match record; accesses `subtype`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_TaskPreference(state,bot,match,suppressed) if lower(clientName(state,bot.client))!=lower(bot.teamleader) then return void end if;client=FindClientByName(state,variable(match,NETNAME));if client<0 then return void end if;pref=state.taskPreferences[client];if match.subtype==ST_DEFENDER then pref=(pref&~TEAMTP_ATTACKER)|TEAMTP_DEFENDER else if match.subtype==ST_ATTACKER then pref=(pref&~TEAMTP_DEFENDER)|TEAMTP_ATTACKER else if match.subtype==ST_ROAMER then pref=pref&~(TEAMTP_ATTACKER|TEAMTP_DEFENDER) end if;state.taskPreferences[client]=pref;state.preferenceNames[client]=state.names[client];initial(state,bot,"keepinmind",state.names[client],suppressed);enter(state,bot,client,CHAT_TELL,suppressed);emit(state,"voice-only",client,0,"yes","",0,suppressed);emit(state,"ea-action",bot.client,0,"","",0x0100000,suppressed);return void end function
// BotMatch_ReturnFlag
/// @param state Bot command matches state; accesses `gametype`.
/// @param bot Bot AI state; accesses `rushbaseawayTime`. May update `bot.rushbaseawayTime` in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_ReturnFlag(state,bot,match,suppressed) if (state.gametype==GT_CTF or state.gametype==GT_1FCTF) and BotAddressedToBot(state,bot,match) then order(state,bot,FindClientByName(state,variable(match,NETNAME)),LTG_RETURNFLAG,180.0,suppressed);bot.rushbaseawayTime=0.0 end if;return void end function
// BotMatch_JoinSubteam
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `subteam`. May update `bot.subteam` in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_JoinSubteam(state,bot,match,suppressed) if state.teamplay and BotAddressedToBot(state,bot,match) then bot.subteam=variable(match,TEAMNAME);initial(state,bot,"joinedteam",bot.subteam,suppressed);enter(state,bot,FindClientByName(state,variable(match,NETNAME)),CHAT_TELL,suppressed) end if;return void end function
// BotMatch_LeaveSubteam
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `subteam`. May update `bot.subteam` in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_LeaveSubteam(state,bot,match,suppressed) if state.teamplay and BotAddressedToBot(state,bot,match) then if bot.subteam!="" then initial(state,bot,"leftteam",bot.subteam,suppressed);enter(state,bot,FindClientByName(state,variable(match,NETNAME)),CHAT_TELL,suppressed) end if;bot.subteam="" end if;return void end function
// BotMatch_WhichTeam
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `subteam` and `client`.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_WhichTeam(state,bot,match,suppressed) if state.teamplay and BotAddressedToBot(state,bot,match) then if bot.subteam!="" then initial(state,bot,"inteam",bot.subteam,suppressed) else initial(state,bot,"noteam","",suppressed) end if;enter(state,bot,bot.client,CHAT_TEAM,suppressed) end if;return void end function
// BotMatch_CheckPoint
/// @param state Bot command matches state; accesses `teamplay` and `pointAreas`.
/// @param bot Bot AI state; accesses `areanum`, `client` and `checkpoints`. May update `bot.checkpoints` in place.
/// @param match Parsed match record; accesses `offsets`, `lengths` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_CheckPoint(state,bot,match,suppressed) if not state.teamplay then return void end if;position=BotGPSToPosition(variable(match,POSITION));position[2]=position[2]+0.5;area=bot.areanum;if state.pointAreas[bot.client]!=0 then area=state.pointAreas[bot.client] end if;client=FindClientByName(state,variable(match,NETNAME));if area==0 then if BotAddressedToBot(state,bot,match) then initial(state,bot,"checkpoint_invalid","",suppressed);enter(state,bot,client,CHAT_TELL,suppressed) end if;return void end if;name=variable(match,NAME);kept=[];for each wp in bot.checkpoints if lower(wp.name)!=lower(name) then kept=kept+[wp] end if end for;wp=Waypoint(name,goal(0,-1,area,position,[-8.0,-8.0,-8.0],[8.0,8.0,8.0],0,name));bot.checkpoints=[wp]+kept;if BotAddressedToBot(state,bot,match) then initial(state,bot,"checkpoint_confirm",name,suppressed);enter(state,bot,client,CHAT_TELL,suppressed) end if;return void end function
// BotMatch_FormationSpace
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `formationDist`. May update `bot.formationDist` in place.
/// @param match Parsed match record; accesses `subtype`.
/// @param suppressed Not read by this implementation; retained in the `BotMatch_FormationSpace` signature.
function BotMatch_FormationSpace(state,bot,match,suppressed) if not state.teamplay or not BotAddressedToBot(state,bot,match) then return void end if;space=32.0*toNumber(variable(match,NUMBER));if (match.subtype&ST_FEET)!=0 then space=0.3048*space end if;if space<48.0 or space>500.0 then space=100.0 end if;bot.formationDist=space;return void end function
// BotMatch_Dismiss
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `decisionmaker`, `ltgtype`, `leadTime` and `lastgoalLtgtype`. May update `bot.decisionmaker`, `bot.ltgtype` and `bot.leadTime` and additional fields in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_Dismiss(state,bot,match,suppressed) if state.teamplay and BotAddressedToBot(state,bot,match) then bot.decisionmaker=FindClientByName(state,variable(match,NETNAME));bot.ltgtype=0;bot.leadTime=0.0;bot.lastgoalLtgtype=0;initial(state,bot,"dismissed","",suppressed);enter(state,bot,bot.decisionmaker,CHAT_TELL,suppressed) end if;return void end function
// BotMatch_Suicide
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `client`.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_Suicide(state,bot,match,suppressed) client=-1;if state.teamplay and BotAddressedToBot(state,bot,match) then client=FindClientByName(state,variable(match,NETNAME));emit(state,"command",bot.client,0,"kill","",0,suppressed);emit(state,"voice",client,0,"taunt","",0,suppressed);emit(state,"ea-action",bot.client,0,"","",0x0100000,suppressed) end if;return void end function
// BotMatch_StartTeamLeaderShip
/// @param state Bot command matches state; accesses `teamplay` and `names`.
/// @param bot Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place.
/// @param match Parsed match record; accesses `subtype`.
/// @param suppressed Not read by this implementation; retained in the `BotMatch_StartTeamLeaderShip` signature.
function BotMatch_StartTeamLeaderShip(state,bot,match,suppressed) client=-1;if not state.teamplay then return void end if;if (match.subtype&ST_I)!=0 then bot.teamleader=variable(match,NETNAME) else client=FindClientByName(state,variable(match,TEAMMATE));if client>=0 then bot.teamleader=state.names[client] end if end if;return void end function
// BotMatch_StopTeamLeaderShip
/// @param state Bot command matches state; accesses `teamplay`, `names` and `notleader`. May update `state.notleader[client]` in place.
/// @param bot Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place.
/// @param match Parsed match record; accesses `subtype`.
/// @param suppressed Not read by this implementation; retained in the `BotMatch_StopTeamLeaderShip` signature.
function BotMatch_StopTeamLeaderShip(state,bot,match,suppressed) client=-1;if not state.teamplay then return void end if;if (match.subtype&ST_I)!=0 then client=FindClientByName(state,variable(match,NETNAME)) else client=FindClientByName(state,variable(match,TEAMMATE)) end if;if client>=0 and lower(bot.teamleader)==lower(state.names[client]) then bot.teamleader="";state.notleader[client]=true end if;return void end function
// BotMatch_WhoIsTeamLeader
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `client` and `teamleader`.
/// @param match Not read by this implementation; retained in the `BotMatch_WhoIsTeamLeader` signature.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_WhoIsTeamLeader(state,bot,match,suppressed) if state.teamplay and lower(clientName(state,bot.client))==lower(bot.teamleader) then emit(state,"say-team",bot.client,CHAT_TEAM,"I'm the team leader\n","",0,suppressed) end if;return void end function
// BotMatch_WhatAreYouDoing
/// @param state Bot command matches state; accesses `randomValue`.
/// @param bot Bot AI state; accesses `ltgtype`.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_WhatAreYouDoing(state,bot,match,suppressed) if not BotAddressedToBot(state,bot,match) then return void end if;keys=["roaming","helping","accompanying","defending","capturingflag","rushingbase","returningflag","camping","camping","patrolling","gettingitem","killing","harvesting","attackingenemybase"];key="roaming";if bot.ltgtype>=0 and bot.ltgtype<len(keys) then key=keys[bot.ltgtype] end if;initial(state,bot,key,"",suppressed);enter(state,bot,FindClientByName(state,variable(match,NETNAME)),CHAT_TELL,suppressed);return void end function
// BotMatch_WhatIsMyCommand
/// @param state Bot command matches state; accesses `names`.
/// @param bot Bot AI state; accesses `client`, `teamleader` and `forceorders`. May update `bot.forceorders` in place.
/// @param match Not read by this implementation; retained in the `BotMatch_WhatIsMyCommand` signature.
/// @param suppressed Not read by this implementation; retained in the `BotMatch_WhatIsMyCommand` signature.
function BotMatch_WhatIsMyCommand(state,bot,match,suppressed) if lower(clientName(state,bot.client))==lower(bot.teamleader) then bot.forceorders=true end if;return void end function
// BotNearestVisibleItem
/// @param state Bot command matches state; accesses `itemGoals` and `traceVisibleFn`.
/// @param bot Bot AI state; accesses `origin`.
/// @param itemname Value passed as argument 1 to `std.string.toLowerAscii`.
function BotNearestVisibleItem(state,bot,itemname)
  best=999999.0;bestGoal=void;for each candidate in state.itemGoals if lower(candidate.name)!=lower(itemname) then continue end if;dx=candidate.origin[0]-bot.origin[0];dy=candidate.origin[1]-bot.origin[1];dz=candidate.origin[2]-bot.origin[2];distance=n.fsqrt(dx*dx+dy*dy+dz*dz);visible=true;if state.traceVisibleFn!=void then visible=state.traceVisibleFn(state,bot,candidate) end if;if visible and distance<best then best=distance;bestGoal=copyGoal(candidate) end if end for;return [best,bestGoal]
end function
// BotMatch_WhereAreYou
/// @param state Bot command matches state; accesses `teamplay`.
/// @param bot Bot AI state; accesses `client` and `subteam`.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_WhereAreYou(state,bot,match,suppressed)
  if not state.teamplay or not BotAddressedToBot(state,bot,match) then return void end if;items=["Shotgun","Grenade Launcher","Rocket Launcher","Plasmagun","Railgun","Lightning Gun","BFG10K","Quad Damage","Regeneration","Battle Suit","Speed","Invisibility","Flight","Armor","Heavy Armor","Red Flag","Blue Flag","Nailgun","Prox Launcher","Chaingun","Scout","Guard","Doubler","Ammo Regen","Neutral Flag","Red Obelisk","Blue Obelisk","Neutral Obelisk"];best=999999.0;name="";for each item in items result=BotNearestVisibleItem(state,bot,item);if result[0]<best then best=result[0];name=item end if end for;if name=="" then return void end if;initial(state,bot,"location",name,suppressed);enter(state,bot,FindClientByName(state,variable(match,NETNAME)),CHAT_TELL,suppressed);return void
end function
// BotMatch_LeadTheWay
/// @param state Bot command matches state; accesses `teamplay`, `now` and `randomValue`.
/// @param bot Bot AI state; accesses `client`, `leadTeamgoal`, `leadTeammate`, `leadTime` and `leadvisibleTime` and related fields. May update `bot.leadTeamgoal`, `bot.leadTeammate` and `bot.leadTime` and additional fields in place.
/// @param match Parsed match record; accesses `subtype`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_LeadTheWay(state,bot,match,suppressed) client=-1;if not state.teamplay or not BotAddressedToBot(state,bot,match) then return void end if;if (match.subtype&ST_SOMEONE)!=0 then client=FindClientByName(state,variable(match,TEAMMATE)) else client=FindClientByName(state,variable(match,NETNAME)) end if;if client<0 or not sameTeam(state,bot,client) then return void end if;g=pointGoal(state,client);if g==void then initial(state,bot,"whereareyou",clientName(state,client),suppressed);enter(state,bot,bot.client,CHAT_TEAM,suppressed);return void end if;bot.leadTeamgoal=g;bot.leadTeammate=client;bot.leadTime=state.now+600.0;bot.leadvisibleTime=0.0;bot.leadmessageTime=-(state.now+2.0*state.randomValue);return void end function
// BotMatch_Kill
/// @param state Bot command matches state; accesses `teamplay`, `now` and `randomValue`.
/// @param bot Bot AI state; accesses `teamgoal`, `teammessageTime`, `ltgtype`, `teamgoalTime` and `client`. May update `bot.teamgoal.entitynum`, `bot.teammessageTime` and `bot.ltgtype` and additional fields in place.
/// @param match Parsed match record; accesses `subtype` and `string`.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatch_Kill(state,bot,match,suppressed) if not state.teamplay or not BotAddressedToBot(state,bot,match) then return void end if;client=FindEnemyByName(state,bot,variable(match,ENEMY));if client<0 then initial(state,bot,"whois",variable(match,ENEMY),suppressed);enter(state,bot,FindClientByName(state,variable(match,NETNAME)),CHAT_TELL,suppressed);return void end if;bot.teamgoal.entitynum=client;bot.teammessageTime=state.now+2.0*state.randomValue;bot.ltgtype=LTG_KILL;bot.teamgoalTime=state.now+180.0;emit(state,"team-status",bot.client,0,"","",bot.ltgtype,suppressed);return void end function
// BotMatch_CTF
/// @param state Bot command matches state; accesses `gametype` and `now`.
/// @param bot Bot AI state; accesses `redflagstatus`, `team`, `flagcarrier`, `blueflagstatus` and `flagstatuschanged` and related fields. May update `bot.redflagstatus`, `bot.flagcarrier` and `bot.blueflagstatus` and additional fields in place.
/// @param match Parsed match record; accesses `subtype`.
/// @param suppressed Not read by this implementation; retained in the `BotMatch_CTF` signature.
function BotMatch_CTF(state,bot,match,suppressed) flag=lower(variable(match,FLAG));if state.gametype==GT_CTF then if (match.subtype&ST_GOTFLAG)!=0 then if flag=="red" then bot.redflagstatus=1;if bot.team==TEAM_BLUE then bot.flagcarrier=FindClientByName(state,variable(match,NETNAME)) end if else bot.blueflagstatus=1;if bot.team==TEAM_RED then bot.flagcarrier=FindClientByName(state,variable(match,NETNAME)) end if end if;bot.flagstatuschanged=1;bot.lastflagcaptureTime=state.now else if (match.subtype&ST_CAPTUREDFLAG)!=0 then bot.redflagstatus=0;bot.blueflagstatus=0;bot.flagcarrier=0;bot.flagstatuschanged=1 else if (match.subtype&ST_RETURNEDFLAG)!=0 then if flag=="red" then bot.redflagstatus=0 else bot.blueflagstatus=0 end if;bot.flagstatuschanged=1 end if else if state.gametype==GT_1FCTF and (match.subtype&ST_1FCTFGOTFLAG)!=0 then bot.flagcarrier=FindClientByName(state,variable(match,NETNAME)) end if;return void end function
// BotMatch_EnterGame
/// @param state Bot command matches state; accesses `notleader`. May update `state.notleader[client]` in place.
/// @param bot Not read by this implementation; retained in the `BotMatch_EnterGame` signature.
/// @param match Parsed match record; accesses `offsets`, `lengths` and `string`.
/// @param suppressed Not read by this implementation; retained in the `BotMatch_EnterGame` signature.
function BotMatch_EnterGame(state,bot,match,suppressed) client=FindClientByName(state,variable(match,NETNAME));if client>=0 then state.notleader[client]=false end if;return void end function
// BotMatch_NewLeader
/// @param state Bot command matches state; accesses `maxclients` and `names`.
/// @param bot Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place.
/// @param match Parsed match record; accesses `offsets`, `lengths` and `string`.
/// @param suppressed Not read by this implementation; retained in the `BotMatch_NewLeader` signature.
function BotMatch_NewLeader(state,bot,match,suppressed) name=variable(match,NETNAME);client=FindClientByName(state,name);if sameTeam(state,bot,client) then bot.teamleader=name end if;return void end function

// BotMatchMessage
/// @param state Bot command matches state; accesses `matchState`.
/// @param bot Bot AI state; accesses `client`.
/// @param message Message text supplied to the diagnostic or chat operation.
/// @param suppressed Whether host delivery of the recorded action is suppressed.
function BotMatchMessage(state,bot,message,suppressed)
  match=find(state,message,MTCONTEXT_MISC|MTCONTEXT_INITIALTEAMCHAT|MTCONTEXT_CTF);if match==void or match is error then return false end if;kind=match.type
  if kind==MSG_HELP or kind==MSG_ACCOMPANY then BotMatch_HelpAccompany(state,bot,match,suppressed)
  else if kind==MSG_DEFENDKEYAREA then BotMatch_DefendKeyArea(state,bot,match,suppressed)
  else if kind==MSG_CAMP then BotMatch_Camp(state,bot,match,suppressed)
  else if kind==MSG_PATROL then BotMatch_Patrol(state,bot,match,suppressed)
  else if kind==MSG_GETFLAG then BotMatch_GetFlag(state,bot,match,suppressed)
  else if kind==MSG_ATTACKENEMYBASE then BotMatch_AttackEnemyBase(state,bot,match,suppressed)
  else if kind==MSG_HARVEST then BotMatch_Harvest(state,bot,match,suppressed)
  else if kind==MSG_RUSHBASE then BotMatch_RushBase(state,bot,match,suppressed)
  else if kind==MSG_RETURNFLAG then BotMatch_ReturnFlag(state,bot,match,suppressed)
  else if kind==MSG_TASKPREFERENCE then BotMatch_TaskPreference(state,bot,match,suppressed)
  else if kind==MSG_CTF then BotMatch_CTF(state,bot,match,suppressed)
  else if kind==MSG_GETITEM then BotMatch_GetItem(state,bot,match,suppressed)
  else if kind==MSG_JOINSUBTEAM then BotMatch_JoinSubteam(state,bot,match,suppressed)
  else if kind==MSG_LEAVESUBTEAM then BotMatch_LeaveSubteam(state,bot,match,suppressed)
  else if kind==MSG_WHICHTEAM then BotMatch_WhichTeam(state,bot,match,suppressed)
  else if kind==MSG_CHECKPOINT then BotMatch_CheckPoint(state,bot,match,suppressed)
  else if kind==MSG_FORMATIONSPACE then BotMatch_FormationSpace(state,bot,match,suppressed)
  else if kind==MSG_DISMISS then BotMatch_Dismiss(state,bot,match,suppressed)
  else if kind==MSG_STARTTEAMLEADERSHIP then BotMatch_StartTeamLeaderShip(state,bot,match,suppressed)
  else if kind==MSG_STOPTEAMLEADERSHIP then BotMatch_StopTeamLeaderShip(state,bot,match,suppressed)
  else if kind==MSG_WHOISTEAMLAEDER then BotMatch_WhoIsTeamLeader(state,bot,match,suppressed)
  else if kind==MSG_WHATAREYOUDOING then BotMatch_WhatAreYouDoing(state,bot,match,suppressed)
  else if kind==MSG_WHATISMYCOMMAND then BotMatch_WhatIsMyCommand(state,bot,match,suppressed)
  else if kind==MSG_WHEREAREYOU then BotMatch_WhereAreYou(state,bot,match,suppressed)
  else if kind==MSG_LEADTHEWAY then BotMatch_LeadTheWay(state,bot,match,suppressed)
  else if kind==MSG_KILL then BotMatch_Kill(state,bot,match,suppressed)
  else if kind==MSG_ENTERGAME then BotMatch_EnterGame(state,bot,match,suppressed)
  else if kind==MSG_NEWLEADER then BotMatch_NewLeader(state,bot,match,suppressed)
  else if kind==MSG_SUICIDE then BotMatch_Suicide(state,bot,match,suppressed)
  else if kind==MSG_CREATENEWFORMATION or kind==MSG_FORMATIONPOSITION then emit(state,"say-team",bot.client,CHAT_TEAM,"the part of my brain to create formations has been damaged","",0,suppressed)
  else if kind!=MSG_DOFORMATION and kind!=MSG_WAIT then emit(state,"print",bot.client,0,"unknown match type\n","",kind,suppressed) end if
  return true
end function
