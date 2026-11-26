// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete ai_dmq3.c file adapter. Existing native combat, inventory,
// navigation and team ports remain the single implementation for their
// functions; this module supplies the remaining game-policy/lifecycle layer.
package mq3.game.bot_deathmatch
import mq3.game.game_headers as headers
import mq3.game.bot_combat_ai as combat
import mq3.game.bot_inventory_ai as inventory
import mq3.game.bot_navigation as navigation
import mq3.game.bot_team_helpers as teams
import mq3.game.bot_lifecycle as lifecycle
import mq3.game.bot_ai_commands as commands
import mq3.game.constants as c
import mq3.shared.info as info
import mq3.compat.numeric as numeric
import mq3.compat.transcendental as trig
import std.string as strings

/// Maximum number of client slots represented by the original game protocol.
const MAX_CLIENTS=64
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
/// Team identifier selecting the red team/category.
const TEAM_RED=1
/// Team identifier selecting the blue team/category.
const TEAM_BLUE=2
/// Bot inventory slot used to read or update health.
const INVENTORY_HEALTH=headers.INVENTORY_HEALTH
/// Bot inventory slot used to read or update teleporter.
const INVENTORY_TELEPORTER=headers.INVENTORY_TELEPORTER
/// Bot inventory slot used to read or update medkit.
const INVENTORY_MEDKIT=headers.INVENTORY_MEDKIT
/// Bot inventory slot used to read or update kamikaze.
const INVENTORY_KAMIKAZE=headers.INVENTORY_KAMIKAZE
/// Bot inventory slot used to read or update invulnerability.
const INVENTORY_INVULNERABILITY=headers.INVENTORY_INVULNERABILITY
/// Bot inventory slot used to read or update environmentsuit.
const INVENTORY_ENVIRONMENTSUIT=headers.INVENTORY_ENVIRONMENTSUIT
/// Bot inventory slot used to read or update neutralflag.
const INVENTORY_NEUTRALFLAG=headers.INVENTORY_NEUTRALFLAG
/// Bot inventory slot used to read or update redcube.
const INVENTORY_REDCUBE=headers.INVENTORY_REDCUBE
/// Bot inventory slot used to read or update bluecube.
const INVENTORY_BLUECUBE=headers.INVENTORY_BLUECUBE
/// Bot inventory slot used to read or update scout.
const INVENTORY_SCOUT=headers.INVENTORY_SCOUT
/// Bot inventory slot used to read or update guard.
const INVENTORY_GUARD=headers.INVENTORY_GUARD
/// Bot inventory slot used to read or update doubler.
const INVENTORY_DOUBLER=headers.INVENTORY_DOUBLER
/// Bot inventory slot used to read or update ammoregen.
const INVENTORY_AMMOREGEN=headers.INVENTORY_AMMOREGEN
/// Network entity-type identifier representing missile.
const ET_MISSILE=3
/// Weapon identifier selecting grenade launcher.
const WP_GRENADE_LAUNCHER=4
/// Weapon identifier selecting prox launcher.
const WP_PROX_LAUNCHER=11
/// Network entity-flag bit indicating dead.
const EF_DEAD=1
/// Network entity-flag bit indicating kamikaze.
const EF_KAMIKAZE=0x100000
/// Collision-contents bit identifying water space or objects.
const CONTENTS_WATER=headers.CONTENTS_WATER
/// Collision-contents bit identifying slime space or objects.
const CONTENTS_SLIME=headers.CONTENTS_SLIME
/// Collision-contents bit identifying lava space or objects.
const CONTENTS_LAVA=headers.CONTENTS_LAVA

/// `Goal` record for bot deathmatch, containing `number`, `entitynum`, `areanum`, `origin` and `mins` and related fields.
struct Goal
  /// Botlib goal number identifying this navigation target.
  number
  /// Entity number associated with the goal used by deathmatch and team-task selection.
  entitynum
  /// AAS area containing the bot or spatial goal.
  areanum
  /// World-space target position of the goal used by deathmatch and team-task selection.
  origin
  /// Lower local bounding-box corner of the goal used by deathmatch and team-task selection.
  mins
  /// Upper local bounding-box corner of the goal used by deathmatch and team-task selection.
  maxs
end struct
/// `Entity` record for bot deathmatch, containing `number`, `valid`, `eType`, `weapon` and `flags` and related fields.
struct Entity
  /// Entity number identifying the tracked game object.
  number
  /// True when this entity slot contains information usable by deathmatch-bot queries.
  valid
  /// Network entity category selected from the ET_* constants.
  eType
  /// Selected or reported weapon identifier.
  weapon
  /// Entity-flag mask supplied by the tracked game or botlib entity state.
  flags
  /// Powerup state or expiration values indexed by PW_* identifiers.
  powerups
  /// Protocol-defined auxiliary entity/player value whose interpretation depends on the game object
  /// type.
  generic1
  /// Entity world-space position used by deathmatch goal and visibility queries.
  origin
  /// Lower local entity bound used by deathmatch model and collision queries.
  mins
  /// Upper local entity bound used by deathmatch model and collision queries.
  maxs
  /// CONTENTS_* mask describing the collision contents of this object or query result.
  contents
  /// Primary model index referenced by the entity snapshot.
  modelindex
  /// Map entity class name used to select a spawn function.
  classname
  /// Transient event identifier associated with the entity or snapshot.
  event
  /// Parameter accompanying the current entity event.
  eventParm
  /// Primary related entity number carried by an entity event or snapshot.
  otherEntityNum
  /// Secondary related entity number carried by an entity event or snapshot.
  otherEntityNum2
  /// Timestamp of the most recently recorded entity event.
  eventTime
end struct
/// `Waypoint` record for bot deathmatch, containing `name`, `origin`, `areanum` and `next`.
struct Waypoint
  /// Name used to refer to this navigation goal or waypoint in bot orders.
  name
  /// World-space position of this waypoint in a bot navigation route.
  origin
  /// AAS area containing the bot or spatial goal.
  areanum
  /// Next waypoint in the linked navigation route.
  next
end struct
/// `LastTask` record for bot deathmatch, containing `valid`, `decisionmaker`, `ltgtype`, `teamgoal` and `teammate`.
struct LastTask
  /// True while a previously ordered bot task is available for restoration.
  valid
  /// Client/entity currently responsible for the bot team decisions.
  decisionmaker
  /// Current long-term goal category selected from the LTG_* constants.
  ltgtype
  /// Navigation goal associated with the bot current team task.
  teamgoal
  /// Teammate entity/client selected for the current cooperative task.
  teammate
end struct
/// `Action` record for bot deathmatch, containing `kind`, `client`, `text`, `value` and `point` and related fields.
struct Action
  /// Discriminator selecting the recorded bot action or decision event.
  kind
  /// Client slot associated with the recorded deathmatch-bot action.
  client
  /// Text payload supplied to the recorded command, chat, or host action.
  text
  /// Numeric/result payload supplied to the recorded host action.
  value
  /// World-space point attached to a navigation or host action.
  point
  /// Nonzero after the action has been delivered to its host callback.
  dispatched
end struct
/// `State` record for bot deathmatch, containing `gametype`, `missionpack`, `maxclients`, `mapname` and `configs` and related fields.
struct State
  /// GT_* game-mode identifier used for deathmatch, team, and capture-the-flag bot task selection.
  gametype
  /// Nonzero when mission-pack rules and content are enabled.
  missionpack
  /// Configured number of client slots active in this game state.
  maxclients
  /// Engine name/path identifier of the active map.
  mapname
  /// Configuration records associated with tracked clients or bot state.
  configs
  /// Registered or selected player skin resources.
  skins
  /// Game entity records indexed by entity number.
  entities
  /// Entity-state records supplied by the current snapshot.
  snapshotEntities
  /// Parsed map entity definitions from the BSP entity lump.
  bspEntities
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
  /// Callbacks and shared state used by bot combat decisions.
  combatServices
  /// Callbacks used to update or query bot inventory values.
  inventoryServices
  /// Callbacks and shared state used for bot navigation decisions.
  navigationServices
  /// Shared bot team-decision state.
  teamState
  /// Callbacks used to deliver or process game commands.
  commandServices
  /// Current clock value supplied to the bot decision step.
  now
  /// Deterministic random input supplied to the current bot decision.
  randomValue
  /// Injected callback for point area; invoked through the State service/state record.
  pointAreaFn
  /// Injected callback for trace areas; invoked through the State service/state record.
  traceAreasFn
  /// Injected callback for visible; invoked through the State service/state record.
  visibleFn
  /// Injected callback for strategy; invoked through the State service/state record.
  strategyFn
  /// Injected callback for deathmatch; invoked through the State service/state record.
  deathmatchFn
  /// Named waypoint records available to navigation and team orders.
  waypoints
  /// Most recently assigned tasks indexed by bot/client.
  lastTasks
  /// Order timestamps indexed by bot/client.
  orderTimes
  /// Most recently consumed event timestamp for each entity.
  entityEventTimes
  /// Corpse entities tracked for kamikaze effects.
  kamikazeBodies
  /// Resource names indexed by registered sound identifier.
  soundNames
  /// Recorded host actions emitted by bot decision logic.
  actions
  /// Injected callback for host action; invoked through the State service/state record.
  hostActionFn
  /// Alternate-route goals used when approaching the red base.
  redAltGoals
  /// Alternate-route goals used when approaching the blue base.
  blueAltGoals
  /// Nonzero after bot/game subsystem setup has completed.
  setup
  /// Largest BSP inline-model index available to bot world queries.
  maxBspModelIndex
  /// Timestamp of the most recently observed teleport.
  lastTeleportTime
  /// Position recorded for the most recently observed teleport.
  lastTeleportOrigin
end struct

/// Create a `mq3.game.bot_deathmatch.Goal` record, initializing `origin` as `[0.0,0.0,0.0]`, `mins` as `[0.0,0.0,0.0]` and `maxs` as `[0.0,0.0,0.0]`.
function goal() return Goal(0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
/// Create a `mq3.game.bot_deathmatch.Entity` record, initializing `number` from `number`, `origin` as `[0.0,0.0,0.0]` and `mins` as `[0.0,0.0,0.0]`.
/// @param number Initial value stored in `mq3.game.bot_deathmatch.Entity.number`.
function entity(number) return Entity(number,false,0,0,0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,"",0,0,0,0,0) end function
/// Create a `mq3.game.bot_deathmatch.Goal` record, initializing `number` as `value.number`, `entitynum` as `value.entitynum` and `areanum` as `value.areanum`.
/// @param value Value record; accesses `number`, `entitynum`, `areanum`, `origin` and `mins` and related fields.
function copyGoal(value) return Goal(value.number,value.entitynum,value.areanum,value.origin+[ ],value.mins+[ ],value.maxs+[ ]) end function
/// Build the `mq3.game.bot_deathmatch.State` result for `create`.
function create()
  values=[];events=[];for i=0 to 1023 values=values+[entity(i)];events=events+[0] end for
  team=teams.create();combatServices=combat.create();inventoryServices=inventory.create();nav=navigation.create()
  return State(0,false,MAX_CLIENTS,"",array(MAX_CLIENTS,""),array(MAX_CLIENTS,""),values,[],[],goal(),goal(),goal(),goal(),goal(),goal(),combatServices,inventoryServices,nav,team,void,0.0,0.0,void,void,void,void,void,[],array(MAX_CLIENTS,LastTask(false,0,0,goal(),0)),array(MAX_CLIENTS,0.0),events,array(MAX_CLIENTS,0),array(256,""),[],void,[],[],false,0,0.0,[0.0,0.0,0.0])
end function
/// Set `state.actions` to `state.actions+[action]` in `mq3.game.bot_deathmatch.emit`. Return paths include `action`.
/// @param state Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param kind Initial value stored in `mq3.game.bot_deathmatch.Action.kind`.
/// @param bot Bot AI state; accesses `client`.
/// @param text Text to parse, format or deliver.
/// @param value Initial value stored in `mq3.game.bot_deathmatch.Action.value`.
/// @param point Three-component point used by the geometric query.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function emit(state,kind,bot,text,value,point,retailActive)
  action=Action(kind,bot.client,text,value,point,not retailActive);state.actions=state.actions+[action]
  if not retailActive and state.hostActionFn!=void then state.hostActionFn(state,action) end if;return action
end function
/// Synchronize combat and team services with the deathmatch game type, client limit and configuration strings.
/// @param state Bot deathmatch state; accesses `combatServices`, `gametype`, `teamState`, `maxclients` and `configs`. May update `state.combatServices.gametype`, `state.teamState.gametype` and `state.teamState.maxclients` and additional fields in place.
function sync(state) state.combatServices.gametype=state.gametype;state.teamState.gametype=state.gametype;state.teamState.maxclients=state.maxclients;state.teamState.configs=state.configs;return void end function
/// Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.team` while evaluating `teamValue`. Return paths include `teams.team(state.teamState,bot)`.
/// @param state Bot deathmatch state; accesses `teamState`.
/// @param bot Bot AI state; accesses `client`.
function teamValue(state,bot) sync(state);return teams.team(state.teamState,bot) end function
/// Calculate squared Euclidean distance between two three-component points without taking a square root.
/// @param a First three-component point.
/// @param b Second three-component point.
function distanceSquared(a,b) x=a[0]-b[0];y=a[1]-b[1];z=a[2]-b[2];return x*x+y*y+z*z end function

// Bot1FCTFCarryingFlag
/// @param state Bot deathmatch state; accesses `gametype`.
/// @param bot Bot AI state; accesses `inventory`.
function bot1FCTFCarryingFlag(state,bot) return state.gametype==GT_1FCTF and bot.inventory[INVENTORY_NEUTRALFLAG]>0 end function
// BotCTFCarryingFlag
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `inventory`.
function botCTFCarryingFlag(state,bot) sync(state);return combat.ctfCarryingFlag(state.combatServices,bot) end function
// BotHarvesterCarryingCubes
/// @param state Bot deathmatch state; accesses `gametype`.
/// @param bot Bot AI state; accesses `inventory`.
function botHarvesterCarryingCubes(state,bot) return state.gametype==GT_HARVESTER and (bot.inventory[INVENTORY_REDCUBE]>0 or bot.inventory[INVENTORY_BLUECUBE]>0) end function
// BotTeam, BotOppositeTeam and BotSameTeam
/// @param state Bot deathmatch state; accesses `teamState`.
/// @param bot Bot AI state; accesses `client`.
function botTeam(state,bot) return teamValue(state,bot) end function
/// Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.oppositeTeam` while evaluating `botOppositeTeam`. Return paths include `teams.oppositeTeam(state.teamState,bot)`.
/// @param state Bot deathmatch state; accesses `teamState`.
/// @param bot Bot AI state; accesses `client`.
function botOppositeTeam(state,bot) sync(state);return teams.oppositeTeam(state.teamState,bot) end function
/// Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.sameTeam` while evaluating `botSameTeam`. Return paths include `teams.sameTeam(state.teamState,bot,entityNumber)`.
/// @param state Bot deathmatch state; accesses `teamState`.
/// @param bot Bot AI state; accesses `client`.
/// @param entityNumber Entity number in the game entity table.
function botSameTeam(state,bot,entityNumber) sync(state);return teams.sameTeam(state.teamState,bot,entityNumber) end function
// BotEnemyFlag and BotTeamFlag
/// @param state Bot deathmatch state; accesses `blueFlag` and `redFlag`.
/// @param bot Bot AI state; accesses `client`.
function botEnemyFlag(state,bot) if teamValue(state,bot)==TEAM_RED then return state.blueFlag end if;return state.redFlag end function
/// Apply `mq3.game.bot_deathmatch.teamValue` while evaluating `botTeamFlag`. Return paths include `state.blueFlag`.
/// @param state Bot deathmatch state; accesses `redFlag` and `blueFlag`.
/// @param bot Bot AI state; accesses `client`.
function botTeamFlag(state,bot) if teamValue(state,bot)==TEAM_RED then return state.redFlag end if;return state.blueFlag end function

// Entity predicates.
/// @param value Entinfo record; accesses `powerups`.
function entityCarriesFlag(value) return combat.entityCarriesFlag(value) end function
/// Test `entityCarriesFlag(value) or (missionpack and (value.powerups&(1<<c.PW_NEUTRALFLAG))!=0)` as the condition for `entityCarriesFlagMode`.
/// @param value Value record; accesses `powerups`.
/// @param missionpack Whether Team Arena rules and definitions are active.
function entityCarriesFlagMode(value,missionpack) return entityCarriesFlag(value) or (missionpack and (value.powerups&(1<<c.PW_NEUTRALFLAG))!=0) end function
/// Forward `entityIsInvisible` to `mq3.game.bot_combat_ai.entityIsInvisible` and return the delegated result.
/// @param value Entinfo record; accesses `powerups`.
function entityIsInvisible(value) return combat.entityIsInvisible(value) end function
/// Forward `entityIsShooting` to `mq3.game.bot_combat_ai.entityIsShooting` and return the delegated result.
/// @param value Entinfo record; accesses `flags`.
function entityIsShooting(value) return combat.entityIsShooting(value) end function
/// Forward `entityIsChatting` to `mq3.game.bot_combat_ai.entityIsChatting` and return the delegated result.
/// @param value Entinfo record; accesses `flags`.
function entityIsChatting(value) return combat.entityIsChatting(value) end function
/// Forward `entityHasQuad` to `mq3.game.bot_combat_ai.entityHasQuad` and return the delegated result.
/// @param value Entinfo record; accesses `powerups`.
function entityHasQuad(value) return combat.entityHasQuad(value) end function
/// Test `(value.flags&EF_KAMIKAZE)!=0` as the condition for `entityHasKamikaze`.
/// @param value Value record; accesses `flags`.
function entityHasKamikaze(value) return (value.flags&EF_KAMIKAZE)!=0 end function
/// Test `state.gametype==GT_HARVESTER and value.generic1>0` as the condition for `entityCarriesCubes`.
/// @param state Bot deathmatch state; accesses `gametype`.
/// @param value Value record; accesses `generic1`.
function entityCarriesCubes(state,value) return state.gametype==GT_HARVESTER and value.generic1>0 end function
/// Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.entityIsDead` while evaluating `entityIsDead`. Return paths include `teams.entityIsDead(state.teamState,value.number)`.
/// @param state Bot deathmatch state; accesses `teamState`.
/// @param value Value record; accesses `number`.
function entityIsDead(state,value) sync(state);return teams.entityIsDead(state.teamState,value.number) end function

// BotSetUserInfo
/// @param state Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param key Lookup key or field name used by the operation.
/// @param value Value used by `botSetUserInfo` in `emit(state,"userinfo",bot,key+"="+value,0,[],retailActive)`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botSetUserInfo(state,bot,key,value,retailActive) emit(state,"userinfo",bot,key+"="+value,0,[],retailActive);return void end function
// BotRememberLastOrderedTask
/// @param state Bot deathmatch state; accesses `lastTasks`. May update `state.lastTasks[bot.client]` in place.
/// @param bot Bot AI state; accesses `ordered`, `client`, `decisionmaker`, `ltgtype` and `teamGoal` and related fields.
function botRememberLastOrderedTask(state,bot)
  if not bot.ordered then return void end if;state.lastTasks[bot.client]=LastTask(true,bot.decisionmaker,bot.ltgtype,copyGoal(bot.teamGoal),bot.teammate);return void
end function
// BotSetTeamStatus
/// @param state Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `ltgtype`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botSetTeamStatus(state,bot,retailActive)
  task=0;if bot.ltgtype==2 then task=1 else if bot.ltgtype==3 then task=2 else if bot.ltgtype==4 or bot.ltgtype==12 or bot.ltgtype==13 then task=3 else if bot.ltgtype==5 then task=2 else if bot.ltgtype==6 then task=4 else if bot.ltgtype==7 or bot.ltgtype==8 then task=5 end if
  botSetUserInfo(state,bot,"teamtask",str(task),retailActive);return task
end function
// BotSetLastOrderedTask
/// @param state Bot deathmatch state; accesses `lastTasks`, `gametype` and `now`. May update `state.lastTasks[bot.client]` in place.
/// @param bot Bot AI state; accesses `client`, `redflagstatus`, `blueflagstatus`, `decisionmaker` and `ordered` and related fields. May update `bot.decisionmaker`, `bot.ordered` and `bot.ltgtype` and additional fields in place.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botSetLastOrderedTask(state,bot,retailActive)
  task=state.lastTasks[bot.client];if not task.valid or task.ltgtype==0 then return false end if
  if state.gametype==GT_CTF and task.ltgtype==6 then if (teamValue(state,bot)==TEAM_RED and bot.redflagstatus==0) or (teamValue(state,bot)==TEAM_BLUE and bot.blueflagstatus==0) then task.valid=false;state.lastTasks[bot.client]=task;return false end if end if
  bot.decisionmaker=task.decisionmaker;bot.ordered=true;bot.ltgtype=task.ltgtype;bot.teamGoal=copyGoal(task.teamgoal);bot.teammate=task.teammate;bot.teamgoalTime=state.now+300.0;botSetTeamStatus(state,bot,retailActive);return true
end function
// BotRefuseOrder
/// @param state Bot deathmatch state; accesses `orderTimes` and `now`. May update `state.orderTimes[bot.client]` in place.
/// @param bot Bot AI state; accesses `client` and `ordered`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botRefuseOrder(state,bot,retailActive) orderTime=state.orderTimes[bot.client];if bot.ordered and orderTime!=0.0 and orderTime>state.now-10.0 then emit(state,"negative",bot,"no",0,[],retailActive);state.orderTimes[bot.client]=0.0;return true end if;return false end function

/// Record or dispatch `"strategy"` actions in `strategicGoal`.
/// @param state Bot deathmatch state; accesses `strategyFn`.
/// @param bot Bot AI state; accesses `client`.
/// @param name Name used to identify the requested entry.
/// @param retreat Value used by `intValue` in `if value then return 1 end if`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function strategicGoal(state,bot,name,retreat,retailActive)
  emit(state,"strategy",bot,name,intValue(retreat),[],retailActive);if state.strategyFn!=void then state.strategyFn(state,bot,name,retreat) end if;return void
end function
/// Convert a truth value to the integer one or zero for game-policy arithmetic.
/// @param value Value used by `intValue` in `if value then return 1 end if`.
function intValue(value) if value then return 1 end if;return 0 end function
/// Forward `botCTFSeekGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `strategyFn`.
/// @param bot Bot AI state; accesses `client`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botCTFSeekGoals(state,bot,retailActive) return strategicGoal(state,bot,"ctf",false,retailActive) end function
/// Forward `botCTFRetreatGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `strategyFn`.
/// @param bot Bot AI state; accesses `client`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botCTFRetreatGoals(state,bot,retailActive) return strategicGoal(state,bot,"ctf",true,retailActive) end function
/// Forward `bot1FCTFSeekGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `strategyFn`.
/// @param bot Bot AI state; accesses `client`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function bot1FCTFSeekGoals(state,bot,retailActive) return strategicGoal(state,bot,"oneflag",false,retailActive) end function
/// Forward `bot1FCTFRetreatGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `strategyFn`.
/// @param bot Bot AI state; accesses `client`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function bot1FCTFRetreatGoals(state,bot,retailActive) return strategicGoal(state,bot,"oneflag",true,retailActive) end function
/// Forward `botObeliskSeekGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `strategyFn`.
/// @param bot Bot AI state; accesses `client`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botObeliskSeekGoals(state,bot,retailActive) return strategicGoal(state,bot,"obelisk",false,retailActive) end function
/// Forward `botObeliskRetreatGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `strategyFn`.
/// @param bot Bot AI state; accesses `client`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botObeliskRetreatGoals(state,bot,retailActive) return strategicGoal(state,bot,"obelisk",true,retailActive) end function
/// Set `bot.ltgtype` to `12` and `bot.teamgoalTime` to `state.now+120.0` in `mq3.game.bot_deathmatch.botGoHarvest`. Return paths include `strategicGoal(state,bot,"harvest",false,retailActive)`.
/// @param state Bot deathmatch state; accesses `now`.
/// @param bot Bot AI state; accesses `ltgtype` and `teamgoalTime`. May update `bot.ltgtype` and `bot.teamgoalTime` in place.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botGoHarvest(state,bot,retailActive) bot.ltgtype=12;bot.teamgoalTime=state.now+120.0;return strategicGoal(state,bot,"harvest",false,retailActive) end function
/// Forward `botHarvesterSeekGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `strategyFn`.
/// @param bot Bot AI state; accesses `client`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botHarvesterSeekGoals(state,bot,retailActive) return strategicGoal(state,bot,"harvester",false,retailActive) end function
/// Forward `botHarvesterRetreatGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `strategyFn`.
/// @param bot Bot AI state; accesses `client`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botHarvesterRetreatGoals(state,bot,retailActive) return strategicGoal(state,bot,"harvester",true,retailActive) end function
// BotTeamGoals
/// @param state Bot deathmatch state; accesses `gametype`.
/// @param bot Bot AI state; accesses `client`.
/// @param retreat Value used by `botTeamGoals` in `if state.gametype==GT_CTF then if retreat then return botCTFRetreatGoals(state,bot,retailActive) end if`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botTeamGoals(state,bot,retreat,retailActive)
  if state.gametype==GT_CTF then if retreat then return botCTFRetreatGoals(state,bot,retailActive) end if;return botCTFSeekGoals(state,bot,retailActive) end if
  if state.gametype==GT_1FCTF then if retreat then return bot1FCTFRetreatGoals(state,bot,retailActive) end if;return bot1FCTFSeekGoals(state,bot,retailActive) end if
  if state.gametype==GT_OBELISK then if retreat then return botObeliskRetreatGoals(state,bot,retailActive) end if;return botObeliskSeekGoals(state,bot,retailActive) end if
  if state.gametype==GT_HARVESTER then if retreat then return botHarvesterRetreatGoals(state,bot,retailActive) end if;return botHarvesterSeekGoals(state,bot,retailActive) end if;return void
end function

// Client and string helpers.
/// @param state Bot deathmatch state; accesses `pointAreaFn` and `traceAreasFn`.
/// @param origin World-space position as three coordinates.
function botPointAreaNum(state,origin) if state.pointAreaFn!=void then area=state.pointAreaFn(state,origin);if area!=0 then return area end if end if;if state.traceAreasFn!=void then values=state.traceAreasFn(state,origin,[origin[0],origin[1],origin[2]+10.0]);if len(values)>0 then return values[0] end if end if;return 0 end function
/// Apply `mq3.game.bot_team_helpers.cleanClientText` and `mq3.shared.info.value` while evaluating `clientName`. Return paths include `teams.cleanClientText(info.value(state.configs[client],"n"))`.
/// @param state Bot deathmatch state; accesses `configs`.
/// @param client Operand used to evaluate the returned expression `teams.cleanClientText(info.value(state.configs[client],"n"))`.
function clientName(state,client) if client<0 or client>=MAX_CLIENTS then return "[client out of range]" end if;return teams.cleanClientText(info.value(state.configs[client],"n")) end function
/// Apply `mq3.shared.info.value` while evaluating `clientSkin`. Return paths include `info.value(state.configs[client],"model")`.
/// @param state Bot deathmatch state; accesses `configs`.
/// @param client Operand used to evaluate the returned expression `info.value(state.configs[client],"model")`.
function clientSkin(state,client) if client<0 or client>=MAX_CLIENTS then return "[client out of range]" end if;return info.value(state.configs[client],"model") end function
/// Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.clientFromName` while evaluating `clientFromName`. Return paths include `teams.clientFromName(state.teamState,name)`.
/// @param state Bot deathmatch state; accesses `teamState`.
/// @param name Name used to identify the requested entry.
function clientFromName(state,name) sync(state);return teams.clientFromName(state.teamState,name) end function
/// Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.clientOnSameTeamFromName` while evaluating `clientOnSameTeamFromName`. Return paths include `teams.clientOnSameTeamFromName(state.teamState,bot,name)`.
/// @param state Bot deathmatch state; accesses `teamState`.
/// @param bot Bot AI state; accesses `client`.
/// @param name Name used to identify the requested entry.
function clientOnSameTeamFromName(state,bot,name) sync(state);return teams.clientOnSameTeamFromName(state.teamState,bot,name) end function
/// Return the result of `strings.indexOf(strings.toLowerAscii(text),strings.toLowerAscii(needle),0)` for `stristr`.
/// @param text Text to parse, format or deliver.
/// @param needle Text or value to search for.
function stristr(text,needle) return strings.indexOf(strings.toLowerAscii(text),strings.toLowerAscii(needle),0) end function
/// Apply `mq3.game.bot_deathmatch.clientName` while evaluating `easyClientName`. Return paths include `decode(bytes(kept))`.
/// @param state Bot deathmatch state; accesses `configs`.
/// @param client Operand used to evaluate the returned expression `teams.cleanClientText(info.value(state.configs[client],"n"))`.
function easyClientName(state,client)
  value=clientName(state,client);value=strings.replaceAll(value," ","");left=strings.indexOf(value,"[",0);right=strings.indexOf(value,"]",0)
  if left>=0 and right>=0 then if right>left then value=strings.substr(value,0,left)+strings.substr(value,right+1,len(value)-right-1) else value=strings.substr(value,0,right)+strings.substr(value,left+1,len(value)-left-1) end if end if
  lower=strings.toLowerAscii(value);if strings.startsWith(lower,"mr") then value=strings.substr(value,2,len(value)-2) end if
  data=bytes(strings.toLowerAscii(value));kept=[];for each ch in data if (ch>=97 and ch<=122) or (ch>=48 and ch<=57) or ch==95 then kept=kept+[ch] end if end for;return decode(bytes(kept))
end function
/// Apply `mq3.game.bot_deathmatch.teamValue` while evaluating `botSynonymContext`. Return paths include `context`.
/// @param state Bot deathmatch state; accesses `gametype`.
/// @param bot Bot AI state; accesses `client`.
function botSynonymContext(state,bot) context=1|2|4;if state.gametype==GT_CTF or state.gametype==GT_1FCTF then if teamValue(state,bot)==TEAM_RED then context=context|8 else context=context|16 end if end if;return context end function

// Existing native inventory/combat/navigation implementations.
/// @param state Bot deathmatch state; accesses `inventoryServices`.
/// @param bot Bot AI state; accesses `curPs`, `client`, `weaponnum`, `ws` and `inventory` and related fields. May update `bot.weaponchangeTime` and `bot.weaponnum` in place.
function botChooseWeapon(state,bot) return inventory.chooseWeapon(state.inventoryServices,bot) end function
/// Forward `botSetupForMovement` to `mq3.game.bot_navigation.setupForMovement` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `curPs`, `entitynum`, `client`, `thinktime` and `viewangles` and related fields.
function botSetupForMovement(state,bot) return navigation.setupForMovement(state.navigationServices,bot) end function
/// Forward `botUpdateBattleInventory` to `mq3.game.bot_inventory_ai.updateBattleInventory` and return the delegated result.
/// @param state Bot deathmatch state; accesses `inventoryServices`.
/// @param bot Bot AI state; accesses `origin` and `inventory`. May update `bot.inventory[ENEMY_HEIGHT]` and `bot.inventory[ENEMY_HORIZONTAL_DIST]` in place.
/// @param enemy Value passed as argument 2 to `services.entityInfoFn`.
function botUpdateBattleInventory(state,bot,enemy) return inventory.updateBattleInventory(state.inventoryServices,bot,enemy) end function
/// Forward `botUpdateInventory` to `mq3.game.bot_inventory_ai.updateInventory` and return the delegated result.
/// @param state Bot deathmatch state; accesses `inventoryServices`.
/// @param bot Bot AI state; accesses `inventory` and `curPs`. May update `bot.inventory[INVENTORY_ARMOR]`, `bot.inventory[INVENTORY_GAUNTLET]` and `bot.inventory[INVENTORY_SHOTGUN]` and additional fields in place.
function botUpdateInventory(state,bot) return inventory.updateInventory(state.inventoryServices,bot) end function
/// Record or dispatch `"item-pickup-check"` actions in `botCheckItemPickup`.
/// @param state Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param oldInventory Sequence whose length bounds the iteration or lookup in `botCheckItemPickup`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botCheckItemPickup(state,bot,oldInventory,retailActive) emit(state,"item-pickup-check",bot,"",len(oldInventory),[],retailActive);return void end function
/// Record or dispatch `"use-item"` actions in `botBattleUseItems`. Return paths include `used`.
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `inventory`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botBattleUseItems(state,bot,retailActive)
  used=false;if bot.inventory[INVENTORY_HEALTH]<40 and bot.inventory[INVENTORY_TELEPORTER]>0 and botCTFCarryingFlag(state,bot)==0 and not bot1FCTFCarryingFlag(state,bot) and not botHarvesterCarryingCubes(state,bot) then emit(state,"use-item",bot,"teleporter",0,[],retailActive);used=true end if
  if bot.inventory[INVENTORY_HEALTH]<60 and bot.inventory[INVENTORY_MEDKIT]>0 then emit(state,"use-item",bot,"medkit",0,[],retailActive);used=true end if;return used
end function
/// Record or dispatch `"use-item"` actions in `botUseKamikaze`.
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `inventory`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botUseKamikaze(state,bot,retailActive) if bot.inventory[INVENTORY_KAMIKAZE]<=0 then return false end if;if botCTFCarryingFlag(state,bot)!=0 or bot1FCTFCarryingFlag(state,bot) or botHarvesterCarryingCubes(state,bot) then return false end if;emit(state,"use-item",bot,"kamikaze",0,[],retailActive);return true end function
/// Record or dispatch `"use-item"` actions in `botUseInvulnerability`.
/// @param state Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `inventory`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botUseInvulnerability(state,bot,retailActive) if bot.inventory[INVENTORY_INVULNERABILITY]<=0 then return false end if;emit(state,"use-item",bot,"invulnerability",0,[],retailActive);return true end function
/// Set `state.combatServices.floatTimeFn` to `nowFn` and `state.combatServices.context` to `state` in `mq3.game.bot_deathmatch.botSetTeleportTime`. Return paths include `combat.setTeleportTime(state.combatServices,bot)`.
/// @param state Bot deathmatch state; accesses `combatServices`. May update `state.combatServices.floatTimeFn` and `state.combatServices.context` in place.
/// @param bot Bot AI state; accesses `curPs`, `lastEFlags` and `teleportTime`. May update `bot.teleportTime` and `bot.lastEFlags` in place.
function botSetTeleportTime(state,bot) state.combatServices.floatTimeFn=nowFn;state.combatServices.context=state;return combat.setTeleportTime(state.combatServices,bot) end function
/// Return `services.context.now` for `nowFn`.
/// @param services Host service callbacks; accesses `context`.
function nowFn(services) return services.context.now end function
/// Forward `botIsDead` to `mq3.game.bot_combat_ai.isDead` and return the delegated result.
/// @param state Not read by this implementation; retained in the `botIsDead` signature.
/// @param bot Bot AI state; accesses `curPs`.
function botIsDead(state,bot) return combat.isDead(bot) end function
/// Test `bot.curPs.pm_type==c.PM_SPECTATOR` as the condition for `botIsObserver`.
/// @param state Not read by this implementation; retained in the `botIsObserver` signature.
/// @param bot Bot AI state; accesses `curPs`.
function botIsObserver(state,bot) return bot.curPs.pm_type==c.PM_SPECTATOR end function
/// Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_combat_ai.intermission` while evaluating `botIntermission`. Return paths include `combat.intermission(state.combatServices,bot)`.
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `curPs`.
function botIntermission(state,bot) sync(state);return combat.intermission(state.combatServices,bot) end function
/// Forward `botInLavaOrSlime` to `mq3.game.bot_combat_ai.inLavaOrSlime` and return the delegated result.
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `origin`.
function botInLavaOrSlime(state,bot) return combat.inLavaOrSlime(state.combatServices,bot) end function

// Waypoint pool/lifecycle.
/// @param state Bot deathmatch state; accesses `waypoints`. May update `state.waypoints` in place.
function botInitWaypoints(state) state.waypoints=[];return 0 end function
/// Set `state.waypoints` to `[value]+state.waypoints` in `mq3.game.bot_deathmatch.botCreateWayPoint`.
/// @param state Bot deathmatch state; accesses `waypoints`. May update `state.waypoints` in place.
/// @param name Name used to identify the requested entry.
/// @param origin World-space position as three coordinates.
/// @param areanum AAS area number; zero denotes no area.
function botCreateWayPoint(state,name,origin,areanum) value=Waypoint(name,origin+[ ],areanum,void);state.waypoints=[value]+state.waypoints;return value end function
/// Find a waypoint by ASCII case-insensitive name and return void when absent.
/// @param state Not read by this implementation; retained in the `botFindWayPoint` signature.
/// @param waypoints Value used by `botFindWayPoint` in `for each item in waypoints if strings.toLowerAscii(item.name)==wanted then return item end if end for`.
/// @param name Name used to identify the requested entry.
function botFindWayPoint(state,waypoints,name) wanted=strings.toLowerAscii(name);for each item in waypoints if strings.toLowerAscii(item.name)==wanted then return item end if end for;return void end function
/// Set `state.waypoints` to `[]` in `mq3.game.bot_deathmatch.botFreeWaypoints`.
/// @param state Bot deathmatch state; accesses `waypoints`. May update `state.waypoints` in place.
/// @param waypoints Value used by `botFreeWaypoints` in `state.waypoints=[]`.
function botFreeWaypoints(state,waypoints) state.waypoints=[];return void end function
/// Test `state.gametype>=GT_TEAM` as the condition for `teamPlayIsOn`.
/// @param state Bot deathmatch state; accesses `gametype`.
function teamPlayIsOn(state) return state.gametype>=GT_TEAM end function
/// Forward `botAggression` to `mq3.game.bot_combat_ai.aggression` and return the delegated result.
/// @param state Not read by this implementation; retained in the `botAggression` signature.
/// @param bot Bot AI state; accesses `inventory` and `weaponnum`.
function botAggression(state,bot) return combat.aggression(bot) end function
/// Forward `botFeelingBad` to `mq3.game.bot_combat_ai.feelingBad` and return the delegated result.
/// @param state Not read by this implementation; retained in the `botFeelingBad` signature.
/// @param bot Bot AI state; accesses `weaponnum` and `inventory`.
function botFeelingBad(state,bot) return combat.feelingBad(bot) end function
/// Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_combat_ai.wantsToRetreat` while evaluating `botWantsToRetreat`. Return paths include `combat.wantsToRetreat(state.combatServices,bot)`.
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `enemy` and `ltgtype`.
function botWantsToRetreat(state,bot) sync(state);return combat.wantsToRetreat(state.combatServices,bot) end function
/// Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_combat_ai.wantsToChase` while evaluating `botWantsToChase`. Return paths include `combat.wantsToChase(state.combatServices,bot)`.
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `enemy` and `ltgtype`.
function botWantsToChase(state,bot) sync(state);return combat.wantsToChase(state.combatServices,bot) end function
/// Return `true` for `botWantsToHelp`.
/// @param state Not read by this implementation; retained in the `botWantsToHelp` signature.
/// @param bot Not read by this implementation; retained in the `botWantsToHelp` signature.
function botWantsToHelp(state,bot) return true end function
/// Forward `botCanAndWantsToRocketJump` to `mq3.game.bot_combat_ai.canAndWantsToRocketJump` and return the delegated result.
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `inventory` and `character`.
function botCanAndWantsToRocketJump(state,bot) return combat.canAndWantsToRocketJump(state.combatServices,bot) end function
/// Check whether health, armor, powerup and ammunition reserves support an aggressive bot task.
/// @param state Bot deathmatch state; accesses `missionpack`.
/// @param bot Bot AI state; accesses `inventory`.
function botHasPersistantPowerupAndWeapon(state,bot)
  inv=bot.inventory;if state.missionpack and inv[INVENTORY_SCOUT]==0 and inv[INVENTORY_GUARD]==0 and inv[INVENTORY_DOUBLER]==0 and inv[INVENTORY_AMMOREGEN]==0 then return false end if
  if inv[INVENTORY_HEALTH]<60 or (inv[INVENTORY_HEALTH]<80 and inv[1]<40) then return false end if
  if inv[13]>0 and inv[25]>7 then return true end if;if inv[10]>0 and inv[24]>5 then return true end if;if inv[9]>0 and inv[22]>50 then return true end if;if inv[8]>0 and inv[23]>5 then return true end if
  if state.missionpack and ((inv[15]>0 and inv[26]>5) or (inv[16]>0 and inv[27]>5) or (inv[17]>0 and inv[28]>40)) then return true end if
  return inv[11]>0 and inv[21]>20
end function
/// Forward `botGoCamp` to `mq3.game.bot_navigation.goCamp` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `decisionmaker`, `client`, `teammessageTime`, `ltgtype` and `teamGoal` and related fields. May update `bot.decisionmaker`, `bot.teammessageTime` and `bot.ltgtype` and additional fields in place.
/// @param value Bot navigation goal; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields.
function botGoCamp(state,bot,value) return navigation.goCamp(state.navigationServices,bot,value) end function
/// Forward `botWantsToCamp` to `mq3.game.bot_navigation.wantsToCamp` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `character`, `ltgtype`, `campTime`, `inventory` and `areanum` and related fields. May update `bot.campTime` and `bot.ordered` in place.
function botWantsToCamp(state,bot) return navigation.wantsToCamp(state.navigationServices,bot) end function
/// Forward `botDontAvoid` to `mq3.game.bot_navigation.dontAvoid` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `gs`.
/// @param name Name used to identify the requested entry.
function botDontAvoid(state,bot,name) return navigation.dontAvoid(state.navigationServices,bot,name) end function
/// Forward `botGoForPowerups` to `mq3.game.bot_navigation.goForPowerups` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `ltgTime`. May update `bot.ltgTime` in place.
function botGoForPowerups(state,bot) return navigation.goForPowerups(state.navigationServices,bot) end function
/// Choose a point one hundred units around the bot using the supplied random angle while preserving its height.
/// @param state Bot deathmatch state; accesses `randomValue`.
/// @param bot Bot AI state; accesses `origin`.
function botRoamGoal(state,bot) angle=state.randomValue*6.283185307;return [bot.origin[0]+100.0*trig.cos(angle),bot.origin[1]+100.0*trig.sin(angle),bot.origin[2]] end function
/// Forward `botAttackMove` to `mq3.game.bot_combat_ai.attackMove` and return the delegated result.
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `enemy`, `attackchaseTime`, `lastEnemyAreaNum`, `lastEnemyOrigin` and `ms` and related fields. May update `bot.attackcrouchTime`, `bot.attackjumpTime` and `bot.attackstrafeTime` and additional fields in place.
/// @param tfl Bit mask of permitted AAS travel modes and area restrictions.
function botAttackMove(state,bot,tfl) return combat.attackMove(state.combatServices,bot,tfl) end function
/// Use `state.visibleFn` to perform `botEntityVisible`. Return paths include `0.0`.
/// @param state Bot deathmatch state; accesses `visibleFn` and `entities`.
/// @param viewer Entity number ignored by the visibility trace.
/// @param eye Value passed as argument 3 to `state.visibleFn`.
/// @param viewangles Value passed as argument 4 to `state.visibleFn`.
/// @param fov Value passed as argument 5 to `state.visibleFn`.
/// @param ent Value passed as argument 6 to `state.visibleFn`.
function botEntityVisible(state,viewer,eye,viewangles,fov,ent) if state.visibleFn!=void then return state.visibleFn(state,viewer,eye,viewangles,fov,ent) end if;if ent>=0 and ent<len(state.entities) and state.entities[ent].valid then return 1.0 end if;return 0.0 end function
/// Forward `botFindEnemy` to `mq3.game.bot_combat_ai.findEnemy` and return the delegated result.
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `character`, `lastHealth`, `inventory`, `origin` and `client` and related fields. May update `bot.lastHealth`, `bot.enemy` and `bot.enemySightTime` and additional fields in place.
/// @param curenemy Value passed as argument 2 to `services.entityInfoFn`.
function botFindEnemy(state,bot,curenemy) return combat.findEnemy(state.combatServices,bot,curenemy) end function
/// Apply `mq3.game.bot_deathmatch.botEntityVisible`, `mq3.game.bot_deathmatch.botSameTeam` and `mq3.game.bot_deathmatch.entityCarriesFlagMode` while evaluating `carrierVisible`. Return paths include `-1`.
/// @param state Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`.
/// @param bot Bot AI state; accesses `client`, `entitynum`, `eye` and `viewangles`.
/// @param teamCarrier Value used by `carrierVisible` in `if carrying and same==teamCarrier then return i end if end if end for`.
/// @param cubes Value used by `carrierVisible` in `if cubes then carrying=entityCarriesCubes(state,state.entities[i]) end if`.
function carrierVisible(state,bot,teamCarrier,cubes)
  for i=0 to state.maxclients-1 if i!=bot.client and state.entities[i].valid and botEntityVisible(state,bot.entitynum,bot.eye,bot.viewangles,360.0,i)>0.0 then same=botSameTeam(state,bot,i);carrying=entityCarriesFlagMode(state.entities[i],state.missionpack);if cubes then carrying=entityCarriesCubes(state,state.entities[i]) end if;if carrying and same==teamCarrier then return i end if end if end for;return -1
end function
/// Forward `botTeamFlagCarrierVisible` to `mq3.game.bot_deathmatch.carrierVisible` and return the delegated result.
/// @param state Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`.
/// @param bot Bot AI state; accesses `client`, `entitynum`, `eye` and `viewangles`.
function botTeamFlagCarrierVisible(state,bot) return carrierVisible(state,bot,true,false) end function
/// Apply `mq3.game.bot_deathmatch.botSameTeam` and `mq3.game.bot_deathmatch.entityCarriesFlagMode` while evaluating `botTeamFlagCarrier`. Return paths include `-1`.
/// @param state Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`.
/// @param bot Bot AI state; accesses `client`.
function botTeamFlagCarrier(state,bot) for i=0 to state.maxclients-1 if botSameTeam(state,bot,i) and entityCarriesFlagMode(state.entities[i],state.missionpack) then return i end if end for;return -1 end function
/// Forward `botEnemyFlagCarrierVisible` to `mq3.game.bot_deathmatch.carrierVisible` and return the delegated result.
/// @param state Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`.
/// @param bot Bot AI state; accesses `client`, `entitynum`, `eye` and `viewangles`.
function botEnemyFlagCarrierVisible(state,bot) return carrierVisible(state,bot,false,false) end function
/// Apply `mq3.game.bot_deathmatch.distanceSquared`, `mq3.game.bot_deathmatch.botEntityVisible` and `mq3.game.bot_deathmatch.botSameTeam` while evaluating `botVisibleTeamMatesAndEnemies`. Return paths include `[teammates,enemies]`.
/// @param state Bot deathmatch state; accesses `maxclients` and `entities`.
/// @param bot Bot AI state; accesses `client`, `origin`, `entitynum`, `eye` and `viewangles`.
/// @param range Value used by `botVisibleTeamMatesAndEnemies` in `for i=0 to state.maxclients-1 if i!=bot.client and state.entities[i].valid and distanceSquared(bot.origin,state....`.
function botVisibleTeamMatesAndEnemies(state,bot,range)
  teammates=0;enemies=0;for i=0 to state.maxclients-1 if i!=bot.client and state.entities[i].valid and distanceSquared(bot.origin,state.entities[i].origin)<range*range and botEntityVisible(state,bot.entitynum,bot.eye,bot.viewangles,360.0,i)>0.0 then if botSameTeam(state,bot,i) then teammates=teammates+1 else enemies=enemies+1 end if end if end for;return [teammates,enemies]
end function
/// Forward `botTeamCubeCarrierVisible` to `mq3.game.bot_deathmatch.carrierVisible` and return the delegated result.
/// @param state Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`.
/// @param bot Bot AI state; accesses `client`, `entitynum`, `eye` and `viewangles`.
function botTeamCubeCarrierVisible(state,bot) return carrierVisible(state,bot,true,true) end function
/// Forward `botEnemyCubeCarrierVisible` to `mq3.game.bot_deathmatch.carrierVisible` and return the delegated result.
/// @param state Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`.
/// @param bot Bot AI state; accesses `client`, `entitynum`, `eye` and `viewangles`.
function botEnemyCubeCarrierVisible(state,bot) return carrierVisible(state,bot,false,true) end function
/// Forward `botAimAtEnemy` to `mq3.game.bot_combat_ai.aimAtEnemy` and return the delegated result.
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `enemy`, `aimTarget`, `idealViewangles`, `eye` and `character` and related fields. May update `bot.aimTarget` and `bot.idealViewangles` in place.
function botAimAtEnemy(state,bot) return combat.aimAtEnemy(state.combatServices,bot) end function
/// Forward `botCheckAttack` to `mq3.game.bot_combat_ai.checkAttack` and return the delegated result.
/// @param state Bot deathmatch state; accesses `combatServices`.
/// @param bot Bot AI state; accesses `enemy`, `character`, `enemySightTime`, `teleportTime` and `weaponchangeTime` and related fields. May update `bot.firethrottlewaitTime`, `bot.firethrottleshootTime` and `bot.combatFlags` in place.
function botCheckAttack(state,bot) return combat.checkAttack(state.combatServices,bot) end function

// Map, movers and activation.
/// @param state Bot deathmatch state; accesses `mapname`.
/// @param bot Bot AI state; accesses `tfl`. May update `bot.tfl` in place.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botMapScripts(state,bot,retailActive) if strings.toLowerAscii(state.mapname)=="q3tourney6" or strings.toLowerAscii(state.mapname)=="mpq3tourney6" then bot.tfl=bot.tfl&(~0x200000);emit(state,"map-script",bot,state.mapname,0,[],retailActive);return true end if;return false end function
/// Forward `botSetMovedir` to `mq3.game.bot_navigation.setMovedir` and return the delegated result.
/// @param angles Pitch, yaw and roll angles in degrees.
function botSetMovedir(angles) return navigation.setMovedir(angles) end function
/// Find a matching model entity and return its number and world-space bounding box, or an empty result when absent.
/// @param state Bot deathmatch state; accesses `entities`.
/// @param modelindex Value used by `botModelMinsMaxs` in `for each value in state.entities if value.valid and value.modelindex==modelindex and (eType==0 or value.eType==e...`.
/// @param eType Value used by `botModelMinsMaxs` in `for each value in state.entities if value.valid and value.modelindex==modelindex and (eType==0 or value.eType==e...`.
/// @param contents Value used by `botModelMinsMaxs` in `for each value in state.entities if value.valid and value.modelindex==modelindex and (eType==0 or value.eType==e...`.
function botModelMinsMaxs(state,modelindex,eType,contents)
  for each value in state.entities if value.valid and value.modelindex==modelindex and (eType==0 or value.eType==eType) and (contents==0 or value.contents==contents) then return [value.number,[value.origin[0]+value.mins[0],value.origin[1]+value.mins[1],value.origin[2]+value.mins[2]],[value.origin[0]+value.maxs[0],value.origin[1]+value.maxs[1],value.origin[2]+value.maxs[2]]] end if end for;return [0,[0.0,0.0,0.0],[0.0,0.0,0.0]]
end function
/// Forward `botFuncButtonActivateGoal` to `mq3.game.bot_navigation.getActivateGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `areanum`, `origin` and `tfl`.
/// @param bspent Value used by `getActivateGoal` in `info=need(services.entityInfoFn,"BotEntityInfo")(services,entitynum)`.
/// @param activategoal Activategoal record; accesses `numareas` and `areas`. May update `activategoal.areas` and `activategoal.numareas` in place.
function botFuncButtonActivateGoal(state,bot,bspent,activategoal) return navigation.getActivateGoal(state.navigationServices,bot,bspent,activategoal) end function
/// Forward `botFuncDoorActivateGoal` to `mq3.game.bot_navigation.getActivateGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `areanum`, `origin` and `tfl`.
/// @param bspent Value used by `getActivateGoal` in `info=need(services.entityInfoFn,"BotEntityInfo")(services,entitynum)`.
/// @param activategoal Activategoal record; accesses `numareas` and `areas`. May update `activategoal.areas` and `activategoal.numareas` in place.
function botFuncDoorActivateGoal(state,bot,bspent,activategoal) return navigation.getActivateGoal(state.navigationServices,bot,bspent,activategoal) end function
/// Forward `botTriggerMultipleActivateGoal` to `mq3.game.bot_navigation.getActivateGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `areanum`, `origin` and `tfl`.
/// @param bspent Value used by `getActivateGoal` in `info=need(services.entityInfoFn,"BotEntityInfo")(services,entitynum)`.
/// @param activategoal Activategoal record; accesses `numareas` and `areas`. May update `activategoal.areas` and `activategoal.numareas` in place.
function botTriggerMultipleActivateGoal(state,bot,bspent,activategoal) return navigation.getActivateGoal(state.navigationServices,bot,bspent,activategoal) end function
/// Forward `botGetActivateGoal` to `mq3.game.bot_navigation.getActivateGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `areanum`, `origin` and `tfl`.
/// @param entitynum Value used by `getActivateGoal` in `info=need(services.entityInfoFn,"BotEntityInfo")(services,entitynum)`.
/// @param activategoal Activategoal record; accesses `numareas` and `areas`. May update `activategoal.areas` and `activategoal.numareas` in place.
function botGetActivateGoal(state,bot,entitynum,activategoal) return navigation.getActivateGoal(state.navigationServices,bot,entitynum,activategoal) end function
/// Forward `botPopFromActivateGoalStack` to `mq3.game.bot_navigation.popActivateGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `activateStackIndex` and `activateGoalHeap`. May update `bot.activateStackIndex` in place.
function botPopFromActivateGoalStack(state,bot) return navigation.popActivateGoal(state.navigationServices,bot) end function
/// Forward `botPushOntoActivateGoalStack` to `mq3.game.bot_navigation.pushActivateGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `activateGoalHeap` and `activateStackIndex`. May update `bot.activateGoalHeap[best]` and `bot.activateStackIndex` in place.
/// @param activategoal Parser source state; accesses `goal`, `areas`, `inuse`, `time` and `startTime` and related fields.
function botPushOntoActivateGoalStack(state,bot,activategoal) return navigation.pushActivateGoal(state.navigationServices,bot,activategoal) end function
/// Forward `botClearActivateGoalStack` to `mq3.game.bot_navigation.clearActivateGoalStack` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `activateStackIndex`.
function botClearActivateGoalStack(state,bot) return navigation.clearActivateGoalStack(state.navigationServices,bot) end function
/// Forward `botEnableActivateGoalAreas` to `mq3.game.bot_navigation.enableActivateGoalAreas` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param activategoal Activategoal record; accesses `areasdisabled`, `numareas` and `areas`. May update `activategoal.areasdisabled` in place.
/// @param enable Value used by `enableActivateGoalAreas` in `disabled=not enable`.
function botEnableActivateGoalAreas(state,activategoal,enable) return navigation.enableActivateGoalAreas(state.navigationServices,activategoal,enable) end function
/// Forward `botIsGoingToActivateEntity` to `mq3.game.bot_navigation.isGoingToActivateEntity` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `activateStackIndex` and `activateGoalHeap`.
/// @param entitynum Value used by `isGoingToActivateEntity` in `if goal.time>=need(services.floatTimeFn,"FloatTime")(services) and goal.goal.entitynum==entitynum then return tr...`.
function botIsGoingToActivateEntity(state,bot,entitynum) return navigation.isGoingToActivateEntity(state.navigationServices,bot,entitynum) end function
/// Forward `botGoForActivateGoal` to `mq3.game.bot_navigation.goForActivateGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `activateGoalHeap` and `activateStackIndex`. May update `bot.activateGoalHeap[best]` and `bot.activateStackIndex` in place.
/// @param activategoal Activategoal record; accesses `inuse`, `time`, `startTime`, `goal` and `origin`. May update `activategoal.inuse`, `activategoal.time` and `activategoal.startTime` and additional fields in place.
function botGoForActivateGoal(state,bot,activategoal) return navigation.goForActivateGoal(state.navigationServices,bot,activategoal) end function
/// Record or dispatch `"activate-info"` actions in `botPrintActivateGoalInfo`.
/// @param state Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param activategoal Activategoal record; accesses `goal`.
/// @param bspent Value passed as argument 1 to `str`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botPrintActivateGoalInfo(state,bot,activategoal,bspent,retailActive) emit(state,"activate-info",bot,str(bspent),activategoal.goal.entitynum,activategoal.goal.origin,retailActive);return void end function
/// Forward `botRandomMove` to `mq3.game.bot_navigation.randomMove` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `ms`.
/// @param moveresult Moveresult record; accesses `failure` and `movedir`. May update `moveresult.failure` and `moveresult.movedir` in place.
function botRandomMove(state,bot,moveresult) return navigation.randomMove(state.navigationServices,bot,moveresult) end function
/// Record or dispatch `"blocked"` actions in `botAIBlocked`.
/// @param state Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param moveresult Moveresult record; accesses `failure` and `movedir`.
/// @param activate Initial value stored in `mq3.game.bot_deathmatch.Action.value`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botAIBlocked(state,bot,moveresult,activate,retailActive) if not moveresult.failure then return false end if;emit(state,"blocked",bot,"",activate,moveresult.movedir,retailActive);return true end function
/// Forward `botAIPredictObstacles` to `mq3.game.bot_navigation.predictObstacles` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `predictobstaclesGoalareanum`, `predictobstaclesTime`, `areanum`, `origin` and `tfl`. May update `bot.predictobstaclesGoalareanum` and `bot.predictobstaclesTime` in place.
/// @param value Bot navigation goal; accesses `areanum` and `entitynum`.
function botAIPredictObstacles(state,bot,value) return navigation.predictObstacles(state.navigationServices,bot,value,true) end function

// Console/snapshot event layer.
/// @param state Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botCheckConsoleMessages(state,bot,retailActive) emit(state,"console-check",bot,"",0,[],retailActive);return void end function
/// Record or dispatch `"avoid-spot"` actions in `botCheckForGrenades`.
/// @param state Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param value Value record; accesses `eType`, `weapon` and `origin`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botCheckForGrenades(state,bot,value,retailActive) if value.eType!=ET_MISSILE or value.weapon!=WP_GRENADE_LAUNCHER then return false end if;emit(state,"avoid-spot",bot,"grenade",160,value.origin,retailActive);return true end function
/// Record or dispatch `"avoid-spot"` actions in `botCheckForProxMines`.
/// @param state Bot deathmatch state; accesses `teamState`.
/// @param bot Bot AI state; accesses `inventory`.
/// @param value Value record; accesses `eType`, `weapon`, `generic1` and `origin`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botCheckForProxMines(state,bot,value,retailActive)
  if value.eType!=ET_MISSILE or value.weapon!=WP_PROX_LAUNCHER or value.generic1==teamValue(state,bot) then return false end if
  armed=(bot.inventory[11]>0 and bot.inventory[21]>0) or (bot.inventory[8]>0 and bot.inventory[23]>0) or (bot.inventory[13]>0 and bot.inventory[25]>0);if not armed then return false end if
  emit(state,"avoid-spot",bot,"proxmine",160,value.origin,retailActive);return true
end function
/// Set `state.kamikazeBodies[bot.client]` to `value.number` in `mq3.game.bot_deathmatch.botCheckForKamikazeBody`.
/// @param state Bot deathmatch state; accesses `kamikazeBodies`. May update `state.kamikazeBodies[bot.client]` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param value Value record; accesses `flags` and `number`.
function botCheckForKamikazeBody(state,bot,value) if (value.flags&EF_KAMIKAZE)!=0 and (value.flags&EF_DEAD)!=0 then state.kamikazeBodies[bot.client]=value.number;return true end if;return false end function
/// Record or dispatch `"obituary-death"`, `"obituary-kill"` and `"event"` actions in `botCheckEvents`.
/// @param state Bot deathmatch state; accesses `entityEventTimes`, `now`, `lastTeleportOrigin` and `lastTeleportTime`. May update `state.entityEventTimes[value.number]`, `state.lastTeleportOrigin` and `state.lastTeleportTime` in place.
/// @param bot Bot AI state; accesses `client`, `numDeaths`, `lastKilledPlayer`, `killedEnemyTime` and `numKills` and related fields. May update `bot.numDeaths`, `bot.lastKilledPlayer` and `bot.killedEnemyTime` and additional fields in place.
/// @param value Value record; accesses `number`, `eventTime`, `event`, `otherEntityNum` and `otherEntityNum2` and related fields.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botCheckEvents(state,bot,value,retailActive)
  if value.number<0 or value.number>=len(state.entityEventTimes) or state.entityEventTimes[value.number]==value.eventTime then return false end if;state.entityEventTimes[value.number]=value.eventTime
  if value.event==1 then target=value.otherEntityNum;attacker=value.otherEntityNum2;if target==bot.client then bot.numDeaths=bot.numDeaths+1;emit(state,"obituary-death",bot,str(attacker),value.eventParm,[],retailActive) else if attacker==bot.client then bot.lastKilledPlayer=target;bot.killedEnemyTime=state.now;bot.numKills=bot.numKills+1;emit(state,"obituary-kill",bot,str(target),value.eventParm,[],retailActive) else if attacker==bot.enemy and target==attacker then bot.enemySuicide=true end if
  else if value.event==2 then state.lastTeleportOrigin=value.origin+[ ];state.lastTeleportTime=state.now
  else emit(state,"event",bot,"",value.event,value.origin,retailActive) end if;return true
end function
/// Record or dispatch `"avoid-clear"` actions in `botCheckSnapshot`. Return paths include `count`.
/// @param state Bot deathmatch state; accesses `kamikazeBodies` and `snapshotEntities`. May update `state.kamikazeBodies[bot.client]` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botCheckSnapshot(state,bot,retailActive)
  emit(state,"avoid-clear",bot,"",0,[0.0,0.0,0.0],retailActive);state.kamikazeBodies[bot.client]=0;count=0
  for each value in state.snapshotEntities botCheckEvents(state,bot,value,retailActive);botCheckForGrenades(state,bot,value,retailActive);botCheckForProxMines(state,bot,value,retailActive);botCheckForKamikazeBody(state,bot,value);count=count+1 end for;return count
end function
/// Set `bot.lastairTime` to `state.now` in `mq3.game.bot_deathmatch.botCheckAir`.
/// @param state Bot deathmatch state; accesses `combatServices` and `now`.
/// @param bot Bot AI state; accesses `inventory`, `eye` and `lastairTime`. May update `bot.lastairTime` in place.
function botCheckAir(state,bot) if bot.inventory[INVENTORY_ENVIRONMENTSUIT]<=0 and state.combatServices.pointContentsFn!=void and (state.combatServices.pointContentsFn(state.combatServices,bot.eye)&(CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA))!=0 then return false end if;bot.lastairTime=state.now;return true end function
/// Forward `botAlternateRoute` to `mq3.game.bot_navigation.alternateRoute` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `altRouteGoal`, `reachedAltRouteGoalTime`, `areanum`, `origin` and `tfl`. May update `bot.reachedAltRouteGoalTime` in place.
/// @param value Target record; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. May update `value.areanum`, `value.entitynum` and `value.origin` and additional fields in place.
function botAlternateRoute(state,bot,value) return navigation.alternateRoute(state.navigationServices,bot,value) end function
/// Forward `botGetAlternateRouteGoal` to `mq3.game.bot_navigation.getAlternateRouteGoal` and return the delegated result.
/// @param state Bot deathmatch state; accesses `navigationServices`, `redAltGoals` and `blueAltGoals`.
/// @param bot Bot AI state; accesses `altRouteGoal` and `reachedAltRouteGoalTime`. May update `bot.altRouteGoal` and `bot.reachedAltRouteGoalTime` in place.
/// @param base Value used by `getAlternateRouteGoal` in `if base==TEAM_RED then goals=redGoals end if`.
function botGetAlternateRouteGoal(state,bot,base) return navigation.getAlternateRouteGoal(state.navigationServices,bot,base,state.redAltGoals,state.blueAltGoals) end function
/// Record or dispatch `"alternate-route-setup"` actions in `botSetupAlternativeRouteGoals`. Return paths include `len(state.redAltGoals)+len(state.blueAltGoals)`.
/// @param state Bot deathmatch state; accesses `setup`, `redAltGoals` and `blueAltGoals`. May update `state.setup` in place.
function botSetupAlternativeRouteGoals(state) state.setup=true;emit(state,"alternate-route-setup",lifecycle.createBot(0),"",0,[],true);return len(state.redAltGoals)+len(state.blueAltGoals) end function
/// Set `bot.thinktime` to `thinktime` in `mq3.game.bot_deathmatch.botDeathmatchAI`.
/// @param state Bot deathmatch state; accesses `deathmatchFn`.
/// @param bot Bot AI state; accesses `thinktime`. May update `bot.thinktime` in place.
/// @param thinktime Bot thinking interval in seconds.
function botDeathmatchAI(state,bot,thinktime) if state.deathmatchFn!=void then return state.deathmatchFn(state,bot,thinktime) end if;bot.thinktime=thinktime;return 0 end function

/// Set `value.entitynum` to `ent.number` in `mq3.game.bot_deathmatch.botSetEntityNumForGoalWithModel`.
/// @param state Bot deathmatch state; accesses `entities`.
/// @param value Value record; accesses `origin` and `entitynum`. May update `value.entitynum` in place.
/// @param eType Value used by `botSetEntityNumForGoalWithModel` in `for each ent in state.entities if ent.valid and (eType==0 or ent.eType==eType) and ent.modelindex==wanted and di...`.
/// @param modelname Sequence whose length bounds the iteration or lookup in `botSetEntityNumForGoalWithModel`.
function botSetEntityNumForGoalWithModel(state,value,eType,modelname)
  wanted=0;if strings.startsWith(modelname,"*") then wanted=toNumber(strings.substr(modelname,1,len(modelname)-1)) end if
  for each ent in state.entities if ent.valid and (eType==0 or ent.eType==eType) and ent.modelindex==wanted and distanceSquared(value.origin,ent.origin)<100.0 then value.entitynum=ent.number;return ent.number end if end for;return 0
end function
/// Set `value.entitynum` to `ent.number` in `mq3.game.bot_deathmatch.botSetEntityNumForGoal`.
/// @param state Bot deathmatch state; accesses `entities`.
/// @param value Value record; accesses `origin` and `entitynum`. May update `value.entitynum` in place.
/// @param classname Value passed as argument 1 to `std.string.toLowerAscii`.
function botSetEntityNumForGoal(state,value,classname)
  // Preserve the original Baseq3 condition: equal classnames are skipped.
  for each ent in state.entities if ent.valid and strings.toLowerAscii(ent.classname)!=strings.toLowerAscii(classname) and distanceSquared(value.origin,ent.origin)<100.0 then value.entitynum=ent.number;return ent.number end if end for;return 0
end function
/// Set `value.origin` to `ent.origin+[ ]` and `value.areanum` to `botPointAreaNum(state,ent.origin)` in `mq3.game.bot_deathmatch.botGoalForBSPEntity`.
/// @param state Bot deathmatch state; accesses `bspEntities`.
/// @param classname Value passed as argument 1 to `std.string.toLowerAscii`.
/// @param value Value record; accesses `origin` and `areanum`. May update `value.origin` and `value.areanum` in place.
function botGoalForBSPEntity(state,classname,value)
  for each ent in state.bspEntities if strings.toLowerAscii(ent.classname)==strings.toLowerAscii(classname) then value.origin=ent.origin+[ ];value.areanum=botPointAreaNum(state,ent.origin);return value.areanum!=0 end if end for;return false
end function
/// Record or dispatch `"deathmatch-setup"` actions in `botSetupDeathmatchAI`.
/// @param state Bot deathmatch state; accesses `setup`, `maxBspModelIndex`, `bspEntities`, `mapname` and `gametype`. May update `state.setup` and `state.maxBspModelIndex` in place.
/// @param retailActive Whether the retail integration owns side-effect delivery.
function botSetupDeathmatchAI(state,retailActive) state.setup=true;state.maxBspModelIndex=0;for each ent in state.bspEntities if ent.modelindex>state.maxBspModelIndex then state.maxBspModelIndex=ent.modelindex end if end for;botInitWaypoints(state);emit(state,"deathmatch-setup",lifecycle.createBot(0),state.mapname,state.gametype,[],retailActive);return true end function
/// Update `state.setup`, `state.redAltGoals` and `state.blueAltGoals` during `botShutdownDeathmatchAI`.
/// @param state Bot deathmatch state; accesses `setup`, `redAltGoals` and `blueAltGoals`. May update `state.setup`, `state.redAltGoals` and `state.blueAltGoals` in place.
function botShutdownDeathmatchAI(state) state.setup=false;state.redAltGoals=[];state.blueAltGoals=[];botInitWaypoints(state);return void end function

// Exact aliases for the remaining existing native implementations.
/// @param viewangles Array or byte sequence accessed at `axis`.
/// @param fov Value passed as argument 1 to `mq3.compat.numeric.fmul`.
/// @param angles Pitch, yaw and roll angles in degrees.
function inFieldOfVision(viewangles,fov,angles) return combat.inFieldOfVision(viewangles,fov,angles) end function
