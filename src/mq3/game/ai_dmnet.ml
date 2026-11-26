// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native file adapter for code/game/ai_dmnet.c.
package mq3.game.ai_dmnet
import mq3.game.game_headers as headers
import mq3.game.bot_navigation as navigation
import mq3.game.bot_seek_state as seek
import mq3.game.bot_fight_state as fight
import mq3.shared.math as q
import mq3.compat.numeric as n

/// Upper bound on nodeswitches represented by mq3.game.ai_dmnet.
const MAX_NODESWITCHES=50
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
/// Long-term bot goal identifier selecting capture the flag behavior.
const LTG_GETFLAG=4
/// Long-term bot goal identifier selecting rush the base behavior.
const LTG_RUSHBASE=5
/// Long-term bot goal identifier selecting return the flag behavior.
const LTG_RETURNFLAG=6
/// Long-term bot goal identifier selecting harvest behavior.
const LTG_HARVEST=12
/// Long-term bot goal identifier selecting attackenemybase behavior.
const LTG_ATTACKENEMYBASE=13
/// Bot movement-result flag reporting movementview.
const MOVERESULT_MOVEMENTVIEW=1
/// Bot movement-result flag reporting movementweapon.
const MOVERESULT_MOVEMENTWEAPON=16
/// Bot movement-result flag reporting blockedbyavoidspot.
const MOVERESULT_BLOCKEDBYAVOIDSPOT=256
/// Bot inventory slot used to read or update shotgun.
const INVENTORY_SHOTGUN=headers.INVENTORY_SHOTGUN
/// Bot inventory slot used to read or update machine gun.
const INVENTORY_MACHINEGUN=headers.INVENTORY_MACHINEGUN
/// Bot inventory slot used to read or update rocket launcher.
const INVENTORY_ROCKETLAUNCHER=headers.INVENTORY_ROCKETLAUNCHER
/// Bot inventory slot used to read or update lightning gun.
const INVENTORY_LIGHTNING=headers.INVENTORY_LIGHTNING
/// Bot inventory slot used to read or update railgun.
const INVENTORY_RAILGUN=headers.INVENTORY_RAILGUN
/// Bot inventory slot used to read or update plasma gun.
const INVENTORY_PLASMAGUN=headers.INVENTORY_PLASMAGUN
/// Bot inventory slot used to read or update bfg10 k.
const INVENTORY_BFG10K=headers.INVENTORY_BFG10K
/// Bot inventory slot used to read or update nailgun.
const INVENTORY_NAILGUN=headers.INVENTORY_NAILGUN
/// Bot inventory slot used to read or update chaingun.
const INVENTORY_CHAINGUN=headers.INVENTORY_CHAINGUN
/// Bot inventory slot used to read or update shells.
const INVENTORY_SHELLS=headers.INVENTORY_SHELLS
/// Bot inventory slot used to read or update bullets.
const INVENTORY_BULLETS=headers.INVENTORY_BULLETS
/// Bot inventory slot used to read or update cells.
const INVENTORY_CELLS=headers.INVENTORY_CELLS
/// Bot inventory slot used to read or update lightningammo.
const INVENTORY_LIGHTNINGAMMO=headers.INVENTORY_LIGHTNINGAMMO
/// Bot inventory slot used to read or update rockets.
const INVENTORY_ROCKETS=headers.INVENTORY_ROCKETS
/// Bot inventory slot used to read or update slugs.
const INVENTORY_SLUGS=headers.INVENTORY_SLUGS
/// Bot inventory slot used to read or update bfgammo.
const INVENTORY_BFGAMMO=headers.INVENTORY_BFGAMMO
/// Bot inventory slot used to read or update nails.
const INVENTORY_NAILS=headers.INVENTORY_NAILS
/// Bot inventory slot used to read or update belt.
const INVENTORY_BELT=headers.INVENTORY_BELT
/// Weapon-definition index identifying machine gun in bot weapon tables.
const WEAPONINDEX_MACHINEGUN=headers.WEAPONINDEX_MACHINEGUN
/// Weapon-definition index identifying shotgun in bot weapon tables.
const WEAPONINDEX_SHOTGUN=headers.WEAPONINDEX_SHOTGUN
/// Weapon-definition index identifying rocket launcher in bot weapon tables.
const WEAPONINDEX_ROCKET_LAUNCHER=headers.WEAPONINDEX_ROCKET_LAUNCHER
/// Weapon-definition index identifying lightning gun in bot weapon tables.
const WEAPONINDEX_LIGHTNING=headers.WEAPONINDEX_LIGHTNING
/// Weapon-definition index identifying railgun in bot weapon tables.
const WEAPONINDEX_RAILGUN=headers.WEAPONINDEX_RAILGUN
/// Weapon-definition index identifying plasma gun in bot weapon tables.
const WEAPONINDEX_PLASMAGUN=headers.WEAPONINDEX_PLASMAGUN
/// Weapon-definition index identifying BFG in bot weapon tables.
const WEAPONINDEX_BFG=headers.WEAPONINDEX_BFG
/// Weapon-definition index identifying nailgun in bot weapon tables.
const WEAPONINDEX_NAILGUN=headers.WEAPONINDEX_NAILGUN
/// Weapon-definition index identifying chaingun in bot weapon tables.
const WEAPONINDEX_CHAINGUN=headers.WEAPONINDEX_CHAINGUN

/// `NodeSwitch` record for ai dmnet, containing `client`, `name`, `time`, `node` and `detail` and related fields.
struct NodeSwitch
  /// Client slot of the bot whose decision-network transition was recorded.
  client
  /// Bot/player name included in the node-switch diagnostic.
  name
  /// Time at which the decision-network transition occurred.
  time
  /// Name or identifier of the active bot decision-network node.
  node
  /// Additional diagnostic or action detail supplied by the bot controller.
  detail
  /// Source/condition label explaining why this node transition was recorded.
  source
end struct
/// `Action` record for ai dmnet, containing `boundary`, `kind`, `subject`, `detail` and `dispatched`.
struct Action
  /// Decision/action boundary at which this bot operation was recorded.
  boundary
  /// Discriminator selecting the recorded bot action or decision event.
  kind
  /// Entity/client or other subject to which the recorded action applies.
  subject
  /// Additional diagnostic or action detail supplied by the bot controller.
  detail
  /// Nonzero after the action has been delivered to its host callback.
  dispatched
end struct
/// `MissionServices` record for ai dmnet, containing `missionpack`, `teamFn`, `neutralFlagGoalFn`, `redFlagGoalFn` and `blueFlagGoalFn` and related fields.
struct MissionServices
  /// Nonzero when mission-pack rules and content are enabled.
  missionpack
  /// Injected callback for team; invoked through the MissionServices service/state record.
  teamFn
  /// Injected callback for neutral flag goal; invoked through the MissionServices service/state record.
  neutralFlagGoalFn
  /// Injected callback for red flag goal; invoked through the MissionServices service/state record.
  redFlagGoalFn
  /// Injected callback for blue flag goal; invoked through the MissionServices service/state record.
  blueFlagGoalFn
  /// Injected callback for red obelisk goal; invoked through the MissionServices service/state record.
  redObeliskGoalFn
  /// Injected callback for blue obelisk goal; invoked through the MissionServices service/state record.
  blueObeliskGoalFn
  /// Injected callback for neutral obelisk goal; invoked through the MissionServices service/state
  /// record.
  neutralObeliskGoalFn
  /// Injected callback for carrying neutral; invoked through the MissionServices service/state record.
  carryingNeutralFn
  /// Injected callback for carrying cubes; invoked through the MissionServices service/state record.
  carryingCubesFn
  /// Injected callback for feeling bad; invoked through the MissionServices service/state record.
  feelingBadFn
  /// Injected callback for alternate route; invoked through the MissionServices service/state record.
  alternateRouteFn
  /// Injected callback for go harvest; invoked through the MissionServices service/state record.
  goHarvestFn
  /// Opaque caller-supplied context available to mission-pack team, objective, alternate-route, and
  /// harvesting callbacks.
  context
end struct
/// `Services` record for ai dmnet, containing `fightServices`, `seekServices`, `navigationServices`, `mission` and `nodeSwitches` and related fields.
struct Services
  /// Callbacks and shared state used by the bot fight node.
  fightServices
  /// Callbacks used by the bot seek/goal-acquisition node.
  seekServices
  /// Callbacks and shared state used for bot navigation decisions.
  navigationServices
  /// Additional service/state bundle for mission-pack game behavior.
  mission
  /// Recorded transitions between bot decision-network nodes.
  nodeSwitches
  /// Injected callback for name; invoked through the Services service/state record.
  nameFn
  /// Injected callback for time; invoked through the Services service/state record.
  timeFn
  /// Injected callback for print; invoked through the Services service/state record.
  printFn
  /// Injected callback for entity state; invoked through the Services service/state record.
  entityStateFn
  /// Injected callback for trace; invoked through the Services service/state record.
  traceFn
  /// Injected callback for attack; invoked through the Services service/state record.
  attackFn
  /// Injected callback for in field of view; invoked through the Services service/state record.
  inFovFn
  /// Nonzero when the retail-compatible bot decision path is active.
  retailActive
  /// Recorded host actions emitted by bot decision logic.
  actions
  /// Opaque caller-supplied context available to decision-network timing, diagnostics, entity, trace,
  /// and attack callbacks.
  context
end struct

/// Update `fightServices.missionEnemyTargetFn`, `fightServices.missionNearbyRangeFn`, `fightServices.dmnetServices` and `seekServices.missionNearbyRangeFn` and related state during `create`. Return paths include `services`.
/// @param fightServices Fight services record; accesses `missionEnemyTargetFn`, `missionNearbyRangeFn` and `dmnetServices`. May update `fightServices.missionEnemyTargetFn`, `fightServices.missionNearbyRangeFn` and `fightServices.dmnetServices` in place.
/// @param seekServices Seek services record; accesses `missionNearbyRangeFn` and `dmnetServices`. May update `seekServices.missionNearbyRangeFn` and `seekServices.dmnetServices` in place.
/// @param navigationServices Initial value stored in `mq3.game.ai_dmnet.Services.navigationServices`.
function create(fightServices,seekServices,navigationServices)
  mission=MissionServices(false,void,void,void,void,void,void,void,void,void,void,void,void,void)
  services=Services(fightServices,seekServices,navigationServices,mission,[],void,void,void,void,void,void,void,false,[],void)
  if fightServices!=void then fightServices.missionEnemyTargetFn=missionEnemyTarget;fightServices.missionNearbyRangeFn=missionNearbyRange;fightServices.dmnetServices=services end if
  if seekServices!=void then seekServices.missionNearbyRangeFn=missionNearbyRange;seekServices.dmnetServices=services end if
  return services
end function
/// Set `services.actions` to `services.actions+[event]` in `mq3.game.ai_dmnet.emit`. Return paths include `event`.
/// @param services Host service callbacks; accesses `retailActive`, `actions` and `printFn`. May update `services.actions` in place.
/// @param kind Initial value stored in `mq3.game.ai_dmnet.Action.kind`.
/// @param subject Initial value stored in `mq3.game.ai_dmnet.Action.subject`.
/// @param detail Initial value stored in `mq3.game.ai_dmnet.Action.detail`.
function emit(services,kind,subject,detail)
  event=Action("ai-dmnet",kind,subject,detail,not services.retailActive);services.actions=services.actions+[event]
  if event.dispatched and services.printFn!=void then services.printFn(services,kind,detail) end if;return event
end function
/// Use `services.timeFn` and `services.navigationServices.floatTimeFn` to perform `now`. Return paths include `services.navigationServices.floatTimeFn(services.navigationServices)`.
/// @param services Host service callbacks; accesses `timeFn` and `navigationServices`.
function now(services) if services.timeFn!=void then return services.timeFn(services) end if;return services.navigationServices.floatTimeFn(services.navigationServices) end function
/// Use `services.nameFn` to perform `botName`. Return paths include `+str(bot.client)`.
/// @param services Host service callbacks; accesses `nameFn`.
/// @param bot Bot AI state; accesses `client`.
function botName(services,bot) if services.nameFn!=void then return services.nameFn(services,bot.client) end if;return "client "+str(bot.client) end function

/// Set `services.nodeSwitches` to `[]` in `mq3.game.ai_dmnet.BotResetNodeSwitches`.
/// @param services Host service callbacks; accesses `nodeSwitches`. May update `services.nodeSwitches` in place.
function BotResetNodeSwitches(services) services.nodeSwitches=[];return void end function
/// Record or dispatch `"node-switch"` actions in `BotRecordNodeSwitch`. Return paths include `record`.
/// @param services Host service callbacks; accesses `nodeSwitches`. May update `services.nodeSwitches` in place.
/// @param bot Bot AI state; accesses `client`.
/// @param node Initial value stored in `mq3.game.ai_dmnet.NodeSwitch.node`.
/// @param detail Initial value stored in `mq3.game.ai_dmnet.NodeSwitch.detail`.
/// @param source Initial value stored in `mq3.game.ai_dmnet.NodeSwitch.source`.
function BotRecordNodeSwitch(services,bot,node,detail,source)
  record=NodeSwitch(bot.client,botName(services,bot),now(services),node,detail,source);services.nodeSwitches=services.nodeSwitches+[record]
  emit(services,"node-switch",bot.client,record.name+" entered "+node+": "+detail+" from "+source)
  if len(services.nodeSwitches)>MAX_NODESWITCHES then BotDumpNodeSwitches(services,bot) end if;return record
end function
/// Record or dispatch `"node-overflow"` and `"node-history"` actions in `BotDumpNodeSwitches`. Return paths include `len(services.nodeSwitches)`.
/// @param services Host service callbacks; accesses `nodeSwitches`.
/// @param bot Bot AI state; accesses `client`.
function BotDumpNodeSwitches(services,bot)
  emit(services,"node-overflow",bot.client,botName(services,bot)+" switched more than "+str(MAX_NODESWITCHES)+" AI nodes")
  for each record in services.nodeSwitches emit(services,"node-history",record.client,record.node+":"+record.detail+":"+record.source) end for
  return len(services.nodeSwitches)
end function

/// Forward `BotGetAirGoal` to `mq3.game.bot_navigation.getAirGoal` and return the delegated result.
/// @param services Host service callbacks; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `origin` and `entitynum`.
/// @param goal Bot navigation goal; accesses `origin`, `areanum`, `mins`, `maxs` and `flags` and related fields. May update `goal.origin`, `goal.areanum` and `goal.mins` and additional fields in place.
function BotGetAirGoal(services,bot,goal) return navigation.getAirGoal(services.navigationServices,bot,goal) end function
/// Forward `BotGoForAir` to `mq3.game.bot_navigation.goForAir` and return the delegated result.
/// @param services Host service callbacks; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `lastairTime`, `gs`, `origin` and `inventory`.
/// @param tfl Bit mask of permitted AAS travel modes and area restrictions.
/// @param ltg Value passed as argument 6 to `services.chooseNbgFn`.
/// @param range Value passed as argument 7 to `services.chooseNbgFn`.
function BotGoForAir(services,bot,tfl,ltg,range) return navigation.goForAir(services.navigationServices,bot,tfl,ltg,range) end function
/// Forward `BotNearbyGoal` to `mq3.game.bot_navigation.nearbyGoal` and return the delegated result.
/// @param services Host service callbacks; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `areanum`, `origin`, `teamGoal`, `gs` and `inventory`.
/// @param tfl Bit mask of permitted AAS travel modes and area restrictions.
/// @param ltg Value passed as argument 6 to `services.chooseNbgFn`.
/// @param range Value passed as argument 7 to `services.chooseNbgFn`.
function BotNearbyGoal(services,bot,tfl,ltg,range) return navigation.nearbyGoal(services.navigationServices,bot,tfl,ltg,range) end function
/// Forward `BotReachedGoal` to `mq3.game.bot_navigation.reachedGoal` and return the delegated result.
/// @param services Host service callbacks; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `origin`, `gs`, `entitynum`, `eye` and `viewangles` and related fields.
/// @param goal Bot navigation goal; accesses `flags`, `number`, `areanum`, `origin` and `mins` and related fields.
function BotReachedGoal(services,bot,goal) return navigation.reachedGoal(services.navigationServices,bot,goal) end function
/// Forward `BotGetItemLongTermGoal` to `mq3.game.bot_navigation.getItemLongTermGoal` and return the delegated result.
/// @param services Host service callbacks; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `gs`, `ltgTime`, `origin`, `inventory` and `ms`. May update `bot.ltgTime` in place.
/// @param tfl Bit mask of permitted AAS travel modes and area restrictions.
/// @param goal Target record; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. May update `goal.areanum`, `goal.entitynum` and `goal.origin` and additional fields in place.
function BotGetItemLongTermGoal(services,bot,tfl,goal) return navigation.getItemLongTermGoal(services.navigationServices,bot,tfl,goal) end function

/// Select a neutral or enemy objective through Team Arena callbacks according to the bot team.
/// @param services Host service callbacks; accesses `mission`.
/// @param bot Value passed as argument 2 to `ms.teamFn`.
/// @param kind Value used by `missionGoal` in `if kind=="neutral-flag" then return ms.neutralFlagGoalFn(ms,bot) end if`.
function missionGoal(services,bot,kind)
  ms=services.mission;team=ms.teamFn(ms,bot)
  if kind=="neutral-flag" then return ms.neutralFlagGoalFn(ms,bot) end if
  if kind=="neutral-obelisk" then return ms.neutralObeliskGoalFn(ms,bot) end if
  if kind=="enemy-flag" then if team==TEAM_RED then return ms.blueFlagGoalFn(ms,bot) end if;if team==TEAM_BLUE then return ms.redFlagGoalFn(ms,bot) end if end if
  if kind=="enemy-obelisk" then if team==TEAM_RED then return ms.blueObeliskGoalFn(ms,bot) end if;if team==TEAM_BLUE then return ms.redObeliskGoalFn(ms,bot) end if end if
  return void
end function
/// Raise the aim point for Team Arena obelisk targets by sixteen units and preserve other targets.
/// @param fightServices Fight services record; accesses `dmnetServices`.
/// @param bot Bot AI state; accesses `enemy`.
/// @param target Three-component array; components 0, 1 and 2 are used in their stored order.
function missionEnemyTarget(fightServices,bot,target)
  services=fightServices.dmnetServices;if services==void or not services.mission.missionpack then return target end if
  red=services.mission.redObeliskGoalFn(services.mission,bot);blue=services.mission.blueObeliskGoalFn(services.mission,bot)
  if (red!=void and bot.enemy==red.entitynum) or (blue!=void and bot.enemy==blue.entitynum) then return [target[0],target[1],n.fadd(target[2],16.0)] end if;return target
end function
/// Reduce nearby-goal search distance while carrying a neutral flag or Harvester cubes.
/// @param nodeServices Node services record; accesses `dmnetServices`.
/// @param bot Value passed as argument 2 to `services.mission.carryingNeutralFn`.
/// @param range Operand used to evaluate the returned expression `range`.
function missionNearbyRange(nodeServices,bot,range)
  services=nodeServices.dmnetServices;if services==void or not services.mission.missionpack then return range end if;game=services.navigationServices.gametype
  if game==GT_1FCTF and services.mission.carryingNeutralFn(services.mission,bot) then return 50.0 end if
  if game==GT_HARVESTER and services.mission.carryingCubesFn(services.mission,bot) then return 80.0 end if;return range
end function
/// Set `bot.teammessageTime` to `0.0` in `mq3.game.ai_dmnet.missionNotify`.
/// @param services Host service callbacks; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `teammessageTime`. May update `bot.teammessageTime` in place.
/// @param event Player or entity event identifier.
function missionNotify(services,bot,event) navigation.notifyLongTerm(services.navigationServices,bot,event,0);bot.teammessageTime=0.0;return void end function
/// Apply `mq3.game.ai_dmnet.now` and `mq3.game.ai_dmnet.missionNotify` while evaluating `missionTimedMessage`.
/// @param services Host service callbacks; accesses `timeFn` and `navigationServices`.
/// @param bot Bot AI state; accesses `teammessageTime`.
/// @param event Player or entity event identifier.
function missionTimedMessage(services,bot,event) if bot.teammessageTime!=0.0 and bot.teammessageTime<now(services) then missionNotify(services,bot,event) end if;return void end function
/// Apply `mq3.game.bot_navigation.copyGoalInto` while evaluating `copyMissionGoal`.
/// @param goal Target record; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. May update `goal.areanum`, `goal.entitynum` and `goal.origin` and additional fields in place.
/// @param value Parser source state; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields.
function copyMissionGoal(goal,value) if value==void then return false end if;navigation.copyGoalInto(goal,value);return true end function
/// Use `services.mission.alternateRouteFn` to perform `missionAlternate`.
/// @param services Host service callbacks; accesses `mission` and `navigationServices`.
/// @param bot Bot AI state; accesses `altRouteGoal`, `reachedAltRouteGoalTime`, `areanum`, `origin` and `tfl`. May update `bot.reachedAltRouteGoalTime` in place.
/// @param goal Target record; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. May update `goal.areanum`, `goal.entitynum` and `goal.origin` and additional fields in place.
function missionAlternate(services,bot,goal) if services.mission.alternateRouteFn!=void then services.mission.alternateRouteFn(services.mission,bot,goal) else navigation.alternateRoute(services.navigationServices,bot,goal) end if;return void end function
/// Return the result of `services.navigationServices.touchingGoalFn(services.navigationServices,bot.origin,goal)` for `missionTouch`.
/// @param services Host service callbacks; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `origin`.
/// @param goal Value passed as argument 3 to `services.navigationServices.touchingGoalFn`.
function missionTouch(services,bot,goal) return services.navigationServices.touchingGoalFn(services.navigationServices,bot.origin,goal) end function
/// Set `bot.ltgtype` to `LTG_HARVEST` and `bot.teamgoalTime` to `n.fadd(now(services),120.0)` in `mq3.game.ai_dmnet.goHarvest`.
/// @param services Host service callbacks; accesses `mission`.
/// @param bot Bot AI state; accesses `ltgtype` and `teamgoalTime`. May update `bot.ltgtype` and `bot.teamgoalTime` in place.
function goHarvest(services,bot) if services.mission.goHarvestFn!=void then services.mission.goHarvestFn(services.mission,bot) else bot.ltgtype=LTG_HARVEST;bot.teamgoalTime=n.fadd(now(services),120.0) end if;return void end function

/// Update `bot.ltgtype`, `bot.attackawayTime` and `bot.harvestawayTime` during `missionLongTermGoal`. Return paths include `[false,false]`.
/// @param services Host service callbacks; accesses `mission` and `navigationServices`.
/// @param bot Bot AI state; accesses `ltgtype`, `teamgoalTime`, `attackawayTime`, `origin` and `harvestawayTime`. May update `bot.ltgtype`, `bot.attackawayTime` and `bot.harvestawayTime` in place.
/// @param tfl Bit mask of permitted AAS travel modes and area restrictions.
/// @param goal Bot navigation goal; accesses `origin`.
function missionLongTermGoal(services,bot,tfl,goal)
  ms=services.mission;if not ms.missionpack then return [false,false] end if;game=services.navigationServices.gametype;time=now(services)
  if game==GT_1FCTF then
    if bot.ltgtype==LTG_GETFLAG then missionTimedMessage(services,bot,"captureflag_start");if not copyMissionGoal(goal,missionGoal(services,bot,"neutral-flag")) then bot.ltgtype=0;return [true,false] end if;if missionTouch(services,bot,goal) or bot.teamgoalTime<time then bot.ltgtype=0 end if;return [true,true] end if
    if bot.ltgtype==LTG_RUSHBASE then if not copyMissionGoal(goal,missionGoal(services,bot,"enemy-flag")) then bot.ltgtype=0;return [true,false] end if;if not ms.carryingNeutralFn(ms,bot) or bot.teamgoalTime<time or missionTouch(services,bot,goal) then bot.ltgtype=0 end if;missionAlternate(services,bot,goal);return [true,true] end if
    if bot.ltgtype==LTG_ATTACKENEMYBASE and bot.attackawayTime<time then missionTimedMessage(services,bot,"attackenemybase_start");if not copyMissionGoal(goal,missionGoal(services,bot,"enemy-flag")) then bot.ltgtype=0;return [true,false] end if;if bot.teamgoalTime<time then bot.ltgtype=0 end if;if missionTouch(services,bot,goal) then bot.attackawayTime=n.fadd(time,n.fadd(2.0,n.fmul(5.0,services.navigationServices.randomFn(services.navigationServices)))) end if;return [true,true] end if
    if bot.ltgtype==LTG_RETURNFLAG then missionTimedMessage(services,bot,"returnflag_start");if bot.teamgoalTime<time then bot.ltgtype=0 end if;return [true,BotGetItemLongTermGoal(services,bot,tfl,goal)] end if
  else if game==GT_OBELISK then
    if bot.ltgtype==LTG_ATTACKENEMYBASE and bot.attackawayTime<time then missionTimedMessage(services,bot,"attackenemybase_start");if not copyMissionGoal(goal,missionGoal(services,bot,"enemy-obelisk")) then bot.ltgtype=0;return [true,false] end if;if ms.feelingBadFn(ms,bot)>50 then return [true,BotGetItemLongTermGoal(services,bot,tfl,goal)] end if;if missionTouch(services,bot,goal) or navigation.distSquared(bot.origin,goal.origin)<3600.0 then bot.attackawayTime=n.fadd(time,n.fadd(3.0,n.fmul(5.0,services.navigationServices.randomFn(services.navigationServices)))) end if;if bot.teamgoalTime<time then bot.ltgtype=0 end if;missionAlternate(services,bot,goal);return [true,true] end if
  else if game==GT_HARVESTER then
    if bot.ltgtype==LTG_RUSHBASE then if not copyMissionGoal(goal,missionGoal(services,bot,"enemy-obelisk")) then goHarvest(services,bot);return [true,false] end if;if not ms.carryingCubesFn(ms,bot) or bot.teamgoalTime<time or missionTouch(services,bot,goal) then goHarvest(services,bot);return [true,false] end if;missionAlternate(services,bot,goal);return [true,true] end if
    if bot.ltgtype==LTG_ATTACKENEMYBASE and bot.attackawayTime<time then missionTimedMessage(services,bot,"attackenemybase_start");if not copyMissionGoal(goal,missionGoal(services,bot,"enemy-obelisk")) then bot.ltgtype=0;return [true,false] end if;if bot.teamgoalTime<time then bot.ltgtype=0 end if;if missionTouch(services,bot,goal) then bot.attackawayTime=n.fadd(time,n.fadd(2.0,n.fmul(5.0,services.navigationServices.randomFn(services.navigationServices)))) end if;return [true,true] end if
    if bot.ltgtype==LTG_HARVEST and bot.harvestawayTime<time then missionTimedMessage(services,bot,"harvest_start");if not copyMissionGoal(goal,missionGoal(services,bot,"neutral-obelisk")) then bot.ltgtype=0;return [true,false] end if;if bot.teamgoalTime<time then bot.ltgtype=0 end if;if missionTouch(services,bot,goal) then bot.harvestawayTime=n.fadd(time,n.fadd(4.0,n.fmul(3.0,services.navigationServices.randomFn(services.navigationServices)))) end if;return [true,true] end if
  end if
  return [false,false]
end function

/// Apply `mq3.game.ai_dmnet.missionLongTermGoal` and `mq3.game.bot_navigation.getLongTermGoal` while evaluating `BotGetLongTermGoal`. Return paths include `navigation.getLongTermGoal(services.navigationServices,bot,tfl,retreat,goal)`.
/// @param services Host service callbacks; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `ltgtype`, `teamgoalTime`, `attackawayTime`, `origin` and `harvestawayTime`. May update `bot.ltgtype`, `bot.attackawayTime` and `bot.harvestawayTime` in place.
/// @param tfl Bit mask of permitted AAS travel modes and area restrictions.
/// @param retreat Value used by `getLongTermGoal` in `if bot.ltgtype==LTG_TEAMHELP and not retreat then`.
/// @param goal Bot navigation goal; accesses `origin`.
function BotGetLongTermGoal(services,bot,tfl,retreat,goal)
  if not retreat then pair=missionLongTermGoal(services,bot,tfl,goal);if pair[0] then return pair[1] end if end if
  return navigation.getLongTermGoal(services.navigationServices,bot,tfl,retreat,goal)
end function
/// Update `bot.leadTime`, `bot.leadmessageTime`, `bot.leadvisibleTime` and `bot.leadbackupTime` and related state during `BotLongTermGoal`. Return paths include `BotGetLongTermGoal(services,bot,tfl,retreat,goal)`.
/// @param services Host service callbacks; accesses `navigationServices`.
/// @param bot Bot AI state; accesses `leadTime`, `leadTeammate`, `leadmessageTime`, `leadTeamGoal` and `entitynum` and related fields. May update `bot.leadTime`, `bot.leadmessageTime` and `bot.leadvisibleTime` and additional fields in place.
/// @param tfl Bit mask of permitted AAS travel modes and area restrictions.
/// @param retreat Value used by `getLongTermGoal` in `if bot.ltgtype==LTG_TEAMHELP and not retreat then`.
/// @param goal Bot navigation goal; accesses `origin`.
function BotLongTermGoal(services,bot,tfl,retreat,goal)
  if bot.leadTime>0.0 and not retreat then
    time=now(services);if bot.leadTime<time then navigation.notifyLongTerm(services.navigationServices,bot,"lead_stop",bot.leadTeammate);bot.leadTime=0.0;return BotGetLongTermGoal(services,bot,tfl,retreat,goal) end if
    if bot.leadmessageTime<0.0 and 0.0-bot.leadmessageTime<time then navigation.notifyLongTerm(services.navigationServices,bot,"followme",bot.leadTeammate);bot.leadmessageTime=time end if
    info=navigation.updateMovingTeamGoal(services.navigationServices,bot,bot.leadTeammate,bot.leadTeamGoal);if services.navigationServices.entityVisibleFn(services.navigationServices,bot.entitynum,bot.eye,bot.viewangles,bot.leadTeammate) then bot.leadvisibleTime=time end if;if bot.leadvisibleTime<n.fsub(time,1.0) then bot.leadbackupTime=n.fadd(time,2.0) end if;squared=navigation.distSquared(bot.origin,bot.leadTeamGoal.origin)
    if bot.leadbackupTime>time then if bot.leadmessageTime<n.fsub(time,20.0) then navigation.notifyLongTerm(services.navigationServices,bot,"followme",bot.leadTeammate);bot.leadmessageTime=time end if;if squared<10000.0 then bot.leadbackupTime=0.0 end if;navigation.copyGoalInto(goal,bot.leadTeamGoal);return true end if
    if squared>250000.0 then if bot.leadmessageTime<n.fsub(time,20.0) then navigation.notifyLongTerm(services.navigationServices,bot,"followme",bot.leadTeammate);bot.leadmessageTime=time end if;bot.idealViewangles=q.vectoangles([n.fsub(info.origin[0],bot.origin[0]),n.fsub(info.origin[1],bot.origin[1]),n.fsub(info.origin[2],bot.origin[2])]);bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5);return false end if
  end if
  return BotGetLongTermGoal(services,bot,tfl,retreat,goal)
end function

/// Forward `AIEnter_Intermission` to `mq3.game.bot_seek_state.enterIntermission` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `chatto` and `aiNode`. May update `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Intermission(services,bot,reason) return seek.enterIntermission(services.seekServices,bot,reason) end function
/// Forward `AINode_Intermission` to `mq3.game.bot_seek_state.intermissionNode` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `standTime`. May update `bot.standTime` in place.
function AINode_Intermission(services,bot) return seek.intermissionNode(services.seekServices,bot) end function
/// Forward `AIEnter_Observer` to `mq3.game.bot_seek_state.enterObserver` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Observer(services,bot,reason) return seek.enterObserver(services.seekServices,bot,reason) end function
/// Forward `AINode_Observer` to `mq3.game.bot_seek_state.observerNode` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `standFindEnemyTime` and `aiNode`. May update `bot.standFindEnemyTime` and `bot.aiNode` in place.
function AINode_Observer(services,bot) return seek.observerNode(services.seekServices,bot) end function
/// Forward `AIEnter_Stand` to `mq3.game.bot_seek_state.enterStand` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `standFindEnemyTime` and `aiNode`. May update `bot.standFindEnemyTime` and `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Stand(services,bot,reason) return seek.enterStand(services.seekServices,bot,reason) end function
/// Forward `AINode_Stand` to `mq3.game.bot_seek_state.standNode` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `lastframeHealth`, `inventory`, `standFindEnemyTime`, `standTime` and `client` and related fields. May update `bot.standFindEnemyTime` and `bot.standTime` in place.
function AINode_Stand(services,bot) return seek.standNode(services.seekServices,bot) end function
/// Forward `AIEnter_Respawn` to `mq3.game.bot_seek_state.enterRespawn` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `ms`, `gs`, `respawnTime`, `respawnChatTime` and `respawnWait` and related fields. May update `bot.respawnTime`, `bot.respawnChatTime` and `bot.respawnWait` and additional fields in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Respawn(services,bot,reason) return seek.enterRespawn(services.seekServices,bot,reason) end function
/// Forward `AINode_Respawn` to `mq3.game.bot_seek_state.respawnNode` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `respawnWait`, `client`, `respawnTime`, `respawnChatTime` and `chatto` and related fields. May update `bot.respawnWait` and `bot.enemy` in place.
function AINode_Respawn(services,bot) return seek.respawnNode(services.seekServices,bot) end function

/// Choose the first available weapon with ammunition from the activation-weapon priority order.
/// @param services Host service callbacks; accesses `mission`.
/// @param bot Bot AI state; accesses `inventory`.
function BotSelectActivateWeapon(services,bot)
  inv=bot.inventory;if inv[INVENTORY_MACHINEGUN]>0 and inv[INVENTORY_BULLETS]>0 then return WEAPONINDEX_MACHINEGUN end if;if inv[INVENTORY_SHOTGUN]>0 and inv[INVENTORY_SHELLS]>0 then return WEAPONINDEX_SHOTGUN end if;if inv[INVENTORY_PLASMAGUN]>0 and inv[INVENTORY_CELLS]>0 then return WEAPONINDEX_PLASMAGUN end if;if inv[INVENTORY_LIGHTNING]>0 and inv[INVENTORY_LIGHTNINGAMMO]>0 then return WEAPONINDEX_LIGHTNING end if
  if services.mission.missionpack then if inv[INVENTORY_CHAINGUN]>0 and inv[INVENTORY_BELT]>0 then return WEAPONINDEX_CHAINGUN end if;if inv[INVENTORY_NAILGUN]>0 and inv[INVENTORY_NAILS]>0 then return WEAPONINDEX_NAILGUN end if end if
  if inv[INVENTORY_RAILGUN]>0 and inv[INVENTORY_SLUGS]>0 then return WEAPONINDEX_RAILGUN end if;if inv[INVENTORY_ROCKETLAUNCHER]>0 and inv[INVENTORY_ROCKETS]>0 then return WEAPONINDEX_ROCKET_LAUNCHER end if;if inv[INVENTORY_BFG10K]>0 and inv[INVENTORY_BFGAMMO]>0 then return WEAPONINDEX_BFG end if;return -1
end function
/// Update `movement.idealViewangles`, `movement.weapon` and `movement.flags` during `shootObstacle`. Return paths include `movement`.
/// @param services Host service callbacks; accesses `entityStateFn`, `inFovFn`, `traceFn` and `attackFn`.
/// @param bot Bot AI state; accesses `eye`, `curPs`, `viewangles`, `entitynum` and `client`.
/// @param movement Movement record; accesses `idealViewangles`, `weapon` and `flags`. May update `movement.idealViewangles`, `movement.weapon` and `movement.flags` in place.
/// @param entity Value passed as argument 2 to `services.entityStateFn`.
/// @param zoffset Value passed as argument 2 to `mq3.compat.numeric.fadd`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function shootObstacle(services,bot,movement,entity,zoffset,weapon)
  state=services.entityStateFn(services,entity);target=[state.origin[0],state.origin[1],n.fadd(state.origin[2],zoffset)];movement.idealViewangles=q.vectoangles([n.fsub(target[0],bot.eye[0]),n.fsub(target[1],bot.eye[1]),n.fsub(target[2],bot.eye[2])]);movement.weapon=weapon;if movement.weapon<0 then movement.weapon=0 end if
  if movement.weapon!=0 then movement.flags=movement.flags|MOVERESULT_MOVEMENTWEAPON|MOVERESULT_MOVEMENTVIEW;if bot.curPs.weapon==movement.weapon and services.inFovFn(services,bot.viewangles,20.0,movement.idealViewangles) then trace=services.traceFn(services,bot.eye,target,bot.entitynum);if trace.fraction>=1.0 or trace.ent==state.number then services.attackFn(services,bot.client) end if end if end if;return movement
end function
/// Set `bot.blockedByAvoidSpotTime` to `n.fadd(now(services),5.0)` in `mq3.game.ai_dmnet.BotClearPath`. Return paths include `movement`.
/// @param services Host service callbacks; accesses `entityStateFn`.
/// @param bot Bot AI state; accesses `kamikazeBody`, `blockedByAvoidSpotTime`, `proxMines`, `origin` and `inventory`. May update `bot.blockedByAvoidSpotTime` in place.
/// @param movement Movement record; accesses `flags`.
function BotClearPath(services,bot,movement)
  occupied=(movement.flags&(MOVERESULT_MOVEMENTVIEW|MOVERESULT_MOVEMENTWEAPON))!=0
  if bot.kamikazeBody!=0 and not occupied then shootObstacle(services,bot,movement,bot.kamikazeBody,8.0,BotSelectActivateWeapon(services,bot)) end if
  if (movement.flags&MOVERESULT_BLOCKEDBYAVOIDSPOT)!=0 then bot.blockedByAvoidSpotTime=n.fadd(now(services),5.0) end if
  occupied=(movement.flags&(MOVERESULT_MOVEMENTVIEW|MOVERESULT_MOVEMENTWEAPON))!=0
  if bot.blockedByAvoidSpotTime>now(services) and not occupied then
    best=-1;bestdist=90000.0;for each entity in bot.proxMines state=services.entityStateFn(services,entity);distance=navigation.distSquared(state.origin,bot.origin);if distance<bestdist then bestdist=distance;best=entity end if end for
    if best>=0 then weapon=0;if bot.inventory[INVENTORY_PLASMAGUN]>0 and bot.inventory[INVENTORY_CELLS]>0 then weapon=WEAPONINDEX_PLASMAGUN else if bot.inventory[INVENTORY_ROCKETLAUNCHER]>0 and bot.inventory[INVENTORY_ROCKETS]>0 then weapon=WEAPONINDEX_ROCKET_LAUNCHER else if bot.inventory[INVENTORY_BFG10K]>0 and bot.inventory[INVENTORY_BFGAMMO]>0 then weapon=WEAPONINDEX_BFG end if;shootObstacle(services,bot,movement,best,2.0,weapon) end if
  end if;return movement
end function

/// Forward `AIEnter_Seek_ActivateEntity` to `mq3.game.bot_seek_state.enterActivate` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Seek_ActivateEntity(services,bot,reason) return seek.enterActivate(services.seekServices,bot,reason) end function
/// Forward `AINode_Seek_ActivateEntity` to `mq3.game.bot_seek_state.activateNode` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `tfl`, `enemy`, `activateStackIndex`, `activateGoalHeap` and `curPs` and related fields. May update `bot.tfl`, `bot.enemy` and `bot.activateGoalHeap[bot.activateStackIndex].time` and additional fields in place.
function AINode_Seek_ActivateEntity(services,bot) return seek.activateNode(services.seekServices,bot) end function
/// Forward `AIEnter_Seek_NBG` to `mq3.game.bot_seek_state.enterSeekNbg` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `gs` and `aiNode`. May update `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Seek_NBG(services,bot,reason) return seek.enterSeekNbg(services.seekServices,bot,reason) end function
/// Forward `AINode_Seek_NBG` to `mq3.game.bot_seek_state.seekNbgNode` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `tfl`, `enemy`, `gs`, `nbgTime` and `checkTime` and related fields. May update `bot.tfl`, `bot.enemy` and `bot.nbgTime` and additional fields in place.
function AINode_Seek_NBG(services,bot) return seek.seekNbgNode(services.seekServices,bot) end function
/// Forward `AIEnter_Seek_LTG` to `mq3.game.bot_seek_state.enterSeek` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `gs` and `aiNode`. May update `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Seek_LTG(services,bot,reason) return seek.enterSeek(services.seekServices,bot,reason) end function
/// Forward `AINode_Seek_LTG` to `mq3.game.bot_seek_state.seekNode` and return the delegated result.
/// @param services Host service callbacks; accesses `seekServices`.
/// @param bot Bot AI state; accesses `standTime`, `tfl`, `enemy`, `killedEnemyTime` and `thinktime` and related fields. May update `bot.standTime`, `bot.tfl` and `bot.enemy` and additional fields in place.
function AINode_Seek_LTG(services,bot) return seek.seekNode(services.seekServices,bot) end function
/// Forward `AIEnter_Battle_Fight` to `mq3.game.bot_fight_state.enterFight` and return the delegated result.
/// @param services Host service callbacks; accesses `fightServices`.
/// @param bot Bot AI state; accesses `ms` and `aiNode`. May update `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Battle_Fight(services,bot,reason) return fight.enterFight(services.fightServices,bot,reason) end function
/// Forward `AIEnter_Battle_SuicidalFight` to `mq3.game.bot_fight_state.enterSuicidalFight` and return the delegated result.
/// @param services Host service callbacks; accesses `fightServices`.
/// @param bot Bot AI state; accesses `combatFlags`. May update `bot.combatFlags` in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Battle_SuicidalFight(services,bot,reason) return fight.enterSuicidalFight(services.fightServices,bot,reason) end function
/// Forward `AINode_Battle_Fight` to `mq3.game.bot_fight_state.fightNode` and return the delegated result.
/// @param services Host service callbacks; accesses `fightServices`.
/// @param bot Bot AI state; accesses `enemy`, `enemyDeathTime`, `enemySuicide`, `lastKilledPlayer` and `standTime` and related fields. May update `bot.enemyDeathTime`, `bot.standTime` and `bot.ltgTime` and additional fields in place.
function AINode_Battle_Fight(services,bot) return fight.fightNode(services.fightServices,bot) end function
/// Forward `AIEnter_Battle_Chase` to `mq3.game.bot_fight_state.enterChase` and return the delegated result.
/// @param services Host service callbacks; accesses `fightServices`.
/// @param bot Bot AI state; accesses `chaseTime` and `aiNode`. May update `bot.chaseTime` and `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Battle_Chase(services,bot,reason) return fight.enterChase(services.fightServices,bot,reason) end function
/// Forward `AINode_Battle_Chase` to `mq3.game.bot_fight_state.chaseNode` and return the delegated result.
/// @param services Host service callbacks; accesses `fightServices`.
/// @param bot Bot AI state; accesses `enemy`, `entitynum`, `eye`, `viewangles` and `lastEnemyAreaNum` and related fields. May update `bot.tfl`, `bot.chaseTime` and `bot.checkTime` and additional fields in place.
function AINode_Battle_Chase(services,bot) return fight.chaseNode(services.fightServices,bot) end function
/// Forward `AIEnter_Battle_Retreat` to `mq3.game.bot_fight_state.enterRetreat` and return the delegated result.
/// @param services Host service callbacks; accesses `fightServices`.
/// @param bot Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Battle_Retreat(services,bot,reason) return fight.enterRetreat(services.fightServices,bot,reason) end function
/// Forward `AINode_Battle_Retreat` to `mq3.game.bot_fight_state.retreatNode` and return the delegated result.
/// @param services Host service callbacks; accesses `fightServices`.
/// @param bot Bot AI state; accesses `enemy`, `tfl`, `gs`, `entitynum` and `eye` and related fields. May update `bot.tfl`, `bot.enemyVisibleTime` and `bot.lastEnemyOrigin` and additional fields in place.
function AINode_Battle_Retreat(services,bot) return fight.retreatNode(services.fightServices,bot) end function
/// Forward `AIEnter_Battle_NBG` to `mq3.game.bot_fight_state.enterNbg` and return the delegated result.
/// @param services Host service callbacks; accesses `fightServices`.
/// @param bot Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function AIEnter_Battle_NBG(services,bot,reason) return fight.enterNbg(services.fightServices,bot,reason) end function
/// Forward `AINode_Battle_NBG` to `mq3.game.bot_fight_state.nbgNode` and return the delegated result.
/// @param services Host service callbacks; accesses `fightServices`.
/// @param bot Bot AI state; accesses `enemy`, `tfl`, `entitynum`, `eye` and `viewangles` and related fields. May update `bot.tfl`, `bot.enemyVisibleTime` and `bot.lastEnemyOrigin` and additional fields in place.
function AINode_Battle_NBG(services,bot) return fight.nbgNode(services.fightServices,bot) end function
