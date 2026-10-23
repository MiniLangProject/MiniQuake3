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

const MAX_NODESWITCHES=50
const GT_1FCTF=5
const GT_OBELISK=6
const GT_HARVESTER=7
const TEAM_RED=1
const TEAM_BLUE=2
const LTG_GETFLAG=4
const LTG_RUSHBASE=5
const LTG_RETURNFLAG=6
const LTG_HARVEST=12
const LTG_ATTACKENEMYBASE=13
const MOVERESULT_MOVEMENTVIEW=1
const MOVERESULT_MOVEMENTWEAPON=16
const MOVERESULT_BLOCKEDBYAVOIDSPOT=256
const INVENTORY_SHOTGUN=headers.INVENTORY_SHOTGUN
const INVENTORY_MACHINEGUN=headers.INVENTORY_MACHINEGUN
const INVENTORY_ROCKETLAUNCHER=headers.INVENTORY_ROCKETLAUNCHER
const INVENTORY_LIGHTNING=headers.INVENTORY_LIGHTNING
const INVENTORY_RAILGUN=headers.INVENTORY_RAILGUN
const INVENTORY_PLASMAGUN=headers.INVENTORY_PLASMAGUN
const INVENTORY_BFG10K=headers.INVENTORY_BFG10K
const INVENTORY_NAILGUN=headers.INVENTORY_NAILGUN
const INVENTORY_CHAINGUN=headers.INVENTORY_CHAINGUN
const INVENTORY_SHELLS=headers.INVENTORY_SHELLS
const INVENTORY_BULLETS=headers.INVENTORY_BULLETS
const INVENTORY_CELLS=headers.INVENTORY_CELLS
const INVENTORY_LIGHTNINGAMMO=headers.INVENTORY_LIGHTNINGAMMO
const INVENTORY_ROCKETS=headers.INVENTORY_ROCKETS
const INVENTORY_SLUGS=headers.INVENTORY_SLUGS
const INVENTORY_BFGAMMO=headers.INVENTORY_BFGAMMO
const INVENTORY_NAILS=headers.INVENTORY_NAILS
const INVENTORY_BELT=headers.INVENTORY_BELT
const WEAPONINDEX_MACHINEGUN=headers.WEAPONINDEX_MACHINEGUN
const WEAPONINDEX_SHOTGUN=headers.WEAPONINDEX_SHOTGUN
const WEAPONINDEX_ROCKET_LAUNCHER=headers.WEAPONINDEX_ROCKET_LAUNCHER
const WEAPONINDEX_LIGHTNING=headers.WEAPONINDEX_LIGHTNING
const WEAPONINDEX_RAILGUN=headers.WEAPONINDEX_RAILGUN
const WEAPONINDEX_PLASMAGUN=headers.WEAPONINDEX_PLASMAGUN
const WEAPONINDEX_BFG=headers.WEAPONINDEX_BFG
const WEAPONINDEX_NAILGUN=headers.WEAPONINDEX_NAILGUN
const WEAPONINDEX_CHAINGUN=headers.WEAPONINDEX_CHAINGUN

struct NodeSwitch client name time node detail source end struct
struct Action boundary kind subject detail dispatched end struct
struct MissionServices missionpack teamFn neutralFlagGoalFn redFlagGoalFn blueFlagGoalFn redObeliskGoalFn blueObeliskGoalFn neutralObeliskGoalFn carryingNeutralFn carryingCubesFn feelingBadFn alternateRouteFn goHarvestFn context end struct
struct Services fightServices seekServices navigationServices mission nodeSwitches nameFn timeFn printFn entityStateFn traceFn attackFn inFovFn retailActive actions context end struct

function create(fightServices,seekServices,navigationServices)
  mission=MissionServices(false,void,void,void,void,void,void,void,void,void,void,void,void,void)
  services=Services(fightServices,seekServices,navigationServices,mission,[],void,void,void,void,void,void,void,false,[],void)
  if fightServices!=void then fightServices.missionEnemyTargetFn=missionEnemyTarget;fightServices.missionNearbyRangeFn=missionNearbyRange;fightServices.dmnetServices=services end if
  if seekServices!=void then seekServices.missionNearbyRangeFn=missionNearbyRange;seekServices.dmnetServices=services end if
  return services
end function
function emit(services,kind,subject,detail)
  event=Action("ai-dmnet",kind,subject,detail,not services.retailActive);services.actions=services.actions+[event]
  if event.dispatched and services.printFn!=void then services.printFn(services,kind,detail) end if;return event
end function
function now(services) if services.timeFn!=void then return services.timeFn(services) end if;return services.navigationServices.floatTimeFn(services.navigationServices) end function
function botName(services,bot) if services.nameFn!=void then return services.nameFn(services,bot.client) end if;return "client "+str(bot.client) end function

function BotResetNodeSwitches(services) services.nodeSwitches=[];return void end function
function BotRecordNodeSwitch(services,bot,node,detail,source)
  record=NodeSwitch(bot.client,botName(services,bot),now(services),node,detail,source);services.nodeSwitches=services.nodeSwitches+[record]
  emit(services,"node-switch",bot.client,record.name+" entered "+node+": "+detail+" from "+source)
  if len(services.nodeSwitches)>MAX_NODESWITCHES then BotDumpNodeSwitches(services,bot) end if;return record
end function
function BotDumpNodeSwitches(services,bot)
  emit(services,"node-overflow",bot.client,botName(services,bot)+" switched more than "+str(MAX_NODESWITCHES)+" AI nodes")
  for each record in services.nodeSwitches emit(services,"node-history",record.client,record.node+":"+record.detail+":"+record.source) end for
  return len(services.nodeSwitches)
end function

function BotGetAirGoal(services,bot,goal) return navigation.getAirGoal(services.navigationServices,bot,goal) end function
function BotGoForAir(services,bot,tfl,ltg,range) return navigation.goForAir(services.navigationServices,bot,tfl,ltg,range) end function
function BotNearbyGoal(services,bot,tfl,ltg,range) return navigation.nearbyGoal(services.navigationServices,bot,tfl,ltg,range) end function
function BotReachedGoal(services,bot,goal) return navigation.reachedGoal(services.navigationServices,bot,goal) end function
function BotGetItemLongTermGoal(services,bot,tfl,goal) return navigation.getItemLongTermGoal(services.navigationServices,bot,tfl,goal) end function

function missionGoal(services,bot,kind)
  ms=services.mission;team=ms.teamFn(ms,bot)
  if kind=="neutral-flag" then return ms.neutralFlagGoalFn(ms,bot) end if
  if kind=="neutral-obelisk" then return ms.neutralObeliskGoalFn(ms,bot) end if
  if kind=="enemy-flag" then if team==TEAM_RED then return ms.blueFlagGoalFn(ms,bot) end if;if team==TEAM_BLUE then return ms.redFlagGoalFn(ms,bot) end if end if
  if kind=="enemy-obelisk" then if team==TEAM_RED then return ms.blueObeliskGoalFn(ms,bot) end if;if team==TEAM_BLUE then return ms.redObeliskGoalFn(ms,bot) end if end if
  return void
end function
function missionEnemyTarget(fightServices,bot,target)
  services=fightServices.dmnetServices;if services==void or not services.mission.missionpack then return target end if
  red=services.mission.redObeliskGoalFn(services.mission,bot);blue=services.mission.blueObeliskGoalFn(services.mission,bot)
  if (red!=void and bot.enemy==red.entitynum) or (blue!=void and bot.enemy==blue.entitynum) then return [target[0],target[1],n.fadd(target[2],16.0)] end if;return target
end function
function missionNearbyRange(nodeServices,bot,range)
  services=nodeServices.dmnetServices;if services==void or not services.mission.missionpack then return range end if;game=services.navigationServices.gametype
  if game==GT_1FCTF and services.mission.carryingNeutralFn(services.mission,bot) then return 50.0 end if
  if game==GT_HARVESTER and services.mission.carryingCubesFn(services.mission,bot) then return 80.0 end if;return range
end function
function missionNotify(services,bot,event) navigation.notifyLongTerm(services.navigationServices,bot,event,0);bot.teammessageTime=0.0;return void end function
function missionTimedMessage(services,bot,event) if bot.teammessageTime!=0.0 and bot.teammessageTime<now(services) then missionNotify(services,bot,event) end if;return void end function
function copyMissionGoal(goal,value) if value==void then return false end if;navigation.copyGoalInto(goal,value);return true end function
function missionAlternate(services,bot,goal) if services.mission.alternateRouteFn!=void then services.mission.alternateRouteFn(services.mission,bot,goal) else navigation.alternateRoute(services.navigationServices,bot,goal) end if;return void end function
function missionTouch(services,bot,goal) return services.navigationServices.touchingGoalFn(services.navigationServices,bot.origin,goal) end function
function goHarvest(services,bot) if services.mission.goHarvestFn!=void then services.mission.goHarvestFn(services.mission,bot) else bot.ltgtype=LTG_HARVEST;bot.teamgoalTime=n.fadd(now(services),120.0) end if;return void end function

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

function BotGetLongTermGoal(services,bot,tfl,retreat,goal)
  if not retreat then pair=missionLongTermGoal(services,bot,tfl,goal);if pair[0] then return pair[1] end if end if
  return navigation.getLongTermGoal(services.navigationServices,bot,tfl,retreat,goal)
end function
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

function AIEnter_Intermission(services,bot,reason) return seek.enterIntermission(services.seekServices,bot,reason) end function
function AINode_Intermission(services,bot) return seek.intermissionNode(services.seekServices,bot) end function
function AIEnter_Observer(services,bot,reason) return seek.enterObserver(services.seekServices,bot,reason) end function
function AINode_Observer(services,bot) return seek.observerNode(services.seekServices,bot) end function
function AIEnter_Stand(services,bot,reason) return seek.enterStand(services.seekServices,bot,reason) end function
function AINode_Stand(services,bot) return seek.standNode(services.seekServices,bot) end function
function AIEnter_Respawn(services,bot,reason) return seek.enterRespawn(services.seekServices,bot,reason) end function
function AINode_Respawn(services,bot) return seek.respawnNode(services.seekServices,bot) end function

function BotSelectActivateWeapon(services,bot)
  inv=bot.inventory;if inv[INVENTORY_MACHINEGUN]>0 and inv[INVENTORY_BULLETS]>0 then return WEAPONINDEX_MACHINEGUN end if;if inv[INVENTORY_SHOTGUN]>0 and inv[INVENTORY_SHELLS]>0 then return WEAPONINDEX_SHOTGUN end if;if inv[INVENTORY_PLASMAGUN]>0 and inv[INVENTORY_CELLS]>0 then return WEAPONINDEX_PLASMAGUN end if;if inv[INVENTORY_LIGHTNING]>0 and inv[INVENTORY_LIGHTNINGAMMO]>0 then return WEAPONINDEX_LIGHTNING end if
  if services.mission.missionpack then if inv[INVENTORY_CHAINGUN]>0 and inv[INVENTORY_BELT]>0 then return WEAPONINDEX_CHAINGUN end if;if inv[INVENTORY_NAILGUN]>0 and inv[INVENTORY_NAILS]>0 then return WEAPONINDEX_NAILGUN end if end if
  if inv[INVENTORY_RAILGUN]>0 and inv[INVENTORY_SLUGS]>0 then return WEAPONINDEX_RAILGUN end if;if inv[INVENTORY_ROCKETLAUNCHER]>0 and inv[INVENTORY_ROCKETS]>0 then return WEAPONINDEX_ROCKET_LAUNCHER end if;if inv[INVENTORY_BFG10K]>0 and inv[INVENTORY_BFGAMMO]>0 then return WEAPONINDEX_BFG end if;return -1
end function
function shootObstacle(services,bot,movement,entity,zoffset,weapon)
  state=services.entityStateFn(services,entity);target=[state.origin[0],state.origin[1],n.fadd(state.origin[2],zoffset)];movement.idealViewangles=q.vectoangles([n.fsub(target[0],bot.eye[0]),n.fsub(target[1],bot.eye[1]),n.fsub(target[2],bot.eye[2])]);movement.weapon=weapon;if movement.weapon<0 then movement.weapon=0 end if
  if movement.weapon!=0 then movement.flags=movement.flags|MOVERESULT_MOVEMENTWEAPON|MOVERESULT_MOVEMENTVIEW;if bot.curPs.weapon==movement.weapon and services.inFovFn(services,bot.viewangles,20.0,movement.idealViewangles) then trace=services.traceFn(services,bot.eye,target,bot.entitynum);if trace.fraction>=1.0 or trace.ent==state.number then services.attackFn(services,bot.client) end if end if end if;return movement
end function
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

function AIEnter_Seek_ActivateEntity(services,bot,reason) return seek.enterActivate(services.seekServices,bot,reason) end function
function AINode_Seek_ActivateEntity(services,bot) return seek.activateNode(services.seekServices,bot) end function
function AIEnter_Seek_NBG(services,bot,reason) return seek.enterSeekNbg(services.seekServices,bot,reason) end function
function AINode_Seek_NBG(services,bot) return seek.seekNbgNode(services.seekServices,bot) end function
function AIEnter_Seek_LTG(services,bot,reason) return seek.enterSeek(services.seekServices,bot,reason) end function
function AINode_Seek_LTG(services,bot) return seek.seekNode(services.seekServices,bot) end function
function AIEnter_Battle_Fight(services,bot,reason) return fight.enterFight(services.fightServices,bot,reason) end function
function AIEnter_Battle_SuicidalFight(services,bot,reason) return fight.enterSuicidalFight(services.fightServices,bot,reason) end function
function AINode_Battle_Fight(services,bot) return fight.fightNode(services.fightServices,bot) end function
function AIEnter_Battle_Chase(services,bot,reason) return fight.enterChase(services.fightServices,bot,reason) end function
function AINode_Battle_Chase(services,bot) return fight.chaseNode(services.fightServices,bot) end function
function AIEnter_Battle_Retreat(services,bot,reason) return fight.enterRetreat(services.fightServices,bot,reason) end function
function AINode_Battle_Retreat(services,bot) return fight.retreatNode(services.fightServices,bot) end function
function AIEnter_Battle_NBG(services,bot,reason) return fight.enterNbg(services.fightServices,bot,reason) end function
function AINode_Battle_NBG(services,bot) return fight.nbgNode(services.fightServices,bot) end function
