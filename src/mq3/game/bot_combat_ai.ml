// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ai_dmq3.c combat-state predicates and tactical decisions.
package mq3.game.bot_combat_ai
import mq3.game.constants as c
import mq3.game.bot_input as input
import mq3.compat.numeric as n
import mq3.shared.math as q

const GT_TEAM=3
const GT_CTF=4
const LTG_GETFLAG=4
const WP_GAUNTLET=1
const WP_MACHINEGUN=2
const EF_TELEPORT_BIT=4
const EF_FIRING=0x100
const EF_TALK=0x1000
const CONTENTS_LAVA=8
const CONTENTS_SLIME=16
const INVENTORY_ARMOR=1
const INVENTORY_SHOTGUN=5
const INVENTORY_GRENADELAUNCHER=7
const INVENTORY_ROCKETLAUNCHER=8
const INVENTORY_LIGHTNING=9
const INVENTORY_RAILGUN=10
const INVENTORY_PLASMAGUN=11
const INVENTORY_BFG10K=13
const INVENTORY_SHELLS=18
const INVENTORY_GRENADES=20
const INVENTORY_CELLS=21
const INVENTORY_LIGHTNINGAMMO=22
const INVENTORY_ROCKETS=23
const INVENTORY_SLUGS=24
const INVENTORY_BFGAMMO=25
const INVENTORY_HEALTH=29
const INVENTORY_QUAD=35
const INVENTORY_REDFLAG=45
const INVENTORY_BLUEFLAG=46
const ENEMY_HORIZONTAL_DIST=200
const ENEMY_HEIGHT=201
const CHARACTERISTIC_WEAPONJUMPING=43
const CHARACTERISTIC_REACTIONTIME=6
const CHARACTERISTIC_AIM_ACCURACY=7
const CHARACTERISTIC_AIM_SKILL=16
const CHARACTERISTIC_EASY_FRAGGER=45
const CHARACTERISTIC_ALERTNESS=46
const CHARACTERISTIC_FIRETHROTTLE=47
const BFL_ATTACKED=2
const WFL_FIRERELEASED=1
const DAMAGETYPE_RADIAL=2
const CHARACTERISTIC_ATTACK_SKILL=5
const CHARACTERISTIC_JUMPER=21
const CHARACTERISTIC_CROUCHER=22
const MOVE_WALK=1
const MOVE_CROUCH=2
const MOVE_JUMP=8
const BFL_STRAFERIGHT=8

struct EntityInfo number powerups flags end struct
struct TargetEntityInfo number powerups flags valid origin angles lastVisOrigin updateTime end struct
struct Trace fraction ent endpos startsolid end struct
struct WeaponInfo number speed offset vspread hspread damageType radius damage flags end struct
struct CombatGoal entitynum areanum origin mins maxs end struct
struct MoveResult failure flags weapon movedir idealViewangles end struct
struct Services
  gametype
  rocketjump
  intermissiontime
  floatTimeFn
  pointContentsFn
  characteristicFloatFn
  entityInfoFn
  maxclients
  lastteleportTime
  lastteleportOrigin
  entityDeadFn
  sameTeamFn
  visibleFn
  updateBattleFn
  randomFn
  traceFn
  weaponInfoFn
  attackFn
  predictMovementFn
  predictVisibleFn
  setupMovementFn
  moveToGoalFn
  moveDirectionFn
  context
end struct

function create()
  return Services(0,false,0,void,void,void,void,64,0.0,[0.0,0.0,0.0],void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function
function entityCarriesFlag(entinfo)
  return (entinfo.powerups&(1<<c.PW_REDFLAG))!=0 or (entinfo.powerups&(1<<c.PW_BLUEFLAG))!=0
end function
function entityIsInvisible(entinfo)
  if entityCarriesFlag(entinfo) then return false end if
  return (entinfo.powerups&(1<<c.PW_INVIS))!=0
end function
function entityIsShooting(entinfo) return (entinfo.flags&EF_FIRING)!=0 end function
function entityIsChatting(entinfo) return (entinfo.flags&EF_TALK)!=0 end function
function entityHasQuad(entinfo) return (entinfo.powerups&(1<<c.PW_QUAD))!=0 end function
function ctfCarryingFlag(services,bot)
  if services.gametype!=GT_CTF then return 0 end if
  if bot.inventory[INVENTORY_REDFLAG]>0 then return 1 end if
  if bot.inventory[INVENTORY_BLUEFLAG]>0 then return 2 end if
  return 0
end function
function teamPlayIsOn(services) return services.gametype>=GT_TEAM end function
function setTeleportTime(services,bot)
  if ((bot.curPs.eFlags^bot.lastEFlags)&EF_TELEPORT_BIT)!=0 then bot.teleportTime=services.floatTimeFn(services) end if
  bot.lastEFlags=bot.curPs.eFlags; return void
end function
function isDead(bot) return bot.curPs.pm_type==c.PM_DEAD end function
function intermission(services,bot)
  if services.intermissiontime!=0 then return true end if
  return bot.curPs.pm_type==c.PM_FREEZE or bot.curPs.pm_type==c.PM_INTERMISSION
end function
function inLavaOrSlime(services,bot)
  feet=[bot.origin[0],bot.origin[1],n.fsub(bot.origin[2],23.0)]
  return (services.pointContentsFn(services,feet)&(CONTENTS_LAVA|CONTENTS_SLIME))!=0
end function
function aggression(bot)
  inv=bot.inventory
  if inv[INVENTORY_QUAD]!=0 and (bot.weaponnum!=WP_GAUNTLET or inv[ENEMY_HORIZONTAL_DIST]<80) then return 70.0 end if
  if inv[ENEMY_HEIGHT]>200 then return 0.0 end if
  if inv[INVENTORY_HEALTH]<60 then return 0.0 end if
  if inv[INVENTORY_HEALTH]<80 and inv[INVENTORY_ARMOR]<40 then return 0.0 end if
  if inv[INVENTORY_BFG10K]>0 and inv[INVENTORY_BFGAMMO]>7 then return 100.0 end if
  if inv[INVENTORY_RAILGUN]>0 and inv[INVENTORY_SLUGS]>5 then return 95.0 end if
  if inv[INVENTORY_LIGHTNING]>0 and inv[INVENTORY_LIGHTNINGAMMO]>50 then return 90.0 end if
  if inv[INVENTORY_ROCKETLAUNCHER]>0 and inv[INVENTORY_ROCKETS]>5 then return 90.0 end if
  if inv[INVENTORY_PLASMAGUN]>0 and inv[INVENTORY_CELLS]>40 then return 85.0 end if
  if inv[INVENTORY_GRENADELAUNCHER]>0 and inv[INVENTORY_GRENADES]>10 then return 80.0 end if
  if inv[INVENTORY_SHOTGUN]>0 and inv[INVENTORY_SHELLS]>10 then return 50.0 end if
  return 0.0
end function
function feelingBad(bot)
  if bot.weaponnum==WP_GAUNTLET then return 100.0 end if
  if bot.inventory[INVENTORY_HEALTH]<40 then return 100.0 end if
  if bot.weaponnum==WP_MACHINEGUN then return 90.0 end if
  if bot.inventory[INVENTORY_HEALTH]<60 then return 80.0 end if
  return 0.0
end function
function wantsToRetreat(services,bot)
  if services.gametype==GT_CTF and ctfCarryingFlag(services,bot)!=0 then return true end if
  if bot.enemy>=0 and entityCarriesFlag(services.entityInfoFn(services,bot.enemy)) then return false end if
  if bot.ltgtype==LTG_GETFLAG then return true end if
  return aggression(bot)<50.0
end function
function wantsToChase(services,bot)
  if services.gametype==GT_CTF then
    if ctfCarryingFlag(services,bot)!=0 then return false end if
    if entityCarriesFlag(services.entityInfoFn(services,bot.enemy)) then return true end if
  end if
  if bot.ltgtype==LTG_GETFLAG then return false end if
  return aggression(bot)>50.0
end function
function canAndWantsToRocketJump(services,bot)
  inv=bot.inventory
  if not services.rocketjump or inv[INVENTORY_ROCKETLAUNCHER]<=0 or inv[INVENTORY_ROCKETS]<3 then return false end if
  if inv[INVENTORY_QUAD]!=0 or inv[INVENTORY_HEALTH]<60 then return false end if
  if inv[INVENTORY_HEALTH]<90 and inv[INVENTORY_ARMOR]<40 then return false end if
  value=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_WEAPONJUMPING,0.0,1.0)
  return value>=0.5
end function
function inFieldOfVision(viewangles,fov,angles)
  for axis=0 to 1
    angle=input.angleMod(viewangles[axis]); angles[axis]=input.angleMod(angles[axis]); diff=n.fsub(angles[axis],angle)
    if angles[axis]>angle then if diff>180.0 then diff=n.fsub(diff,360.0) end if
    else if diff < -180.0 then diff=n.fadd(diff,360.0) end if
    if diff>0 then if diff>n.fmul(fov,0.5) then return false end if
    else if diff<n.fneg(n.fmul(fov,0.5)) then return false end if
  end for
  return true
end function

function subtract(a,b) return [n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])] end function
function lengthSquared(v) return q.DotProduct(v,v) end function
function now(services) return services.floatTimeFn(services) end function

function findEnemy(services,bot,curenemy)
  alertness=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_ALERTNESS,0.0,1.0)
  easyfragger=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_EASY_FRAGGER,0.0,1.0)
  healthdecrease=bot.lastHealth>bot.inventory[INVENTORY_HEALTH];bot.lastHealth=bot.inventory[INVENTORY_HEALTH];cursquaredist=0.0
  if curenemy>=0 then current=services.entityInfoFn(services,curenemy);if entityCarriesFlag(current) then return false end if;cursquaredist=lengthSquared(subtract(current.origin,bot.origin)) end if
  limit=services.maxclients;if limit>64 then limit=64 end if
  for index=0 to limit-1
    if index==bot.client or index==curenemy then continue end if
    ent=services.entityInfoFn(services,index)
    if not ent.valid or services.entityDeadFn(services,ent) or ent.number==bot.entitynum then continue end if
    if entityIsInvisible(ent) and not entityIsShooting(ent) then continue end if
    if easyfragger<0.5 and entityIsChatting(ent) then continue end if
    if services.lastteleportTime>n.fsub(now(services),3.0) and lengthSquared(subtract(ent.origin,services.lastteleportOrigin))<4900.0 then continue end if
    squaredist=lengthSquared(subtract(ent.origin,bot.origin))
    if not entityCarriesFlag(ent) and curenemy>=0 and squaredist>cursquaredist then continue end if
    reach=n.fadd(900.0,n.fmul(alertness,4000.0));if squaredist>n.fmul(reach,reach) then continue end if
    if services.sameTeamFn(services,bot,index) then continue end if
    fov=0.0;bounded=0.0
    if curenemy<0 and (healthdecrease or entityIsShooting(ent)) then fov=360.0
    else bounded=squaredist;if bounded>656100.0 then bounded=656100.0 end if;fov=n.fsub(180.0,n.fsub(90.0,n.fdiv(bounded,7290.0))) end if
    if services.visibleFn(services,bot.entitynum,bot.eye,bot.viewangles,fov,index)<=0 then continue end if
    if curenemy<0 and squaredist>10000.0 and not healthdecrease and not entityIsShooting(ent) then
      angles=q.vectoangles(subtract(bot.origin,ent.origin))
      if not inFieldOfVision(ent.angles,90.0,angles) then services.updateBattleFn(services,bot,index);if wantsToRetreat(services,bot) then continue end if end if
    end if
    bot.enemy=ent.number;if curenemy>=0 then bot.enemySightTime=n.fsub(now(services),2.0) else bot.enemySightTime=now(services) end if
    bot.enemySuicide=false;bot.enemyDeathTime=0.0;bot.enemyVisibleTime=now(services);return true
  end for
  return false
end function

function projectileAim(services,bot,ent,weapon,aimskill,best)
  velocity=subtract(ent.origin,ent.lastVisOrigin);velocity=q.VectorScale(velocity,n.fdiv(1.0,ent.updateTime))
  if bot.enemyPositionTime<now(services) then bot.enemyPositionTime=n.fadd(now(services),0.5);bot.enemyVelocity=[velocity[0],velocity[1],velocity[2]];bot.enemyOrigin=[ent.origin[0],ent.origin[1],ent.origin[2]] end if
  distance=q.VectorLength(subtract(best,bot.origin));drift=subtract(ent.origin,bot.enemyOrigin)
  if distance>100.0 and lengthSquared(drift)<1024.0 then return best end if
  if aimskill>0.8 and bot.curPs.weaponstate==0 then
    frames=n.fdiv(n.fmul(distance,10.0),weapon.speed);origin=[ent.origin[0],ent.origin[1],n.fadd(ent.origin[2],1.0)]
    return services.predictMovementFn(services,bot.enemy,origin,velocity,frames,0.1)
  end if
  if aimskill>0.4 then
    horizontal=[velocity[0],velocity[1],0.0];speed=q.VectorNormalize(horizontal)
    return q.VectorMA(ent.origin,n.fmul(n.fdiv(distance,weapon.speed),speed),horizontal)
  end if
  return best
end function

function splashGroundAim(services,bot,ent,start,best)
  if ent.origin[2]>=n.fadd(bot.origin[2],16.0) then return best end if
  down=[ent.origin[0],ent.origin[1],n.fsub(ent.origin[2],64.0)];floor=services.traceFn(services,ent.origin,down,ent.number,4);ground=[best[0],best[1],best[2]]
  if floor.startsolid then ground[2]=n.fsub(ent.origin[2],16.0) else ground[2]=n.fsub(floor.endpos[2],8.0) end if
  shot=services.traceFn(services,start,ground,bot.entitynum,1)
  dz=n.fsub(shot.endpos[2],ground[2]);if dz<0 then dz=n.fneg(dz) end if;if dz>=50.0 then return best end if
  if lengthSquared(subtract(shot.endpos,ground))>=3600.0 or lengthSquared(subtract(shot.endpos,start))<=10000.0 then return best end if
  eye=[shot.endpos[0],shot.endpos[1],n.fadd(shot.endpos[2],1.0)];clear=services.traceFn(services,eye,ent.origin,ent.number,1);if clear.fraction>=1.0 then return ground end if
  return best
end function

function cornerAim(services,bot,weapon,aimskill,best)
  if aimskill<=0.5 or (weapon.number!=5 and weapon.number!=4 and weapon.number!=9) then return best end if
  target=services.predictVisibleFn(services,bot.lastEnemyOrigin,bot.lastEnemyAreaNum,bot.eye)
  if target==void or lengthSquared(subtract(target,bot.eye))<=6400.0 then return best end if
  return [target[0],target[1],n.fsub(target[2],20.0)]
end function

function aimAtEnemy(services,bot)
  if bot.enemy<0 then return false end if
  ent=services.entityInfoFn(services,bot.enemy);best=[ent.origin[0],ent.origin[1],ent.origin[2]]
  if bot.enemy>=64 then bot.aimTarget=best;bot.idealViewangles=q.vectoangles(subtract(best,bot.eye));return true end if
  aimskill=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_AIM_SKILL,0.0,1.0)
  accuracy=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_AIM_ACCURACY,0.0,1.0)
  if aimskill>0.95 then reaction=n.fmul(0.5,services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_REACTIONTIME,0.0,1.0));if bot.enemySightTime>n.fsub(now(services),reaction) or bot.teleportTime>n.fsub(now(services),reaction) then return false end if end if
  if accuracy<=0 then accuracy=0.0001 end if
  weapon=services.weaponInfoFn(services,bot.ws,bot.weaponnum)
  visible=services.visibleFn(services,bot.entitynum,bot.eye,bot.viewangles,360.0,bot.enemy)>0
  if visible then
    best[2]=n.fadd(best[2],8.0);probe=services.traceFn(services,bot.eye,best,bot.entitynum,1);if probe.fraction<=1.0 and probe.ent!=ent.number then best[2]=n.fadd(best[2],16.0) end if
    if weapon.speed!=0.0 then best=projectileAim(services,bot,ent,weapon,aimskill,best) end if
    if aimskill>0.6 and (weapon.damageType&DAMAGETYPE_RADIAL)!=0 then start=[bot.origin[0],bot.origin[1],n.fadd(n.fadd(bot.origin[2],bot.curPs.viewheight),weapon.offset[2])];best=splashGroundAim(services,bot,ent,start,best) end if
    best[0]=n.fadd(best[0],n.fmul(n.fmul(20.0,services.randomFn(services)),n.fsub(1.0,accuracy)));best[1]=n.fadd(best[1],n.fmul(n.fmul(20.0,services.randomFn(services)),n.fsub(1.0,accuracy)));best[2]=n.fadd(best[2],n.fmul(n.fmul(10.0,services.randomFn(services)),n.fsub(1.0,accuracy)))
    finalTrace=services.traceFn(services,bot.eye,best,bot.entitynum,1);bot.aimTarget=finalTrace.endpos
  else best=[bot.lastEnemyOrigin[0],bot.lastEnemyOrigin[1],n.fadd(bot.lastEnemyOrigin[2],8.0)];best=cornerAim(services,bot,weapon,aimskill,best);bot.aimTarget=best end if
  dir=subtract(best,bot.eye)
  if accuracy<0.8 then q.VectorNormalize(dir);for axis=0 to 2 dir[axis]=n.fadd(dir[axis],n.fmul(n.fmul(0.3,services.randomFn(services)),n.fsub(1.0,accuracy))) end for end if
  bot.idealViewangles=q.vectoangles(dir);return true
end function

function checkAttack(services,bot)
  attackentity=bot.enemy;services.entityInfoFn(services,attackentity);time=now(services);reaction=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_REACTIONTIME,0.0,1.0)
  if bot.enemySightTime>n.fsub(time,reaction) or bot.teleportTime>n.fsub(time,reaction) or bot.weaponchangeTime>n.fsub(time,0.1) then return false end if
  if bot.firethrottlewaitTime>time then return false end if
  throttle=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_FIRETHROTTLE,0.0,1.0)
  if bot.firethrottleshootTime<time then if services.randomFn(services)>throttle then bot.firethrottlewaitTime=n.fadd(time,throttle);bot.firethrottleshootTime=0.0 else bot.firethrottleshootTime=n.fadd(time,n.fsub(1.0,throttle));bot.firethrottlewaitTime=0.0 end if end if
  dir=subtract(bot.aimTarget,bot.eye);distance2=lengthSquared(dir);if bot.weaponnum==WP_GAUNTLET and distance2>3600.0 then return false end if
  fov=50.0;if distance2<10000.0 then fov=120.0 end if;if not inFieldOfVision(bot.viewangles,fov,q.vectoangles(dir)) then return false end if
  sight=services.traceFn(services,bot.eye,bot.aimTarget,bot.client,2);if sight.fraction<1.0 and sight.ent!=attackentity then return false end if
  weapon=services.weaponInfoFn(services,bot.ws,bot.weaponnum);vectors=q.AngleVectors(bot.viewangles);forward=vectors[0];right=vectors[1]
  start=[bot.origin[0],bot.origin[1],n.fadd(bot.origin[2],bot.curPs.viewheight)];start[0]=n.fadd(start[0],n.fadd(n.fmul(forward[0],weapon.offset[0]),n.fmul(right[0],weapon.offset[1])));start[1]=n.fadd(start[1],n.fadd(n.fmul(forward[1],weapon.offset[0]),n.fmul(right[1],weapon.offset[1])));start[2]=n.fadd(start[2],n.fadd(n.fadd(n.fmul(forward[2],weapon.offset[0]),n.fmul(right[2],weapon.offset[1])),weapon.offset[2]))
  finish=q.VectorMA(start,1000.0,forward);start=q.VectorMA(start,-12.0,forward);hit=services.traceFn(services,start,finish,bot.entitynum,3)
  if hit.ent>0 and hit.ent<=64 and hit.ent!=attackentity and services.sameTeamFn(services,bot,hit.ent) then return false end if
  if hit.ent!=attackentity or attackentity>=64 then if (weapon.damageType&DAMAGETYPE_RADIAL)!=0 and n.fmul(hit.fraction,1000.0)<weapon.radius then points=n.fmul(n.fsub(weapon.damage,n.fmul(n.fmul(0.5,hit.fraction),1000.0)),0.5);if points>0 then return false end if end if end if
  attacked=false;if (weapon.flags&WFL_FIRERELEASED)!=0 then if (bot.combatFlags&BFL_ATTACKED)!=0 then services.attackFn(services,bot.client);attacked=true end if else services.attackFn(services,bot.client);attacked=true end if
  bot.combatFlags=bot.combatFlags^BFL_ATTACKED;return attacked
end function

function emptyMoveResult() return MoveResult(false,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
function attackMove(services,bot,tfl)
  attackentity=bot.enemy;time=now(services)
  if bot.attackchaseTime>time then
    goal=CombatGoal(attackentity,bot.lastEnemyAreaNum,[bot.lastEnemyOrigin[0],bot.lastEnemyOrigin[1],bot.lastEnemyOrigin[2]],[-8.0,-8.0,-8.0],[8.0,8.0,8.0])
    services.setupMovementFn(services,bot);return services.moveToGoalFn(services,bot.ms,goal,tfl)
  end if
  result=emptyMoveResult();skill=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_ATTACK_SKILL,0.0,1.0);jumper=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_JUMPER,0.0,1.0);croucher=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_CROUCHER,0.0,1.0)
  if skill<0.2 then return result end if
  services.setupMovementFn(services,bot);ent=services.entityInfoFn(services,attackentity);forward=subtract(ent.origin,bot.origin);distance=q.VectorNormalize(forward);backward=[n.fneg(forward[0]),n.fneg(forward[1]),n.fneg(forward[2])];movetype=MOVE_WALK
  if bot.attackcrouchTime<n.fsub(time,1.0) then
    if services.randomFn(services)<jumper then movetype=MOVE_JUMP
    else if bot.attackcrouchTime<n.fsub(time,1.0) and services.randomFn(services)<croucher then bot.attackcrouchTime=n.fadd(time,n.fmul(croucher,5.0)) end if
  end if
  if bot.attackcrouchTime>time then movetype=MOVE_CROUCH end if
  if movetype==MOVE_JUMP then if bot.attackjumpTime>time then movetype=MOVE_WALK else bot.attackjumpTime=n.fadd(time,1.0) end if end if
  attackDistance=140.0;attackRange=40.0;if bot.curPs.weapon==WP_GAUNTLET then attackDistance=0.0;attackRange=0.0 end if
  if skill<=0.4 then
    if distance>n.fadd(attackDistance,attackRange) and services.moveDirectionFn(services,bot.ms,forward,400.0,movetype) then return result end if
    if distance<n.fsub(attackDistance,attackRange) and services.moveDirectionFn(services,bot.ms,backward,400.0,movetype) then return result end if
    return result
  end if
  bot.attackstrafeTime=n.fadd(bot.attackstrafeTime,bot.thinktime);change=n.fadd(0.4,n.fmul(n.fsub(1.0,skill),0.2))
  if skill>0.7 then change=n.fadd(change,n.fmul(n.fsub(n.fmul(2.0,services.randomFn(services)),1.0),0.2)) end if
  if bot.attackstrafeTime>change and services.randomFn(services)>0.935 then bot.combatFlags=bot.combatFlags^BFL_STRAFERIGHT;bot.attackstrafeTime=0.0 end if
  for attempt=0 to 1
    horizontal=[forward[0],forward[1],0.0];q.VectorNormalize(horizontal);side=[horizontal[1],n.fneg(horizontal[0]),0.0]
    if (bot.combatFlags&BFL_STRAFERIGHT)!=0 then side=[n.fneg(side[0]),n.fneg(side[1]),n.fneg(side[2])] end if
    if services.randomFn(services)>0.9 then side=[n.fadd(side[0],backward[0]),n.fadd(side[1],backward[1]),n.fadd(side[2],backward[2])]
    else if distance>n.fadd(attackDistance,attackRange) then side=[n.fadd(side[0],forward[0]),n.fadd(side[1],forward[1]),n.fadd(side[2],forward[2])]
    else if distance<n.fsub(attackDistance,attackRange) then side=[n.fadd(side[0],backward[0]),n.fadd(side[1],backward[1]),n.fadd(side[2],backward[2])] end if
    if services.moveDirectionFn(services,bot.ms,side,400.0,movetype) then return result end if
    bot.combatFlags=bot.combatFlags^BFL_STRAFERIGHT;bot.attackstrafeTime=0.0
  end for
  return result
end function
