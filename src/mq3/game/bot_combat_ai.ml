// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Baseq3 ai_dmq3.c combat-state predicates and tactical decisions.
package mq3.game.bot_combat_ai
import mq3.game.game_headers as headers
import mq3.game.constants as c
import mq3.game.bot_input as input
import mq3.game.bot_ai_headers as aiheaders
import mq3.compat.numeric as n
import mq3.shared.math as q

/// Game-mode identifier selecting team rules.
const GT_TEAM=3
/// Game-mode identifier selecting capture the flag rules.
const GT_CTF=4
/// Long-term bot goal identifier selecting capture the flag behavior.
const LTG_GETFLAG=4
/// Weapon identifier selecting gauntlet.
const WP_GAUNTLET=1
/// Weapon identifier selecting machine gun.
const WP_MACHINEGUN=2
/// Network entity-flag bit indicating teleport bit.
const EF_TELEPORT_BIT=4
/// Network entity-flag bit indicating firing.
const EF_FIRING=0x100
/// Network entity-flag bit indicating talk.
const EF_TALK=0x1000
/// Collision-contents bit identifying lava space or objects.
const CONTENTS_LAVA=headers.CONTENTS_LAVA
/// Collision-contents bit identifying slime space or objects.
const CONTENTS_SLIME=headers.CONTENTS_SLIME
/// Bot inventory slot used to read or update armor.
const INVENTORY_ARMOR=headers.INVENTORY_ARMOR
/// Bot inventory slot used to read or update shotgun.
const INVENTORY_SHOTGUN=headers.INVENTORY_SHOTGUN
/// Bot inventory slot used to read or update grenade launcher.
const INVENTORY_GRENADELAUNCHER=headers.INVENTORY_GRENADELAUNCHER
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
/// Bot inventory slot used to read or update shells.
const INVENTORY_SHELLS=headers.INVENTORY_SHELLS
/// Bot inventory slot used to read or update grenades.
const INVENTORY_GRENADES=headers.INVENTORY_GRENADES
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
/// Bot inventory slot used to read or update health.
const INVENTORY_HEALTH=headers.INVENTORY_HEALTH
/// Bot inventory slot used to read or update quad.
const INVENTORY_QUAD=headers.INVENTORY_QUAD
/// Bot inventory slot used to read or update redflag.
const INVENTORY_REDFLAG=headers.INVENTORY_REDFLAG
/// Bot inventory slot used to read or update blueflag.
const INVENTORY_BLUEFLAG=headers.INVENTORY_BLUEFLAG
/// Bot inventory slot containing horizontal distance to the selected enemy.
const ENEMY_HORIZONTAL_DIST=headers.ENEMY_HORIZONTAL_DIST
/// Bot inventory slot containing the enemy height relative to the bot.
const ENEMY_HEIGHT=headers.ENEMY_HEIGHT
/// Bot-character characteristic index for weaponjumping. Definition: tendency to jump using a weapon
/// float [0, 1].
const CHARACTERISTIC_WEAPONJUMPING=headers.CHARACTERISTIC_WEAPONJUMPING
/// Bot-character characteristic index for reactiontime. Definition: reaction time in seconds float [0,
/// 5].
const CHARACTERISTIC_REACTIONTIME=headers.CHARACTERISTIC_REACTIONTIME
/// Bot-character characteristic index for aim accuracy. Definition: accuracy when aiming float [0, 1].
const CHARACTERISTIC_AIM_ACCURACY=headers.CHARACTERISTIC_AIM_ACCURACY
/// Bot-character characteristic index controlling aim skill.
const CHARACTERISTIC_AIM_SKILL=headers.CHARACTERISTIC_AIM_SKILL
/// Bot-character characteristic index for easy fragger. Definition: tendency to get easy frags float
/// [0, 1].
const CHARACTERISTIC_EASY_FRAGGER=headers.CHARACTERISTIC_EASY_FRAGGER
/// Bot-character characteristic index for alertness. Definition: how alert the bot is (view distance)
/// float [0, 1].
const CHARACTERISTIC_ALERTNESS=headers.CHARACTERISTIC_ALERTNESS
/// Bot-character characteristic index for firethrottle. Definition: how much the bot fires it's weapon
/// float [0, 1].
const CHARACTERISTIC_FIRETHROTTLE=headers.CHARACTERISTIC_FIRETHROTTLE
/// Bot-state flag marking attacked.
const BFL_ATTACKED=aiheaders.BFL_ATTACKED
/// Bot weapon flag selecting firereleased.
const WFL_FIRERELEASED=1
/// Weapon damage-category bit identifying radial damage.
const DAMAGETYPE_RADIAL=2
/// Bot-character characteristic index controlling attack skill.
const CHARACTERISTIC_ATTACK_SKILL=headers.CHARACTERISTIC_ATTACK_SKILL
/// Bot-character characteristic index for jumper. Definition: tendency to jump float [0, 1].
const CHARACTERISTIC_JUMPER=headers.CHARACTERISTIC_JUMPER
/// Bot-character characteristic index for croucher. Definition: movement tendency to crouch float [0,
/// 1].
const CHARACTERISTIC_CROUCHER=headers.CHARACTERISTIC_CROUCHER
/// Bot movement-type flag selecting walk.
const MOVE_WALK=1
/// Bot movement-type flag selecting crouch.
const MOVE_CROUCH=2
/// Bot movement-type flag selecting jump.
const MOVE_JUMP=8
/// Bot-state flag marking straferight.
const BFL_STRAFERIGHT=aiheaders.BFL_STRAFERIGHT

/// `EntityInfo` record for bot combat ai, containing `number`, `powerups` and `flags`.
struct EntityInfo
  /// Entity number identifying the tracked game object.
  number
  /// Powerup state or expiration values indexed by PW_* identifiers.
  powerups
  /// Entity-flag mask supplied by the tracked game or botlib entity state.
  flags
end struct
/// `TargetEntityInfo` record for bot combat ai, containing `number`, `powerups`, `flags`, `valid` and `origin` and related fields.
struct TargetEntityInfo
  /// Entity number identifying the tracked game object.
  number
  /// Powerup state or expiration values indexed by PW_* identifiers.
  powerups
  /// Entity-flag mask supplied by the tracked game or botlib entity state.
  flags
  /// True when the combat-target lookup returned usable entity information.
  valid
  /// Reported world-space position of the potential combat target.
  origin
  /// Orientation angles used by the entity or movement operation.
  angles
  /// Most recent position at which the tracked entity was visible.
  lastVisOrigin
  /// Timestamp at which the tracked information was last refreshed.
  updateTime
end struct
/// `Trace` record for bot combat ai, containing `fraction`, `ent`, `endpos` and `startsolid`.
struct Trace
  /// Fraction of the requested trace completed before the first blocking collision.
  fraction
  /// Entity number hit by or blocking the spatial query.
  ent
  /// Final position reached by the collision trace.
  endpos
  /// Nonzero when the requested trace begins inside solid space.
  startsolid
end struct
/// `WeaponInfo` record for bot combat ai, containing `number`, `speed`, `offset`, `vspread` and `hspread` and related fields.
struct WeaponInfo
  /// Weapon identifier associated with these combat characteristics.
  number
  /// Movement or travel speed used by this game object.
  speed
  /// Vector offset of the projectile launch position relative to the weapon origin.
  offset
  /// Vertical spread applied when generating a weapon shot direction.
  vspread
  /// Horizontal spread applied when generating a weapon shot direction.
  hspread
  /// Weapon damage-category flags describing the attack effect.
  damageType
  /// World-space radius used by the weapon or spatial effect.
  radius
  /// Damage amount applied by this entity, attack, or operation.
  damage
  /// WFL_* flags controlling bot weapon firing behavior.
  flags
end struct
/// `CombatGoal` record for bot combat ai, containing `entitynum`, `areanum`, `origin`, `mins` and `maxs`.
struct CombatGoal
  /// Entity number associated with the goal used by bot combat movement.
  entitynum
  /// AAS area containing the bot or spatial goal.
  areanum
  /// World-space target position of the goal used by bot combat movement.
  origin
  /// Lower local bounding-box corner of the goal used by bot combat movement.
  mins
  /// Upper local bounding-box corner of the goal used by bot combat movement.
  maxs
end struct
/// `MoveResult` record for bot combat ai, containing `failure`, `flags`, `weapon`, `movedir` and `idealViewangles`.
struct MoveResult
  /// Nonzero when the bot movement operation could not be completed.
  failure
  /// MOVERESULT_* flags describing the result of the bot movement attempt.
  flags
  /// Selected or reported weapon identifier.
  weapon
  /// Normalized direction along which the entity moves or fires.
  movedir
  /// Target viewing angles toward which the bot should turn.
  idealViewangles
end struct
/// `Services` record for bot combat ai, containing `gametype`, `rocketjump`, `intermissiontime`, `floatTimeFn` and `pointContentsFn` and related fields.
struct Services
  /// GT_* game-mode identifier used for mode-specific bot combat and team-relationship decisions.
  gametype
  /// Nonzero when the bot is allowed or instructed to use a rocket jump.
  rocketjump
  /// Timestamp at which the intermission began.
  intermissiontime
  /// Injected callback for float time; invoked through the Services service/state record.
  floatTimeFn
  /// Injected callback for point contents; invoked through the Services service/state record.
  pointContentsFn
  /// Injected callback for characteristic float; invoked through the Services service/state record.
  characteristicFloatFn
  /// Injected callback for entity info; invoked through the Services service/state record.
  entityInfoFn
  /// Configured number of client slots active in this game state.
  maxclients
  /// Timestamp of the most recently observed teleport.
  lastteleportTime
  /// Position recorded for the most recently observed teleport.
  lastteleportOrigin
  /// Injected callback for entity dead; invoked through the Services service/state record.
  entityDeadFn
  /// Injected callback for same team; invoked through the Services service/state record.
  sameTeamFn
  /// Injected callback for visible; invoked through the Services service/state record.
  visibleFn
  /// Injected callback for update battle; invoked through the Services service/state record.
  updateBattleFn
  /// Injected callback for random; invoked through the Services service/state record.
  randomFn
  /// Injected callback for trace; invoked through the Services service/state record.
  traceFn
  /// Injected callback for weapon info; invoked through the Services service/state record.
  weaponInfoFn
  /// Injected callback for attack; invoked through the Services service/state record.
  attackFn
  /// Injected callback for predict movement; invoked through the Services service/state record.
  predictMovementFn
  /// Injected callback for predict visible; invoked through the Services service/state record.
  predictVisibleFn
  /// Injected callback for setup movement; invoked through the Services service/state record.
  setupMovementFn
  /// Injected callback for move to goal; invoked through the Services service/state record.
  moveToGoalFn
  /// Injected callback for move direction; invoked through the Services service/state record.
  moveDirectionFn
  /// Opaque caller-supplied context available to bot combat visibility, weapon, attack, and movement
  /// callbacks.
  context
end struct

/// Create a `mq3.game.bot_combat_ai.Services` record, initializing `maxclients` as `64` and `lastteleportOrigin` as `[0.0,0.0,0.0]`.
function create()
  return Services(0,false,0,void,void,void,void,64,0.0,[0.0,0.0,0.0],void,void,void,void,void,void,void,void,void,void,void,void,void,void)
end function
/// Test `(entinfo.powerups&(1<<c.PW_REDFLAG))!=0 or (entinfo.powerups&(1<<c.PW_BLUEFLAG))!=0` as the condition for `entityCarriesFlag`.
/// @param entinfo Entinfo record; accesses `powerups`.
function entityCarriesFlag(entinfo)
  return (entinfo.powerups&(1<<c.PW_REDFLAG))!=0 or (entinfo.powerups&(1<<c.PW_BLUEFLAG))!=0
end function
/// Apply `mq3.game.bot_combat_ai.entityCarriesFlag` while evaluating `entityIsInvisible`. Return paths include `(entinfo.powerups&(1<<c.PW_INVIS))!=0`.
/// @param entinfo Entinfo record; accesses `powerups`.
function entityIsInvisible(entinfo)
  if entityCarriesFlag(entinfo) then return false end if
  return (entinfo.powerups&(1<<c.PW_INVIS))!=0
end function
/// Test `(entinfo.flags&EF_FIRING)!=0` as the condition for `entityIsShooting`.
/// @param entinfo Entinfo record; accesses `flags`.
function entityIsShooting(entinfo) return (entinfo.flags&EF_FIRING)!=0 end function
/// Test `(entinfo.flags&EF_TALK)!=0` as the condition for `entityIsChatting`.
/// @param entinfo Entinfo record; accesses `flags`.
function entityIsChatting(entinfo) return (entinfo.flags&EF_TALK)!=0 end function
/// Test `(entinfo.powerups&(1<<c.PW_QUAD))!=0` as the condition for `entityHasQuad`.
/// @param entinfo Entinfo record; accesses `powerups`.
function entityHasQuad(entinfo) return (entinfo.powerups&(1<<c.PW_QUAD))!=0 end function
/// Return the red or blue flag code carried by the bot in CTF, or zero when neither flag is carried.
/// @param services Host service callbacks; accesses `gametype`.
/// @param bot Bot AI state; accesses `inventory`.
function ctfCarryingFlag(services,bot)
  if services.gametype!=GT_CTF then return 0 end if
  if bot.inventory[INVENTORY_REDFLAG]>0 then return 1 end if
  if bot.inventory[INVENTORY_BLUEFLAG]>0 then return 2 end if
  return 0
end function
/// Test `services.gametype>=GT_TEAM` as the condition for `teamPlayIsOn`.
/// @param services Host service callbacks; accesses `gametype`.
function teamPlayIsOn(services) return services.gametype>=GT_TEAM end function
/// Set `bot.teleportTime` to `services.floatTimeFn(services)` and `bot.lastEFlags` to `bot.curPs.eFlags` in `mq3.game.bot_combat_ai.setTeleportTime`.
/// @param services Host service callbacks; accesses `floatTimeFn`.
/// @param bot Bot AI state; accesses `curPs`, `lastEFlags` and `teleportTime`. May update `bot.teleportTime` and `bot.lastEFlags` in place.
function setTeleportTime(services,bot)
  if ((bot.curPs.eFlags^bot.lastEFlags)&EF_TELEPORT_BIT)!=0 then bot.teleportTime=services.floatTimeFn(services) end if
  bot.lastEFlags=bot.curPs.eFlags; return void
end function
/// Test `bot.curPs.pm_type==c.PM_DEAD` as the condition for `isDead`.
/// @param bot Bot AI state; accesses `curPs`.
function isDead(bot) return bot.curPs.pm_type==c.PM_DEAD end function
/// Detect intermission from the game timer or the bot player-state freeze/intermission mode.
/// @param services Host service callbacks; accesses `intermissiontime`.
/// @param bot Bot AI state; accesses `curPs`.
function intermission(services,bot)
  if services.intermissiontime!=0 then return true end if
  return bot.curPs.pm_type==c.PM_FREEZE or bot.curPs.pm_type==c.PM_INTERMISSION
end function
/// Use `services.pointContentsFn` to perform `inLavaOrSlime`. Return paths include `(services.pointContentsFn(services,feet)&(CONTENTS_LAVA|CONTENTS_SLIME))!=0`.
/// @param services Host service callbacks; accesses `pointContentsFn`.
/// @param bot Bot AI state; accesses `origin`.
function inLavaOrSlime(services,bot)
  feet=[bot.origin[0],bot.origin[1],n.fsub(bot.origin[2],23.0)]
  return (services.pointContentsFn(services,feet)&(CONTENTS_LAVA|CONTENTS_SLIME))!=0
end function
/// Estimate combat aggression from the bot's health, armor, powerups, ammunition and enemy height.
/// @param bot Bot AI state; accesses `inventory` and `weaponnum`.
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
/// Assign a retreat pressure value from the bot's current weapon and remaining health.
/// @param bot Bot AI state; accesses `weaponnum` and `inventory`.
function feelingBad(bot)
  if bot.weaponnum==WP_GAUNTLET then return 100.0 end if
  if bot.inventory[INVENTORY_HEALTH]<40 then return 100.0 end if
  if bot.weaponnum==WP_MACHINEGUN then return 90.0 end if
  if bot.inventory[INVENTORY_HEALTH]<60 then return 80.0 end if
  return 0.0
end function
/// Use `services.entityInfoFn` to perform `wantsToRetreat`. Return paths include `aggression(bot)<50.0`.
/// @param services Host service callbacks; accesses `gametype` and `entityInfoFn`.
/// @param bot Bot AI state; accesses `enemy` and `ltgtype`.
function wantsToRetreat(services,bot)
  if services.gametype==GT_CTF and ctfCarryingFlag(services,bot)!=0 then return true end if
  if bot.enemy>=0 and entityCarriesFlag(services.entityInfoFn(services,bot.enemy)) then return false end if
  if bot.ltgtype==LTG_GETFLAG then return true end if
  return aggression(bot)<50.0
end function
/// Use `services.entityInfoFn` to perform `wantsToChase`. Return paths include `aggression(bot)>50.0`.
/// @param services Host service callbacks; accesses `gametype` and `entityInfoFn`.
/// @param bot Bot AI state; accesses `enemy` and `ltgtype`.
function wantsToChase(services,bot)
  if services.gametype==GT_CTF then
    if ctfCarryingFlag(services,bot)!=0 then return false end if
    if entityCarriesFlag(services.entityInfoFn(services,bot.enemy)) then return true end if
  end if
  if bot.ltgtype==LTG_GETFLAG then return false end if
  return aggression(bot)>50.0
end function
/// Use `services.characteristicFloatFn` to perform `canAndWantsToRocketJump`. Return paths include `value>=0.5`.
/// @param services Host service callbacks; accesses `rocketjump` and `characteristicFloatFn`.
/// @param bot Bot AI state; accesses `inventory` and `character`.
function canAndWantsToRocketJump(services,bot)
  inv=bot.inventory
  if not services.rocketjump or inv[INVENTORY_ROCKETLAUNCHER]<=0 or inv[INVENTORY_ROCKETS]<3 then return false end if
  if inv[INVENTORY_QUAD]!=0 or inv[INVENTORY_HEALTH]<60 then return false end if
  if inv[INVENTORY_HEALTH]<90 and inv[INVENTORY_ARMOR]<40 then return false end if
  value=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_WEAPONJUMPING,0.0,1.0)
  return value>=0.5
end function
/// Set `angles[axis]` to `input.angleMod(angles[axis])` in `mq3.game.bot_combat_ai.inFieldOfVision`.
/// @param viewangles Array or byte sequence accessed at `axis`.
/// @param fov Value passed as argument 1 to `mq3.compat.numeric.fmul`.
/// @param angles Pitch, yaw and roll angles in degrees. Entries may be updated in place.
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

/// Return a new array `[n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])]` for `subtract`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function subtract(a,b) return [n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])] end function
/// Forward `lengthSquared` to `mq3.shared.math.DotProduct` and return the delegated result.
/// @param v Value passed as argument 1 to `mq3.shared.math.DotProduct`.
function lengthSquared(v) return q.DotProduct(v,v) end function
/// Return the result of `services.floatTimeFn(services)` for `now`.
/// @param services Host service callbacks; accesses `floatTimeFn`.
function now(services) return services.floatTimeFn(services) end function

/// Update `bot.lastHealth`, `bot.enemy`, `bot.enemySightTime` and `bot.enemySuicide` and related state during `findEnemy`.
/// @param services Host service callbacks; accesses `characteristicFloatFn`, `entityInfoFn`, `maxclients`, `entityDeadFn` and `lastteleportTime` and related fields.
/// @param bot Bot AI state; accesses `character`, `lastHealth`, `inventory`, `origin` and `client` and related fields. May update `bot.lastHealth`, `bot.enemy` and `bot.enemySightTime` and additional fields in place.
/// @param curenemy Value passed as argument 2 to `services.entityInfoFn`.
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

/// Update `bot.enemyPositionTime`, `bot.enemyVelocity` and `bot.enemyOrigin` during `projectileAim`. Return paths include `best`.
/// @param services Host service callbacks; accesses `predictMovementFn`.
/// @param bot Bot AI state; accesses `enemyPositionTime`, `enemyVelocity`, `enemyOrigin`, `origin` and `curPs` and related fields. May update `bot.enemyPositionTime`, `bot.enemyVelocity` and `bot.enemyOrigin` in place.
/// @param ent Game entity; accesses `origin`, `lastVisOrigin` and `updateTime`.
/// @param weapon Weapon record; accesses `speed`.
/// @param aimskill Value used by `projectileAim` in `if aimskill>0.8 and bot.curPs.weaponstate==0 then`.
/// @param best Three-component array; components 0, 1 and 2 are used in their stored order.
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

/// Use `services.traceFn` to perform `splashGroundAim`. Return paths include `best`.
/// @param services Host service callbacks; accesses `traceFn`.
/// @param bot Bot AI state; accesses `origin` and `entitynum`.
/// @param ent Game entity; accesses `origin` and `number`.
/// @param start Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param best Three-component array; components 0, 1 and 2 are used in their stored order.
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

/// Use `services.predictVisibleFn` to perform `cornerAim`. Return paths include `[target[0],target[1],n.fsub(target[2],20.0)]`.
/// @param services Host service callbacks; accesses `predictVisibleFn`.
/// @param bot Bot AI state; accesses `lastEnemyOrigin`, `lastEnemyAreaNum` and `eye`.
/// @param weapon Weapon record; accesses `number`.
/// @param aimskill Value used by `cornerAim` in `if aimskill<=0.5 or (weapon.number!=5 and weapon.number!=4 and weapon.number!=9) then return best end if`.
/// @param best Operand used to evaluate the returned expression `best`.
function cornerAim(services,bot,weapon,aimskill,best)
  if aimskill<=0.5 or (weapon.number!=5 and weapon.number!=4 and weapon.number!=9) then return best end if
  target=services.predictVisibleFn(services,bot.lastEnemyOrigin,bot.lastEnemyAreaNum,bot.eye)
  if target==void or lengthSquared(subtract(target,bot.eye))<=6400.0 then return best end if
  return [target[0],target[1],n.fsub(target[2],20.0)]
end function

/// Update `bot.aimTarget` and `bot.idealViewangles` during `aimAtEnemy`.
/// @param services Host service callbacks; accesses `entityInfoFn`, `characteristicFloatFn`, `weaponInfoFn`, `visibleFn` and `traceFn` and related fields.
/// @param bot Bot AI state; accesses `enemy`, `aimTarget`, `idealViewangles`, `eye` and `character` and related fields. May update `bot.aimTarget` and `bot.idealViewangles` in place.
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

/// Update `bot.firethrottlewaitTime`, `bot.firethrottleshootTime` and `bot.combatFlags` during `checkAttack`. Return paths include `attacked`.
/// @param services Host service callbacks; accesses `entityInfoFn`, `characteristicFloatFn`, `randomFn`, `traceFn` and `weaponInfoFn` and related fields.
/// @param bot Bot AI state; accesses `enemy`, `character`, `enemySightTime`, `teleportTime` and `weaponchangeTime` and related fields. May update `bot.firethrottlewaitTime`, `bot.firethrottleshootTime` and `bot.combatFlags` in place.
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

/// Create a `mq3.game.bot_combat_ai.MoveResult` record, initializing `movedir` as `[0.0,0.0,0.0]` and `idealViewangles` as `[0.0,0.0,0.0]`.
function emptyMoveResult() return MoveResult(false,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
/// Update `bot.attackcrouchTime`, `bot.attackjumpTime`, `bot.attackstrafeTime` and `bot.combatFlags` during `attackMove`.
/// @param services Host service callbacks; accesses `setupMovementFn`, `moveToGoalFn`, `characteristicFloatFn`, `entityInfoFn` and `randomFn` and related fields.
/// @param bot Bot AI state; accesses `enemy`, `attackchaseTime`, `lastEnemyAreaNum`, `lastEnemyOrigin` and `ms` and related fields. May update `bot.attackcrouchTime`, `bot.attackjumpTime` and `bot.attackstrafeTime` and additional fields in place.
/// @param tfl Bit mask of permitted AAS travel modes and area restrictions.
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
