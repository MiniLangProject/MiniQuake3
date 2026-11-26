// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Renderer/audio-neutral semantic port of code/cgame/cg_weapons.c.  Every
// renderer and sound call becomes a typed Boundary record.  The retail QVM
// remains authoritative: callers pass retailActive=true to retain decisions
// while suppressing duplicate host dispatch.
package mq3.client.cgame_weapons
import mq3.client.cg_local as cgabi

import mq3.compat.numeric as n
import mq3.compat.transcendental as crt
import mq3.shared.directions as directions
import mq3.shared.math as q

/// Native weapon identifier selecting no selected weapon.
const WP_NONE=0
/// Native weapon identifier selecting the gauntlet.
const WP_GAUNTLET=1
/// Native weapon identifier selecting the machine gun.
const WP_MACHINEGUN=2
/// Native weapon identifier selecting the shotgun.
const WP_SHOTGUN=3
/// Native weapon identifier selecting the grenade launcher.
const WP_GRENADE_LAUNCHER=4
/// Native weapon identifier selecting the rocket launcher.
const WP_ROCKET_LAUNCHER=5
/// Native weapon identifier selecting the lightning gun.
const WP_LIGHTNING=6
/// Native weapon identifier selecting the railgun.
const WP_RAILGUN=7
/// Native weapon identifier selecting the plasma gun.
const WP_PLASMAGUN=8
/// Native weapon identifier selecting the BFG.
const WP_BFG=9
/// Native weapon identifier selecting the grappling hook.
const WP_GRAPPLING_HOOK=10
/// Native weapon identifier selecting the nailgun.
const WP_NAILGUN=11
/// Native weapon identifier selecting the proximity-mine launcher.
const WP_PROX_LAUNCHER=12
/// Native weapon identifier selecting the chaingun.
const WP_CHAINGUN=13
/// Number of native weapon slots, used to size weapon-indexed tables rather than select a weapon.
const WP_NUM_WEAPONS=14
/// Player powerup slot for quad, also used when constructing active-powerup bitsets.
const PW_QUAD=1
/// Player powerup slot for battlesuit, also used when constructing active-powerup bitsets.
const PW_BATTLESUIT=2
/// Player powerup slot for invis, also used when constructing active-powerup bitsets.
const PW_INVIS=4
/// Entity-state flag selecting firing behavior in client presentation.
const EF_FIRING=0x100
/// Player-movement state flag indicating follow.
const PMF_FOLLOW=0x1000
/// Weapon-impact sound category selecting default surface feedback.
const IMPACTSOUND_DEFAULT=cgabi.IMPACTSOUND_DEFAULT
/// Weapon-impact sound category selecting metal surface feedback.
const IMPACTSOUND_METAL=cgabi.IMPACTSOUND_METAL
/// Weapon-impact sound category selecting flesh surface feedback.
const IMPACTSOUND_FLESH=cgabi.IMPACTSOUND_FLESH
/// Collision-content bit identifying water volumes or surfaces during client traces.
const CONTENTS_WATER=0x20
/// Collision-content bit identifying slime volumes or surfaces during client traces.
const CONTENTS_SLIME=0x10
/// Collision-content bit identifying lava volumes or surfaces during client traces.
const CONTENTS_LAVA=0x8
/// Surface-property flag selecting noimpact client collision or effect behavior.
const SURF_NOIMPACT=0x10
/// Surface-property flag selecting metalsteps client collision or effect behavior.
const SURF_METALSTEPS=0x1000
/// Fallback shotgun count setting used when constructing the native client simulation or effect
/// configuration.
const DEFAULT_SHOTGUN_COUNT=11
/// Fallback shotgun spread setting used when constructing the native client simulation or effect
/// configuration.
const DEFAULT_SHOTGUN_SPREAD=700
/// Maximum world-space length of the lightning-gun beam trace.
const LIGHTNING_RANGE=768.0
/// Firing-state weapon-barrel rotation rate in degrees per millisecond.
const SPIN_SPEED=0.9
/// Duration in milliseconds over which the weapon barrel coasts after firing stops.
const COAST_TIME=1000
/// Milliseconds spent moving the view during the initial landing kick.
const LAND_DEFLECT_TIME=cgabi.LAND_DEFLECT_TIME
/// Milliseconds spent restoring the view after the landing kick.
const LAND_RETURN_TIME=cgabi.LAND_RETURN_TIME
/// Milliseconds for which a weapon muzzle flash remains visible.
const MUZZLE_FLASH_TIME=cgabi.MUZZLE_FLASH_TIME

/// Stores client game weapons boundary record, including `boundary`, `kind`, `weapon`, `entity`, `origin`, `finish` and additional values.
struct Boundary
  /// Host service category recorded with a request emitted while registering and presenting weapon
  /// models, firing sounds, and impact effects.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while registering and
  /// presenting weapon models, firing sounds, and impact effects.
  kind
  /// Native weapon identifier whose model, sound, trail, or firing effect this host request concerns.
  weapon
  /// When constructing this record, `action` supplies `entityNum` for this member.
  entity
  /// World-space location supplied with the queued weapon sound, projectile, muzzle, or impact effect.
  origin
  /// When constructing this record, `action` supplies `copy3(finish)` for this member.
  finish
  /// Linear rate of change of position used by movement or effect integration.
  velocity
  /// Model resource selected for rendering the object.
  model
  /// Material reference carried by a weapon trail, impact, muzzle, or registration request.
  shader
  /// Sound resource carried by a weapon audio action at the host dispatch boundary.
  sound
  /// World-space effect radius recorded for the weapon rendering or particle request.
  radius
  /// Dynamic-light intensity emitted by the local effect.
  light
  /// Color components carried by the weapon light, trail, or temporary-effect host request.
  color
  /// Value payload supplied to the selected host operation while registering and presenting weapon
  /// models, firing sounds, and impact effects.
  value
  /// True when this request is marked for native dispatch while registering and presenting weapon
  /// models, firing sounds, and impact effects; false when its native effect is suppressed.
  dispatched
end struct
/// Stores client game weapons weapon info record, including `number`, `registered`, `weaponModel`, `flashModel`, `barrelModel`, `handsModel` and additional values.
struct WeaponInfo
  /// When constructing this record, `emptyWeapon` supplies `number` for this member.
  number
  /// True once the referenced media resources have been registered with the engine.
  registered
  /// Model resource selected for the weapon presentation.
  weaponModel
  /// Model resource selected for the flash presentation.
  flashModel
  /// Model resource selected for the barrel presentation.
  barrelModel
  /// Weapon-hand model used to position the first-person weapon, even when the hands are not drawn.
  handsModel
  /// Model resource selected for the missile presentation.
  missileModel
  /// Shader or image resource used to display the weapon in the HUD.
  weaponIcon
  /// Shader or image resource used to display this weapon's ammunition.
  ammoIcon
  /// Sound resource selected for the ready event or effect.
  readySound
  /// Sound resource selected for the firing event or effect.
  firingSound
  /// Sound resource selected for the missile event or effect.
  missileSound
  /// Sound resources selected for the flash event or effect.
  flashSounds
  /// When constructing this record, `emptyWeapon` supplies `zero3()` for this member.
  flashColor
  /// When constructing this record, `emptyWeapon` supplies `zero3()` for this member.
  missileColor
  /// Intensity of the dynamic light attached to the projectile.
  missileDlight
  /// Last trail-emission time, allowing missile trails to catch up across dropped packets.
  trailTime
  /// Radius used when emitting this weapon's projectile trail.
  trailRadius
  /// When constructing this record, `emptyWeapon` supplies an empty string for this member.
  trail
  /// When constructing this record, `emptyWeapon` supplies an empty string for this member.
  ejectBrass
  /// When constructing this record, `emptyWeapon` supplies `false` for this member.
  loopFire
  /// Human-readable item name shown by pickup notifications and item-selection UI.
  pickupName
end struct
/// Stores client game weapons menu item, including `number`, `type`, `tag`, `worldModel`, `worldModel2`, `icon` and additional values.
struct Item
  /// Index of the item in the game's item-definition table.
  number
  /// UI item kind selecting its type-specific behavior and payload.
  type
  /// Type-specific item tag selecting the associated weapon, ammunition, powerup, or holdable
  /// identifier.
  tag
  /// Model resource selected for the world presentation.
  worldModel
  /// Secondary world-model asset associated with the item, such as an additional model component.
  worldModel2
  /// Virtual shader or image name used to register the item's HUD icon.
  icon
  /// Human-readable item name shown by pickup notifications and item-selection UI.
  pickupName
  /// True once the referenced media resources have been registered with the engine.
  registered
end struct
/// Stores client game weapons barrel record, including `angle`, `time`, `spinning`.
struct Barrel
  /// When constructing this record, `barrel` supplies `0.0` for this member. Used by
  /// `machinegunSpinAngle` during subsequent processing.
  angle
  /// Timestamp in milliseconds of the last weapon-barrel spin-state change, paired with the stored
  /// angle.
  time
  /// When constructing this record, `barrel` supplies `false` for this member. Used by
  /// `machinegunSpinAngle` during subsequent processing.
  spinning
end struct
/// Stores client game weapons entity record, including `number`, `clientNum`, `weapon`, `eFlags`, `powerups`, `origin` and additional values.
struct Entity
  /// When constructing this record, `entity` supplies `number` for this member.
  number
  /// Client slot identifying the player represented by this weapon-rendering entity.
  clientNum
  /// Native weapon identifier carried by the player or projectile entity being rendered.
  weapon
  /// When constructing this record, `entity` supplies `0` for this member.
  eFlags
  /// Active PW_* bitmask used when selecting weapon-related powerup effects.
  powerups
  /// World-space weapon-owner position used to derive muzzle and attached-weapon placement.
  origin
  /// Euler orientation used to place or animate the object.
  angles
  /// Last trail-emission time, allowing missile trails to catch up across dropped packets.
  trailTime
  /// Client timestamp at which the entity's muzzle-flash effect began.
  muzzleFlashTime
  /// True while the player is continuously firing the lightning gun.
  lightningFiring
  /// True while the railgun's muzzle-flash effect should be emitted.
  railgunFlash
  /// World-space endpoint of the last railgun impact used by the weapon effect.
  railgunImpact
  /// When constructing this record, `entity` supplies `barrel()` for this member.
  barrel
  /// True when the current snapshot contains a valid state for this entity.
  currentValid
  /// When constructing this record, `entity` supplies `0` for this member.
  legsAnim
end struct
/// Stores client game weapons state, including `time`, `weaponSelect`, `weaponSelectTime`, `owned`, `ammo`, `health` and additional values.
struct State
  /// Current client-game time in milliseconds used for weapon animation, muzzle flashes, and barrel
  /// effects.
  time
  /// Weapon identifier currently selected by the local player.
  weaponSelect
  /// Timestamp at which the weapon-selection display was last refreshed.
  weaponSelectTime
  /// When constructing this record, `create` supplies `0` for this member. Used by `drawWeaponSelect`
  /// and `weaponSelectable` during subsequent processing.
  owned
  /// Ammunition quantity or ammunition state associated with the selected weapon.
  ammo
  /// Local-player health used to suppress the weapon-selection display after death.
  health
  /// When constructing this record, `create` supplies `false` for this member. Used by `nextWeapon` and
  /// `prevWeapon` during subsequent processing.
  follow
  /// Timestamp at which the most recent item-pickup notification began.
  itemPickupTime
  /// When constructing this record, `create` supplies `false` for this member. Used by `smokeTrail` and
  /// `plasmaTrail` during subsequent processing.
  noProjectileTrail
  /// When constructing this record, `create` supplies `false` for this member. Used by `railTrail`
  /// during subsequent processing.
  oldRail
  /// When constructing this record, `create` supplies `false` for this member. Used by `plasmaTrail`
  /// during subsequent processing.
  oldPlasma
  /// When constructing this record, `create` supplies `false` for this member. Used by `missileHitWall`
  /// during subsequent processing.
  oldRocket
  /// When constructing this record, `create` supplies `2500` for this member. Used by
  /// `machineGunEjectBrass` and `shotgunEjectBrass` during subsequent processing.
  brassTime
  /// When constructing this record, `create` supplies `0.4` for this member. Used by `bullet` during
  /// subsequent processing.
  tracerChance
  /// When constructing this record, `create` supplies `160.0` for this member. Used by `tracer` during
  /// subsequent processing.
  tracerLength
  /// When constructing this record, `create` supplies `1.0` for this member. Used by `tracer` during
  /// subsequent processing.
  tracerWidth
  /// When constructing this record, `create` supplies `400.0` for this member. Used by `railTrail`
  /// during subsequent processing.
  railTrailTime
  /// When constructing this record, `create` supplies `0.0` for this member. Used by `lightningBolt`
  /// during subsequent processing.
  trueLightning
  /// When constructing this record, `create` supplies `true` for this member. Used by `addViewWeapon`
  /// during subsequent processing.
  drawGun
  /// When constructing this record, `create` supplies `90` for this member. Used by `addViewWeapon`
  /// during subsequent processing.
  fov
  /// When constructing this record, `create` supplies `0.0` for this member. Used by `addViewWeapon`
  /// during subsequent processing.
  gunX
  /// When constructing this record, `create` supplies `0.0` for this member. Used by `addViewWeapon`
  /// during subsequent processing.
  gunY
  /// When constructing this record, `create` supplies `0.0` for this member. Used by `addViewWeapon`
  /// during subsequent processing.
  gunZ
  /// True while the camera uses a third-person, chase, or death view.
  renderingThirdPerson
  /// True when the developer test model is positioned as a first-person weapon.
  testGun
  /// When constructing this record, `create` supplies `q.RandomState(1)` for this member. Used by
  /// `randInt` during subsequent processing.
  random
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `setRandomInts` and `randInt` during subsequent processing.
  randomInts
  /// When constructing this record, `create` supplies `0` for this member. Used by `setRandomInts` and
  /// `randInt` during subsequent processing.
  randomAt
  /// When constructing this record, `create` supplies `ws` for this member. Used by `registerWeapon`
  /// and `addPlayerWeapon` during subsequent processing.
  weapons
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `registerItemVisuals` during subsequent processing.
  items
  /// Host requests queued while registering and presenting weapon models, firing sounds, and impact
  /// effects, retained in request order.
  actions
  /// When constructing this record, `create` supplies `0` for this member. Used by `action` and
  /// `clearActions` during subsequent processing.
  emitted
  /// Number of requests withheld from native dispatch while registering and presenting weapon models,
  /// firing sounds, and impact effects because the retail QVM owns their effects.
  suppressed
  /// Diagnostic messages collected while parsing or processing the input.
  errors
end struct

/// Copies the X, Y and Z components into a fresh client game weapons vector.
/// @param v Sequence read at `v[0]`, `v[1]`, `v[2]`.
function copy3(v) return [v[0],v[1],v[2]] end function
/// Creates a three-component zero vector for client game weapons.
function zero3() return [0.0,0.0,0.0] end function
/// Creates a `mq3.client.cgame_weapons.Barrel` record. Initializes the record with the defaults written in this constructor.
function barrel() return Barrel(0.0,0,false) end function
/// Creates a `mq3.client.cgame_weapons.Entity` record. Assigns `number` from `number`, `clientNum` from `number`.
/// @param number Value used to initialize `Entity.number`, `Entity.clientNum`.
function entity(number) return Entity(number,number,WP_NONE,0,0,zero3(),zero3(),0,0,false,false,zero3(),barrel(),true,0) end function
/// Creates a `mq3.client.cgame_weapons.WeaponInfo` record. Assigns `number` from `number`.
/// @param number Value used to initialize `WeaponInfo.number`.
function emptyWeapon(number) return WeaponInfo(number,false,"","","","","","","","","","",[],zero3(),zero3(),0.0,0,0.0,"","",false,"") end function
/// Calls `mq3.client.cgame_weapons.emptyWeapon`, `mq3.client.cgame_weapons.State`, `mq3.shared.math.RandomState` from client game weapons `create`.
function create()
  ws=[];for i=0 to WP_NUM_WEAPONS ws=ws+[emptyWeapon(i)] end for
  return State(0,WP_MACHINEGUN,0,0,array(16,0),100,false,0,false,false,false,false,2500,0.4,160.0,1.0,400.0,0.0,true,90,0.0,0.0,0.0,false,false,q.RandomState(1),[],0,ws,[],[],0,0,[])
end function
/// Updates `state.randomInts`, `state.randomAt` during client game weapons `setRandomInts`.
/// @param state Mutable client game weapons record/storage; this routine assigns `state.randomInts`, `state.randomAt`.
/// @param values Value assigned to `state.randomInts`.
function setRandomInts(state,values) state.randomInts=values;state.randomAt=0;return void end function
/// Updates `state.randomAt` during client game weapons `randInt`.
/// @param state Mutable client game weapons record/storage; this routine assigns `state.randomAt`.
function randInt(state) if state.randomAt<len(state.randomInts) then v=state.randomInts[state.randomAt];state.randomAt=state.randomAt+1;return v end if;return q.Q_rand(state.random)&0x7fffffff end function
/// Adapts `mq3.compat.numeric.fdiv` to client game weapons `randomFloat`, returning its result for `randInt(state), 32767.0`.
/// @param state Argument 1 of `mq3.compat.numeric.fdiv`; passed as `randInt(state)`.
function randomFloat(state) return n.fdiv(randInt(state),32767.0) end function
/// Adapts `mq3.compat.numeric.fsub` to client game weapons `crandom`, returning its result for `n.fmul(2.0,randomFloat(state)), 1.0`.
/// @param state Argument 1 of `mq3.compat.numeric.fsub`; passed as `n.fmul(2.0,randomFloat(state))`.
function crandom(state) return n.fsub(n.fmul(2.0,randomFloat(state)),1.0) end function
/// Appends a client game weapons action record to the queued engine requests.
/// @param state Mutable client game weapons record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`.
/// @param boundaryName Value used by `v=Boundary(boundaryName,kind,weaponNum,entityNum,copy3(origin),copy3(finish),copy3(velocity),model,shader,sound,radius,light,color,value,not r...`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param weaponNum Quake III weapon identifier.
/// @param entityNum Entity number identifying a world or player entity.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param finish Value used by `v=Boundary(boundaryName,kind,weaponNum,entityNum,copy3(origin),copy3(finish),copy3(velocity),model,shader,sound,radius,light,color,value,not r...`.
/// @param velocity Velocity vector used to advance or orient the effect.
/// @param model Model handle, asset or preview record used by this client game weapons operation.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param sound Sound handle or asset name passed to the audio action.
/// @param radius Radius used by the spatial or visual calculation.
/// @param light Value used by `v=Boundary(boundaryName,kind,weaponNum,entityNum,copy3(origin),copy3(finish),copy3(velocity),model,shader,sound,radius,light,color,value,not r...`.
/// @param color Color value used by the client game weapons drawing or interpolation operation.
/// @param value Value used by `v=Boundary(boundaryName,kind,weaponNum,entityNum,copy3(origin),copy3(finish),copy3(velocity),model,shader,sound,radius,light,color,value,not r...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function action(state,boundaryName,kind,weaponNum,entityNum,origin,finish,velocity,model,shader,sound,radius,light,color,value,retailActive)
  v=Boundary(boundaryName,kind,weaponNum,entityNum,copy3(origin),copy3(finish),copy3(velocity),model,shader,sound,radius,light,color,value,not retailActive);state.actions=state.actions+[v]
  if v.dispatched then state.emitted=state.emitted+1 else state.suppressed=state.suppressed+1 end if;return v
end function
/// Updates `state.actions`, `state.emitted`, `state.suppressed` during client game weapons `clearActions`.
/// @param state Mutable client game weapons record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`.
function clearActions(state) state.actions=[];state.emitted=0;state.suppressed=0;return void end function
/// Adapts `mq3.client.cgame_weapons.action` to client game weapons `visual`, returning its result for `state, "render", kind, weaponNum, entityNum, origin, finish, zero3(), model, shader, "", radius, 0.0, [1.0,1.0,1.0], value, retailActive`.
/// @param state Argument 1 of `mq3.client.cgame_weapons.action`.
/// @param kind Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_weapons.action`.
/// @param weaponNum Quake III weapon identifier. Forwarded to `mq3.client.cgame_weapons.action`.
/// @param entityNum Entity number identifying a world or player entity. Forwarded to `mq3.client.cgame_weapons.action`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_weapons.action`.
/// @param finish Argument 7 of `mq3.client.cgame_weapons.action`.
/// @param model Argument 9 of `mq3.client.cgame_weapons.action`.
/// @param shader Argument 10 of `mq3.client.cgame_weapons.action`.
/// @param radius Radius used by the spatial or visual calculation. Forwarded to `mq3.client.cgame_weapons.action`.
/// @param value Argument 15 of `mq3.client.cgame_weapons.action`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.action`.
function visual(state,kind,weaponNum,entityNum,origin,finish,model,shader,radius,value,retailActive) return action(state,"render",kind,weaponNum,entityNum,origin,finish,zero3(),model,shader,"",radius,0.0,[1.0,1.0,1.0],value,retailActive) end function
/// Adapts `mq3.client.cgame_weapons.action` to client game weapons `audio`, returning its result for `state, "audio", kind, weaponNum, entityNum, origin, origin, zero3(), "", "", sound, 0.0, 0.0, [1.0,1.0,1.0], 0, retailActive`.
/// @param state Argument 1 of `mq3.client.cgame_weapons.action`.
/// @param kind Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_weapons.action`.
/// @param weaponNum Quake III weapon identifier. Forwarded to `mq3.client.cgame_weapons.action`.
/// @param entityNum Entity number identifying a world or player entity. Forwarded to `mq3.client.cgame_weapons.action`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_weapons.action`.
/// @param sound Argument 11 of `mq3.client.cgame_weapons.action`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.action`.
function audio(state,kind,weaponNum,entityNum,origin,sound,retailActive) return action(state,"audio",kind,weaponNum,entityNum,origin,origin,zero3(),"","",sound,0.0,0.0,[1.0,1.0,1.0],0,retailActive) end function

// CG_MachineGunEjectBrass
/// @param state Record read through `state.brassTime`, `state.time`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.angles`, `cent.origin`, `cent.weapon`, `cent.number`.
/// @param water Value used by `if water then scale=0.1 end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function machineGunEjectBrass(state,cent,water,retailActive)
  if state.brassTime<=0 then return void end if;axes=q.AngleVectors(cent.angles);origin=copy3(cent.origin);offset=[8.0,-4.0,24.0];for i=0 to 2 origin[i]=origin[i]+offset[0]*axes[0][i]+offset[1]*axes[1][i]+offset[2]*axes[2][i] end for
  scale=1.0;if water then scale=0.1 end if;velocity=[0.0,-50.0+40.0*crandom(state),100.0+50.0*crandom(state)];world=zero3();for i=0 to 2 world[i]=(velocity[0]*axes[0][i]+velocity[1]*axes[1][i]+velocity[2]*axes[2][i])*scale end for
  return action(state,"render","machinegun-brass",cent.weapon,cent.number,origin,origin,world,"models/weapons2/shells/m_shell.md3","","",0.4*scale,0.0,[1.0,1.0,1.0],state.time+state.brassTime+n.trunc32(state.brassTime/4)*randomFloat(state),retailActive)
end function

// CG_ShotgunEjectBrass
/// @param state Record read through `state.brassTime`, `state.time`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.angles`, `cent.origin`, `cent.weapon`, `cent.number`.
/// @param water Value used by `if water then scale=0.1 end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function shotgunEjectBrass(state,cent,water,retailActive)
  result=[];if state.brassTime<=0 then return result end if;axes=q.AngleVectors(cent.angles);origin=copy3(cent.origin);offset=[8.0,0.0,24.0];for a=0 to 2 origin[a]=origin[a]+offset[0]*axes[0][a]+offset[1]*axes[1][a]+offset[2]*axes[2][a] end for
  for i=0 to 1 side=-40.0+10.0*crandom(state);if i==0 then side=40.0+10.0*crandom(state) end if;velocity=[60.0+60.0*crandom(state),side,100.0+50.0*crandom(state)];scale=1.0;if water then scale=0.1 end if;world=zero3();for a=0 to 2 world[a]=(velocity[0]*axes[0][a]+velocity[1]*axes[1][a]+velocity[2]*axes[2][a])*scale end for;result=result+[action(state,"render","shotgun-brass",cent.weapon,cent.number,origin,origin,world,"models/weapons2/shells/s_shell.md3","","",0.3,0.0,[1.0,1.0,1.0],state.time+state.brassTime*3+n.trunc32(state.brassTime*randomFloat(state)),retailActive)] end for;return result
end function

// CG_NailgunEjectBrass
/// @param state Record read through `state.time`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.angles`, `cent.origin`, `cent.weapon`, `cent.number`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function nailgunEjectBrass(state,cent,retailActive)
  axes=q.AngleVectors(cent.angles);origin=copy3(cent.origin);offset=[0.0,-12.0,24.0];for i=0 to 2 origin[i]=origin[i]+offset[0]*axes[0][i]+offset[1]*axes[1][i]+offset[2]*axes[2][i] end for;return action(state,"render","nailgun-smoke",cent.weapon,cent.number,origin,origin,[0.0,0.0,64.0],"","smokePuff","",32.0,0.0,[1.0,1.0,1.0],state.time+700,retailActive)
end function

// CG_RailTrail
/// @param state Record read through `state.time`, `state.railTrailTime`, `state.oldRail`.
/// @param color1 Value used by `core=action(state,"render","rail-core",WP_RAILGUN,0,start,finish,zero3(),"","railCore","",0.0,0.0,color1,state.time+n.trunc32(state.railTrailT...`.
/// @param color2 Value used by `result=result+[action(state,"render","rail-ring",WP_RAILGUN,0,point,point,q.VectorScale(ringAxis,6.0),"","railDisc","",1.1,0.0,color2,state.ti...`.
/// @param start Mutable sequence; this routine writes `start[2]`.
/// @param finish Mutable sequence; this routine writes `finish[2]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function railTrail(state,color1,color2,start,finish,retailActive)
  start=copy3(start);start[2]=start[2]-4.0;direction=[finish[0]-start[0],finish[1]-start[1],finish[2]-start[2]];length=q.VectorNormalize(direction);result=[];core=action(state,"render","rail-core",WP_RAILGUN,0,start,finish,zero3(),"","railCore","",0.0,0.0,color1,state.time+n.trunc32(state.railTrailTime),retailActive);result=result+[core]
  if state.oldRail then core.origin[2]=core.origin[2]-8.0;core.finish[2]=core.finish[2]-8.0;return result end if
  move=q.VectorMA(start,20.0,direction);axis=directions.perpendicular(direction);i=0;j=18
  while i<length
    if i%10==0 then angle=j*10.0*3.14159265358979323846/180.0;ringAxis=[axis[0]*crt.cos(angle),axis[1]*crt.cos(angle),axis[2]*crt.cos(angle)];point=q.VectorMA(move,4.0,ringAxis);result=result+[action(state,"render","rail-ring",WP_RAILGUN,0,point,point,q.VectorScale(ringAxis,6.0),"","railDisc","",1.1,0.0,color2,state.time+(i>>1)+600,retailActive)] end if
    move=q.VectorMA(move,5.0,direction);i=i+5;j=(j+1)%36
  end while;return result
end function

/// Updates `cent.trailTime` during client game weapons `smokeTrail`.
/// @param state Record read through `state.time`, `state.noProjectileTrail`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param cent Mutable client game weapons record/storage; this routine assigns `cent.trailTime`.
/// @param start Sequence read at `start[0]`, `start[1]`, `start[2]`.
/// @param finish Sequence read at `finish[0]`, `finish[1]`, `finish[2]`.
/// @param trailRadius Value used by `result=result+[action(state,"render",kind,cent.weapon,cent.number,pos,pos,zero3(),"",shader,"",trailRadius,0.0,[1.0,1.0,1.0],t+trailTime,retai...`.
/// @param trailTime Value used by `startTime=cent.trailTime`.
/// @param liquidBoth Value used by `if liquidBoth then return [action(state,"render",kind+"-bubbles",cent.weapon,cent.number,start,finish,zero3(),"","waterBubble","",8.0,0.0,[1.0...`.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function smokeTrail(state,kind,cent,start,finish,trailRadius,trailTime,liquidBoth,shader,retailActive)
  result=[];startTime=cent.trailTime;cent.trailTime=state.time;if state.noProjectileTrail then return result end if;if liquidBoth then return [action(state,"render",kind+"-bubbles",cent.weapon,cent.number,start,finish,zero3(),"","waterBubble","",8.0,0.0,[1.0,1.0,1.0],0,retailActive)] end if
  t=50*n.trunc32((startTime+50)/50);duration=state.time;if duration<t then duration=t end if;span=duration-startTime
  while t<=duration frac=0.0;if span>0 then frac=(t-startTime)*1.0/span end if;pos=[start[0]+(finish[0]-start[0])*frac,start[1]+(finish[1]-start[1])*frac,start[2]+(finish[2]-start[2])*frac];result=result+[action(state,"render",kind,cent.weapon,cent.number,pos,pos,zero3(),"",shader,"",trailRadius,0.0,[1.0,1.0,1.0],t+trailTime,retailActive)];t=t+50 end while;return result
end function
// CG_RocketTrail
/// @param state Argument 1 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_weapons.smokeTrail`.
/// @param start Argument 4 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param finish Argument 5 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param liquidBoth Argument 8 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.smokeTrail`.
function rocketTrail(state,cent,start,finish,liquidBoth,retailActive) return smokeTrail(state,"rocket-smoke",cent,start,finish,64.0,2000,liquidBoth,"smokePuff",retailActive) end function
// CG_NailTrail
/// @param state Argument 1 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_weapons.smokeTrail`.
/// @param start Argument 4 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param finish Argument 5 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param liquidBoth Argument 8 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.smokeTrail`.
function nailTrail(state,cent,start,finish,liquidBoth,retailActive) return smokeTrail(state,"nail-smoke",cent,start,finish,16.0,250,liquidBoth,"nailPuff",retailActive) end function
// CG_PlasmaTrail
/// @param state Record read through `state.noProjectileTrail`, `state.oldPlasma`, `state.time`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.angles`, `cent.number`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param water Value used by `if water then scale=0.1 end if`.
/// @param flashColor Sequence read at `flashColor[0]`, `flashColor[1]`, `flashColor[2]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function plasmaTrail(state,cent,origin,water,flashColor,retailActive)
  if state.noProjectileTrail or state.oldPlasma then return void end if;axes=q.AngleVectors(cent.angles);p=q.VectorMA(q.VectorMA(q.VectorMA(origin,2.0,axes[0]),2.0,axes[1]),2.0,axes[2]);scale=1.0;if water then scale=0.1 end if;local=[60.0-120.0*crandom(state),40.0-80.0*crandom(state),100.0-200.0*crandom(state)];velocity=zero3();for i=0 to 2 velocity[i]=(local[0]*axes[0][i]+local[1]*axes[1][i]+local[2]*axes[2][i])*scale end for;return action(state,"render","plasma-trail",WP_PLASMAGUN,cent.number,p,p,velocity,"","railDisc","",0.25,0.0,[flashColor[0]*0.2,flashColor[1]*0.2,flashColor[2]*0.2],state.time+600,retailActive)
end function
// CG_GrappleTrail
/// @param state Record read through `state.time`.
/// @param cent Mutable client game weapons record/storage; this routine assigns `cent.trailTime`.
/// @param ownerOrigin Sequence read at `ownerOrigin[0]`, `ownerOrigin[1]`, `ownerOrigin[2]`.
/// @param ownerAngles Value used by `up=q.AngleVectors(ownerAngles)[2]`.
/// @param hookOrigin Sequence read at `hookOrigin[0]`, `hookOrigin[1]`, `hookOrigin[2]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function grappleTrail(state,cent,ownerOrigin,ownerAngles,hookOrigin,retailActive)
  cent.trailTime=state.time;up=q.AngleVectors(ownerAngles)[2];start=q.VectorMA([ownerOrigin[0],ownerOrigin[1],ownerOrigin[2]+26.0],-6.0,up);if q.VectorLength([hookOrigin[0]-start[0],hookOrigin[1]-start[1],hookOrigin[2]-start[2]])<64.0 then return void end if;return visual(state,"grapple-beam",WP_GRAPPLING_HOOK,cent.number,start,hookOrigin,"","lightningBoltNew",0.0,0,retailActive)
end function
// CG_GrenadeTrail
/// @param state Argument 1 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_weapons.smokeTrail`.
/// @param start Argument 4 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param finish Argument 5 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param liquidBoth Argument 8 of `mq3.client.cgame_weapons.smokeTrail`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.smokeTrail`.
function grenadeTrail(state,cent,start,finish,liquidBoth,retailActive) return smokeTrail(state,"grenade-smoke",cent,start,finish,32.0,700,liquidBoth,"smokePuff",retailActive) end function

/// Calls `mq3.client.cgame_weapons.emptyWeapon` from client game weapons `profile`. The final path returns `w`.
/// @param number Value used by `w=emptyWeapon(number)`.
function profile(number)
  w=emptyWeapon(number);w.registered=true;w.flashColor=[1.0,1.0,1.0];w.flashSounds=["sound/weapons/rocket/rocklf1a.wav"]
  switch number
    case WP_GAUNTLET w.flashColor=[0.6,0.6,1.0];w.firingSound="sound/weapons/melee/fstrun.wav";w.flashSounds=["sound/weapons/melee/fstatck.wav"] end case
    case WP_MACHINEGUN w.flashColor=[1.0,1.0,0.0];w.flashSounds=["sound/weapons/machinegun/machgf1b.wav","sound/weapons/machinegun/machgf2b.wav","sound/weapons/machinegun/machgf3b.wav","sound/weapons/machinegun/machgf4b.wav"];w.ejectBrass="machinegun" end case
    case WP_SHOTGUN w.flashColor=[1.0,1.0,0.0];w.flashSounds=["sound/weapons/shotgun/sshotf1b.wav"];w.ejectBrass="shotgun" end case
    case WP_GRENADE_LAUNCHER w.missileModel="models/ammo/grenade1.md3";w.trail="grenade";w.trailTime=700;w.trailRadius=32.0;w.flashColor=[1.0,0.7,0.0];w.flashSounds=["sound/weapons/grenade/grenlf1a.wav"] end case
    case WP_ROCKET_LAUNCHER w.missileModel="models/ammo/rocket/rocket.md3";w.missileSound="sound/weapons/rocket/rockfly.wav";w.trail="rocket";w.missileDlight=200.0;w.trailTime=2000;w.trailRadius=64.0;w.missileColor=[1.0,0.75,0.0];w.flashColor=[1.0,0.75,0.0];w.flashSounds=["sound/weapons/rocket/rocklf1a.wav"] end case
    case WP_LIGHTNING w.flashColor=[0.6,0.6,1.0];w.readySound="sound/weapons/melee/fsthum.wav";w.firingSound="sound/weapons/lightning/lg_hum.wav";w.flashSounds=["sound/weapons/lightning/lg_fire.wav"] end case
    case WP_RAILGUN w.readySound="sound/weapons/railgun/rg_hum.wav";w.flashColor=[1.0,0.5,0.0];w.flashSounds=["sound/weapons/railgun/railgf1a.wav"] end case
    case WP_PLASMAGUN w.trail="plasma";w.missileSound="sound/weapons/plasma/lasfly.wav";w.flashColor=[0.6,0.6,1.0];w.flashSounds=["sound/weapons/plasma/hyprbf1a.wav"] end case
    case WP_BFG w.readySound="sound/weapons/bfg/bfg_hum.wav";w.flashColor=[1.0,0.7,1.0];w.flashSounds=["sound/weapons/bfg/bfg_fire.wav"];w.missileModel="models/weaphits/bfg.md3";w.missileSound="sound/weapons/rocket/rockfly.wav" end case
    case WP_GRAPPLING_HOOK w.missileModel="models/ammo/rocket/rocket.md3";w.trail="grapple";w.missileDlight=200.0;w.trailTime=2000;w.trailRadius=64.0;w.missileColor=[1.0,0.75,0.0];w.flashColor=[0.6,0.6,1.0];w.readySound="sound/weapons/melee/fsthum.wav";w.firingSound="sound/weapons/melee/fstrun.wav" end case
    case WP_NAILGUN w.ejectBrass="nailgun";w.trail="nail";w.trailRadius=16.0;w.trailTime=250;w.missileModel="models/weaphits/nail.md3";w.flashColor=[1.0,0.75,0.0];w.flashSounds=["sound/weapons/nailgun/wnalfire.wav"] end case
    case WP_PROX_LAUNCHER w.missileModel="models/weaphits/proxmine.md3";w.trail="grenade";w.trailTime=700;w.trailRadius=32.0;w.flashColor=[1.0,0.7,0.0];w.flashSounds=["sound/weapons/proxmine/wstbfire.wav"] end case
    case WP_CHAINGUN w.firingSound="sound/weapons/vulcan/wvulfire.wav";w.loopFire=true;w.flashColor=[1.0,1.0,0.0];w.flashSounds=["sound/weapons/vulcan/vulcanf1b.wav","sound/weapons/vulcan/vulcanf2b.wav","sound/weapons/vulcan/vulcanf3b.wav","sound/weapons/vulcan/vulcanf4b.wav"];w.ejectBrass="machinegun" end case
  end switch;return w
end function
// CG_RegisterWeapon
/// @param state Mutable client game weapons record/storage; this routine assigns `state.weapons[weaponNum]`.
/// @param weaponNum Quake III weapon identifier.
/// @param item Record read through `item.pickupName`, `item.worldModel`, `item.icon`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function registerWeapon(state,weaponNum,item,retailActive)
  if weaponNum==0 then return void end if;if weaponNum<0 or weaponNum>=len(state.weapons) then return error(7790,"weapon number out of range") end if;if state.weapons[weaponNum].registered then return state.weapons[weaponNum] end if
  w=profile(weaponNum);if item!=void then w.pickupName=item.pickupName;w.weaponModel=item.worldModel;w.weaponIcon=item.icon;base=item.worldModel;if len(base)>4 then base=decode(slice(bytes(base),0,len(base)-4)) end if;w.flashModel=base+"_flash.md3";w.barrelModel=base+"_barrel.md3";w.handsModel=base+"_hand.md3" end if;if w.handsModel=="" then w.handsModel="models/weapons2/shotgun/shotgun_hand.md3" end if;state.weapons[weaponNum]=w;action(state,"register","weapon",weaponNum,0,zero3(),zero3(),zero3(),w.weaponModel,w.weaponIcon,"",0.0,0.0,w.flashColor,0,retailActive);return w
end function
// CG_RegisterItemVisuals
/// @param state Mutable client game weapons record/storage; this routine assigns `state.items[itemNum]`.
/// @param itemNum Value used by `if itemNum<0 or itemNum>=len(state.items) then return error(7790,"item number out of range") end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function registerItemVisuals(state,itemNum,retailActive)
  if itemNum<0 or itemNum>=len(state.items) then return error(7790,"item number out of range") end if;item=state.items[itemNum];if item.registered then return item end if;item.registered=true;state.items[itemNum]=item;action(state,"register","item",item.tag,itemNum,zero3(),zero3(),zero3(),item.worldModel,item.icon,"",0.0,0.0,[1.0,1.0,1.0],0,retailActive);if item.type==1 then registerWeapon(state,item.tag,item,retailActive) end if;return item
end function

// CG_MapTorsoToWeaponFrame
/// @param dropFirst Value used by `if frame>=dropFirst and frame<dropFirst+9 then return frame-dropFirst+6 end if`.
/// @param attackFirst Value used by `if frame>=attackFirst and frame<attackFirst+6 then return 1+frame-attackFirst end if`.
/// @param attack2First Value used by `if frame>=attack2First and frame<attack2First+6 then return 1+frame-attack2First end if`.
/// @param frame Value used by `if frame>=dropFirst and frame<dropFirst+9 then return frame-dropFirst+6 end if`.
function mapTorsoToWeaponFrame(dropFirst,attackFirst,attack2First,frame)
  if frame>=dropFirst and frame<dropFirst+9 then return frame-dropFirst+6 end if;if frame>=attackFirst and frame<attackFirst+6 then return 1+frame-attackFirst end if;if frame>=attack2First and frame<attack2First+6 then return 1+frame-attack2First end if;return 0
end function
// CG_CalculateWeaponPosition
/// @param vieworg Value used by `origin=copy3(vieworg)`.
/// @param viewangles Value used by `angles=copy3(viewangles)`.
/// @param bobcycle Value used by `if (bobcycle&1)!=0 then scale= -xyspeed end if`.
/// @param xyspeed Value used by `scale=xyspeed`.
/// @param bobfracsin Value used by `angles[2]=angles[2]+scale*bobfracsin*0.005`.
/// @param time Value used by `delta=time-landTime`.
/// @param landTime Value used by `delta=time-landTime`.
/// @param landChange Value used by `if delta<LAND_DEFLECT_TIME then origin[2]=origin[2]+landChange*0.25*delta/LAND_DEFLECT_TIME else if delta<LAND_DEFLECT_TIME+LAND_RETURN_TIME t...`.
function calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,time,landTime,landChange)
  origin=copy3(vieworg);angles=copy3(viewangles);scale=xyspeed;if (bobcycle&1)!=0 then scale= -xyspeed end if;angles[2]=angles[2]+scale*bobfracsin*0.005;angles[1]=angles[1]+scale*bobfracsin*0.01;angles[0]=angles[0]+xyspeed*bobfracsin*0.005;delta=time-landTime
  if delta<LAND_DEFLECT_TIME then origin[2]=origin[2]+landChange*0.25*delta/LAND_DEFLECT_TIME else if delta<LAND_DEFLECT_TIME+LAND_RETURN_TIME then origin[2]=origin[2]+landChange*0.25*(LAND_DEFLECT_TIME+LAND_RETURN_TIME-delta)/LAND_RETURN_TIME end if
  scale=xyspeed+40.0;wave=crt.sin(time*0.001);for i=0 to 2 angles[i]=angles[i]+scale*wave*0.01 end for;return [origin,angles]
end function
// CG_LightningBolt
/// @param state Record read through `state.trueLightning`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.weapon`, `cent.angles`, `cent.number`, `cent.origin`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param viewAngles Sequence read at `viewAngles[i]`.
/// @param predictedClient Value used by `if cent.number==predictedClient and state.trueLightning!=0.0 then for i=0 to 2 diff=cent.angles[i]-viewAngles[i]`.
/// @param traceEnd Value used by `finish=traceEnd`.
/// @param traceFraction Value used by `if traceFraction<1.0 then result=result+[visual(state,"lightning-impact",WP_LIGHTNING,cent.number,q.VectorMA(finish,-16.0,forward),finish,"mod...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function lightningBolt(state,cent,origin,viewAngles,predictedClient,traceEnd,traceFraction,retailActive)
  if cent.weapon!=WP_LIGHTNING then return [] end if;angle=copy3(cent.angles);if cent.number==predictedClient and state.trueLightning!=0.0 then for i=0 to 2 diff=cent.angles[i]-viewAngles[i];if diff>180.0 then diff=diff-360.0 end if;if diff< -180.0 then diff=diff+360.0 end if;angle[i]=viewAngles[i]+diff*(1.0-state.trueLightning);if angle[i]<0.0 then angle[i]=angle[i]+360.0 end if;if angle[i]>360.0 then angle[i]=angle[i]-360.0 end if end for end if
  forward=q.AngleVectors(angle)[0];muzzle=[cent.origin[0],cent.origin[1],cent.origin[2]+26.0];muzzle=q.VectorMA(muzzle,14.0,forward);finish=traceEnd;if finish==void then finish=q.VectorMA(muzzle,LIGHTNING_RANGE,forward) end if;result=[visual(state,"lightning-bolt",WP_LIGHTNING,cent.number,origin,finish,"","lightningBoltNew",0.0,0,retailActive)];if traceFraction<1.0 then result=result+[visual(state,"lightning-impact",WP_LIGHTNING,cent.number,q.VectorMA(finish,-16.0,forward),finish,"models/weaphits/crackle.md3","",0.0,0,retailActive)] end if;return result
end function
// CG_SpawnRailTrail
/// @param state Shared client game weapons state passed to the helper calls in `spawnRailTrail`.
/// @param cent Mutable client game weapons record/storage; this routine assigns `cent.railgunFlash`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param color1 Value used by `return railTrail(state,color1,color2,origin,cent.railgunImpact,retailActive)`.
/// @param color2 Value used by `return railTrail(state,color1,color2,origin,cent.railgunImpact,retailActive)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function spawnRailTrail(state,cent,origin,color1,color2,retailActive) if cent.weapon!=WP_RAILGUN or not cent.railgunFlash then return [] end if;cent.railgunFlash=true;return railTrail(state,color1,color2,origin,cent.railgunImpact,retailActive) end function
// CG_MachinegunSpinAngle
/// @param state Record read through `state.time`.
/// @param cent Mutable client game weapons record/storage; this routine assigns `cent.barrel.time`, `cent.barrel.angle`, `cent.barrel.spinning`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function machinegunSpinAngle(state,cent,retailActive)
  delta=state.time-cent.barrel.time
  angle=cent.barrel.angle
  if cent.barrel.spinning then
    angle=cent.barrel.angle+delta*SPIN_SPEED
  else
    if delta>COAST_TIME then delta=COAST_TIME end if
    speed=0.5*(SPIN_SPEED+(COAST_TIME-delta)*1.0/COAST_TIME);angle=cent.barrel.angle+delta*speed
  end if
  firing=(cent.eFlags&EF_FIRING)!=0
  if cent.barrel.spinning==(not firing) then cent.barrel.time=state.time;cent.barrel.angle=q.AngleNormalize360(angle);cent.barrel.spinning=firing;if cent.weapon==WP_CHAINGUN and not firing then audio(state,"chaingun-winddown",cent.weapon,cent.number,cent.origin,"sound/weapons/vulcan/wvulwind.wav",retailActive) end if end if;return angle
end function
// CG_AddWeaponWithPowerups
/// @param state Shared client game weapons state passed to the helper calls in `addWeaponWithPowerups`.
/// @param weaponNum Quake III weapon identifier.
/// @param entityNum Entity number identifying a world or player entity.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param powerups Value used by `if (powerups&(1<<PW_INVIS))!=0 then result=result+[visual(state,"weapon-invisibility",weaponNum,entityNum,origin,origin,model,"invis",0.0,0,re...`.
/// @param model Model handle, asset or preview record used by this client game weapons operation.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function addWeaponWithPowerups(state,weaponNum,entityNum,origin,powerups,model,retailActive)
  result=[];if (powerups&(1<<PW_INVIS))!=0 then result=result+[visual(state,"weapon-invisibility",weaponNum,entityNum,origin,origin,model,"invis",0.0,0,retailActive)];return result end if;result=result+[visual(state,"weapon",weaponNum,entityNum,origin,origin,model,"",0.0,0,retailActive)];if (powerups&(1<<PW_BATTLESUIT))!=0 then result=result+[visual(state,"weapon-battlesuit",weaponNum,entityNum,origin,origin,model,"battleWeapon",0.0,0,retailActive)] end if;if (powerups&(1<<PW_QUAD))!=0 then result=result+[visual(state,"weapon-quad",weaponNum,entityNum,origin,origin,model,"quadWeapon",0.0,0,retailActive)] end if;return result
end function
// CG_AddPlayerWeapon
/// @param state Record read through `state.weapons`, `state.time`.
/// @param cent Mutable client game weapons record/storage; this routine assigns `cent.lightningFiring`.
/// @param isView Value used by `if not isView then if (cent.eFlags&EF_FIRING)!=0 and w.firingSound!="" then result=result+[audio(state,"weapon-loop",cent.weapon,cent.number,c...`.
/// @param flashOrigin Value used by `if w.flashModel!="" then result=result+[visual(state,"muzzle-flash",cent.weapon,cent.number,flashOrigin,flashOrigin,w.flashModel,"",0.0,0,reta...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function addPlayerWeapon(state,cent,isView,flashOrigin,retailActive)
  if cent.weapon<=WP_NONE or cent.weapon>=len(state.weapons) then return [] end if;w=state.weapons[cent.weapon];if not w.registered then w=registerWeapon(state,cent.weapon,void,retailActive) end if;result=addWeaponWithPowerups(state,cent.weapon,cent.number,cent.origin,cent.powerups,w.weaponModel,retailActive)
  if not isView then if (cent.eFlags&EF_FIRING)!=0 and w.firingSound!="" then result=result+[audio(state,"weapon-loop",cent.weapon,cent.number,cent.origin,w.firingSound,retailActive)];cent.lightningFiring=true else if w.readySound!="" then result=result+[audio(state,"weapon-ready",cent.weapon,cent.number,cent.origin,w.readySound,retailActive)] end if end if
  if w.barrelModel!="" then result=result+addWeaponWithPowerups(state,cent.weapon,cent.number,cent.origin,cent.powerups,w.barrelModel,retailActive);machinegunSpinAngle(state,cent,retailActive) end if
  continuous=(cent.weapon==WP_LIGHTNING or cent.weapon==WP_GAUNTLET or cent.weapon==WP_GRAPPLING_HOOK) and (cent.eFlags&EF_FIRING)!=0;if not continuous and state.time-cent.muzzleFlashTime>MUZZLE_FLASH_TIME and not cent.railgunFlash then return result end if;if w.flashModel!="" then result=result+[visual(state,"muzzle-flash",cent.weapon,cent.number,flashOrigin,flashOrigin,w.flashModel,"",0.0,0,retailActive)] end if;return result
end function
// CG_AddViewWeapon
/// @param state Record read through `state.renderingThirdPerson`, `state.testGun`, `state.drawGun`, `state.time` and additional values.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.eFlags`, `cent.number`.
/// @param team Value used by `if team==3 or intermission or state.renderingThirdPerson or state.testGun then return [] end if`.
/// @param intermission Value used by `if team==3 or intermission or state.renderingThirdPerson or state.testGun then return [] end if`.
/// @param vieworg Value used by `if not state.drawGun then if (cent.eFlags&EF_FIRING)!=0 then return lightningBolt(state,cent,q.VectorMA(vieworg,-8.0,q.AngleVectors(viewangles...`.
/// @param viewangles Value used by `if not state.drawGun then if (cent.eFlags&EF_FIRING)!=0 then return lightningBolt(state,cent,q.VectorMA(vieworg,-8.0,q.AngleVectors(viewangles...`.
/// @param bobcycle Value used by `position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange)`.
/// @param xyspeed Value used by `position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange)`.
/// @param bobfracsin Value used by `position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange)`.
/// @param landTime Value used by `position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange)`.
/// @param landChange Value used by `position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function addViewWeapon(state,cent,team,intermission,vieworg,viewangles,bobcycle,xyspeed,bobfracsin,landTime,landChange,retailActive)
  if team==3 or intermission or state.renderingThirdPerson or state.testGun then return [] end if;if not state.drawGun then if (cent.eFlags&EF_FIRING)!=0 then return lightningBolt(state,cent,q.VectorMA(vieworg,-8.0,q.AngleVectors(viewangles)[2]),viewangles,cent.number,void,1.0,retailActive) end if;return [] end if;position=calculateWeaponPosition(vieworg,viewangles,bobcycle,xyspeed,bobfracsin,state.time,landTime,landChange);offset=q.VectorMA(q.VectorMA(q.VectorMA(position[0],state.gunX,q.AngleVectors(viewangles)[0]),state.gunY,q.AngleVectors(viewangles)[1]),state.gunZ+(-0.2*(state.fov-90)),q.AngleVectors(viewangles)[2]);return addPlayerWeapon(state,cent,true,offset,retailActive)
end function

// CG_DrawWeaponSelect
/// @param state Mutable client game weapons record/storage; this routine assigns `state.itemPickupTime`.
/// @param names Sequence read at `names[state.weaponSelect]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawWeaponSelect(state,names,retailActive)
  result=[];if state.health<=0 then return result end if;state.itemPickupTime=0;count=0;for i=1 to 15 if (state.owned&(1<<i))!=0 then count=count+1 end if end for;x=320-count*20
  for i=1 to 15 if (state.owned&(1<<i))==0 then continue end if;kind="weapon-icon";if i==state.weaponSelect then kind="weapon-icon-selected" end if;result=result+[visual(state,kind,i,0,[x*1.0,380.0,0.0],[32.0,32.0,0.0],"","",32.0,state.ammo[i],retailActive)];x=x+40 end for;if state.weaponSelect<len(names) and names[state.weaponSelect]!="" then result=result+[action(state,"render","weapon-name",state.weaponSelect,0,[320.0,358.0,0.0],zero3(),zero3(),"","","",0.0,0.0,[1.0,1.0,1.0],names[state.weaponSelect],retailActive)] end if;return result
end function
// CG_WeaponSelectable
/// @param state Record read through `state.ammo`, `state.owned`.
/// @param i Value used by `return i>=0 and i<len(state.ammo) and state.ammo[i]!=0 and (state.owned&(1<<i))!=0`.
function weaponSelectable(state,i) return i>=0 and i<len(state.ammo) and state.ammo[i]!=0 and (state.owned&(1<<i))!=0 end function
// CG_NextWeapon_f
/// @param state Mutable client game weapons record/storage; this routine assigns `state.weaponSelectTime`, `state.weaponSelect`.
function nextWeapon(state) if state.follow then return state.weaponSelect end if;state.weaponSelectTime=state.time;original=state.weaponSelect;for i=0 to 15 state.weaponSelect=state.weaponSelect+1;if state.weaponSelect==16 then state.weaponSelect=0 end if;if state.weaponSelect==WP_GAUNTLET then continue end if;if weaponSelectable(state,state.weaponSelect) then return state.weaponSelect end if end for;state.weaponSelect=original;return original end function
// CG_PrevWeapon_f
/// @param state Mutable client game weapons record/storage; this routine assigns `state.weaponSelectTime`, `state.weaponSelect`.
function prevWeapon(state) if state.follow then return state.weaponSelect end if;state.weaponSelectTime=state.time;original=state.weaponSelect;for i=0 to 15 state.weaponSelect=state.weaponSelect-1;if state.weaponSelect== -1 then state.weaponSelect=15 end if;if state.weaponSelect==WP_GAUNTLET then continue end if;if weaponSelectable(state,state.weaponSelect) then return state.weaponSelect end if end for;state.weaponSelect=original;return original end function
// CG_Weapon_f
/// @param state Mutable client game weapons record/storage; this routine assigns `state.weaponSelectTime`, `state.weaponSelect`.
/// @param num Value assigned to `state.weaponSelect`.
function selectWeapon(state,num) if state.follow or num<1 or num>15 then return state.weaponSelect end if;state.weaponSelectTime=state.time;if (state.owned&(1<<num))!=0 then state.weaponSelect=num end if;return state.weaponSelect end function
// CG_OutOfAmmoChange
/// @param state Mutable client game weapons record/storage; this routine assigns `state.weaponSelectTime`, `state.weaponSelect`.
function outOfAmmoChange(state) state.weaponSelectTime=state.time;i=15;while i>0 if weaponSelectable(state,i) then state.weaponSelect=i;return i end if;i=i-1 end while;return state.weaponSelect end function

// CG_FireWeapon
/// @param state Mutable client game weapons record/storage; this routine assigns `state.weapons[cent.weapon]`.
/// @param cent Mutable client game weapons record/storage; this routine assigns `cent.muzzleFlashTime`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function fireWeapon(state,cent,retailActive)
  if cent.weapon==WP_NONE then return [] end if;if cent.weapon>=WP_NUM_WEAPONS then return error(7790,"weapon exceeds WP_NUM_WEAPONS") end if;cent.muzzleFlashTime=state.time;if cent.weapon==WP_LIGHTNING and cent.lightningFiring then return [] end if;result=[];if (cent.powerups&(1<<PW_QUAD))!=0 then result=result+[audio(state,"quad-fire",cent.weapon,cent.number,cent.origin,"sound/items/damage3.wav",retailActive)] end if;w=state.weapons[cent.weapon];if not w.registered then w=profile(cent.weapon);state.weapons[cent.weapon]=w end if;if len(w.flashSounds)>0 then result=result+[audio(state,"weapon-fire",cent.weapon,cent.number,cent.origin,w.flashSounds[randInt(state)%len(w.flashSounds)],retailActive)] end if;if state.brassTime>0 then if w.ejectBrass=="machinegun" then v=machineGunEjectBrass(state,cent,false,retailActive);if v!=void then result=result+[v] end if else if w.ejectBrass=="shotgun" then result=result+shotgunEjectBrass(state,cent,false,retailActive) else if w.ejectBrass=="nailgun" then result=result+[nailgunEjectBrass(state,cent,retailActive)] end if end if;return result
end function

// CG_MissileHitWall
/// @param state Record read through `state.oldRocket`.
/// @param weaponNum Quake III weapon identifier.
/// @param clientNum Client slot identifier used by the client/server protocol.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param dir Value used by `if not state.oldRocket then action(state,"render","rocket-particle-explosion",weaponNum,0,q.VectorMA(origin,24.0,dir),origin,q.VectorScale(dir...`.
/// @param soundType Value used by `if soundType==IMPACTSOUND_FLESH then sound="sound/weapons/nailgun/wnalimpl.wav" else if soundType==IMPACTSOUND_METAL then sound="sound/weapons...`.
/// @param clientColor1 Value used by `color=clientColor1 end case`.
/// @param clientColor2 Value used by `if weaponNum==WP_RAILGUN then markColor=clientColor2 end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function missileHitWall(state,weaponNum,clientNum,origin,dir,soundType,clientColor1,clientColor2,retailActive)
  model="";shader="";sound="";mark="";radius=32.0;light=0.0;duration=600;sprite=false;color=[1.0,1.0,0.0]
  switch weaponNum
    case WP_LIGHTNING r=randInt(state)&3;if r<2 then sound="sound/weapons/lightning/lg_hit2.wav" else if r==2 then sound="sound/weapons/lightning/lg_hit.wav" else sound="sound/weapons/lightning/lg_hit3.wav" end if;mark="hole";radius=12.0 end case
    case WP_GRENADE_LAUNCHER model="models/weaphits/boom01.md3";shader="grenadeExplosion";sound="sound/weapons/rocket/rocklx1a.wav";mark="burn";radius=64.0;light=300.0;sprite=true end case
    case WP_PROX_LAUNCHER model="models/weaphits/boom01.md3";shader="grenadeExplosion";sound="sound/weapons/proxmine/wstbexpl.wav";mark="burn";radius=64.0;light=300.0;sprite=true end case
    case WP_ROCKET_LAUNCHER model="models/weaphits/boom01.md3";shader="rocketExplosion";sound="sound/weapons/rocket/rocklx1a.wav";mark="burn";radius=64.0;light=300.0;sprite=true;duration=1000;color=[1.0,0.75,0.0];if not state.oldRocket then action(state,"render","rocket-particle-explosion",weaponNum,0,q.VectorMA(origin,24.0,dir),origin,q.VectorScale(dir,64.0),"","explode1","",30.0,0.0,color,1400,retailActive) end if end case
    case WP_RAILGUN model="models/weaphits/ring02.md3";shader="railExplosion";sound="sound/weapons/plasma/plasmx1a.wav";mark="energy";radius=24.0;color=clientColor1 end case
    case WP_PLASMAGUN model="models/weaphits/ring02.md3";shader="plasmaExplosion";sound="sound/weapons/plasma/plasmx1a.wav";mark="energy";radius=16.0 end case
    case WP_BFG model="models/weaphits/boom01.md3";shader="bfgExplosion";sound="sound/weapons/rocket/rocklx1a.wav";mark="burn";radius=32.0;sprite=true end case
    case WP_SHOTGUN model="models/weaphits/bullet.md3";shader="bulletExplosion";mark="bullet";radius=4.0 end case
    case WP_MACHINEGUN model="models/weaphits/bullet.md3";shader="bulletExplosion";mark="bullet";radius=8.0;r=randInt(state)&3;if r==0 then sound="sound/world/ric1.wav" else if r==1 then sound="sound/world/ric2.wav" else sound="sound/world/ric3.wav" end if end case
    case WP_CHAINGUN model="models/weaphits/bullet.md3";mark="bullet";radius=8.0;r=randInt(state)&3;if r<2 then sound="sound/world/ric1.wav" else if r==2 then sound="sound/world/ric2.wav" else sound="sound/world/ric3.wav" end if end case
    case WP_NAILGUN mark="hole";radius=12.0;if soundType==IMPACTSOUND_FLESH then sound="sound/weapons/nailgun/wnalimpl.wav" else if soundType==IMPACTSOUND_METAL then sound="sound/weapons/nailgun/wnalimpd.wav" else sound="sound/weapons/nailgun/wnalimp.wav" end if end case
  end switch;result=[];if sound!="" then result=result+[audio(state,"impact",weaponNum,-1,origin,sound,retailActive)] end if;if model!="" then result=result+[action(state,"render","impact-explosion",weaponNum,clientNum,origin,dir,zero3(),model,shader,"",radius,light,color,duration,retailActive)] end if;if mark!="" then markColor=[1.0,1.0,1.0];if weaponNum==WP_RAILGUN then markColor=clientColor2 end if;result=result+[action(state,"render","impact-mark",weaponNum,clientNum,origin,dir,zero3(),"",mark,"",radius,0.0,markColor,randomFloat(state)*360.0,retailActive)] end if;return result
end function
// CG_MissileHitPlayer
/// @param state Shared client game weapons state passed to the helper calls in `missileHitPlayer`.
/// @param weaponNum Quake III weapon identifier.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param dir Value used by `result=[visual(state,"bleed",weaponNum,entityNum,origin,dir,"","bloodExplosion",24.0,0,retailActive)]`.
/// @param entityNum Entity number identifying a world or player entity.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function missileHitPlayer(state,weaponNum,origin,dir,entityNum,retailActive)
  result=[visual(state,"bleed",weaponNum,entityNum,origin,dir,"","bloodExplosion",24.0,0,retailActive)];if weaponNum==WP_GRENADE_LAUNCHER or weaponNum==WP_ROCKET_LAUNCHER or weaponNum==WP_NAILGUN or weaponNum==WP_CHAINGUN or weaponNum==WP_PROX_LAUNCHER then result=result+missileHitWall(state,weaponNum,0,origin,dir,IMPACTSOUND_FLESH,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive) end if;return result
end function

// CG_ShotgunPellet
/// @param state Shared client game weapons state passed to the helper calls in `shotgunPellet`.
/// @param start Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`.
/// @param finish Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`.
/// @param skipNum Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`.
/// @param sourceContents Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`.
/// @param destContents Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`.
/// @param hitPosition Value used by `if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,st...`.
/// @param normal Surface-normal vector used to orient or offset the effect.
/// @param surfaceFlags Value used by `if (surfaceFlags&SURF_NOIMPACT)!=0 then return result end if`.
/// @param hitPlayer Value used by `if hitPlayer then return result+missileHitPlayer(state,WP_SHOTGUN,hitPosition,normal,hitEntity,retailActive) end if`.
/// @param hitEntity Value used by `if hitPlayer then return result+missileHitPlayer(state,WP_SHOTGUN,hitPosition,normal,hitEntity,retailActive) end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function shotgunPellet(state,start,finish,skipNum,sourceContents,destContents,hitPosition,normal,surfaceFlags,hitPlayer,hitEntity,retailActive)
  result=[];if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,start,hitPosition,"","waterBubble",32.0,0,retailActive)] else if (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,start,hitPosition,"","waterBubble",32.0,0,retailActive)] else if (destContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"pellet-bubbles",WP_SHOTGUN,skipNum,hitPosition,finish,"","waterBubble",32.0,0,retailActive)] end if;if (surfaceFlags&SURF_NOIMPACT)!=0 then return result end if;if hitPlayer then return result+missileHitPlayer(state,WP_SHOTGUN,hitPosition,normal,hitEntity,retailActive) end if;soundType=IMPACTSOUND_DEFAULT;if (surfaceFlags&SURF_METALSTEPS)!=0 then soundType=IMPACTSOUND_METAL end if;return result+missileHitWall(state,WP_SHOTGUN,0,hitPosition,normal,soundType,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive)
end function
// CG_ShotgunPattern
/// @param state Shared client game weapons state passed to the helper calls in `shotgunPattern`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param direction Direction vector used by the spatial calculation.
/// @param seed Value used by `rng=q.RandomState(seed)`.
/// @param otherEntNum Value used by `result=result+[action(state,"trace","shotgun-pellet",WP_SHOTGUN,otherEntNum,origin,finish,zero3(),"","","",0.0,0.0,[1.0,1.0,1.0],rng.seed,reta...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function shotgunPattern(state,origin,direction,seed,otherEntNum,retailActive)
  forward=q.VectorNormalize2(direction);right=directions.perpendicular(forward);up=q.CrossProduct(forward,right);rng=q.RandomState(seed);result=[];for i=0 to DEFAULT_SHOTGUN_COUNT-1 r=q.Q_crandom(rng)*DEFAULT_SHOTGUN_SPREAD*16.0;u=q.Q_crandom(rng)*DEFAULT_SHOTGUN_SPREAD*16.0;finish=q.VectorMA(q.VectorMA(q.VectorMA(origin,8192.0*16.0,forward),r,right),u,up);result=result+[action(state,"trace","shotgun-pellet",WP_SHOTGUN,otherEntNum,origin,finish,zero3(),"","","",0.0,0.0,[1.0,1.0,1.0],rng.seed,retailActive)] end for;return result
end function
// CG_ShotgunFire
/// @param state Record read through `state.time`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param direction Direction vector used by the spatial calculation.
/// @param seed Value used by `return result+shotgunPattern(state,origin,direction,seed,otherEntNum,retailActive)`.
/// @param otherEntNum Value used by `if not ragePro and not water then result=result+[action(state,"render","shotgun-smoke",WP_SHOTGUN,otherEntNum,smokeOrigin,smokeOrigin,[0.0,0.0...`.
/// @param water Value used by `if not ragePro and not water then result=result+[action(state,"render","shotgun-smoke",WP_SHOTGUN,otherEntNum,smokeOrigin,smokeOrigin,[0.0,0.0...`.
/// @param ragePro Value used by `if not ragePro and not water then result=result+[action(state,"render","shotgun-smoke",WP_SHOTGUN,otherEntNum,smokeOrigin,smokeOrigin,[0.0,0.0...`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function shotgunFire(state,origin,direction,seed,otherEntNum,water,ragePro,retailActive)
  forward=q.VectorNormalize2([direction[0]-origin[0],direction[1]-origin[1],direction[2]-origin[2]]);smokeOrigin=q.VectorMA(origin,32.0,forward);result=[];if not ragePro and not water then result=result+[action(state,"render","shotgun-smoke",WP_SHOTGUN,otherEntNum,smokeOrigin,smokeOrigin,[0.0,0.0,8.0],"","shotgunSmokePuff","",32.0,0.0,[1.0,1.0,1.0],state.time+900,retailActive)] end if;return result+shotgunPattern(state,origin,direction,seed,otherEntNum,retailActive)
end function

// CG_Tracer
/// @param state Record read through `state.tracerLength`, `state.tracerWidth`.
/// @param source Sequence read at `source[0]`, `source[1]`, `source[2]`.
/// @param dest Sequence read at `dest[0]`, `dest[1]`, `dest[2]`.
/// @param viewRight Value used by `line=[q.DotProduct(forward,viewRight),q.DotProduct(forward,viewUp),0.0]`.
/// @param viewUp Value used by `line=[q.DotProduct(forward,viewRight),q.DotProduct(forward,viewUp),0.0]`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function tracer(state,source,dest,viewRight,viewUp,retailActive)
  forward=[dest[0]-source[0],dest[1]-source[1],dest[2]-source[2]];length=q.VectorNormalize(forward);if length<100.0 then return [] end if;begin=50.0+randomFloat(state)*(length-60.0);finishDistance=begin+state.tracerLength;if finishDistance>length then finishDistance=length end if;start=q.VectorMA(source,begin,forward);finish=q.VectorMA(source,finishDistance,forward);line=[q.DotProduct(forward,viewRight),q.DotProduct(forward,viewUp),0.0];right=q.VectorScale(viewRight,line[1]);right=q.VectorMA(right,-line[0],viewUp);q.VectorNormalize(right);middle=[(start[0]+finish[0])*0.5,(start[1]+finish[1])*0.5,(start[2]+finish[2])*0.5];return [action(state,"render","tracer",WP_MACHINEGUN,-1,start,finish,right,"","tracer","",state.tracerWidth,0.0,[1.0,1.0,1.0],0,retailActive),audio(state,"tracer-sound",WP_MACHINEGUN,-1,middle,"sound/weapons/machinegun/buletby1.wav",retailActive)]
end function
// CG_CalcMuzzlePoint
/// @param entityNum Entity number identifying a world or player entity.
/// @param localClient Value used by `if entityNum==localClient then muzzle=[localOrigin[0],localOrigin[1],localOrigin[2]+viewheight]`.
/// @param localOrigin Sequence read at `localOrigin[0]`, `localOrigin[1]`, `localOrigin[2]`.
/// @param viewheight Value used by `if entityNum==localClient then muzzle=[localOrigin[0],localOrigin[1],localOrigin[2]+viewheight]`.
/// @param viewangles Value used by `return q.VectorMA(muzzle,14.0,q.AngleVectors(viewangles)[0]) end if`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Record read through `cent.currentValid`, `cent.origin`, `cent.legsAnim`, `cent.angles`.
function calcMuzzlePoint(entityNum,localClient,localOrigin,viewheight,viewangles,cent)
  if entityNum==localClient then muzzle=[localOrigin[0],localOrigin[1],localOrigin[2]+viewheight];return q.VectorMA(muzzle,14.0,q.AngleVectors(viewangles)[0]) end if;if cent==void or not cent.currentValid then return void end if;muzzle=copy3(cent.origin);if (cent.legsAnim&~128)==13 or (cent.legsAnim&~128)==22 then muzzle[2]=muzzle[2]+12.0 else muzzle[2]=muzzle[2]+26.0 end if;return q.VectorMA(muzzle,14.0,q.AngleVectors(cent.angles)[0])
end function
// CG_Bullet
/// @param state Record read through `state.tracerChance`.
/// @param finish Value used by `if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0...`.
/// @param sourceEntityNum Value used by `if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0...`.
/// @param normal Surface-normal vector used to orient or offset the effect.
/// @param flesh Value used by `if flesh then return result+[visual(state,"bleed",WP_MACHINEGUN,fleshEntityNum,finish,normal,"","bloodExplosion",24.0,0,retailActive)] end if`.
/// @param fleshEntityNum Value used by `if flesh then return result+[visual(state,"bleed",WP_MACHINEGUN,fleshEntityNum,finish,normal,"","bloodExplosion",24.0,0,retailActive)] end if`.
/// @param muzzle Value used by `if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0...`.
/// @param sourceContents Value used by `if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0...`.
/// @param destContents Value used by `if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0...`.
/// @param viewRight Value used by `if randomFloat(state)<state.tracerChance then result=result+tracer(state,muzzle,finish,viewRight,viewUp,retailActive) end if end if`.
/// @param viewUp Value used by `if randomFloat(state)<state.tracerChance then result=result+tracer(state,muzzle,finish,viewRight,viewUp,retailActive) end if end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function bullet(state,finish,sourceEntityNum,normal,flesh,fleshEntityNum,muzzle,sourceContents,destContents,viewRight,viewUp,retailActive)
  result=[];if sourceEntityNum>=0 and state.tracerChance>0.0 and muzzle!=void then if sourceContents==destContents and (sourceContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"bullet-bubbles",WP_MACHINEGUN,sourceEntityNum,muzzle,finish,"","waterBubble",32.0,0,retailActive)] else if (sourceContents&CONTENTS_WATER)!=0 or (destContents&CONTENTS_WATER)!=0 then result=result+[visual(state,"bullet-bubbles",WP_MACHINEGUN,sourceEntityNum,muzzle,finish,"","waterBubble",32.0,0,retailActive)] end if;if randomFloat(state)<state.tracerChance then result=result+tracer(state,muzzle,finish,viewRight,viewUp,retailActive) end if end if;if flesh then return result+[visual(state,"bleed",WP_MACHINEGUN,fleshEntityNum,finish,normal,"","bloodExplosion",24.0,0,retailActive)] end if;return result+missileHitWall(state,WP_MACHINEGUN,0,finish,normal,IMPACTSOUND_DEFAULT,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive)
end function

// Inventory scanner also reports the local identifiers `strike` and `weapon`.
// Keep stable semantic aliases so all 35 ledger candidates have a native target.
// strike
/// @param state Argument 1 of `mq3.client.cgame_weapons.missileHitWall`.
/// @param weaponNum Quake III weapon identifier. Forwarded to `mq3.client.cgame_weapons.missileHitWall`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_weapons.missileHitWall`.
/// @param dir Argument 5 of `mq3.client.cgame_weapons.missileHitWall`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_weapons.missileHitWall`.
function strike(state,weaponNum,origin,dir,retailActive) return missileHitWall(state,weaponNum,0,origin,dir,IMPACTSOUND_DEFAULT,[1.0,1.0,1.0],[1.0,1.0,1.0],retailActive) end function
// weapon
/// @param state Record read through `state.weapons`.
/// @param weaponNum Quake III weapon identifier.
function weapon(state,weaponNum) if weaponNum<0 or weaponNum>=len(state.weapons) then return void end if;return state.weapons[weaponNum] end function
