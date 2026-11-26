// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ai_dmnet.c fight, chase, retreat and nearby-goal battle nodes.
package mq3.game.bot_fight_state
import mq3.game.bot_combat_ai as fightCombat
import mq3.compat.numeric as n
import mq3.shared.math as q

const NODE_FIGHT=1
const NODE_CHASE=2
const NODE_SEEK=3
const NODE_STAND=4
const NODE_OBSERVER=5
const NODE_INTERMISSION=6
const NODE_RESPAWN=7
const NODE_RETREAT=8
const NODE_NBG=9
const NODE_SEEK_NBG=10
const BFL_FIGHTSUICIDAL=64
const BFL_IDEALVIEWSET=32
const MOVERESULT_MOVEMENTVIEW=1
const MOVERESULT_SWIMVIEW=2
const MOVERESULT_MOVEMENTVIEWSET=8
const MOVERESULT_MOVEMENTWEAPON=16
const TFL_DEFAULT=0x11c0fbe
const TFL_ROCKETJUMP=0x1000
const TFL_GRAPPLEHOOK=0x4000
const TFL_SLIME=0x200000
const TFL_LAVA=0x400000
const PERS_HITS=1

/// `Services` record for bot fight state, containing `combatServices`, `observerFn`, `recordNodeFn`, `resetLastAvoidFn` and `enterNodeFn` and related fields.
struct Services
  combatServices
  observerFn
  recordNodeFn
  resetLastAvoidFn
  enterNodeFn
  chatEnemySuicideFn
  chatKillFn
  chatHitNoDeathFn
  chatHitNoKillFn
  chatTimeFn
  pointAreaFn
  areaReachableFn
  updateBattleFn
  battleUseItemsFn
  grapple
  chooseWeaponFn
  blockedFn
  resetAvoidFn
  mapScriptsFn
  touchingGoalFn
  nearbyGoalFn
  topGoalFn
  popGoalFn
  reachedGoalFn
  emptyGoalStackFn
  teamGoalsFn
  longTermGoalFn
  movementViewTargetFn
  missionEnemyTargetFn
  missionNearbyRangeFn
  dmnetServices
  context
end struct
/// Create a `mq3.game.bot_fight_state.Services` record, initializing `combatServices` from `combatServices`.
/// @param combatServices Initial value stored in `mq3.game.bot_fight_state.Services.combatServices`.
function create(combatServices)
  return Services(combatServices,void,void,void,void,void,void,void,void,void,void,void,void,void,false,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function
/// Set `bot.aiNode` to `node` in `mq3.game.bot_fight_state.transition`.
/// @param services Host service callbacks; accesses `enterNodeFn`.
/// @param bot Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place.
/// @param node Value passed as argument 3 to `services.enterNodeFn`.
/// @param reason Reason text recorded with the operation.
function transition(services,bot,node,reason)
  bot.aiNode=node;if services.enterNodeFn!=void then services.enterNodeFn(services,bot,node,reason) end if;return void
end function
/// Set `bot.aiNode` to `NODE_FIGHT` in `mq3.game.bot_fight_state.enterFight`.
/// @param services Host service callbacks; accesses `recordNodeFn` and `resetLastAvoidFn`.
/// @param bot Bot AI state; accesses `ms` and `aiNode`. May update `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function enterFight(services,bot,reason)
  services.recordNodeFn(services,bot,"battle fight","",reason);services.resetLastAvoidFn(services,bot.ms);bot.aiNode=NODE_FIGHT;return void
end function
/// Set `bot.combatFlags` to `bot.combatFlags|BFL_FIGHTSUICIDAL` in `mq3.game.bot_fight_state.enterSuicidalFight`.
/// @param services Host service callbacks; accesses `recordNodeFn` and `resetLastAvoidFn`.
/// @param bot Bot AI state; accesses `combatFlags`. May update `bot.combatFlags` in place.
/// @param reason Reason text recorded with the operation.
function enterSuicidalFight(services,bot,reason)
  enterFight(services,bot,reason);bot.combatFlags=bot.combatFlags|BFL_FIGHTSUICIDAL;return void
end function
/// Set `bot.chaseTime` to `fightCombat.now(services.combatServices)` and `bot.aiNode` to `NODE_CHASE` in `mq3.game.bot_fight_state.enterChase`.
/// @param services Host service callbacks; accesses `recordNodeFn` and `combatServices`.
/// @param bot Bot AI state; accesses `chaseTime` and `aiNode`. May update `bot.chaseTime` and `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function enterChase(services,bot,reason)
  services.recordNodeFn(services,bot,"battle chase","",reason);bot.chaseTime=fightCombat.now(services.combatServices);bot.aiNode=NODE_CHASE;return void
end function
/// Set `bot.aiNode` to `NODE_RETREAT` in `mq3.game.bot_fight_state.enterRetreat`.
/// @param services Host service callbacks; accesses `recordNodeFn`.
/// @param bot Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function enterRetreat(services,bot,reason)
  services.recordNodeFn(services,bot,"battle retreat","",reason);bot.aiNode=NODE_RETREAT;return void
end function
/// Set `bot.aiNode` to `NODE_NBG` in `mq3.game.bot_fight_state.enterNbg`.
/// @param services Host service callbacks; accesses `recordNodeFn`.
/// @param bot Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place.
/// @param reason Reason text recorded with the operation.
function enterNbg(services,bot,reason)
  services.recordNodeFn(services,bot,"battle NBG","",reason);bot.aiNode=NODE_NBG;return void
end function
/// Update `bot.idealViewangles`, `bot.idealViewangles[2]` and `bot.weaponnum` during `setMovementView`.
/// @param services Host service callbacks; accesses `combatServices` and `movementViewTargetFn`.
/// @param bot Bot AI state; accesses `idealViewangles`, `combatFlags`, `ms`, `tfl` and `origin` and related fields. May update `bot.idealViewangles`, `bot.idealViewangles[2]` and `bot.weaponnum` in place.
/// @param movement Movement record; accesses `flags`, `idealViewangles`, `movedir` and `weapon`.
/// @param goal Value passed as argument 3 to `services.movementViewTargetFn`.
/// @param allowAim Value used by `setMovementView` in `if allowAim then fightCombat.aimAtEnemy(services.combatServices,bot)`.
/// @param copyViewSet Value used by `setMovementView` in `fixed=(movement.flags&(MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW))!=0 or (copyViewSet and (movement.flags&MOVE...`.
/// @param halveRoll Value used by `setMovementView` in `if halveRoll then bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5) end if`.
function setMovementView(services,bot,movement,goal,allowAim,copyViewSet,halveRoll)
  fixed=(movement.flags&(MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW))!=0 or (copyViewSet and (movement.flags&MOVERESULT_MOVEMENTVIEWSET)!=0)
  if fixed then bot.idealViewangles=[movement.idealViewangles[0],movement.idealViewangles[1],movement.idealViewangles[2]]
  else if (movement.flags&MOVERESULT_MOVEMENTVIEWSET)==0 and (bot.combatFlags&BFL_IDEALVIEWSET)==0 then
    if allowAim then fightCombat.aimAtEnemy(services.combatServices,bot)
    else
      target=services.movementViewTargetFn(services,bot.ms,goal,bot.tfl,300.0)
      if target!=void then bot.idealViewangles=q.vectoangles(fightCombat.subtract(target,bot.origin)) else bot.idealViewangles=q.vectoangles(movement.movedir) end if
    end if
    if halveRoll then bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5) end if
  end if
  if (movement.flags&MOVERESULT_MOVEMENTWEAPON)!=0 then bot.weaponnum=movement.weapon end if
  return void
end function
/// Update `bot.enemyDeathTime`, `bot.standTime`, `bot.ltgTime` and `bot.lastEnemyOrigin` and related state during `fightNode`.
/// @param services Host service callbacks; accesses `combatServices`, `observerFn`, `chatEnemySuicideFn`, `chatKillFn` and `chatTimeFn` and related fields.
/// @param bot Bot AI state; accesses `enemy`, `enemyDeathTime`, `enemySuicide`, `lastKilledPlayer` and `standTime` and related fields. May update `bot.enemyDeathTime`, `bot.standTime` and `bot.ltgTime` and additional fields in place.
function fightNode(services,bot)
  cs=services.combatServices
  if services.observerFn(services,bot) then transition(services,bot,NODE_OBSERVER,"battle fight: observer");return false end if
  if fightCombat.intermission(cs,bot) then transition(services,bot,NODE_INTERMISSION,"battle fight: intermission");return false end if
  if fightCombat.isDead(bot) then transition(services,bot,NODE_RESPAWN,"battle fight: bot dead");return false end if
  fightCombat.findEnemy(cs,bot,bot.enemy)
  if bot.enemy<0 then transition(services,bot,NODE_SEEK,"battle fight: no enemy");return false end if
  ent=cs.entityInfoFn(cs,bot.enemy)
  if bot.enemyDeathTime!=0.0 then
    if bot.enemyDeathTime<fightCombat.now(cs)-1.0 then
      bot.enemyDeathTime=0.0;if bot.enemySuicide then services.chatEnemySuicideFn(services,bot) end if
      if bot.lastKilledPlayer==bot.enemy and services.chatKillFn(services,bot) then bot.standTime=fightCombat.now(cs)+services.chatTimeFn(services,bot);transition(services,bot,NODE_STAND,"battle fight: enemy dead")
      else bot.ltgTime=0.0;transition(services,bot,NODE_SEEK,"battle fight: enemy dead") end if
      return false
    end if
  else if cs.entityDeadFn(cs,ent) then bot.enemyDeathTime=fightCombat.now(cs) end if
  if fightCombat.entityIsInvisible(ent) and not fightCombat.entityIsShooting(ent) and cs.randomFn(cs)<0.2 then transition(services,bot,NODE_SEEK,"battle fight: invisible");return false end if
  target=[ent.origin[0],ent.origin[1],ent.origin[2]];if services.missionEnemyTargetFn!=void then target=services.missionEnemyTargetFn(services,bot,target) end if;area=services.pointAreaFn(services,target)
  if area!=0 and services.areaReachableFn(services,area) then bot.lastEnemyOrigin=target;bot.lastEnemyAreaNum=area end if
  services.updateBattleFn(services,bot,bot.enemy)
  if bot.lastframeHealth>bot.inventory[fightCombat.INVENTORY_HEALTH] and services.chatHitNoDeathFn(services,bot) then bot.standTime=fightCombat.now(cs)+services.chatTimeFn(services,bot);transition(services,bot,NODE_STAND,"battle fight: chat health decreased");return false end if
  if bot.curPs.persistant[PERS_HITS]>bot.lastHitCount and services.chatHitNoKillFn(services,bot) then bot.standTime=fightCombat.now(cs)+services.chatTimeFn(services,bot);transition(services,bot,NODE_STAND,"battle fight: chat hit someone");return false end if
  if cs.visibleFn(cs,bot.entitynum,bot.eye,bot.viewangles,360.0,bot.enemy)<=0 then
    if fightCombat.wantsToChase(cs,bot) then enterChase(services,bot,"battle fight: enemy out of sight") else transition(services,bot,NODE_SEEK,"battle fight: enemy out of sight") end if
    return false
  end if
  services.battleUseItemsFn(services,bot);bot.tfl=TFL_DEFAULT;if services.grapple then bot.tfl=bot.tfl|TFL_GRAPPLEHOOK end if
  if fightCombat.inLavaOrSlime(cs,bot) then bot.tfl=bot.tfl|TFL_LAVA|TFL_SLIME end if
  if fightCombat.canAndWantsToRocketJump(cs,bot) then bot.tfl=bot.tfl|TFL_ROCKETJUMP end if
  services.chooseWeaponFn(services,bot);movement=fightCombat.attackMove(cs,bot,bot.tfl)
  if movement.failure then services.resetAvoidFn(services,bot.ms);bot.ltgTime=0.0 end if
  services.blockedFn(services,bot,movement,false);fightCombat.aimAtEnemy(cs,bot);fightCombat.checkAttack(cs,bot)
  if (bot.combatFlags&BFL_FIGHTSUICIDAL)==0 and fightCombat.wantsToRetreat(cs,bot) then enterRetreat(services,bot,"battle fight: wants to retreat");return true end if
  return true
end function

/// Update `bot.tfl`, `bot.chaseTime`, `bot.checkTime` and `bot.nbgTime` and related state during `chaseNode`.
/// @param services Host service callbacks; accesses `combatServices`, `observerFn`, `grapple`, `mapScriptsFn` and `touchingGoalFn` and related fields.
/// @param bot Bot AI state; accesses `enemy`, `entitynum`, `eye`, `viewangles` and `lastEnemyAreaNum` and related fields. May update `bot.tfl`, `bot.chaseTime` and `bot.checkTime` and additional fields in place.
function chaseNode(services,bot)
  cs=services.combatServices;time=fightCombat.now(cs)
  if services.observerFn(services,bot) then transition(services,bot,NODE_OBSERVER,"battle chase: observer");return false end if
  if fightCombat.intermission(cs,bot) then transition(services,bot,NODE_INTERMISSION,"battle chase: intermission");return false end if
  if fightCombat.isDead(bot) then transition(services,bot,NODE_RESPAWN,"battle chase: bot dead");return false end if
  if bot.enemy<0 then transition(services,bot,NODE_SEEK,"battle chase: no enemy");return false end if
  if cs.visibleFn(cs,bot.entitynum,bot.eye,bot.viewangles,360.0,bot.enemy)>0 then enterFight(services,bot,"battle chase");return false end if
  if fightCombat.findEnemy(cs,bot,-1) then enterFight(services,bot,"battle chase: better enemy");return false end if
  if bot.lastEnemyAreaNum==0 then transition(services,bot,NODE_SEEK,"battle chase: no enemy area");return false end if
  bot.tfl=TFL_DEFAULT;if services.grapple then bot.tfl=bot.tfl|TFL_GRAPPLEHOOK end if
  if fightCombat.inLavaOrSlime(cs,bot) then bot.tfl=bot.tfl|TFL_LAVA|TFL_SLIME end if
  if fightCombat.canAndWantsToRocketJump(cs,bot) then bot.tfl=bot.tfl|TFL_ROCKETJUMP end if
  services.mapScriptsFn(services,bot);goal=fightCombat.CombatGoal(bot.enemy,bot.lastEnemyAreaNum,[bot.lastEnemyOrigin[0],bot.lastEnemyOrigin[1],bot.lastEnemyOrigin[2]],[-8.0,-8.0,-8.0],[8.0,8.0,8.0])
  if services.touchingGoalFn(services,bot.origin,goal) then bot.chaseTime=0.0 end if
  if bot.chaseTime==0.0 or bot.chaseTime<n.fsub(time,10.0) then transition(services,bot,NODE_SEEK,"battle chase: time out");return false end if
  if bot.checkTime<time then
    bot.checkTime=n.fadd(time,1.0);if services.nearbyGoalFn(services,bot,bot.tfl,goal,150.0) then bot.nbgTime=n.fadd(time,16.0);services.resetLastAvoidFn(services,bot.ms);enterNbg(services,bot,"battle chase: nbg");return false end if
  end if
  services.updateBattleFn(services,bot,bot.enemy);cs.setupMovementFn(cs,bot);movement=cs.moveToGoalFn(cs,bot.ms,goal,bot.tfl)
  if movement.failure then services.resetAvoidFn(services,bot.ms);bot.ltgTime=0.0 end if
  services.blockedFn(services,bot,movement,false);setMovementView(services,bot,movement,goal,bot.chaseTime>n.fsub(time,2.0),true,true)
  if bot.areanum==bot.lastEnemyAreaNum then bot.chaseTime=0.0 end if
  if fightCombat.wantsToRetreat(cs,bot) then enterRetreat(services,bot,"battle chase: wants to retreat");return true end if
  return true
end function

/// Update `bot.tfl`, `bot.enemyVisibleTime`, `bot.lastEnemyOrigin` and `bot.lastEnemyAreaNum` and related state during `retreatNode`.
/// @param services Host service callbacks; accesses `combatServices`, `observerFn`, `grapple`, `mapScriptsFn` and `updateBattleFn` and related fields.
/// @param bot Bot AI state; accesses `enemy`, `tfl`, `gs`, `entitynum` and `eye` and related fields. May update `bot.tfl`, `bot.enemyVisibleTime` and `bot.lastEnemyOrigin` and additional fields in place.
function retreatNode(services,bot)
  cs=services.combatServices;time=fightCombat.now(cs)
  if services.observerFn(services,bot) then transition(services,bot,NODE_OBSERVER,"battle retreat: observer");return false end if
  if fightCombat.intermission(cs,bot) then transition(services,bot,NODE_INTERMISSION,"battle retreat: intermission");return false end if
  if fightCombat.isDead(bot) then transition(services,bot,NODE_RESPAWN,"battle retreat: bot dead");return false end if
  if bot.enemy<0 then transition(services,bot,NODE_SEEK,"battle retreat: no enemy");return false end if
  ent=cs.entityInfoFn(cs,bot.enemy);if cs.entityDeadFn(cs,ent) then transition(services,bot,NODE_SEEK,"battle retreat: enemy dead");return false end if
  fightCombat.findEnemy(cs,bot,bot.enemy);bot.tfl=TFL_DEFAULT;if services.grapple then bot.tfl=bot.tfl|TFL_GRAPPLEHOOK end if
  if fightCombat.inLavaOrSlime(cs,bot) then bot.tfl=bot.tfl|TFL_LAVA|TFL_SLIME end if
  services.mapScriptsFn(services,bot);services.updateBattleFn(services,bot,bot.enemy)
  if fightCombat.wantsToChase(cs,bot) then services.emptyGoalStackFn(services,bot.gs);enterChase(services,bot,"battle retreat: wants to chase");return false end if
  if cs.visibleFn(cs,bot.entitynum,bot.eye,bot.viewangles,360.0,bot.enemy)>0 then bot.enemyVisibleTime=time;target=[ent.origin[0],ent.origin[1],ent.origin[2]];if services.missionEnemyTargetFn!=void then target=services.missionEnemyTargetFn(services,bot,target) end if;area=services.pointAreaFn(services,target);if area!=0 and services.areaReachableFn(services,area) then bot.lastEnemyOrigin=target;bot.lastEnemyAreaNum=area end if end if
  if bot.enemyVisibleTime<n.fsub(time,4.0) then transition(services,bot,NODE_SEEK,"battle retreat: lost enemy");return false
  else if bot.enemyVisibleTime<time and fightCombat.findEnemy(cs,bot,-1) then enterFight(services,bot,"battle retreat: another enemy");return false end if
  services.teamGoalsFn(services,bot,true);services.battleUseItemsFn(services,bot);goal=fightCombat.CombatGoal(0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0])
  if not services.longTermGoalFn(services,bot,bot.tfl,true,goal) then enterSuicidalFight(services,bot,"battle retreat: no way out");return false end if
  if bot.checkTime<time then range=150.0;if cs.gametype==fightCombat.GT_CTF and fightCombat.ctfCarryingFlag(cs,bot)!=0 then range=50.0 end if;if services.missionNearbyRangeFn!=void then range=services.missionNearbyRangeFn(services,bot,range) end if;bot.checkTime=n.fadd(time,1.0);if services.nearbyGoalFn(services,bot,bot.tfl,goal,range) then services.resetLastAvoidFn(services,bot.ms);bot.nbgTime=n.fadd(time,n.fadd(n.fdiv(range,100.0),1.0));enterNbg(services,bot,"battle retreat: nbg");return false end if end if
  cs.setupMovementFn(cs,bot);movement=cs.moveToGoalFn(cs,bot.ms,goal,bot.tfl);if movement.failure then services.resetAvoidFn(services,bot.ms);bot.ltgTime=0.0 end if
  services.blockedFn(services,bot,movement,false);services.chooseWeaponFn(services,bot)
  skill=cs.characteristicFloatFn(cs,bot.character,fightCombat.CHARACTERISTIC_ATTACK_SKILL,0.0,1.0);setMovementView(services,bot,movement,goal,skill>0.3,false,false);fightCombat.checkAttack(cs,bot);return true
end function

/// Update `bot.tfl`, `bot.enemyVisibleTime`, `bot.lastEnemyOrigin` and `bot.lastEnemyAreaNum` and related state during `nbgNode`.
/// @param services Host service callbacks; accesses `combatServices`, `observerFn`, `grapple`, `mapScriptsFn` and `missionEnemyTargetFn` and related fields.
/// @param bot Bot AI state; accesses `enemy`, `tfl`, `entitynum`, `eye` and `viewangles` and related fields. May update `bot.tfl`, `bot.enemyVisibleTime` and `bot.lastEnemyOrigin` and additional fields in place.
function nbgNode(services,bot)
  cs=services.combatServices;time=fightCombat.now(cs)
  if services.observerFn(services,bot) then transition(services,bot,NODE_OBSERVER,"battle nbg: observer");return false end if
  if fightCombat.intermission(cs,bot) then transition(services,bot,NODE_INTERMISSION,"battle nbg: intermission");return false end if
  if fightCombat.isDead(bot) then transition(services,bot,NODE_RESPAWN,"battle nbg: bot dead");return false end if
  if bot.enemy<0 then transition(services,bot,NODE_SEEK_NBG,"battle nbg: no enemy");return false end if
  ent=cs.entityInfoFn(cs,bot.enemy);if cs.entityDeadFn(cs,ent) then transition(services,bot,NODE_SEEK_NBG,"battle nbg: enemy dead");return false end if
  bot.tfl=TFL_DEFAULT;if services.grapple then bot.tfl=bot.tfl|TFL_GRAPPLEHOOK end if;if fightCombat.inLavaOrSlime(cs,bot) then bot.tfl=bot.tfl|TFL_LAVA|TFL_SLIME end if;if fightCombat.canAndWantsToRocketJump(cs,bot) then bot.tfl=bot.tfl|TFL_ROCKETJUMP end if;services.mapScriptsFn(services,bot)
  if cs.visibleFn(cs,bot.entitynum,bot.eye,bot.viewangles,360.0,bot.enemy)>0 then bot.enemyVisibleTime=time;target=[ent.origin[0],ent.origin[1],ent.origin[2]];if services.missionEnemyTargetFn!=void then target=services.missionEnemyTargetFn(services,bot,target) end if;area=services.pointAreaFn(services,target);if area!=0 and services.areaReachableFn(services,area) then bot.lastEnemyOrigin=target;bot.lastEnemyAreaNum=area end if end if
  pair=services.topGoalFn(services,bot.gs);hasGoal=pair[0];goal=pair[1];if not hasGoal or services.reachedGoalFn(services,bot,goal) then bot.nbgTime=0.0 end if
  if bot.nbgTime<time then services.popGoalFn(services,bot.gs);pair=services.topGoalFn(services,bot.gs);if pair[0] then enterRetreat(services,bot,"battle nbg: time out") else enterFight(services,bot,"battle nbg: time out") end if;return false end if
  cs.setupMovementFn(cs,bot);movement=cs.moveToGoalFn(cs,bot.ms,goal,bot.tfl);if movement.failure then services.resetAvoidFn(services,bot.ms);bot.nbgTime=0.0 end if
  services.blockedFn(services,bot,movement,false);services.updateBattleFn(services,bot,bot.enemy);services.chooseWeaponFn(services,bot)
  skill=cs.characteristicFloatFn(cs,bot.character,fightCombat.CHARACTERISTIC_ATTACK_SKILL,0.0,1.0);setMovementView(services,bot,movement,goal,skill>0.3,false,false);fightCombat.checkAttack(cs,bot);return true
end function

/// Apply `mq3.game.bot_fight_state.fightNode`, `mq3.game.bot_fight_state.chaseNode` and `mq3.game.bot_fight_state.retreatNode` while evaluating `runNode`.
/// @param services Host service callbacks; accesses `combatServices`, `observerFn`, `chatEnemySuicideFn`, `chatKillFn` and `chatTimeFn` and related fields.
/// @param bot Bot AI state; accesses `aiNode`.
function runNode(services,bot)
  if bot.aiNode==NODE_FIGHT then return fightNode(services,bot) end if
  if bot.aiNode==NODE_CHASE then return chaseNode(services,bot) end if
  if bot.aiNode==NODE_RETREAT then return retreatNode(services,bot) end if
  if bot.aiNode==NODE_NBG then return nbgNode(services,bot) end if
  if bot.aiNode!=0 then return error(499,"Unknown battle AI node "+str(bot.aiNode)) end if
  return true
end function
