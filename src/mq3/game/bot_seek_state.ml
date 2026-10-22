// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ai_dmnet.c long-term-goal seek entry and execution node.
package mq3.game.bot_seek_state
import mq3.game.bot_fight_state as fight
import mq3.game.bot_combat_ai as seekCombat
import mq3.game.bot_navigation as navigation
import mq3.shared.math as q
import mq3.compat.numeric as n

const NODE_SEEK=3
const NODE_STAND=4
const NODE_OBSERVER=5
const NODE_INTERMISSION=6
const NODE_RESPAWN=7
const NODE_SEEK_NBG=10
const NODE_ACTIVATE=11
const BFL_IDEALVIEWSET=32
const MOVERESULT_MOVEMENTVIEW=1
const MOVERESULT_SWIMVIEW=2
const MOVERESULT_WAITING=4
const MOVERESULT_MOVEMENTVIEWSET=8
const MOVERESULT_MOVEMENTWEAPON=16
const LTG_DEFENDKEYAREA=3
const TFL_DEFAULT=0x11c0fbe
const TFL_ROCKETJUMP=0x1000
const TFL_GRAPPLEHOOK=0x4000
const TFL_SLIME=0x200000
const TFL_LAVA=0x400000

struct Services
  fightServices
  navigationServices
  observerFn
  recordNodeFn
  enterNodeFn
  topGoalFn
  goalNameFn
  randomChatFn
  chatTimeFn
  mapScriptsFn
  gestureFn
  emptyGoalStackFn
  teamGoalsFn
  longTermGoalFn
  wantsCampFn
  nearbyGoalFn
  resetLastAvoidFn
  enterSeekNbgFn
  predictObstaclesFn
  setupMovementFn
  moveToGoalFn
  resetAvoidFn
  blockedFn
  clearPathFn
  movementViewTargetFn
  roamGoalFn
  grapple
  reachedGoalFn
  secondGoalFn
  popGoalFn
  chooseWeaponFn
  resetStateFn
  endLevelChatFn
  startLevelChatFn
  hitTalkingChatFn
  deathChatFn
  enterChatFn
  talkFn
  respawnFn
  resetMoveStateFn
  resetGoalStateFn
  resetAvoidGoalsFn
  clearActivateFn
  activationNodeFn
  activateTraceFn
  activateTouchFn
  activateOriginFn
  attackFn
  selectActivateWeaponFn
  missionNearbyRangeFn
  dmnetServices
  context
end struct

function create(fightServices,navigationServices)
  return Services(fightServices,navigationServices,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,false,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function
function transition(services,bot,node,reason)
  bot.aiNode=node;if services.enterNodeFn!=void then services.enterNodeFn(services,bot,node,reason) end if;return void
end function
function enterSeek(services,bot,reason)
  pair=services.topGoalFn(services,bot.gs)
  if pair[0] then services.recordNodeFn(services,bot,"seek LTG",services.goalNameFn(services,pair[1].number),reason)
  else services.recordNodeFn(services,bot,"seek LTG","no goal",reason) end if
  bot.aiNode=NODE_SEEK;return void
end function
function recordEntry(services,bot,name,goal,reason)
  if services.recordNodeFn!=void then services.recordNodeFn(services,bot,name,goal,reason) end if;return void
end function
function enterSeekNbg(services,bot,reason)
  pair=services.topGoalFn(services,bot.gs);name="no goal";if pair[0] then name=services.goalNameFn(services,pair[1].number) end if
  recordEntry(services,bot,"seek NBG",name,reason);bot.aiNode=NODE_SEEK_NBG;return void
end function
function enterObserver(services,bot,reason)
  recordEntry(services,bot,"observer","",reason);if services.resetStateFn!=void then services.resetStateFn(services,bot) end if;bot.aiNode=NODE_OBSERVER;return void
end function
function enterIntermission(services,bot,reason)
  recordEntry(services,bot,"intermission","",reason);if services.resetStateFn!=void then services.resetStateFn(services,bot) end if
  if services.endLevelChatFn!=void and services.endLevelChatFn(services,bot) and services.enterChatFn!=void then services.enterChatFn(services,bot,bot.chatto) end if
  bot.aiNode=NODE_INTERMISSION;return void
end function
function enterStand(services,bot,reason)
  recordEntry(services,bot,"stand","",reason);bot.standFindEnemyTime=n.fadd(seekCombat.now(services.fightServices.combatServices),1.0);bot.aiNode=NODE_STAND;return void
end function
function enterRespawn(services,bot,reason)
  cs=services.fightServices.combatServices;time=seekCombat.now(cs);recordEntry(services,bot,"respawn","",reason)
  if services.resetMoveStateFn!=void then services.resetMoveStateFn(services,bot.ms) end if;if services.resetGoalStateFn!=void then services.resetGoalStateFn(services,bot.gs) end if
  if services.resetAvoidGoalsFn!=void then services.resetAvoidGoalsFn(services,bot.gs) end if;if services.resetAvoidFn!=void then services.resetAvoidFn(services,bot.ms) end if
  if services.deathChatFn!=void and services.deathChatFn(services,bot) then bot.respawnTime=n.fadd(time,services.chatTimeFn(services,bot));bot.respawnChatTime=time
  else bot.respawnTime=n.fadd(time,n.fadd(1.0,cs.randomFn(cs)));bot.respawnChatTime=0.0 end if
  bot.respawnWait=false;bot.aiNode=NODE_RESPAWN;return void
end function
function clearActivation(services,bot)
  if services.clearActivateFn!=void then services.clearActivateFn(services,bot) else navigation.clearActivateGoalStack(services.navigationServices,bot) end if;return void
end function
function enterActivate(services,bot,reason)
  recordEntry(services,bot,"activate entity","",reason);bot.aiNode=NODE_ACTIVATE;return void
end function

function intermissionNode(services,bot)
  if not seekCombat.intermission(services.fightServices.combatServices,bot) then
    time=seekCombat.now(services.fightServices.combatServices)
    if services.startLevelChatFn!=void and services.startLevelChatFn(services,bot) then bot.standTime=n.fadd(time,services.chatTimeFn(services,bot)) else bot.standTime=n.fadd(time,2.0) end if
    enterStand(services,bot,"intermission: chat")
  end if
  return true
end function
function observerNode(services,bot)
  if not services.observerFn(services,bot) then enterStand(services,bot,"observer: left observer") end if;return true
end function
function standNode(services,bot)
  cs=services.fightServices.combatServices;time=seekCombat.now(cs)
  if bot.lastframeHealth>bot.inventory[seekCombat.INVENTORY_HEALTH] and services.hitTalkingChatFn!=void and services.hitTalkingChatFn(services,bot) then
    duration=n.fadd(services.chatTimeFn(services,bot),0.1);bot.standFindEnemyTime=n.fadd(time,duration);bot.standTime=n.fadd(time,duration)
  end if
  if bot.standFindEnemyTime<time then
    if seekCombat.findEnemy(cs,bot,-1) then fight.enterFight(services.fightServices,bot,"stand: found enemy");return false end if
    bot.standFindEnemyTime=n.fadd(time,1.0)
  end if
  if services.talkFn!=void then services.talkFn(services,bot.client) end if
  if bot.standTime<time then if services.enterChatFn!=void then services.enterChatFn(services,bot,bot.chatto) end if;enterSeek(services,bot,"stand: time out");return false end if
  return true
end function
function respawnNode(services,bot)
  time=seekCombat.now(services.fightServices.combatServices)
  if bot.respawnWait then
    if not seekCombat.isDead(bot) then
      enterSeek(services,bot,"respawn: respawned")
    else
      if services.respawnFn!=void then services.respawnFn(services,bot.client) end if
    end if
  else if bot.respawnTime<time then
    bot.respawnWait=true;if services.respawnFn!=void then services.respawnFn(services,bot.client) end if
    if bot.respawnChatTime!=0.0 then if services.enterChatFn!=void then services.enterChatFn(services,bot,bot.chatto) end if;bot.enemy=-1 end if
  end if
  if bot.respawnChatTime!=0.0 and bot.respawnChatTime<n.fsub(time,0.5) and services.talkFn!=void then services.talkFn(services,bot.client) end if
  return true
end function
function activateNode(services,bot)
  fs=services.fightServices;cs=fs.combatServices;time=seekCombat.now(cs)
  if services.observerFn(services,bot) then clearActivation(services,bot);enterObserver(services,bot,"active entity: observer");return false end if
  if seekCombat.intermission(cs,bot) then clearActivation(services,bot);enterIntermission(services,bot,"activate entity: intermission");return false end if
  if seekCombat.isDead(bot) then clearActivation(services,bot);enterRespawn(services,bot,"activate entity: bot dead");return false end if
  bot.tfl=TFL_DEFAULT;if services.grapple then bot.tfl=bot.tfl|TFL_GRAPPLEHOOK end if;if seekCombat.inLavaOrSlime(cs,bot) then bot.tfl=bot.tfl|TFL_LAVA|TFL_SLIME end if
  services.mapScriptsFn(services,bot);bot.enemy=-1;navigation.ensureActivateHeap(bot)
  if bot.activateStackIndex<0 then clearActivation(services,bot);enterSeekNbg(services,bot,"activate entity: no goal");return false end if
  active=bot.activateGoalHeap[bot.activateStackIndex];goal=active.goal;visible=false;movement=seekCombat.MoveResult(false,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0])
  if active.shoot and services.activateTraceFn!=void then visible=services.activateTraceFn(services,bot,active) end if
  if visible then
    if bot.curPs.weapon==active.weapon then
      angles=q.vectoangles(seekCombat.subtract(active.target,bot.eye))
      if seekCombat.inFieldOfVision(bot.viewangles,20.0,angles) and services.attackFn!=void then services.attackFn(services,bot.client) end if
    end if
    if services.activateOriginFn!=void and services.activateOriginFn(services,goal.entitynum)!=active.origin then active.time=0.0 end if
    if active.time<time then
      navigation.popActivateGoal(services.navigationServices,bot)
      if bot.activateStackIndex>=0 then bot.activateGoalHeap[bot.activateStackIndex].time=n.fadd(time,10.0);return false end if
      enterSeekNbg(services,bot,"activate entity: time out");return false
    end if
  else
    if not active.shoot and services.activateTouchFn!=void and services.activateTouchFn(services,bot.origin,goal) then active.time=0.0 end if
    if active.time<time then
      navigation.popActivateGoal(services.navigationServices,bot)
      if bot.activateStackIndex>=0 then bot.activateGoalHeap[bot.activateStackIndex].time=n.fadd(time,10.0);return false end if
      enterSeekNbg(services,bot,"activate entity: activated");return false
    end if
    if predictObstacles(services,bot,goal) then return false end if
    setupMovement(services,bot);movement=services.moveToGoalFn(services,bot.ms,goal,bot.tfl)
    if movement.failure then services.resetAvoidFn(services,bot.ms);active.time=0.0 end if
    services.blockedFn(services,bot,movement,true)
  end if
  services.clearPathFn(services,bot,movement)
  if active.shoot then
    if (movement.flags&MOVERESULT_MOVEMENTVIEW)==0 then movement.idealViewangles=q.vectoangles(seekCombat.subtract(active.target,bot.eye));movement.flags=movement.flags|MOVERESULT_MOVEMENTVIEW end if
    if (movement.flags&MOVERESULT_MOVEMENTWEAPON)==0 then
      movement.flags=movement.flags|MOVERESULT_MOVEMENTWEAPON
      if services.selectActivateWeaponFn!=void then active.weapon=services.selectActivateWeaponFn(services,bot) end if;if active.weapon<0 then active.weapon=0 end if;movement.weapon=active.weapon
    end if
  end if
  fixed=(movement.flags&(MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW))!=0
  if fixed then bot.idealViewangles=[movement.idealViewangles[0],movement.idealViewangles[1],movement.idealViewangles[2]]
  else if (movement.flags&MOVERESULT_WAITING)!=0 then if cs.randomFn(cs)<n.fmul(bot.thinktime,0.8) then target=services.roamGoalFn(services,bot);bot.idealViewangles=q.vectoangles(seekCombat.subtract(target,bot.origin));bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5) end if
  else if (bot.combatFlags&BFL_IDEALVIEWSET)==0 then target=services.movementViewTargetFn(services,bot.ms,goal,bot.tfl,300.0);if target!=void then bot.idealViewangles=q.vectoangles(seekCombat.subtract(target,bot.origin)) else bot.idealViewangles=q.vectoangles(movement.movedir) end if;bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5) end if
  if (movement.flags&MOVERESULT_MOVEMENTWEAPON)!=0 then bot.weaponnum=movement.weapon end if
  if seekCombat.findEnemy(cs,bot,-1) then
    if seekCombat.wantsToRetreat(cs,bot) then fight.enterNbg(fs,bot,"activate entity: found enemy")
    else services.resetLastAvoidFn(services,bot.ms);services.emptyGoalStackFn(services,bot.gs);fight.enterFight(fs,bot,"activate entity: found enemy") end if
    clearActivation(services,bot)
  end if
  return true
end function
function longTermGoal(services,bot,goal)
  if services.longTermGoalFn!=void then return services.longTermGoalFn(services,bot,bot.tfl,false,goal) end if
  return navigation.longTermGoal(services.navigationServices,bot,bot.tfl,false,goal)
end function
function predictObstacles(services,bot,goal)
  if services.predictObstaclesFn!=void then return services.predictObstaclesFn(services,bot,goal) end if
  return navigation.predictObstacles(services.navigationServices,bot,goal,true)
end function
function setupMovement(services,bot)
  if services.setupMovementFn!=void then return services.setupMovementFn(services,bot) end if
  return navigation.setupForMovement(services.navigationServices,bot)
end function
function seekNode(services,bot)
  fs=services.fightServices;cs=fs.combatServices;time=seekCombat.now(cs)
  if services.observerFn(services,bot) then transition(services,bot,NODE_OBSERVER,"seek ltg: observer");return false end if
  if seekCombat.intermission(cs,bot) then transition(services,bot,NODE_INTERMISSION,"seek ltg: intermission");return false end if
  if seekCombat.isDead(bot) then transition(services,bot,NODE_RESPAWN,"seek ltg: bot dead");return false end if
  if services.randomChatFn(services,bot) then bot.standTime=n.fadd(time,services.chatTimeFn(services,bot));transition(services,bot,NODE_STAND,"seek ltg: random chat");return false end if
  bot.tfl=TFL_DEFAULT;if services.grapple then bot.tfl=bot.tfl|TFL_GRAPPLEHOOK end if
  if seekCombat.inLavaOrSlime(cs,bot) then bot.tfl=bot.tfl|TFL_LAVA|TFL_SLIME end if
  if seekCombat.canAndWantsToRocketJump(cs,bot) then bot.tfl=bot.tfl|TFL_ROCKETJUMP end if
  services.mapScriptsFn(services,bot);bot.enemy=-1
  if bot.killedEnemyTime>n.fsub(time,2.0) and cs.randomFn(cs)<bot.thinktime then services.gestureFn(services,bot.client) end if
  if seekCombat.findEnemy(cs,bot,-1) then
    if seekCombat.wantsToRetreat(cs,bot) then fight.enterRetreat(fs,bot,"seek ltg: found enemy")
    else services.resetLastAvoidFn(services,bot.ms);services.emptyGoalStackFn(services,bot.gs);fight.enterFight(fs,bot,"seek ltg: found enemy") end if
    return false
  end if
  services.teamGoalsFn(services,bot,false)
  goal=navigation.Goal(0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0,0,0)
  if not longTermGoal(services,bot,goal) then return true end if
  if bot.checkTime<time then
    bot.checkTime=n.fadd(time,0.5);services.wantsCampFn(services,bot);range=150.0;if bot.ltgtype==LTG_DEFENDKEYAREA then range=400.0 end if
    if cs.gametype==seekCombat.GT_CTF and seekCombat.ctfCarryingFlag(cs,bot)!=0 then range=50.0 end if;if services.missionNearbyRangeFn!=void then range=services.missionNearbyRangeFn(services,bot,range) end if
    if services.nearbyGoalFn(services,bot,bot.tfl,goal,range) then services.resetLastAvoidFn(services,bot.ms);bot.nbgTime=n.fadd(time,n.fadd(4.0,n.fmul(range,0.01)));services.enterSeekNbgFn(services,bot,"ltg seek: nbg");return false end if
  end if
  if predictObstacles(services,bot,goal) then return false end if
  setupMovement(services,bot);movement=services.moveToGoalFn(services,bot.ms,goal,bot.tfl)
  if movement.failure then services.resetAvoidFn(services,bot.ms);bot.ltgTime=0.0 end if
  services.blockedFn(services,bot,movement,true);services.clearPathFn(services,bot,movement)
  fixed=(movement.flags&(MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW))!=0
  if fixed then bot.idealViewangles=[movement.idealViewangles[0],movement.idealViewangles[1],movement.idealViewangles[2]]
  else if (movement.flags&MOVERESULT_WAITING)!=0 then
    if cs.randomFn(cs)<n.fmul(bot.thinktime,0.8) then target=services.roamGoalFn(services,bot);bot.idealViewangles=q.vectoangles(seekCombat.subtract(target,bot.origin));bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5) end if
  else if (bot.combatFlags&BFL_IDEALVIEWSET)==0 then
    target=services.movementViewTargetFn(services,bot.ms,goal,bot.tfl,300.0)
    if target!=void then bot.idealViewangles=q.vectoangles(seekCombat.subtract(target,bot.origin))
    else
      squared=n.fadd(n.fmul(movement.movedir[0],movement.movedir[0]),n.fadd(n.fmul(movement.movedir[1],movement.movedir[1]),n.fmul(movement.movedir[2],movement.movedir[2])))
      if squared!=0.0 then bot.idealViewangles=q.vectoangles(movement.movedir)
      else if cs.randomFn(cs)<n.fmul(bot.thinktime,0.8) then target=services.roamGoalFn(services,bot);bot.idealViewangles=q.vectoangles(seekCombat.subtract(target,bot.origin));bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5) end if
    end if
    bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5)
  end if
  if (movement.flags&MOVERESULT_MOVEMENTWEAPON)!=0 then bot.weaponnum=movement.weapon end if
  return true
end function
function seekNbgNode(services,bot)
  fs=services.fightServices;cs=fs.combatServices;time=seekCombat.now(cs)
  if services.observerFn(services,bot) then enterObserver(services,bot,"seek nbg: observer");return false end if
  if seekCombat.intermission(cs,bot) then enterIntermission(services,bot,"seek nbg: intermision");return false end if
  if seekCombat.isDead(bot) then enterRespawn(services,bot,"seek nbg: bot dead");return false end if
  bot.tfl=TFL_DEFAULT;if services.grapple then bot.tfl=bot.tfl|TFL_GRAPPLEHOOK end if
  if seekCombat.inLavaOrSlime(cs,bot) then bot.tfl=bot.tfl|TFL_LAVA|TFL_SLIME end if
  if seekCombat.canAndWantsToRocketJump(cs,bot) then bot.tfl=bot.tfl|TFL_ROCKETJUMP end if
  services.mapScriptsFn(services,bot);bot.enemy=-1;pair=services.topGoalFn(services,bot.gs);hasGoal=pair[0];goal=pair[1]
  if not hasGoal then bot.nbgTime=0.0
  else if services.reachedGoalFn!=void and services.reachedGoalFn(services,bot,goal) then if services.chooseWeaponFn!=void then services.chooseWeaponFn(services,bot) end if;bot.nbgTime=0.0 end if
  if bot.nbgTime<time then
    if services.popGoalFn!=void then services.popGoalFn(services,bot.gs) end if;bot.checkTime=n.fadd(time,0.05);enterSeek(services,bot,"seek nbg: time out");return false
  end if
  if predictObstacles(services,bot,goal) then return false end if
  setupMovement(services,bot);movement=services.moveToGoalFn(services,bot.ms,goal,bot.tfl)
  if movement.failure then services.resetAvoidFn(services,bot.ms);bot.nbgTime=0.0 end if
  services.blockedFn(services,bot,movement,true);services.clearPathFn(services,bot,movement)
  fixed=(movement.flags&(MOVERESULT_MOVEMENTVIEWSET|MOVERESULT_MOVEMENTVIEW|MOVERESULT_SWIMVIEW))!=0
  if fixed then bot.idealViewangles=[movement.idealViewangles[0],movement.idealViewangles[1],movement.idealViewangles[2]]
  else if (movement.flags&MOVERESULT_WAITING)!=0 then
    if cs.randomFn(cs)<n.fmul(bot.thinktime,0.8) then target=services.roamGoalFn(services,bot);bot.idealViewangles=q.vectoangles(seekCombat.subtract(target,bot.origin));bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5) end if
  else if (bot.combatFlags&BFL_IDEALVIEWSET)==0 then
    viewGoal=goal;if services.secondGoalFn!=void then second=services.secondGoalFn(services,bot.gs);if second[0] then viewGoal=second[1] end if end if
    target=services.movementViewTargetFn(services,bot.ms,viewGoal,bot.tfl,300.0)
    if target!=void then bot.idealViewangles=q.vectoangles(seekCombat.subtract(target,bot.origin)) else bot.idealViewangles=q.vectoangles(movement.movedir) end if
    bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5)
  end if
  if (movement.flags&MOVERESULT_MOVEMENTWEAPON)!=0 then bot.weaponnum=movement.weapon end if
  if seekCombat.findEnemy(cs,bot,-1) then
    if seekCombat.wantsToRetreat(cs,bot) then fight.enterNbg(fs,bot,"seek nbg: found enemy")
    else services.resetLastAvoidFn(services,bot.ms);services.emptyGoalStackFn(services,bot.gs);fight.enterFight(fs,bot,"seek nbg: found enemy") end if
  end if
  return true
end function
function runNode(services,bot)
  if bot.aiNode==0 then enterSeek(services,bot,"BotDeathmatchAI: first frame") end if
  if bot.aiNode==NODE_SEEK then return seekNode(services,bot) end if
  if bot.aiNode==NODE_SEEK_NBG then return seekNbgNode(services,bot) end if
  if bot.aiNode==NODE_STAND then return standNode(services,bot) end if
  if bot.aiNode==NODE_OBSERVER then return observerNode(services,bot) end if
  if bot.aiNode==NODE_INTERMISSION then return intermissionNode(services,bot) end if
  if bot.aiNode==NODE_RESPAWN then return respawnNode(services,bot) end if
  if bot.aiNode==NODE_ACTIVATE then if services.activationNodeFn!=void then return services.activationNodeFn(services,bot) end if;return activateNode(services,bot) end if
  return fight.runNode(services.fightServices,bot)
end function
