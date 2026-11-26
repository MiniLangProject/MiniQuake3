// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ai_main.c bot setup, map reset, shutdown and match-end control.
// AAS, botlib resources and the decision AI remain explicit services.
package mq3.game.bot_lifecycle
import mq3.qcommon.cvar as cv
import mq3.shared.info as infoStrings
import mq3.compat.numeric as n

/// Maximum number of client slots represented by the original game protocol.
const MAX_CLIENTS = 64
/// Maximum number of entity slots represented by the original game protocol.
const MAX_GENTITIES = 1024

/// `BotState` record for bot lifecycle, containing `inuse`, `client`, `entitynum`, `settings` and `curPs` and related fields.
struct BotState
  /// Nonzero when this entity, client, or bot record currently represents a live allocated object.
  inuse
  /// Client slot assigned to this live bot lifecycle record.
  client
  /// Game entity number assigned to the bot represented by this lifecycle state.
  entitynum
  /// Bot creation settings containing character file, skill, and team choices.
  settings
  /// Most recently retrieved player state for this bot.
  curPs
  /// Loaded bot-character handle used to query behavioral characteristics.
  character
  /// Botlib movement-state handle owned by this bot.
  ms
  /// Botlib goal-state handle owned by this bot.
  gs
  /// Botlib chat-state handle owned by this bot.
  cs
  /// Botlib weapon-state handle owned by this bot.
  ws
  /// Timestamp at which this bot entered the game.
  entergameTime
  /// Nonzero when the bot movement preference is to walk.
  walker
  /// Counter controlling initial bot setup before normal decision processing.
  setupcount
  /// Linked or indexed checkpoint goals available to the bot.
  checkpoints
  /// Patrol goals traversed by the bot patrol behavior.
  patrolpoints
  /// Number of kills credited to this bot.
  numKills
  /// Number of deaths recorded for this bot.
  numDeaths
  /// Transient input/decision state reset independently of persistent bot data.
  transient
  /// Player or bot viewing angles used for aiming and command generation.
  viewangles
  /// Target viewing angles toward which the bot should turn.
  idealViewangles
  /// Current angular turn speed used by the bot view controller.
  viewanglespeed
  /// Current enemy entity selected by the bot decision logic.
  enemy
  /// Name or identifier of the current bot-team leader.
  teamleader
  /// Current long-term goal category selected from the LTG_* constants.
  ltgtype
  /// Teammate entity/client selected for the current cooperative task.
  teammate
  /// Goal number associated with the bot current team task.
  teamgoalNumber
  /// Entity number associated with the bot current team task.
  teamgoalEntitynum
  /// Bot inventory slots containing weapon ownership, ammunition, health, and tactical observations.
  inventory
  /// Weapon identifier selected by the bot weapon state.
  weaponnum
  /// Entity-flag value retained from the preceding bot update.
  lastEFlags
  /// Time of the last teleport detected by the bot.
  teleportTime
  /// Current world-space position retained in the live bot lifecycle state.
  origin
  /// AAS area containing the bot or spatial goal.
  areanum
  /// Time interval used for the current bot thinking/update step.
  thinktime
  /// Travel flags controlling which AAS travel types the bot may use.
  tfl
  /// Goal AAS area used by the latest obstacle-prediction query.
  predictobstaclesGoalareanum
  /// Time controlling when obstacle prediction is refreshed.
  predictobstaclesTime
  /// Intermediate goal selected to approach the main target by an alternate route.
  altRouteGoal
  /// Timestamp at which the alternate-route waypoint was reached.
  reachedAltRouteGoalTime
  /// Eye position used as the origin of visibility and aiming queries.
  eye
  /// World-space point toward which the bot aims its weapon.
  aimTarget
  /// Enemy position retained from the previous observation.
  lastEnemyOrigin
  /// Health value retained from the preceding bot update.
  lastHealth
  /// Timestamp associated with acquiring the selected enemy.
  enemySightTime
  /// Nonzero when the tracked enemy death was a suicide.
  enemySuicide
  /// Timestamp associated with the tracked enemy death.
  enemyDeathTime
  /// Most recent time at which the selected enemy was visible.
  enemyVisibleTime
  /// Timestamp of the most recent weapon change.
  weaponchangeTime
  /// Deadline of the current pause between bot firing bursts.
  firethrottlewaitTime
  /// Deadline of the current bot firing burst.
  firethrottleshootTime
  /// Bit flags describing bot combat behavior and transient combat conditions.
  combatFlags
  /// Deadline associated with chasing an enemy during combat.
  attackchaseTime
  /// AAS area of the last observed enemy position.
  lastEnemyAreaNum
  /// Time controlling a combat crouch interval.
  attackcrouchTime
  /// Time controlling a combat jump interval.
  attackjumpTime
  /// Time controlling a combat strafe interval.
  attackstrafeTime
  /// Storage for activation goals required to traverse interactive obstacles.
  activateGoalHeap
  /// Top/current index in the bot activation-goal stack.
  activateStackIndex
  /// Most recently tracked position of the selected enemy.
  enemyOrigin
  /// Most recently tracked velocity of the selected enemy.
  enemyVelocity
  /// Timestamp of the most recently recorded enemy position.
  enemyPositionTime
  /// Number of teammates considered by the team decision logic.
  numteammates
  /// Client/entity currently carrying the flag of interest.
  flagcarrier
  /// Selected capture-the-flag team strategy.
  ctfstrategy
  /// Client/entity currently responsible for the bot team decisions.
  decisionmaker
  /// Time controlling the next bot team message.
  teammessageTime
  /// Navigation goal associated with the bot current team task.
  teamGoal
  /// Deadline associated with the current cooperative team goal.
  teamgoalTime
  /// Deadline associated with the current camping behavior.
  campTime
  /// Timestamp at which the bot arrived at the current team goal.
  arriveTime
  /// Nonzero when a teammate explicitly ordered the current team task.
  ordered
  /// Deadline or timing value associated with the current long-term goal.
  ltgTime
  /// Current bot decision-network node or its callable entry point.
  aiNode
  /// Client identifier of the player most recently killed by this bot.
  lastKilledPlayer
  /// Deadline associated with temporary standing/waiting behavior.
  standTime
  /// Health value retained from the preceding bot frame.
  lastframeHealth
  /// Hit counter retained from the preceding bot frame.
  lastHitCount
  /// Deadline associated with the current enemy chase.
  chaseTime
  /// Most recent time at which the bot had breathable air.
  lastairTime
  /// Last time the teammate associated with the task was visible.
  teammatevisibleTime
  /// Desired separation from the teammate or formation leader.
  formationDist
  /// Time controlling how long the bot may leave its defense goal.
  defendawayTime
  /// Maximum distance for an excursion from a defense goal.
  defendawayRange
  /// Long-term goal type retained from the preceding team task.
  lastgoalLtgtype
  /// Allowed movement radius around the camp goal.
  campRange
  /// Patrol goal currently being approached.
  curpatrolpoint
  /// PATROL_* behavior flags associated with the current patrol route.
  patrolflags
  /// Bot-tracked status of the red flag.
  redflagstatus
  /// Bot-tracked status of the blue flag.
  blueflagstatus
  /// Time controlling temporary excursions from a rush-base goal.
  rushbaseawayTime
  /// Deadline associated with leading a teammate toward a goal.
  leadTime
  /// Client/entity identifier of the teammate being led.
  leadTeammate
  /// Time controlling the next message to the teammate being led.
  leadmessageTime
  /// Navigation goal toward which the bot is leading a teammate.
  leadTeamGoal
  /// Last time the teammate being led was visible.
  leadvisibleTime
  /// Time controlling when the bot backs up to help a trailing teammate.
  leadbackupTime
  /// Deadline for the next periodic condition check.
  checkTime
  /// Deadline associated with the current nearby-item goal.
  nbgTime
  /// Timestamp at which the bot killed its selected enemy.
  killedEnemyTime
  /// Time controlling the next enemy search while standing.
  standFindEnemyTime
  /// Timestamp associated with the client or bot next respawn decision.
  respawnTime
  /// Time controlling a chat message associated with respawning.
  respawnChatTime
  /// Nonzero while the bot waits to issue its respawn action.
  respawnWait
  /// Recipient mode selecting global, team, or other chat delivery.
  chatto
  /// Time controlling temporary excursions from an attack-base goal.
  attackawayTime
  /// Time controlling temporary excursions from a harvesting goal.
  harvestawayTime
  /// Corpse/entity selected for kamikaze-related handling.
  kamikazeBody
  /// Time of the last movement blockage caused by an avoid spot.
  blockedByAvoidSpotTime
  /// Proximity mines tracked by bot hazard logic.
  proxMines
end struct

/// `State` record for bot lifecycle, containing `registry`, `botstates`, `numbots`, `interbreed` and `interbreedMatchCount` and related fields.
struct State
  /// Registry of currently loaded preprocessor/token sources.
  registry
  /// Bot-state records indexed by client slot.
  botstates
  /// Number of allocated bot-state records.
  numbots
  /// Nonzero while genetic interbreeding of bot characters is enabled.
  interbreed
  /// Matches accumulated toward the next interbreeding cycle.
  interbreedMatchCount
  /// Time interval used for the current bot thinking/update step.
  thinktime
  /// Control value requesting botlib memory diagnostics.
  memorydump
  /// Control value requesting persistence of the AAS routing cache.
  saveroutingcache
  /// Control value that pauses bot thinking.
  pause
  /// Control value enabling bot-state diagnostic reporting.
  report
  /// Control value enabling bot/AAS solidity diagnostics.
  testsolid
  /// Control value enabling AAS cluster diagnostics.
  testclusters
  /// Developer diagnostic setting exposed to the bot/game subsystem.
  developer
  /// Character definition used as input to bot interbreeding.
  interbreedchar
  /// Number of bots participating in an interbreeding run.
  interbreedbots
  /// Number of matches between bot interbreeding cycles.
  interbreedcycle
  /// Output character-file setting for the interbreeding result.
  interbreedwrite
  /// Injected callback for console variable effect; invoked through the State service/state record.
  cvarEffectFn
  /// Injected callback for bot lib var set; invoked through the State service/state record.
  botLibVarSetFn
  /// Injected callback for bot lib setup; invoked through the State service/state record.
  botLibSetupFn
  /// Injected callback for bot lib shutdown; invoked through the State service/state record.
  botLibShutdownFn
  /// Injected callback for bot lib load map; invoked through the State service/state record.
  botLibLoadMapFn
  /// Injected callback for free waypoints; invoked through the State service/state record.
  freeWaypointsFn
  /// Injected callback for reset move state; invoked through the State service/state record.
  resetMoveStateFn
  /// Injected callback for reset goal state; invoked through the State service/state record.
  resetGoalStateFn
  /// Injected callback for reset weapon state; invoked through the State service/state record.
  resetWeaponStateFn
  /// Injected callback for reset avoid goals; invoked through the State service/state record.
  resetAvoidGoalsFn
  /// Injected callback for reset avoid reach; invoked through the State service/state record.
  resetAvoidReachFn
  /// Injected callback for deathmatch setup; invoked through the State service/state record.
  deathmatchSetupFn
  /// Injected callback for shutdown client; invoked through the State service/state record.
  shutdownClientFn
  /// Injected callback for genetic selection; invoked through the State service/state record.
  geneticSelectionFn
  /// Injected callback for interbreed goal; invoked through the State service/state record.
  interbreedGoalFn
  /// Injected callback for mutate goal; invoked through the State service/state record.
  mutateGoalFn
  /// Injected callback for save goal; invoked through the State service/state record.
  saveGoalFn
  /// Opaque caller-supplied context available to botlib setup, map loading, shutdown, and bot-state
  /// reset callbacks.
  context
  /// Per-client botlib resource handles and lifecycle state.
  clientResources
end struct

/// Build the `mq3.game.bot_lifecycle.State` result for `create`.
/// @param registry Initial value stored in `mq3.game.bot_lifecycle.State.registry`.
function create(registry)
  if registry == void then return error(494,"Bot lifecycle requires a Cvar registry") end if
  return State(registry,array(MAX_CLIENTS,void),0,false,0,
    cv.createVm(),cv.createVm(),cv.createVm(),cv.createVm(),cv.createVm(),cv.createVm(),cv.createVm(),cv.createVm(),
    cv.createVm(),cv.createVm(),cv.createVm(),cv.createVm(),
    void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function

/// Create a `mq3.game.bot_lifecycle.BotState` record, initializing `inuse` as `true`, `client` from `client` and `entitynum` from `client`.
/// @param client Initial value stored in `mq3.game.bot_lifecycle.BotState.client`.
function createBot(client)
  return BotState(true,client,client,void,void,0,0,0,0,0,0.0,0.0,0,void,void,0,0,void,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],-1,"",0,0,0,0,array(204,0),0,0,0.0,[0.0,0.0,0.0],0,0.0,0,0,0.0,void,0.0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0.0,false,0.0,0.0,0.0,0.0,0,0,0.0,0,0.0,0.0,0.0,void,-1,[0.0,0.0,0.0],[0.0,0.0,0.0],0.0,0,-1,0,0,0.0,void,0.0,0.0,0.0,false,0.0,0,-1,0.0,0,0,0.0,0.0,0.0,0.0,0.0,0.0,0,0.0,void,0,0,0,0.0,0.0,0,0.0,void,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,false,0,0.0,0.0,0,0.0,[])
end function

/// Use `state.cvarEffectFn` to perform `cvarEffect`.
/// @param state Bot lifecycle state; accesses `cvarEffectFn`.
/// @param kind Value passed as argument 2 to `state.cvarEffectFn`.
/// @param key Lookup key or field name used by the operation.
/// @param value Value passed as argument 4 to `state.cvarEffectFn`.
function cvarEffect(state,kind,key,value)
  if state.cvarEffectFn != void then state.cvarEffectFn(state,kind,key,value) end if
  return void
end function

/// Register a bot lifecycle cvar through the configured host services and retain its local state.
/// @param state Bot lifecycle state; accesses `registry`.
/// @param snapshot Snapshot record; accesses `handle` and `modificationCount`. May update `snapshot.handle` and `snapshot.modificationCount` in place.
/// @param name Name used to identify the requested entry.
/// @param defaultValue Value passed as argument 4 to `state.cvarEffectFn`.
/// @param flags Initial value stored in `mq3.qcommon.cvar.Cvar.flags`.
function registerCvar(state,snapshot,name,defaultValue,flags)
  cvarEffect(state,1,name,defaultValue)
  cv.registerVm(state.registry,snapshot,name,defaultValue,flags)
  return void
end function

/// Apply `mq3.game.bot_lifecycle.cvarEffect`, `mq3.qcommon.cvar.find` and `mq3.shared.info.copy` while evaluating `queryCvar`. Return paths include `infoStrings.copy(variable.string,capacity)`.
/// @param state Bot lifecycle state; accesses `registry`.
/// @param name Name used to identify the requested entry.
/// @param capacity Maximum number of entries to allocate or retain.
function queryCvar(state,name,capacity)
  cvarEffect(state,2,name,"")
  variable = cv.find(state.registry,name)
  if variable == void then return "" end if
  return infoStrings.copy(variable.string,capacity)
end function

/// Apply `mq3.game.bot_lifecycle.cvarEffect` and `mq3.qcommon.cvar.updateVm` while evaluating `updateCvar`.
/// @param state Bot lifecycle state; accesses `registry`.
/// @param snapshot Snapshot record; accesses `handle`, `modificationCount`, `string`, `value` and `integer` and related fields. May update `snapshot.modificationCount`, `snapshot.string` and `snapshot.value` and additional fields in place.
/// @param name Name used to identify the requested entry.
function updateCvar(state,snapshot,name)
  cvarEffect(state,3,name,""); cv.updateVm(state.registry,snapshot); return void
end function

/// Apply `mq3.game.bot_lifecycle.cvarEffect` and `mq3.qcommon.cvar.set2` while evaluating `setCvar`.
/// @param state Bot lifecycle state; accesses `registry`.
/// @param name Name used to identify the requested entry.
/// @param value Value passed as argument 4 to `state.cvarEffectFn`.
function setCvar(state,name,value)
  cvarEffect(state,4,name,value); cv.set2(state.registry,name,value,true); return void
end function

/// Use `state.botLibVarSetFn` to perform `botLibVar`.
/// @param state Bot lifecycle state; accesses `botLibVarSetFn`.
/// @param name Name used to identify the requested entry.
/// @param value Value passed as argument 3 to `state.botLibVarSetFn`.
function botLibVar(state,name,value)
  if state.botLibVarSetFn == void then return error(494,"Bot lifecycle requires BotLibVarSet") end if
  state.botLibVarSetFn(state,name,value); return void
end function

/// Use `state.botLibSetupFn` to perform `initLibrary`. Return paths include `state.botLibSetupFn(state)`.
/// @param state Bot lifecycle state; accesses `developer` and `botLibSetupFn`.
function initLibrary(state)
  buffer = queryCvar(state,"sv_maxclients",144)
  if buffer == "" then buffer = "8" end if
  botLibVar(state,"maxclients",buffer)
  botLibVar(state,"maxentities",str(MAX_GENTITIES))
  buffer = queryCvar(state,"sv_mapChecksum",144)
  if buffer != "" then botLibVar(state,"sv_mapChecksum",buffer) end if
  buffer = queryCvar(state,"max_aaslinks",144)
  if buffer != "" then botLibVar(state,"max_aaslinks",buffer) end if
  buffer = queryCvar(state,"max_levelitems",144)
  if buffer != "" then botLibVar(state,"max_levelitems",buffer) end if
  buffer = queryCvar(state,"g_gametype",144)
  if buffer == "" then buffer = "0" end if
  botLibVar(state,"g_gametype",buffer)
  botLibVar(state,"bot_developer",state.developer.string)
  // Original Baseq3 passes the still-live g_gametype scratch buffer as "log".
  botLibVar(state,"log",buffer)
  buffer = queryCvar(state,"bot_nochat",144)
  // Original Baseq3 ignores the queried value and writes literal zero.
  if buffer != "" then botLibVar(state,"nochat","0") end if
  buffer = queryCvar(state,"bot_visualizejumppads",144)
  if buffer != "" then botLibVar(state,"bot_visualizejumppads",buffer) end if
  buffer = queryCvar(state,"bot_forceclustering",144)
  if buffer != "" then botLibVar(state,"forceclustering",buffer) end if
  buffer = queryCvar(state,"bot_forcereachability",144)
  if buffer != "" then botLibVar(state,"forcereachability",buffer) end if
  buffer = queryCvar(state,"bot_forcewrite",144)
  if buffer != "" then botLibVar(state,"forcewrite",buffer) end if
  buffer = queryCvar(state,"bot_aasoptimize",144)
  if buffer != "" then botLibVar(state,"aasoptimize",buffer) end if
  buffer = queryCvar(state,"bot_saveroutingcache",144)
  if buffer != "" then botLibVar(state,"saveroutingcache",buffer) end if
  buffer = queryCvar(state,"bot_reloadcharacters",144)
  if buffer == "" then buffer = "0" end if
  botLibVar(state,"bot_reloadcharacters",buffer)
  buffer = queryCvar(state,"fs_basepath",144)
  if buffer != "" then botLibVar(state,"basedir",buffer) end if
  buffer = queryCvar(state,"fs_game",144)
  if buffer != "" then botLibVar(state,"gamedir",buffer) end if
  buffer = queryCvar(state,"fs_cdpath",144)
  if buffer != "" then botLibVar(state,"cddir",buffer) end if
  if state.botLibSetupFn == void then return error(494,"Bot lifecycle requires BotLibSetup") end if
  return state.botLibSetupFn(state)
end function

/// Set `state.botstates` to `array(MAX_CLIENTS,void)` in `mq3.game.bot_lifecycle.setup`. Return paths include `initLibrary(state) == 0`.
/// @param state Bot lifecycle state; accesses `thinktime`, `memorydump`, `saveroutingcache`, `pause` and `report` and related fields. May update `state.botstates` in place.
/// @param restart Whether initialization or shutdown belongs to a map restart.
function setup(state,restart)
  registerCvar(state,state.thinktime,"bot_thinktime","100",cv.CHEAT)
  registerCvar(state,state.memorydump,"bot_memorydump","0",cv.CHEAT)
  registerCvar(state,state.saveroutingcache,"bot_saveroutingcache","0",cv.CHEAT)
  registerCvar(state,state.pause,"bot_pause","0",cv.CHEAT)
  registerCvar(state,state.report,"bot_report","0",cv.CHEAT)
  registerCvar(state,state.testsolid,"bot_testsolid","0",cv.CHEAT)
  registerCvar(state,state.testclusters,"bot_testclusters","0",cv.CHEAT)
  registerCvar(state,state.developer,"bot_developer","0",cv.CHEAT)
  registerCvar(state,state.interbreedchar,"bot_interbreedchar","",0)
  registerCvar(state,state.interbreedbots,"bot_interbreedbots","10",0)
  registerCvar(state,state.interbreedcycle,"bot_interbreedcycle","20",0)
  registerCvar(state,state.interbreedwrite,"bot_interbreedwrite","",0)
  if restart != 0 then return true end if
  state.botstates = array(MAX_CLIENTS,void)
  return initLibrary(state) == 0
end function

/// Require a bot lifecycle callback and report the missing service by name.
/// @param state Not read by this implementation; retained in the `required` signature.
/// @param callback Callback invoked by this operation.
/// @param label Label retained with the diagnostic or action record.
function required(state,callback,label)
  if callback == void then return error(494,"Bot lifecycle requires "+label) end if
  return callback
end function

/// Update `bot.setupcount`, `bot.checkpoints`, `bot.patrolpoints` and `bot.walker` and related state during `resetState`.
/// @param state Bot lifecycle state; accesses `freeWaypointsFn`, `resetMoveStateFn`, `resetGoalStateFn`, `resetWeaponStateFn` and `resetAvoidGoalsFn` and related fields.
/// @param bot Bot AI state; accesses `checkpoints`, `patrolpoints`, `setupcount`, `walker` and `numKills` and related fields. May update `bot.setupcount`, `bot.checkpoints` and `bot.patrolpoints` and additional fields in place.
function resetState(state,bot)
  if bot == void then return error(494,"Bot reset requires state") end if
  freeFn = required(state,state.freeWaypointsFn,"BotFreeWaypoints")
  freeFn(state,bot.checkpoints); freeFn(state,bot.patrolpoints)
  bot.setupcount = 0; bot.checkpoints = void; bot.patrolpoints = void
  bot.walker = 0.0; bot.numKills = 0; bot.numDeaths = 0; bot.transient = void
  bot.viewangles = [0.0,0.0,0.0]; bot.idealViewangles = [0.0,0.0,0.0]
  bot.viewanglespeed = [0.0,0.0,0.0]; bot.enemy = 0
  bot.teamleader = ""; bot.ltgtype = 0; bot.teammate = 0; bot.teamgoalNumber = 0; bot.teamgoalEntitynum = 0
  bot.inventory = array(204,0); bot.weaponnum = 0; bot.lastEFlags = 0; bot.teleportTime = 0.0; bot.origin = [0.0,0.0,0.0]
  bot.eye = [0.0,0.0,0.0]; bot.aimTarget = [0.0,0.0,0.0]; bot.lastEnemyOrigin = [0.0,0.0,0.0]
  bot.lastHealth = 0; bot.enemySightTime = 0.0; bot.enemySuicide = false; bot.enemyDeathTime = 0.0; bot.enemyVisibleTime = 0.0
  bot.weaponchangeTime = 0.0; bot.firethrottlewaitTime = 0.0; bot.firethrottleshootTime = 0.0; bot.combatFlags = 0
  bot.attackchaseTime = 0.0; bot.lastEnemyAreaNum = 0; bot.attackcrouchTime = 0.0; bot.attackjumpTime = 0.0; bot.attackstrafeTime = 0.0
  bot.enemyOrigin = [0.0,0.0,0.0]; bot.enemyVelocity = [0.0,0.0,0.0]; bot.enemyPositionTime = 0.0
  bot.numteammates = 0; bot.flagcarrier = -1
  bot.ctfstrategy = 0
  bot.aiNode = 0; bot.lastKilledPlayer = -1; bot.standTime = 0.0; bot.lastframeHealth = 0; bot.lastHitCount = 0; bot.chaseTime = 0.0
  bot.checkTime = 0.0; bot.nbgTime = 0.0; bot.killedEnemyTime = 0.0
  bot.standFindEnemyTime=0.0;bot.respawnTime=0.0;bot.respawnChatTime=0.0;bot.respawnWait=false;bot.chatto=0
  if bot.ms != 0 then required(state,state.resetMoveStateFn,"BotResetMoveState")(state,bot.ms) end if
  if bot.gs != 0 then required(state,state.resetGoalStateFn,"BotResetGoalState")(state,bot.gs) end if
  if bot.ws != 0 then required(state,state.resetWeaponStateFn,"BotResetWeaponState")(state,bot.ws) end if
  if bot.gs != 0 then required(state,state.resetAvoidGoalsFn,"BotResetAvoidGoals")(state,bot.gs) end if
  if bot.ms != 0 then required(state,state.resetAvoidReachFn,"BotResetAvoidReach")(state,bot.ms) end if
  return void
end function

/// Use `state.botLibLoadMapFn` and `state.deathmatchSetupFn` to perform `loadMap`.
/// @param state Bot lifecycle state; accesses `botLibLoadMapFn`, `botstates` and `deathmatchSetupFn`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
function loadMap(state,restart)
  if restart == 0 then
    mapname = cv.createVm(); registerCvar(state,mapname,"mapname","",cv.SERVERINFO | cv.ROM)
    if state.botLibLoadMapFn == void then return error(494,"Bot lifecycle requires BotLibLoadMap") end if
    state.botLibLoadMapFn(state,mapname.string)
  end if
  for index = 0 to MAX_CLIENTS-1
    bot = state.botstates[index]
    if bot != void and bot.inuse then resetState(state,bot); bot.setupcount = 4 end if
  end for
  if state.deathmatchSetupFn == void then return error(494,"Bot lifecycle requires BotSetupDeathmatchAI") end if
  state.deathmatchSetupFn(state); return true
end function

/// Use `state.shutdownClientFn` and `state.botLibShutdownFn` to perform `shutdown`.
/// @param state Bot lifecycle state; accesses `botstates`, `shutdownClientFn` and `botLibShutdownFn`.
/// @param restart Whether initialization or shutdown belongs to a map restart.
function shutdown(state,restart)
  if restart != 0 then
    for index = 0 to MAX_CLIENTS-1
      bot = state.botstates[index]
      if bot != void and bot.inuse then
        if state.shutdownClientFn == void then return error(494,"Bot lifecycle requires BotAIShutdownClient") end if
        state.shutdownClientFn(state,bot.client,restart)
      end if
    end for
  else
    if state.botLibShutdownFn == void then return error(494,"Bot lifecycle requires BotLibShutdown") end if
    state.botLibShutdownFn(state)
  end if
  return true
end function

/// Forward `rank` to `mq3.compat.numeric.f32` and return the delegated result.
/// @param bot Bot AI state; accesses `numKills` and `numDeaths`.
function rank(bot)
  // C evaluates the counters as int and then stores the result in float.
  return n.f32(n.add32(n.mul32(bot.numKills,2),n.mul32(bot.numDeaths,-1)))
end function

/// Use `state.saveGoalFn` to perform `writeInterbreeded`.
/// @param state Bot lifecycle state; accesses `botstates` and `saveGoalFn`.
/// @param filename Filename supplied to the configured loader or file service.
function writeInterbreeded(state,filename)
  bestRank = 0.0; bestBot = -1
  for index = 0 to MAX_CLIENTS-1
    bot = state.botstates[index]; value = -1.0
    if bot != void and bot.inuse then value = rank(bot) end if
    if value > bestRank then bestRank = value; bestBot = index end if
  end for
  if bestBot >= 0 then
    if state.saveGoalFn == void then return error(494,"Bot lifecycle requires BotSaveGoalFuzzyLogic") end if
    state.saveGoalFn(state,state.botstates[bestBot].gs,filename)
  end if
  return void
end function

/// Use `state.geneticSelectionFn`, `state.interbreedGoalFn` and `state.mutateGoalFn` to perform `interbreedBots`.
/// @param state Bot lifecycle state; accesses `botstates`, `geneticSelectionFn`, `interbreedGoalFn` and `mutateGoalFn`.
function interbreedBots(state)
  ranks = array(MAX_CLIENTS,-1.0)
  for index = 0 to MAX_CLIENTS-1
    bot = state.botstates[index]
    if bot != void and bot.inuse then ranks[index] = rank(bot) end if
  end for
  if state.geneticSelectionFn == void then return error(494,"Bot lifecycle requires GeneticParentsAndChildSelection") end if
  selection = state.geneticSelectionFn(state,ranks)
  if len(selection) != 4 then return error(494,"Bot genetic selection must return four integers") end if
  if selection[0] != 0 then
    if state.interbreedGoalFn == void then return error(494,"Bot lifecycle requires BotInterbreedGoalFuzzyLogic") end if
    if state.mutateGoalFn == void then return error(494,"Bot lifecycle requires BotMutateGoalFuzzyLogic") end if
    parent1 = selection[1]; parent2 = selection[2]; child = selection[3]
    state.interbreedGoalFn(state,state.botstates[parent1].gs,state.botstates[parent2].gs,state.botstates[child].gs)
    state.mutateGoalFn(state,state.botstates[child].gs,1)
  end if
  for index = 0 to MAX_CLIENTS-1
    bot = state.botstates[index]
    if bot != void and bot.inuse then bot.numKills = 0; bot.numDeaths = 0 end if
  end for
  return void
end function

/// Set `state.interbreedMatchCount` to `n.add32(state.interbreedMatchCount,1)` and `state.interbreedMatchCount` to `0` in `mq3.game.bot_lifecycle.endMatch`. Return paths include `interbreedBots(state)`.
/// @param state Bot lifecycle state; accesses `interbreed`, `interbreedMatchCount`, `interbreedcycle` and `interbreedwrite`. May update `state.interbreedMatchCount` in place.
function endMatch(state)
  if not state.interbreed then return void end if
  state.interbreedMatchCount = n.add32(state.interbreedMatchCount,1)
  if state.interbreedMatchCount < state.interbreedcycle.integer then return void end if
  state.interbreedMatchCount = 0
  updateCvar(state,state.interbreedwrite,"bot_interbreedwrite")
  if state.interbreedwrite.string != "" then
    writeInterbreeded(state,state.interbreedwrite.string)
    setCvar(state,"bot_interbreedwrite","")
  end if
  return interbreedBots(state)
end function
