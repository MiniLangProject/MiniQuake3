// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/cgame/cg_servercmds.c. Host side effects are
// returned as typed actions so an unchanged Retail QVM can remain authoritative.
package mq3.client.cgame_servercmds
import mq3.client.cg_local as cgabi
import std.string as strings
import mq3.shared.info as info
import mq3.compat.numeric as numeric
/// Converts a NUL-terminated decimal C string to a signed 32-bit integer using the Windows C runtime. This binding is used by client game servercmds.
/// @param text NUL-terminated C string containing the decimal numeric text.
/// @returns The converted integer; a string with no initial numeric conversion yields zero.
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32

/// Capacity limit for the clients collection or bounded storage used by this client module.
const MAX_CLIENTS=64
/// Capacity limit for the models collection or bounded storage used by this client module.
const MAX_MODELS=256
/// Capacity limit for the voicefiles collection or bounded storage used by this client module.
const MAX_VOICEFILES=8
/// Capacity limit for the voicechats collection or bounded storage used by this client module.
const MAX_VOICECHATS=64
/// Capacity limit for the voicesounds collection or bounded storage used by this client module.
const MAX_VOICESOUNDS=64
/// Capacity limit for the headmodels collection or bounded storage used by this client module.
const MAX_HEADMODELS=64
/// Capacity limit for the voicechatbuffer collection or bounded storage used by this client module.
const MAX_VOICECHATBUFFER=32
/// Maximum text length accepted for a chat message.
const MAX_SAY_TEXT=150
/// Maximum number of team-chat lines retained by the overlay history.
const TEAMCHAT_HEIGHT=cgabi.TEAMCHAT_HEIGHT
/// Maximum visible character count retained for one team-chat line.
const TEAMCHAT_WIDTH=cgabi.TEAMCHAT_WIDTH
/// Native game-type value for capture the flag, used when interpreting mode-specific server and
/// flag-status updates.
const GT_CTF=4
/// Native game-type identifier selecting one-flag capture the flag.
const GT_1FCTF=5
/// Player-model gender identifier selecting male sound variants.
const GENDER_MALE=0
/// Player-model gender identifier selecting female sound variants.
const GENDER_FEMALE=1
/// Player-model gender identifier selecting neuter sound variants.
const GENDER_NEUTER=2
/// Chat routing mode that sends the message to all players.
const SAY_ALL=0
/// Chat routing mode that sends the message only to the player's team.
const SAY_TEAM=1
/// Chat routing mode that sends the message to one addressed player.
const SAY_TELL=2
/// Team-order identifier assigning the player the offense tactical role.
const TEAMTASK_OFFENSE=1
/// Team-order identifier assigning the player the defense tactical role.
const TEAMTASK_DEFENSE=2
/// Team-order identifier assigning the player the patrol tactical role.
const TEAMTASK_PATROL=3
/// Team-order identifier assigning the player the follow tactical role.
const TEAMTASK_FOLLOW=4
/// Team-order identifier assigning the player the retrieve tactical role.
const TEAMTASK_RETRIEVE=5
/// Team-order identifier assigning the player the escort tactical role.
const TEAMTASK_ESCORT=6
/// Team-order identifier assigning the player the camp tactical role.
const TEAMTASK_CAMP=7
/// Server configuration-string index for serverinfo; shared by the client and game protocol.
const CS_SERVERINFO=0
/// Server configuration-string index for music; shared by the client and game protocol.
const CS_MUSIC=2
/// Server configuration-string index for warmup; shared by the client and game protocol.
const CS_WARMUP=5
/// Server configuration-string index for scores1; shared by the client and game protocol.
const CS_SCORES1=6
/// Server configuration-string index for scores2; shared by the client and game protocol.
const CS_SCORES2=7
/// Server configuration-string index for vote time; shared by the client and game protocol.
const CS_VOTE_TIME=8
/// Server configuration-string index for vote string; shared by the client and game protocol.
const CS_VOTE_STRING=9
/// Server configuration-string index for vote yes; shared by the client and game protocol.
const CS_VOTE_YES=10
/// Server configuration-string index for vote no; shared by the client and game protocol.
const CS_VOTE_NO=11
/// Server configuration-string index for teamvote time; shared by the client and game protocol.
const CS_TEAMVOTE_TIME=12
/// Server configuration-string index for teamvote string; shared by the client and game protocol.
const CS_TEAMVOTE_STRING=14
/// Server configuration-string index for teamvote yes; shared by the client and game protocol.
const CS_TEAMVOTE_YES=16
/// Server configuration-string index for teamvote no; shared by the client and game protocol.
const CS_TEAMVOTE_NO=18
/// Server configuration-string index for level start time; shared by the client and game protocol.
const CS_LEVEL_START_TIME=21
/// Server configuration-string index for intermission; shared by the client and game protocol.
const CS_INTERMISSION=22
/// Server configuration-string index for flagstatus; shared by the client and game protocol.
const CS_FLAGSTATUS=23
/// Server configuration-string index for shaderstate; shared by the client and game protocol.
const CS_SHADERSTATE=24
/// Server configuration-string index for models; shared by the client and game protocol.
const CS_MODELS=32
/// Server configuration-string index for sounds; shared by the client and game protocol.
const CS_SOUNDS=288
/// Server configuration-string index for players; shared by the client and game protocol.
const CS_PLAYERS=544

/// Stores client game servercmds score record, including `client`, `score`, `ping`, `time`, `scoreFlags`, `powerups` and additional values.
struct Score
  /// Player slot associated with this score or client-side record.
  client
  /// Player score parsed from the server score command.
  score
  /// Player ping in milliseconds parsed from the server score command; -1 marks a connecting player.
  ping
  /// Elapsed player connection time reported by the server for scoreboard presentation.
  time
  /// Flags supplied with the server's scoreboard entry.
  scoreFlags
  /// Powerup bitmask reported for this player by the server score command.
  powerups
  /// Percentage of successful weapon hits reported in the scoreboard data.
  accuracy
  /// When constructing this record, `parseScores` supplies `integer(args,base+7)` for this member.
  impressive
  /// When constructing this record, `parseScores` supplies `integer(args,base+8)` for this member.
  excellent
  /// When constructing this record, `parseScores` supplies `integer(args,base+9)` for this member.
  gauntlet
  /// When constructing this record, `parseScores` supplies `integer(args,base+10)` for this member.
  defend
  /// When constructing this record, `parseScores` supplies `integer(args,base+11)` for this member.
  assist
  /// True or nonzero when the player's result qualifies as a perfect game.
  perfect
  /// Number of flag captures credited to this player.
  captures
  /// Team assigned to this parsed score entry from the corresponding client information.
  team
end struct
/// Stores client game servercmds client record, including `name`, `team`, `score`, `powerups`, `location`, `health` and additional values.
struct Client
  /// Player name retained from server configuration strings for client-game server-command
  /// presentation.
  name
  /// Client team membership retained while interpreting scoreboard and team-information commands.
  team
  /// Latest reported player score copied into client information by score-command processing.
  score
  /// Latest player powerup bitmask copied from score or team-overlay server commands.
  powerups
  /// When constructing this record, `client` supplies `0` for this member.
  location
  /// Teammate health decoded from a server team-information command.
  health
  /// Teammate armor decoded from the server team-information payload.
  armor
  /// Currently selected weapon identifier for the client-information entry.
  curWeapon
  /// Model gender used when selecting gender-specific player sounds.
  gender
  /// Virtual model name selected for the player's head.
  headModelName
  /// Skin name selected for the player's head model.
  headSkinName
end struct
/// Stores client game servercmds voice variant record, including `sound`, `chat`.
struct VoiceVariant
  /// Registered voice sound, or its virtual asset path when no sound-registration callback is supplied.
  sound
  /// When constructing this record, `parseVoiceChats` supplies `chat` for this member.
  chat
end struct
/// Stores client game servercmds voice chat record, including `id`, `variants`.
struct VoiceChat
  /// Voice-chat command identifier used to find the requested sound and text alternatives.
  id
  /// When constructing this record, `parseVoiceChats` supplies `variants` for this member.
  variants
end struct
/// Stores client game servercmds voice list record, including `name`, `gender`, `chats`.
struct VoiceList
  /// Voice-script list name used to select the matching voice-chat definitions.
  name
  /// Model gender used when selecting gender-specific player sounds.
  gender
  /// When constructing this record, `parseVoiceChats` supplies an empty list for this member.
  chats
end struct
/// Stores client game servercmds head voice record, including `headmodel`, `voiceChatNum`.
struct HeadVoice
  /// When constructing this record, `cacheHead` supplies `name` for this member.
  headmodel
  /// When constructing this record, `cacheHead` supplies `index` for this member.
  voiceChatNum
end struct
/// Stores client game servercmds buffered voice record, including `clientNum`, `sound`, `voiceOnly`, `cmd`, `message`.
struct BufferedVoice
  /// Client slot of the speaker associated with this queued voice-chat message.
  clientNum
  /// Voice sound resource queued together with its speaker and chat message.
  sound
  /// When constructing this record, `voiceChatLocal` supplies `voiceOnly` for this member.
  voiceOnly
  /// When constructing this record, `voiceChatLocal` supplies `cmd` for this member.
  cmd
  /// When constructing this record, `voiceChatLocal` supplies `message` for this member.
  message
end struct
/// Stores client game servercmds queued engine action, including `boundary`, `kind`, `value`, `value2`, `number`, `dispatched`.
struct Action
  /// Host service category recorded with a request emitted while applying reliable server commands and
  /// playing server-directed feedback.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while applying reliable
  /// server commands and playing server-directed feedback.
  kind
  /// Value payload supplied to the selected host operation while applying reliable server commands and
  /// playing server-directed feedback.
  value
  /// When constructing this record, `action` supplies `value2` for this member.
  value2
  /// Numeric argument interpreted by the selected host operation while applying reliable server
  /// commands and playing server-directed feedback.
  number
  /// True when this request is marked for native dispatch while applying reliable server commands and
  /// playing server-directed feedback; false when its native effect is suppressed.
  dispatched
end struct
/// Stores client game servercmds operation result, including `handled`, `actions`.
struct Result
  /// When constructing this record, `result` supplies `handled` for this member.
  handled
  /// Host requests queued while applying reliable server commands and playing server-directed feedback,
  /// retained in request order.
  actions
end struct
/// Stores client game servercmds state, including `configstrings`, `clients`, `scores`, `numScores`, `teamScores`, `sortedTeamPlayers` and additional values.
struct State
  /// Server configuration strings indexed by the native protocol's configuration-string identifiers.
  configstrings
  /// Client records updated by player configstrings, score commands, and team-overlay commands.
  clients
  /// Scoreboard entries received from the server.
  scores
  /// Number of valid scoreboard entries received from the server.
  numScores
  /// Current score totals indexed by the two competing teams.
  teamScores
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `parseTeamInfo` during subsequent processing.
  sortedTeamPlayers
  /// Game-rule identifier parsed from the current server-information configuration string.
  gametype
  /// When constructing this record, `create` supplies `0` for this member. Used by `parseServerinfo`
  /// during subsequent processing.
  dmflags
  /// When constructing this record, `create` supplies `0` for this member. Used by `parseServerinfo`
  /// during subsequent processing.
  teamflags
  /// When constructing this record, `create` supplies `0` for this member. Used by `parseServerinfo`
  /// during subsequent processing.
  fraglimit
  /// Capture or objective-score limit parsed from the server's game information.
  capturelimit
  /// When constructing this record, `create` supplies `0` for this member. Used by `parseServerinfo`
  /// during subsequent processing.
  timelimit
  /// When constructing this record, `create` supplies `0` for this member. Used by `parseServerinfo`
  /// during subsequent processing.
  maxclients
  /// Map name parsed from server information or selected by the client UI.
  mapname
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `parseServerinfo` during subsequent processing.
  redTeam
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `parseServerinfo` during subsequent processing.
  blueTeam
  /// First team or leading player's score received through server configuration strings.
  scores1
  /// Second team or trailing player's score received through server configuration strings.
  scores2
  /// Server timestamp at which the level began, used by elapsed-match-time displays.
  levelStartTime
  /// Red-flag status received through server configuration strings.
  redflag
  /// Blue-flag status received through server configuration strings.
  blueflag
  /// Current flag-objective state used by capture-the-flag presentation.
  flagStatus
  /// Warmup deadline or state supplied by the server's warmup configuration.
  warmup
  /// Last warmup countdown value announced to the player.
  warmupCount
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `configStringModified` and `mapRestart` during subsequent processing.
  voteTime
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `configStringModified` during subsequent processing.
  voteYes
  /// When constructing this record, `create` supplies `0` for this member. Used by
  /// `configStringModified` during subsequent processing.
  voteNo
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `configStringModified` during subsequent processing.
  voteString
  /// True when vote information changed and the UI should refresh or play feedback.
  voteModified
  /// When constructing this record, `create` supplies `[0,0]` for this member. Used by
  /// `configStringModified` during subsequent processing.
  teamVoteTime
  /// When constructing this record, `create` supplies `[0,0]` for this member. Used by
  /// `configStringModified` during subsequent processing.
  teamVoteYes
  /// When constructing this record, `create` supplies `[0,0]` for this member. Used by
  /// `configStringModified` during subsequent processing.
  teamVoteNo
  /// When constructing this record, `create` supplies `["",""]` for this member. Used by
  /// `configStringModified` during subsequent processing.
  teamVoteString
  /// Per-team indicators that team-vote information changed.
  teamVoteModified
  /// True after intermission begins, suppressing gameplay-only presentation such as voice rewards.
  intermissionStarted
  /// When constructing this record, `create` supplies `TEAMCHAT_HEIGHT` for this member. Used by
  /// `addToTeamChat` during subsequent processing.
  teamChatHeight
  /// When constructing this record, `create` supplies `3000` for this member. Used by `addToTeamChat`
  /// during subsequent processing.
  teamChatTime
  /// Color-coded team-chat lines retained in the bounded team-chat history.
  teamChatMsgs
  /// Arrival timestamps corresponding to the stored team-chat lines.
  teamChatMsgTimes
  /// Next write position in the team-chat history ring.
  teamChatPos
  /// Oldest team-chat history position still eligible for display.
  teamLastChatPos
  /// Client-game timestamp in milliseconds used to schedule voice playback, orders, and server-command
  /// feedback.
  time
  /// Bitset recording which frag-limit warning thresholds have already been announced.
  fraglimitWarnings
  /// Bitset recording which time-limit warning thresholds have already been announced.
  timelimitWarnings
  /// True after a map restart, causing presentation and prediction state to be reinitialized.
  mapRestart
  /// True while producing the menu screenshot for the current level.
  levelShot
  /// Last processed reliable server-command sequence, advanced while executing commands through the
  /// requested sequence.
  serverCommandSequence
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `loadVoiceChats` and `headModelVoiceChats` during subsequent processing.
  voiceLists
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `cacheHead` and `voiceChatListForClient` during subsequent processing.
  headVoices
  /// When constructing this record, `create` supplies `array(MAX_VOICECHATBUFFER,void)` for this
  /// member. Used by `playBufferedVoiceChats` and `addBufferedVoiceChat` during subsequent processing.
  voiceBuffer
  /// Write position in the buffered voice-chat announcement ring.
  voiceChatBufferIn
  /// Read position in the buffered voice-chat announcement ring.
  voiceChatBufferOut
  /// Next time at which a buffered voice-chat announcement may be played.
  voiceChatTime
  /// When constructing this record, `create` supplies `0` for this member. Used by `voiceChatLocal`
  /// during subsequent processing.
  currentVoiceClient
  /// When constructing this record, `create` supplies `0` for this member. Used by `playVoiceChat`
  /// during subsequent processing.
  acceptOrderTime
  /// When constructing this record, `create` supplies an empty string for this member. Used by
  /// `playVoiceChat` during subsequent processing.
  acceptVoice
  /// When constructing this record, `create` supplies `0` for this member. Used by `playVoiceChat`
  /// during subsequent processing.
  acceptTask
  /// When constructing this record, `create` supplies `0` for this member. Used by `playVoiceChat`
  /// during subsequent processing.
  acceptLeader
  /// When constructing this record, `create` supplies `false` for this member. Used by `voiceChatLocal`
  /// and `serverCommand` during subsequent processing.
  teamChatsOnly
  /// When constructing this record, `create` supplies `false` for this member. Used by `voiceChat`
  /// during subsequent processing.
  noTaunt
  /// When constructing this record, `create` supplies `false` for this member. Used by `playVoiceChat`
  /// during subsequent processing.
  noVoiceChats
  /// When constructing this record, `create` supplies `false` for this member. Used by `playVoiceChat`
  /// during subsequent processing.
  noVoiceText
  /// When constructing this record, `create` supplies `0` for this member. Used by `playVoiceChat`
  /// during subsequent processing.
  localClientNum
  /// When constructing this record, `create` supplies `0.0` for this member. Used by `voiceChatLocal`
  /// during subsequent processing.
  randomCursor
end struct

/// Creates a `mq3.client.cgame_servercmds.Client` record. Initializes the record with the defaults written in this constructor.
function client() return Client("",0,0,0,0,0,0,0,GENDER_MALE,"","") end function
/// Calls `mq3.client.cgame_servercmds.client`, `mq3.client.cgame_servercmds.State` from client game servercmds `create`.
function create()
  clients=[];for index=0 to MAX_CLIENTS-1 clients=clients+[client()] end for
  return State(array(1024,""),clients,[],0,[0,0],[],0,0,0,0,0,0,0,"","","",
    0,0,0,0,0,0,0,-1,0,0,0,"",false,[0,0],[0,0],[0,0],["",""],[false,false],false,
    TEAMCHAT_HEIGHT,3000,array(TEAMCHAT_HEIGHT,""),array(TEAMCHAT_HEIGHT,0),0,0,0,0,0,false,false,0,
    [],[],array(MAX_VOICECHATBUFFER,void),0,0,0,0,0,"",0,0,false,false,false,false,0,0.0)
end function
/// Creates a `mq3.client.cgame_servercmds.Action` record. Assigns `boundary` from `boundary`, `kind` from `kind`, `value` from `value`, `value2` from `value2`.
/// @param boundary Value used to initialize `Action.boundary`.
/// @param kind Value used to initialize `Action.kind`.
/// @param value Value used to initialize `Action.value`.
/// @param value2 Value used to initialize `Action.value2`.
/// @param number Value used to initialize `Action.number`.
/// @param emit Value used to initialize `Action.dispatched`.
function action(boundary,kind,value,value2,number,emit) return Action(boundary,kind,value,value2,number,emit) end function
/// Creates a `mq3.client.cgame_servercmds.Result` record. Assigns `handled` from `handled`.
/// @param handled Value used to initialize `Result.handled`.
function result(handled) return Result(handled,[]) end function
/// Updates `effect.actions` during client game servercmds `add`.
/// @param effect Mutable client game servercmds record/storage; this routine assigns `effect.actions`.
/// @param boundary Engine service boundary recorded on the queued action, such as renderer, audio or cvar.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param value Value used by `effect.actions=effect.actions+[action(boundary,kind,value,value2,number,emit)]`.
/// @param value2 Value used by `effect.actions=effect.actions+[action(boundary,kind,value,value2,number,emit)]`.
/// @param number Value used by `effect.actions=effect.actions+[action(boundary,kind,value,value2,number,emit)]`.
/// @param emit Value used by `effect.actions=effect.actions+[action(boundary,kind,value,value2,number,emit)]`.
function add(effect,boundary,kind,value,value2,number,emit) effect.actions=effect.actions+[action(boundary,kind,value,value2,number,emit)];return void end function
/// Evaluates client game servercmds `arg` and returns `""`, `args[index]` according to its guard/selection conditions.
/// @param args Sequence read at `args[index]`.
/// @param index Value tested by `index<0 or index>=len(args)` before the calculation continues.
function arg(args,index) if index<0 or index>=len(args) then return "" end if;return args[index] end function
/// Adapts `mq3.client.cgame_servercmds.atoi` to client game servercmds `integer`, returning its result for `arg(args,index)`.
/// @param args Argument 1 of `mq3.client.cgame_servercmds.atoi`; passed as `arg(args,index)`.
/// @param index Argument 1 of `mq3.client.cgame_servercmds.atoi`; passed as `arg(args,index)`.
function integer(args,index) return atoi(arg(args,index)) end function

// CG_ValidOrder
/// @param name Name used to select or register the corresponding client game servercmds resource.
function validOrder(name)
  key=strings.toLowerAscii(name)
  if key=="getflag" or key=="offense" then return TEAMTASK_OFFENSE end if
  if key=="defend" or key=="defendflag" then return TEAMTASK_DEFENSE end if
  if key=="patrol" then return TEAMTASK_PATROL end if
  if key=="camp" then return TEAMTASK_CAMP end if
  if key=="followme" then return TEAMTASK_FOLLOW end if
  if key=="returnflag" then return TEAMTASK_RETRIEVE end if
  if key=="followflagcarrier" then return TEAMTASK_ESCORT end if
  return -1
end function

// CG_ParseScores: the wire command has fourteen fields per score.
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.numScores`, `state.teamScores`, `state.scores`, `state.clients[number].score` and additional values.
/// @param args Value used by `count=integer(args,1)`.
function parseScores(state,args)
  count=integer(args,1);if count>MAX_CLIENTS then count=MAX_CLIENTS end if;if count<0 then count=0 end if
  state.numScores=count;state.teamScores=[integer(args,2),integer(args,3)];state.scores=[]
  for index=0 to count-1
    base=index*14+4;number=integer(args,base);if number<0 or number>=MAX_CLIENTS then number=0 end if
    item=Score(number,integer(args,base+1),integer(args,base+2),integer(args,base+3),integer(args,base+4),integer(args,base+5),integer(args,base+6),integer(args,base+7),integer(args,base+8),integer(args,base+9),integer(args,base+10),integer(args,base+11),integer(args,base+12),integer(args,base+13),state.clients[number].team)
    state.scores=state.scores+[item];state.clients[number].score=item.score;state.clients[number].powerups=item.powerups
  end for
  return state.numScores
end function

// CG_ParseTeamInfo
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.sortedTeamPlayers`.
/// @param args Value used by `count=integer(args,1)`.
function parseTeamInfo(state,args)
  count=integer(args,1);if count<0 then count=0 end if;if count>MAX_CLIENTS then count=MAX_CLIENTS end if;state.sortedTeamPlayers=[]
  for index=0 to count-1
    base=index*6+2;number=integer(args,base)
    if number>=0 and number<MAX_CLIENTS then
      state.sortedTeamPlayers=state.sortedTeamPlayers+[number];ci=state.clients[number];ci.location=integer(args,base+1);ci.health=integer(args,base+2);ci.armor=integer(args,base+3);ci.curWeapon=integer(args,base+4);ci.powerups=integer(args,base+5)
    end if
  end for
  return len(state.sortedTeamPlayers)
end function

// CG_ParseServerinfo
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.gametype`, `state.dmflags`, `state.teamflags`, `state.fraglimit` and additional values.
function parseServerinfo(state)
  text=state.configstrings[CS_SERVERINFO];state.gametype=atoi(info.value(text,"g_gametype"));state.dmflags=atoi(info.value(text,"dmflags"));state.teamflags=atoi(info.value(text,"teamflags"));state.fraglimit=atoi(info.value(text,"fraglimit"));state.capturelimit=atoi(info.value(text,"capturelimit"));state.timelimit=atoi(info.value(text,"timelimit"));state.maxclients=atoi(info.value(text,"sv_maxclients"));state.mapname="maps/"+info.value(text,"mapname")+".bsp";state.redTeam=info.value(text,"g_redTeam");state.blueTeam=info.value(text,"g_blueTeam")
  effect=result(true);add(effect,"cvar","set","g_gametype",str(state.gametype),0,true);add(effect,"cvar","set","g_redTeam",state.redTeam,0,true);add(effect,"cvar","set","g_blueTeam",state.blueTeam,0,true);return effect
end function

// CG_ParseWarmup
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.warmupCount`, `state.warmup`.
function parseWarmup(state)
  warmup=atoi(state.configstrings[CS_WARMUP]);state.warmupCount=-1;effect=result(true)
  if warmup>0 and state.warmup<=0 then kind="prepare";if state.gametype>=GT_CTF then kind="prepare-team" end if;add(effect,"audio",kind,"","",0,true) end if
  state.warmup=warmup;return effect
end function

// CG_SetConfigValues
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.scores1`, `state.scores2`, `state.levelStartTime`, `state.redflag` and additional values.
function setConfigValues(state)
  state.scores1=atoi(state.configstrings[CS_SCORES1]);state.scores2=atoi(state.configstrings[CS_SCORES2]);state.levelStartTime=atoi(state.configstrings[CS_LEVEL_START_TIME]);flags=state.configstrings[CS_FLAGSTATUS]
  if state.gametype==GT_CTF and len(flags)>=2 then state.redflag=atoi(strings.substr(flags,0,1));state.blueflag=atoi(strings.substr(flags,1,1))
  else if state.gametype==GT_1FCTF and len(flags)>=1 then state.flagStatus=atoi(strings.substr(flags,0,1)) end if
  state.warmup=atoi(state.configstrings[CS_WARMUP]);return void
end function

// CG_ShaderStateChanged
/// @param state Record read through `state.configstrings`.
/// @param emit Value used by `add(effect,"renderer","remap-shader",oldName,newName,atoi(offset),emit)`.
function shaderStateChanged(state,emit)
  effect=result(true);text=state.configstrings[CS_SHADERSTATE];at=0
  while at<len(text)
    equal=strings.indexOf(text,"=",at);if equal<0 then break end if;colon=strings.indexOf(text,":",equal+1);if colon<0 then break end if;mark=strings.indexOf(text,"@",colon+1);if mark<0 then break end if
    oldName=strings.substr(text,at,equal-at);newName=strings.substr(text,equal+1,colon-equal-1);offset=strings.substr(text,colon+1,mark-colon-1);add(effect,"renderer","remap-shader",oldName,newName,atoi(offset),emit);at=mark+1
  end while
  return effect
end function

// CG_ConfigStringModified. The engine has already integrated the new value.
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.configstrings[num]`, `state.scores1`, `state.scores2`, `state.levelStartTime` and additional values.
/// @param num Value used by `if num<0 or num>=len(state.configstrings) then return error(7820,"cg_servercmds: bad configstring index") end if`.
/// @param value Sequence whose length/content is inspected by `configStringModified`.
/// @param emit Value used by `if num==CS_MUSIC then add(effect,"audio","start-music",value,"",0,emit)`.
function configStringModified(state,num,value,emit)
  effect=result(true);if num<0 or num>=len(state.configstrings) then return error(7820,"cg_servercmds: bad configstring index") end if;state.configstrings[num]=value
  if num==CS_MUSIC then add(effect,"audio","start-music",value,"",0,emit)
  else if num==CS_SERVERINFO then nested=parseServerinfo(state);effect.actions=effect.actions+nested.actions
  else if num==CS_WARMUP then nested=parseWarmup(state);effect.actions=effect.actions+nested.actions
  else if num==CS_SCORES1 then state.scores1=atoi(value)
  else if num==CS_SCORES2 then state.scores2=atoi(value)
  else if num==CS_LEVEL_START_TIME then state.levelStartTime=atoi(value)
  else if num==CS_VOTE_TIME then state.voteTime=atoi(value);state.voteModified=true
  else if num==CS_VOTE_YES then state.voteYes=atoi(value);state.voteModified=true
  else if num==CS_VOTE_NO then state.voteNo=atoi(value);state.voteModified=true
  else if num==CS_VOTE_STRING then state.voteString=value;add(effect,"audio","vote-now","","",0,emit)
  else if num>=CS_TEAMVOTE_TIME and num<=CS_TEAMVOTE_TIME+1 then slot=num-CS_TEAMVOTE_TIME;state.teamVoteTime[slot]=atoi(value);state.teamVoteModified[slot]=true
  else if num>=CS_TEAMVOTE_YES and num<=CS_TEAMVOTE_YES+1 then slot=num-CS_TEAMVOTE_YES;state.teamVoteYes[slot]=atoi(value);state.teamVoteModified[slot]=true
  else if num>=CS_TEAMVOTE_NO and num<=CS_TEAMVOTE_NO+1 then slot=num-CS_TEAMVOTE_NO;state.teamVoteNo[slot]=atoi(value);state.teamVoteModified[slot]=true
  else if num>=CS_TEAMVOTE_STRING and num<=CS_TEAMVOTE_STRING+1 then slot=num-CS_TEAMVOTE_STRING;state.teamVoteString[slot]=value;add(effect,"audio","vote-now","","",0,emit)
  else if num==CS_INTERMISSION then state.intermissionStarted=atoi(value)!=0
  else if num>=CS_MODELS and num<CS_MODELS+MAX_MODELS then add(effect,"renderer","register-model",value,"",num-CS_MODELS,emit)
  else if num>=CS_SOUNDS and num<CS_SOUNDS+MAX_MODELS then if len(value)==0 or strings.substr(value,0,1)!="*" then add(effect,"audio","register-sound",value,"",num-CS_SOUNDS,emit) end if
  else if num>=CS_PLAYERS and num<CS_PLAYERS+MAX_CLIENTS then add(effect,"state","new-client-info",value,"",num-CS_PLAYERS,emit);add(effect,"state","build-spectator-string","","",0,emit)
  else if num==CS_FLAGSTATUS then if state.gametype==GT_CTF and len(value)>=2 then state.redflag=atoi(strings.substr(value,0,1));state.blueflag=atoi(strings.substr(value,1,1)) else if state.gametype==GT_1FCTF and len(value)>=1 then state.flagStatus=atoi(strings.substr(value,0,1)) end if
  else if num==CS_SHADERSTATE then nested=shaderStateChanged(state,emit);effect.actions=effect.actions+nested.actions end if
  return effect
end function

/// Computes `index+1<len(data) and data[index]==94 and data[index+1]!=94` for client game servercmds `isColor`.
/// @param data Sequence read at `data[index]`, `data[index+1]`.
/// @param index Value used by `return index+1<len(data) and data[index]==94 and data[index+1]!=94`.
function isColor(data,index) return index+1<len(data) and data[index]==94 and data[index+1]!=94 end function
// CG_AddToTeamChat, including color carry and last-space wrapping.
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.teamChatPos`, `state.teamLastChatPos`, `state.teamChatMsgs[state.teamChatPos%height]`, `state.teamChatMsgTimes[state.teamChatPos%height]`.
/// @param text Text consumed or emitted by `addToTeamChat` in the client game servercmds path.
function addToTeamChat(state,text)
  height=state.teamChatHeight;if height>TEAMCHAT_HEIGHT then height=TEAMCHAT_HEIGHT end if
  if height<=0 or state.teamChatTime<=0 then state.teamChatPos=0;state.teamLastChatPos=0;return 0 end if
  data=bytes(text);line=[];lastColor=55;lastSpace=-1;visible=0;at=0;added=0
  while at<len(data)
    if visible>TEAMCHAT_WIDTH-1 then
      carry=[]
      if lastSpace>=0 then carry=slice(line,lastSpace+1,len(line)-lastSpace-1);line=slice(line,0,lastSpace) end if
      state.teamChatMsgs[state.teamChatPos%height]=decode(bytes(line));state.teamChatMsgTimes[state.teamChatPos%height]=state.time;state.teamChatPos=state.teamChatPos+1;added=added+1;line=[94,lastColor]+carry;visible=len(carry);lastSpace=-1
    end if
    if isColor(data,at) then line=line+[data[at],data[at+1]];lastColor=data[at+1];at=at+2
    else
      if data[at]==32 then lastSpace=len(line) end if;line=line+[data[at]];visible=visible+1;at=at+1
    end if
  end while
  state.teamChatMsgs[state.teamChatPos%height]=decode(bytes(line));state.teamChatMsgTimes[state.teamChatPos%height]=state.time;state.teamChatPos=state.teamChatPos+1;added=added+1;if state.teamChatPos-state.teamLastChatPos>height then state.teamLastChatPos=state.teamChatPos-height end if;return added
end function

// CG_MapRestart
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.fraglimitWarnings`, `state.timelimitWarnings`, `state.intermissionStarted`, `state.voteTime` and additional values.
/// @param emit Value used by `for each kind in ["init-local-entities","init-mark-polys","clear-particles"] add(effect,"state",kind,"","",0,emit) end for`.
function mapRestart(state,emit)
  effect=result(true);state.fraglimitWarnings=0;state.timelimitWarnings=0;state.intermissionStarted=false;state.voteTime=0;state.mapRestart=true
  for each kind in ["init-local-entities","init-mark-polys","clear-particles"] add(effect,"state",kind,"","",0,emit) end for
  add(effect,"audio","start-music","","",0,emit);add(effect,"audio","clear-looping","","",1,emit)
  if state.warmup==0 then add(effect,"audio","fight","","",0,emit);add(effect,"hud","center-print","FIGHT!","120",32,emit) end if
  add(effect,"cvar","set","cg_thirdPerson","0",0,emit);return effect
end function

// COM_ParseExt subset used by .voice and .vc files.
/// @param text Text consumed or emitted by `voiceTokens` in the client game servercmds path.
function voiceTokens(text)
  data=bytes(text);tokens=[];at=0
  while at<len(data)
    while at<len(data) and data[at]<=32 at=at+1 end while;if at>=len(data) then break end if
    if at+1<len(data) and data[at]==47 and data[at+1]==47 then while at<len(data) and data[at]!=10 at=at+1 end while
    else if at+1<len(data) and data[at]==47 and data[at+1]==42 then at=at+2;while at+1<len(data) and not (data[at]==42 and data[at+1]==47) at=at+1 end while;at=at+2
    else if data[at]==34 then at=at+1;start=at;while at<len(data) and data[at]!=34 at=at+1 end while;tokens=tokens+[decode(slice(data,start,at-start))];if at<len(data) then at=at+1 end if
    else start=at;while at<len(data) and data[at]>32 and data[at]!=123 and data[at]!=125 at=at+1 end while;if at==start then tokens=tokens+[decode(slice(data,at,1))];at=at+1 else tokens=tokens+[decode(slice(data,start,at-start))] end if end if
  end while
  return tokens
end function

// CG_ParseVoiceChats. soundFn(path,compress) may reject an unavailable sound.
/// @param filename File name passed to the corresponding file/asset operation.
/// @param text Text consumed or emitted by `parseVoiceChats` in the client game servercmds path.
/// @param maxVoiceChats Value used by `while at<len(tokens) and len(list.chats)<maxVoiceChats`.
/// @param soundFn Callback invoked by `parseVoiceChats` for sound.
/// @param compress Value used by `if soundFn!=void then sound=soundFn(path,compress) end if`.
function parseVoiceChats(filename,text,maxVoiceChats,soundFn,compress)
  tokens=voiceTokens(text);if len(tokens)==0 then return VoiceList(filename,GENDER_MALE,[]) end if
  key=strings.toLowerAscii(tokens[0]);gender=-1;if key=="male" then gender=GENDER_MALE else if key=="female" then gender=GENDER_FEMALE else if key=="neuter" then gender=GENDER_NEUTER end if;if gender<0 then return error(7821,"expected gender not found in voice chat file: "+filename) end if
  list=VoiceList(filename,gender,[]);at=1
  while at<len(tokens) and len(list.chats)<maxVoiceChats
    id=tokens[at];at=at+1;if at>=len(tokens) or tokens[at]!="{" then return error(7822,"expected { in voice chat file: "+filename) end if;at=at+1;variants=[]
    while at<len(tokens) and tokens[at]!="}" and len(variants)<MAX_VOICESOUNDS
      path=tokens[at];at=at+1;if at>=len(tokens) then break end if;chat=tokens[at];at=at+1;sound=path;if soundFn!=void then sound=soundFn(path,compress) end if;if sound!=void and sound!=0 and sound!="" then variants=variants+[VoiceVariant(sound,chat)] end if
    end while
    while at<len(tokens) and tokens[at]!="}" at=at+1 end while;if at<len(tokens) then at=at+1 end if;list.chats=list.chats+[VoiceChat(id,variants)]
  end while
  return list
end function

// CG_LoadVoiceChats
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.voiceLists`.
/// @param files Value used by `for each item in files if len(state.voiceLists)>=MAX_VOICEFILES then break end if`.
/// @param soundFn Callback invoked by `loadVoiceChats` for sound.
/// @param compress Value used by `parsed=parseVoiceChats(item[0],item[1],MAX_VOICECHATS,soundFn,compress)`.
function loadVoiceChats(state,files,soundFn,compress)
  state.voiceLists=[];for each item in files if len(state.voiceLists)>=MAX_VOICEFILES then break end if;parsed=parseVoiceChats(item[0],item[1],MAX_VOICECHATS,soundFn,compress);if not (parsed is error) then state.voiceLists=state.voiceLists+[parsed] end if end for;return len(state.voiceLists)
end function

// CG_HeadModelVoiceChats
/// @param state Record read through `state.voiceLists`.
/// @param text Text consumed or emitted by `headModelVoiceChats` in the client game servercmds path.
function headModelVoiceChats(state,text)
  tokens=voiceTokens(text);if len(tokens)==0 then return -1 end if;for index=0 to len(state.voiceLists)-1 if strings.equalsIgnoreCaseAscii(tokens[0],state.voiceLists[index].name) then return index end if end for;return -1
end function

// CG_GetVoiceChat. cursor is an injected [0,1) random value.
/// @param list Record read through `list.chats`.
/// @param id Value used by `if strings.equalsIgnoreCaseAscii(id,chat.id) and len(chat.variants)>0 then index=numeric.trunc32(cursor*len(chat.variants))`.
/// @param cursor Value used by `if strings.equalsIgnoreCaseAscii(id,chat.id) and len(chat.variants)>0 then index=numeric.trunc32(cursor*len(chat.variants))`.
function getVoiceChat(list,id,cursor)
  for each chat in list.chats
    if strings.equalsIgnoreCaseAscii(id,chat.id) and len(chat.variants)>0 then index=numeric.trunc32(cursor*len(chat.variants));if index>=len(chat.variants) then index=len(chat.variants)-1 end if;if index<0 then index=0 end if;return chat.variants[index] end if
  end for
  return void
end function

/// Updates `state.headVoices` during client game servercmds `cacheHead`.
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.headVoices`.
/// @param name Name used to select or register the corresponding client game servercmds resource.
/// @param index Value assigned to `pair.voiceChatNum`.
function cacheHead(state,name,index)
  for each pair in state.headVoices if strings.equalsIgnoreCaseAscii(pair.headmodel,name) then pair.voiceChatNum=index;return void end if end for
  if len(state.headVoices)<MAX_HEADMODELS then state.headVoices=state.headVoices+[HeadVoice(name,index)] end if;return void
end function
// CG_VoiceChatListForClient. vcFiles contains [path,text] pairs.
/// @param state Record read through `state.clients`, `state.headVoices`, `state.voiceLists`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param vcFiles Value used by `for each file in vcFiles if strings.equalsIgnoreCaseAscii(file[0],wanted) then index=headModelVoiceChats(state,file[1])`.
function voiceChatListForClient(state,clientNum,vcFiles)
  if clientNum<0 or clientNum>=MAX_CLIENTS then clientNum=0 end if;ci=state.clients[clientNum];base=ci.headModelName;if len(base)>0 and strings.substr(base,0,1)=="*" then base=strings.substr(base,1,len(base)-1) end if
  candidates=[base+"/"+ci.headSkinName,base]
  for each head in candidates
    for each pair in state.headVoices if strings.equalsIgnoreCaseAscii(pair.headmodel,head) and pair.voiceChatNum>=0 and pair.voiceChatNum<len(state.voiceLists) then return state.voiceLists[pair.voiceChatNum] end if end for
    wanted="scripts/"+head+".vc";for each file in vcFiles if strings.equalsIgnoreCaseAscii(file[0],wanted) then index=headModelVoiceChats(state,file[1]);if index>=0 then cacheHead(state,head,index);return state.voiceLists[index] end if end if end for
  end for
  gender=ci.gender;for attempt=0 to 1 for index=0 to len(state.voiceLists)-1 if state.voiceLists[index].gender==gender then cacheHead(state,base,index);return state.voiceLists[index] end if end for;if gender==GENDER_MALE then break end if;gender=GENDER_MALE end for
  if len(state.voiceLists)==0 then return void end if;cacheHead(state,base,0);return state.voiceLists[0]
end function

// CG_PlayVoiceChat
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.acceptOrderTime`, `state.acceptVoice`, `state.acceptTask`, `state.acceptLeader`.
/// @param vchat Record read through `vchat.sound`, `vchat.clientNum`, `vchat.cmd`, `vchat.voiceOnly` and additional values.
/// @param emit Value used by `if not state.noVoiceChats then add(effect,"audio","voice",vchat.sound,"",vchat.clientNum,emit)`.
function playVoiceChat(state,vchat,emit)
  effect=result(true);if state.intermissionStarted then return effect end if
  if not state.noVoiceChats then add(effect,"audio","voice",vchat.sound,"",vchat.clientNum,emit);if vchat.clientNum!=state.localClientNum then task=validOrder(vchat.cmd);if task>0 then state.acceptOrderTime=state.time+5000;state.acceptVoice=vchat.cmd;state.acceptTask=task;state.acceptLeader=vchat.clientNum end if;add(effect,"hud","response-head","","",vchat.clientNum,emit) end if end if
  if not vchat.voiceOnly and not state.noVoiceText then addToTeamChat(state,vchat.message);add(effect,"console","print",vchat.message+"\n","",0,emit) end if;return effect
end function

// CG_PlayBufferedVoiceChats
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.voiceBuffer[state.voiceChatBufferOut]`, `state.voiceChatBufferOut`, `state.voiceChatTime`.
/// @param emit Value used by `if value!=void then nested=playVoiceChat(state,value,emit)`.
function playBufferedVoiceChats(state,emit)
  effect=result(true);if state.voiceChatTime<state.time and state.voiceChatBufferOut!=state.voiceChatBufferIn then value=state.voiceBuffer[state.voiceChatBufferOut];if value!=void then nested=playVoiceChat(state,value,emit);effect.actions=effect.actions+nested.actions;state.voiceBuffer[state.voiceChatBufferOut]=void;state.voiceChatBufferOut=(state.voiceChatBufferOut+1)%MAX_VOICECHATBUFFER;state.voiceChatTime=state.time+1000 end if end if;return effect
end function

// CG_AddBufferedVoiceChat
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.voiceBuffer[state.voiceChatBufferIn]`, `state.voiceChatBufferIn`, `state.voiceChatBufferOut`.
/// @param vchat Value used by `state.voiceBuffer[state.voiceChatBufferIn]=vchat`.
/// @param emit Value used by `if state.voiceChatBufferIn==state.voiceChatBufferOut then nested=playVoiceChat(state,state.voiceBuffer[state.voiceChatBufferOut],emit)`.
function addBufferedVoiceChat(state,vchat,emit)
  effect=result(true);if state.intermissionStarted then return effect end if;state.voiceBuffer[state.voiceChatBufferIn]=vchat;state.voiceChatBufferIn=(state.voiceChatBufferIn+1)%MAX_VOICECHATBUFFER
  if state.voiceChatBufferIn==state.voiceChatBufferOut then nested=playVoiceChat(state,state.voiceBuffer[state.voiceChatBufferOut],emit);effect.actions=effect.actions+nested.actions;state.voiceChatBufferOut=(state.voiceChatBufferOut+1)%MAX_VOICECHATBUFFER end if;return effect
end function

// CG_VoiceChatLocal
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.currentVoiceClient`.
/// @param mode Value used by `if variant==void or (mode!=SAY_TEAM and state.teamChatsOnly) then return effect end if`.
/// @param voiceOnly Value used by `vchat=BufferedVoice(clientNum,variant.sound,voiceOnly,cmd,message)`.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param color Color value used by the client game servercmds drawing or interpolation operation.
/// @param cmd Value used by `variant=getVoiceChat(list,cmd,state.randomCursor)`.
/// @param vcFiles Value used by `list=voiceChatListForClient(state,clientNum,vcFiles)`.
/// @param emit Value used by `return addBufferedVoiceChat(state,vchat,emit)`.
function voiceChatLocal(state,mode,voiceOnly,clientNum,color,cmd,vcFiles,emit)
  effect=result(true);if state.intermissionStarted then return effect end if;if clientNum<0 or clientNum>=MAX_CLIENTS then clientNum=0 end if;state.currentVoiceClient=clientNum;list=voiceChatListForClient(state,clientNum,vcFiles);if list==void then return effect end if;variant=getVoiceChat(list,cmd,state.randomCursor);if variant==void or (mode!=SAY_TEAM and state.teamChatsOnly) then return effect end if
  name=state.clients[clientNum].name;prefix=name+": ";if mode==SAY_TELL then prefix="["+name+"]: " else if mode==SAY_TEAM then prefix="("+name+"): " end if;message=prefix+"^"+str(color)+variant.chat;vchat=BufferedVoice(clientNum,variant.sound,voiceOnly,cmd,message);return addBufferedVoiceChat(state,vchat,emit)
end function

// CG_VoiceChat
/// @param state Record read through `state.noTaunt`.
/// @param mode Value used by `return voiceChatLocal(state,mode,integer(args,1)!=0,integer(args,2),integer(args,3),cmd,vcFiles,emit)`.
/// @param args Value used by `cmd=arg(args,4)`.
/// @param vcFiles Value used by `return voiceChatLocal(state,mode,integer(args,1)!=0,integer(args,2),integer(args,3),cmd,vcFiles,emit)`.
/// @param emit Value used by `return voiceChatLocal(state,mode,integer(args,1)!=0,integer(args,2),integer(args,3),cmd,vcFiles,emit)`.
function voiceChat(state,mode,args,vcFiles,emit)
  cmd=arg(args,4);key=strings.toLowerAscii(cmd);if state.noTaunt and (key=="kill_insult" or key=="taunt" or key=="death_insult" or key=="kill_guantlet" or key=="praise") then return result(true) end if
  return voiceChatLocal(state,mode,integer(args,1)!=0,integer(args,2),integer(args,3),cmd,vcFiles,emit)
end function

// CG_RemoveChatEscapeChar
/// @param text Text consumed or emitted by `removeChatEscapeChar` in the client game servercmds path.
function removeChatEscapeChar(text) data=bytes(text);effect=[];for each value in data if value!=25 then effect=effect+[value] end if end for;return decode(bytes(effect)) end function

// CG_ServerCommand
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.levelShot`.
/// @param args Command argument sequence by `serverCommand`.
/// @param vcFiles Value used by `else if cmd=="vchat" then nested=voiceChat(state,SAY_ALL,args,vcFiles,emit)`.
/// @param emit Value used by `if cmd=="cp" then add(effect,"hud","center-print",arg(args,1),"144",16,emit)`.
function serverCommand(state,args,vcFiles,emit)
  effect=result(true);cmd=arg(args,0);if cmd=="" then return effect end if
  if cmd=="cp" then add(effect,"hud","center-print",arg(args,1),"144",16,emit)
  else if cmd=="cs" then num=integer(args,1);value="";if num>=0 and num<len(state.configstrings) then value=state.configstrings[num] end if;nested=configStringModified(state,num,value,emit);effect.actions=effect.actions+nested.actions
  else if cmd=="print" then add(effect,"console","print",arg(args,1),"",0,emit)
  else if cmd=="chat" then if not state.teamChatsOnly then add(effect,"audio","talk","","",0,emit);add(effect,"console","print",removeChatEscapeChar(arg(args,1))+"\n","",0,emit) end if
  else if cmd=="tchat" then text=removeChatEscapeChar(arg(args,1));add(effect,"audio","talk","","",0,emit);addToTeamChat(state,text);add(effect,"console","print",text+"\n","",0,emit)
  else if cmd=="vchat" then nested=voiceChat(state,SAY_ALL,args,vcFiles,emit);effect.actions=effect.actions+nested.actions
  else if cmd=="vtchat" then nested=voiceChat(state,SAY_TEAM,args,vcFiles,emit);effect.actions=effect.actions+nested.actions
  else if cmd=="vtell" then nested=voiceChat(state,SAY_TELL,args,vcFiles,emit);effect.actions=effect.actions+nested.actions
  else if cmd=="scores" then parseScores(state,args)
  else if cmd=="tinfo" then parseTeamInfo(state,args)
  else if cmd=="map_restart" then nested=mapRestart(state,emit);effect.actions=effect.actions+nested.actions
  else if strings.equalsIgnoreCaseAscii(cmd,"remapShader") then if len(args)==4 then add(effect,"renderer","remap-shader",arg(args,1),arg(args,2),atoi(arg(args,3)),emit) end if
  else if cmd=="loaddefered" then add(effect,"state","load-deferred-players","","",0,emit)
  else if cmd=="clientLevelShot" then state.levelShot=true
  else add(effect,"console","print","Unknown client game command: "+cmd+"\n","",0,emit) end if
  return effect
end function

// CG_ExecuteNewServerCommands. commands contains [sequence,argv] records.
/// @param state Mutable client game servercmds record/storage; this routine assigns `state.serverCommandSequence`.
/// @param latestSequence Value used by `while state.serverCommandSequence<latestSequence`.
/// @param commands Value used by `for each item in commands if item[0]==state.serverCommandSequence then found=item[1]`.
/// @param vcFiles Value used by `if found!=void then nested=serverCommand(state,found,vcFiles,emit)`.
/// @param emit Value used by `if found!=void then nested=serverCommand(state,found,vcFiles,emit)`.
function executeNewServerCommands(state,latestSequence,commands,vcFiles,emit)
  effect=result(true)
  while state.serverCommandSequence<latestSequence
    state.serverCommandSequence=state.serverCommandSequence+1;found=void
    for each item in commands if item[0]==state.serverCommandSequence then found=item[1];break end if end for
    if found!=void then nested=serverCommand(state,found,vcFiles,emit);effect.actions=effect.actions+nested.actions end if
  end while
  return effect
end function

// Cmd_Argv compatibility name retained for the original candidate inventory.
/// @param args Argument 1 of `mq3.client.cgame_servercmds.arg`.
/// @param index Argument 2 of `mq3.client.cgame_servercmds.arg`.
function cmdArgv(args,index) return arg(args,index) end function
