// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/cgame/cg_effects.c.  The original functions
// allocate local entities; this module describes the same render/audio
// boundary actions.  retailActive suppresses dispatch beside cgame.qvm.
package mq3.client.cgame_effects
import mq3.client.cg_local as cgabi

import mq3.compat.numeric as n
import mq3.shared.math as qmath

/// Local-effect entity kind selecting an effect that moves, scales, and fades over its lifetime.
const LE_MOVE_SCALE_FADE=cgabi.LE_MOVE_SCALE_FADE
/// Local-effect entity kind selecting an effect that fades its RGB color components.
const LE_FADE_RGB=cgabi.LE_FADE_RGB
/// Local-effect entity kind selecting a model-based explosion.
const LE_EXPLOSION=cgabi.LE_EXPLOSION
/// Local-effect entity kind selecting a sprite-based explosion.
const LE_SPRITE_EXPLOSION=cgabi.LE_SPRITE_EXPLOSION
/// Local-effect entity kind selecting a moving fragment with collision and bounce handling.
const LE_FRAGMENT=cgabi.LE_FRAGMENT
/// Local-effect entity kind selecting a floating score indicator.
const LE_SCOREPLUM=cgabi.LE_SCOREPLUM
/// Local-effect entity kind selecting a renderer entity displayed without another local-effect update
/// mode.
const LE_SHOWREFENTITY=cgabi.LE_SHOWREFENTITY
/// Local-effect entity kind selecting the Missionpack kamikaze explosion sequence.
const LE_KAMIKAZE=cgabi.LE_KAMIKAZE
/// Local-effect entity kind selecting an impact against the invulnerability shield.
const LE_INVULIMPACT=cgabi.LE_INVULIMPACT
/// Local-effect entity kind selecting the invulnerability elimination effect.
const LE_INVULJUICED=cgabi.LE_INVULJUICED
/// Local-effect flag controlling the puff dont scale behavior of the temporary entity.
const LEF_PUFF_DONT_SCALE=cgabi.LEF_PUFF_DONT_SCALE
/// Trajectory kind that advances from its base with constant velocity.
const TR_LINEAR=2
/// Trajectory kind that applies downward gravitational acceleration to ballistic motion.
const TR_GRAVITY=5
/// Renderer-entity type selecting the model primitive.
const RT_MODEL=1
/// Renderer-entity type selecting the sprite primitive.
const RT_SPRITE=2
/// Renderer-entity type selecting the lightning primitive.
const RT_LIGHTNING=5
/// Renderer flag excluding the entity from its own first-person view while allowing external or
/// reflected views.
const RF_THIRD_PERSON=2
/// Local-fragment bounce-sound kind selecting none impact feedback.
const LEBS_NONE=cgabi.LEBS_NONE
/// Local-fragment bounce-sound kind selecting blood impact feedback.
const LEBS_BLOOD=cgabi.LEBS_BLOOD
/// Local-fragment bounce-sound kind selecting brass impact feedback.
const LEBS_BRASS=cgabi.LEBS_BRASS
/// Local-fragment impact-decal kind selecting none marks.
const LEMT_NONE=cgabi.LEMT_NONE
/// Local-fragment impact-decal kind selecting blood marks.
const LEMT_BLOOD=cgabi.LEMT_BLOOD
/// Entity-number sentinel representing no entity in the native game protocol.
const ENTITYNUM_NONE=1023
/// Sound channel used for an entity's body-related effects such as movement feedback.
const CHAN_BODY=4

/// Virtual asset path used to load the water bubble shader renderer or menu resource.
const WATER_BUBBLE_SHADER="waterBubble"
/// Virtual asset path used to load the smoke ragepro shader renderer or menu resource.
const SMOKE_RAGEPRO_SHADER="smokePuffRagePro"
/// Virtual asset path used to load the teleport shader renderer or menu resource.
const TELEPORT_SHADER="teleportEffect"
/// Virtual asset path used to load the teleport model renderer or menu resource.
const TELEPORT_MODEL="models/misc/telep.md3"
/// Virtual asset path used to load the teleport missionpack model renderer or menu resource.
const TELEPORT_MISSIONPACK_MODEL="models/powerups/pop.md3"
/// Virtual asset path used to load the lightning shader renderer or menu resource.
const LIGHTNING_SHADER="lightningBoltNew"
/// Virtual asset path used to load the kamikaze model renderer or menu resource.
const KAMIKAZE_MODEL="models/weaphits/kamboom2.md3"
/// Virtual asset path used to load the dish flash model renderer or menu resource.
const DISH_FLASH_MODEL="models/weaphits/boom01.md3"
/// Virtual asset path used to load the rocket explosion shader renderer or menu resource.
const ROCKET_EXPLOSION_SHADER="rocketExplosion"
/// Virtual asset path used to load the invul impact model renderer or menu resource.
const INVUL_IMPACT_MODEL="models/powerups/shield/impact.md3"
/// Virtual asset path used to load the invul juiced model renderer or menu resource.
const INVUL_JUICED_MODEL="models/powerups/shield/juicer.md3"
/// Virtual asset path used to load the blood explosion shader renderer or menu resource.
const BLOOD_EXPLOSION_SHADER="bloodExplosion"
/// Virtual asset path used to load the smoke2 model renderer or menu resource.
const SMOKE2_MODEL="models/weapons2/shells/s_shell.md3"

// An Effect contains every field written by cg_effects.c.  Unused scalar
// fields are zero and unused names are empty strings.
struct Effect
  /// Host service category recorded with a request emitted while constructing smoke, bubble, debris,
  /// and explosion effects.
  boundary
  /// Effect or media category selecting the matching geometry, texture, or presentation behavior.
  kind
  /// Local-effect entity kind selecting its update and rendering behavior.
  leType
  /// When constructing this record, `effect` supplies `0` for this member.
  startTime
  /// When constructing this record, `effect` supplies `0` for this member.
  fadeInTime
  /// When constructing this record, `effect` supplies `0` for this member.
  endTime
  /// Reciprocal effect lifetime used to normalize the fade or growth fraction.
  lifeRate
  /// When constructing this record, `effect` supplies `0` for this member.
  flags
  /// When constructing this record, `effect` supplies `0` for this member.
  trajectoryType
  /// When constructing this record, `effect` supplies `[0.0,0.0,0.0]` for this member.
  position
  /// When constructing this record, `effect` supplies `[0.0,0.0,0.0]` for this member.
  oldPosition
  /// Linear rate of change of position used by movement or effect integration.
  velocity
  /// Euler orientation used to place or animate the object.
  angles
  /// World-space radius supplied when creating a smoke puff, bubble, or other temporary effect.
  radius
  /// Normalized RGBA tint and opacity from which the spawned effect computes its shader color.
  color
  /// When constructing this record, `effect` supplies `[0.0,0.0,0.0,0.0]` for this member.
  shaderColor
  /// Model resource selected for rendering the object.
  model
  /// Material selected for the spawned smoke, bubble, teleport, or other temporary visual effect.
  shader
  /// When constructing this record, `effect` supplies `0.0` for this member.
  shaderTime
  /// When constructing this record, `effect` supplies `0.0` for this member.
  rotation
  /// Velocity multiplier after an impact; zero stops the fragment and one preserves its speed.
  bounceFactor
  /// Sound resource selected for the bounce event or effect.
  bounceSound
  /// When constructing this record, `effect` supplies `LEMT_NONE` for this member.
  markType
  /// When constructing this record, `effect` supplies `0` for this member.
  reType
  /// Renderer-entity flags controlling lighting, view restrictions, depth handling, and related
  /// effects.
  renderfx
  /// Dynamic-light intensity emitted by the local effect.
  light
  /// RGB components of the dynamic light emitted by the effect.
  lightColor
  /// When constructing this record, `effect` supplies `0` for this member.
  entity
  /// When constructing this record, `effect` supplies `0` for this member.
  channel
  /// True when this request is marked for native dispatch while constructing smoke, bubble, debris, and
  /// explosion effects; false when its native effect is suppressed.
  dispatched
end struct
/// Stores client game effects state, including `time`, `predictedClient`, `blood`, `gibs`, `scorePlum`, `noProjectileTrail` and additional values.
struct State
  /// Client-game timestamp in milliseconds used to initialize and schedule transient visual effects.
  time
  /// When constructing this record, `create` supplies `0` for this member. Used by `scorePlum` and
  /// `bleed` during subsequent processing.
  predictedClient
  /// When constructing this record, `create` supplies `true` for this member. Used by `bleed` and
  /// `gibPlayer` during subsequent processing.
  blood
  /// When constructing this record, `create` supplies `true` for this member. Used by `gibPlayer`
  /// during subsequent processing.
  gibs
  /// When constructing this record, `create` supplies `true` for this member. Used by `scorePlum`
  /// during subsequent processing.
  scorePlum
  /// When constructing this record, `create` supplies `false` for this member. Used by `bubbleTrail`
  /// during subsequent processing.
  noProjectileTrail
  /// When constructing this record, `create` supplies `false` for this member. Used by `spawnEffect`
  /// during subsequent processing.
  missionpack
  /// When constructing this record, `create` supplies `false` for this member. Used by `smokePuff`
  /// during subsequent processing.
  ragePro
  /// When constructing this record, `create` supplies `1` for this member. Used by `randInt` during
  /// subsequent processing.
  randomSeed
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `setRandomInts` and `randInt` during subsequent processing.
  randomInts
  /// When constructing this record, `create` supplies `0` for this member. Used by `setRandomInts` and
  /// `randInt` during subsequent processing.
  randomAt
  /// When constructing this record, `create` supplies `0x92` for this member. Used by `smokeRandom`
  /// during subsequent processing.
  smokeSeed
  /// When constructing this record, `create` supplies `[0.0,0.0,0.0]` for this member. Used by
  /// `scorePlum` during subsequent processing.
  lastScorePosition
  /// Host requests queued while constructing smoke, bubble, debris, and explosion effects, retained in
  /// request order.
  actions
  /// When constructing this record, `create` supplies `0` for this member. Used by `publish` during
  /// subsequent processing.
  emitted
  /// Number of requests withheld from native dispatch while constructing smoke, bubble, debris, and
  /// explosion effects because the retail QVM owns their effects.
  suppressed
end struct

/// Creates a `mq3.client.cgame_effects.State` record. Initializes the record with the defaults written in this constructor.
function create()
  return State(0,0,true,true,true,false,false,false,1,[],0,0x92,[0.0,0.0,0.0],[],0,0)
end function

/// Creates a `mq3.client.cgame_effects.Effect` record. Assigns `boundary` from `boundary`, `kind` from `kind`.
/// @param boundary Value used to initialize `Effect.boundary`.
/// @param kind Value used to initialize `Effect.kind`.
function effect(boundary,kind)
  return Effect(boundary,kind,0,0,0,0,0.0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0.0,[0.0,0.0,0.0,0.0],[0.0,0.0,0.0,0.0],"","",0.0,0.0,0.0,LEBS_NONE,LEMT_NONE,0,0,0.0,[0.0,0.0,0.0],0,0,false)
end function

/// Updates `value.dispatched`, `state.actions`, `state.emitted`, `state.suppressed` during client game effects `publish`.
/// @param state Mutable client game effects record/storage; this routine assigns `state.actions`, `state.emitted`, `state.suppressed`.
/// @param value Mutable client game effects record/storage; this routine assigns `value.dispatched`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function publish(state,value,retailActive)
  value.dispatched=not retailActive;state.actions=state.actions+[value]
  if value.dispatched then state.emitted=state.emitted+1 else state.suppressed=state.suppressed+1 end if
  return value
end function

/// Updates `state.actions` during client game effects `clear`.
/// @param state Mutable client game effects record/storage; this routine assigns `state.actions`.
function clear(state) state.actions=[];return void end function
/// Updates `state.randomInts`, `state.randomAt` during client game effects `setRandomInts`.
/// @param state Mutable client game effects record/storage; this routine assigns `state.randomInts`, `state.randomAt`.
/// @param values Value assigned to `state.randomInts`.
function setRandomInts(state,values) state.randomInts=values;state.randomAt=0;return void end function
/// Updates `state.randomAt`, `state.randomSeed` during client game effects `randInt`.
/// @param state Mutable client game effects record/storage; this routine assigns `state.randomAt`, `state.randomSeed`.
function randInt(state)
  if state.randomAt<len(state.randomInts) then value=state.randomInts[state.randomAt];state.randomAt=state.randomAt+1;return value end if
  state.randomSeed=n.add32(n.mul32(state.randomSeed,214013),2531011);return (n.u32(state.randomSeed)>>16)&32767
end function
/// Adapts `mq3.compat.numeric.fdiv` to client game effects `randomFloat`, returning its result for `randInt(state), 32767.0`.
/// @param state Argument 1 of `mq3.compat.numeric.fdiv`; passed as `randInt(state)`.
function randomFloat(state) return n.fdiv(randInt(state),32767.0) end function
/// Computes `2.0*(randomFloat(state)-0.5)` for client game effects `crandom`.
/// @param state Shared client game effects state passed to the helper calls in `crandom`.
function crandom(state) return 2.0*(randomFloat(state)-0.5) end function
/// Updates `state.smokeSeed` during client game effects `smokeRandom`.
/// @param state Mutable client game effects record/storage; this routine assigns `state.smokeSeed`.
function smokeRandom(state)
  state.smokeSeed=n.add32(n.mul32(69069,state.smokeSeed),1)
  return n.fdiv(state.smokeSeed&65535,65536.0)
end function
/// Copies the X, Y and Z components into a fresh client game effects vector.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function copy3(value) return [value[0],value[1],value[2]] end function
/// Builds the client game effects `white` sequence from `[1.0,1.0,1.0,1.0]`.
function white() return [1.0,1.0,1.0,1.0] end function

// CG_BubbleTrail
/// @param state Record read through `state.noProjectileTrail`, `state.time`.
/// @param start Sequence read at `start[0]`, `start[1]`, `start[2]`.
/// @param finish Sequence read at `finish[0]`, `finish[1]`, `finish[2]`.
/// @param spacing Value used by `if spacing<=0.0 then return error(7720,"bubble trail spacing must be positive") end if`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function bubbleTrail(state,start,finish,spacing,retailActive)
  if state.noProjectileTrail then return [] end if
  if spacing<=0.0 then return error(7720,"bubble trail spacing must be positive") end if
  move=copy3(start);direction=[finish[0]-start[0],finish[1]-start[1],finish[2]-start[2]];length=qmath.VectorNormalize(direction);step=n.trunc32(spacing);if step<=0 then return error(7720,"bubble trail spacing must be at least one") end if
  index=randInt(state)%step;move=[move[0]+index*direction[0],move[1]+index*direction[1],move[2]+index*direction[2]];delta=[direction[0]*spacing,direction[1]*spacing,direction[2]*spacing];result=[]
  while index<length
    value=effect("render","bubble");value.leType=LE_MOVE_SCALE_FADE;value.flags=LEF_PUFF_DONT_SCALE;value.trajectoryType=TR_LINEAR;value.startTime=state.time;value.endTime=state.time+1000+n.trunc32(randomFloat(state)*250.0);value.lifeRate=1.0/(value.endTime-value.startTime);value.position=copy3(move);value.velocity=[crandom(state)*5.0,crandom(state)*5.0,crandom(state)*5.0+6.0];value.radius=3.0;value.color=white();value.shaderColor=[255.0,255.0,255.0,255.0];value.shader=WATER_BUBBLE_SHADER;value.shaderTime=state.time/1000.0;value.reType=RT_SPRITE;result=result+[publish(state,value,retailActive)];move=[move[0]+delta[0],move[1]+delta[1],move[2]+delta[2]];index=index+step
  end while
  return result
end function

// CG_SmokePuff
/// @param state Record read through `state.ragePro`.
/// @param p Value used by `value.position=copy3(p)`.
/// @param velocity Velocity vector used to advance or orient the effect.
/// @param radius Radius used by the spatial or visual calculation.
/// @param r Value used by `value.color=[r,g,b,a]`.
/// @param g Value used by `value.color=[r,g,b,a]`.
/// @param b Value used by `value.color=[r,g,b,a]`.
/// @param a Value used by `value.color=[r,g,b,a]`.
/// @param duration Lifetime or interval in the same units as this operation's clock.
/// @param startTime Value assigned to `value.startTime`, `value.endTime`, `value.shaderTime`.
/// @param fadeInTime Value assigned to `value.fadeInTime`.
/// @param flags Value assigned to `value.flags`.
/// @param shader Value assigned to `value.shader`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function smokePuff(state,p,velocity,radius,r,g,b,a,duration,startTime,fadeInTime,flags,shader,retailActive)
  value=effect("render","smoke-puff");value.leType=LE_MOVE_SCALE_FADE;value.flags=flags;value.trajectoryType=TR_LINEAR;value.startTime=startTime;value.fadeInTime=fadeInTime;value.endTime=startTime+n.trunc32(duration);fadeStart=fadeInTime;if fadeStart<=startTime then fadeStart=startTime end if;value.lifeRate=1.0/(value.endTime-fadeStart);value.position=copy3(p);value.velocity=copy3(velocity);value.radius=radius;value.color=[r,g,b,a];value.shaderColor=[r*255.0,g*255.0,b*255.0,255.0];value.rotation=smokeRandom(state)*360.0;value.shader=shader;value.shaderTime=startTime/1000.0
  if state.ragePro then value.shader=SMOKE_RAGEPRO_SHADER;value.shaderColor=[255.0,255.0,255.0,255.0] end if;value.reType=RT_SPRITE;return publish(state,value,retailActive)
end function

// CG_SpawnEffect
/// @param state Record read through `state.time`, `state.missionpack`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function spawnEffect(state,origin,retailActive)
  value=effect("render","spawn-effect");value.leType=LE_FADE_RGB;value.startTime=state.time;value.endTime=state.time+500;value.lifeRate=1.0/500.0;value.color=white();value.reType=RT_MODEL;value.shaderTime=state.time/1000.0;value.position=copy3(origin)
  if state.missionpack then value.position[2]=value.position[2]+16.0;value.model=TELEPORT_MISSIONPACK_MODEL else value.position[2]=value.position[2]-24.0;value.model=TELEPORT_MODEL;value.shader=TELEPORT_SHADER end if
  return publish(state,value,retailActive)
end function

// CG_LightningBoltBeam
/// @param state Record read through `state.time`.
/// @param start Value used by `value.position=copy3(start)`.
/// @param finish Value used by `value.oldPosition=copy3(finish)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function lightningBoltBeam(state,start,finish,retailActive)
  value=effect("render","lightning-bolt-beam");value.leType=LE_SHOWREFENTITY;value.startTime=state.time;value.endTime=state.time+50;value.position=copy3(start);value.oldPosition=copy3(finish);value.reType=RT_LIGHTNING;value.shader=LIGHTNING_SHADER;return publish(state,value,retailActive)
end function

// CG_KamikazeEffect
/// @param state Record read through `state.time`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function kamikazeEffect(state,origin,retailActive)
  value=effect("render","kamikaze");value.leType=LE_KAMIKAZE;value.startTime=state.time;value.endTime=state.time+3000;value.lifeRate=1.0/3000.0;value.color=white();value.reType=RT_MODEL;value.shaderTime=state.time/1000.0;value.model=KAMIKAZE_MODEL;value.position=copy3(origin);return publish(state,value,retailActive)
end function

// CG_MakeExplosion
/// @param state Record read through `state.time`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param direction Direction vector used by the spatial calculation.
/// @param model Value assigned to `value.model`.
/// @param shader Value assigned to `value.shader`.
/// @param msec Time interval in milliseconds.
/// @param isSprite Value used by `if isSprite then value.leType=LE_SPRITE_EXPLOSION`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function makeExplosion(state,origin,direction,model,shader,msec,isSprite,retailActive)
  if msec<=0 then return error(7720,"CG_MakeExplosion: msec must be positive") end if
  offset=randInt(state)&63;value=effect("render","explosion");value.startTime=state.time-offset;value.endTime=value.startTime+msec;value.model=model;value.shader=shader;value.shaderTime=value.startTime/1000.0;value.color=[1.0,1.0,1.0,0.0]
  if isSprite then value.leType=LE_SPRITE_EXPLOSION;value.rotation=(randInt(state)%360)*1.0;if direction==void then direction=[0.0,0.0,0.0] end if;value.position=[origin[0]+direction[0]*16.0,origin[1]+direction[1]*16.0,origin[2]+direction[2]*16.0]
  else value.leType=LE_EXPLOSION;value.position=copy3(origin);if direction!=void then value.angles=copy3(direction);value.rotation=(randInt(state)%360)*1.0 end if end if
  value.oldPosition=copy3(value.position);return publish(state,value,retailActive)
end function

// CG_ObeliskExplode
/// @param state Shared client game effects state passed to the helper calls in `obeliskExplode`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param entityNum Entity number identifying a world or player entity.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function obeliskExplode(state,origin,entityNum,retailActive)
  raised=[origin[0],origin[1],origin[2]+64.0];value=makeExplosion(state,raised,[0.0,0.0,0.0],DISH_FLASH_MODEL,ROCKET_EXPLOSION_SHADER,600,true,retailActive);if value is error then return value end if;value.kind="obelisk-explode";value.entity=entityNum;value.light=300.0;value.lightColor=[1.0,0.75,0.0];return value
end function

/// Evaluates client game effects `variationSound` and returns `"sound/items/"+prefix+suffix` according to its guard/selection conditions.
/// @param prefix Value used by `return "sound/items/"+prefix+suffix`.
/// @param choice Value used by `if choice==2 then suffix="02.wav" else if choice==3 then suffix="03.wav" end if`.
function variationSound(prefix,choice)
  suffix="01.wav";if choice==2 then suffix="02.wav" else if choice==3 then suffix="03.wav" end if;return "sound/items/"+prefix+suffix
end function
/// Calls `mq3.client.cgame_effects.effect`, `mq3.client.cgame_effects.copy3`, `mq3.client.cgame_effects.publish` from client game effects `soundAction`. The final path returns `publish(state,value,retailActive)`.
/// @param state Shared client game effects state passed to the helper calls in `soundAction`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param sound Value assigned to `value.shader`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function soundAction(state,kind,origin,sound,retailActive)
  value=effect("audio",kind);value.position=copy3(origin);value.shader=sound;value.entity=ENTITYNUM_NONE;value.channel=CHAN_BODY;return publish(state,value,retailActive)
end function

// CG_ObeliskPain
/// @param state Shared client game effects state passed to the helper calls in `obeliskPain`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function obeliskPain(state,origin,retailActive)
  choice=randInt(state)&3;if choice<2 then choice=1 end if;return soundAction(state,"obelisk-pain",origin,variationSound("obelisk_hit_",choice),retailActive)
end function

// CG_InvulnerabilityImpact
/// @param state Record read through `state.time`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param angles Value used by `value.angles=copy3(angles)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function invulnerabilityImpact(state,origin,angles,retailActive)
  value=effect("render","invulnerability-impact");value.leType=LE_INVULIMPACT;value.startTime=state.time;value.endTime=state.time+1000;value.lifeRate=1.0/1000.0;value.color=white();value.reType=RT_MODEL;value.shaderTime=state.time/1000.0;value.model=INVUL_IMPACT_MODEL;value.position=copy3(origin);value.angles=copy3(angles);publish(state,value,retailActive)
  choice=randInt(state)&3;if choice<2 then choice=1 end if;soundAction(state,"invulnerability-impact-sound",origin,variationSound("invul_impact_",choice),retailActive);return value
end function

// CG_InvulnerabilityJuiced
/// @param state Record read through `state.time`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function invulnerabilityJuiced(state,origin,retailActive)
  value=effect("render","invulnerability-juiced");value.leType=LE_INVULJUICED;value.startTime=state.time;value.endTime=state.time+10000;value.lifeRate=1.0/10000.0;value.color=white();value.reType=RT_MODEL;value.shaderTime=state.time/1000.0;value.model=INVUL_JUICED_MODEL;value.position=copy3(origin);publish(state,value,retailActive);soundAction(state,"invulnerability-juiced-sound",origin,"sound/items/invul_juiced.wav",retailActive);return value
end function

// CG_ScorePlum
/// @param state Mutable client game effects record/storage; this routine assigns `state.lastScorePosition`.
/// @param client Value used by `if client!=state.predictedClient or not state.scorePlum then return void end if`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param score Value assigned to `value.radius`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function scorePlum(state,client,origin,score,retailActive)
  if client!=state.predictedClient or not state.scorePlum then return void end if
  value=effect("render","score-plum");value.leType=LE_SCOREPLUM;value.startTime=state.time;value.endTime=state.time+4000;value.lifeRate=1.0/4000.0;value.color=white();value.radius=score*1.0;value.position=copy3(origin);if origin[2]>=state.lastScorePosition[2]-20.0 and origin[2]<=state.lastScorePosition[2]+20.0 then value.position[2]=value.position[2]-20.0 end if;state.lastScorePosition=copy3(origin);value.reType=RT_SPRITE;return publish(state,value,retailActive)
end function

// CG_Bleed
/// @param state Record read through `state.blood`, `state.time`, `state.predictedClient`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param entityNum Entity number identifying a world or player entity.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function bleed(state,origin,entityNum,retailActive)
  if not state.blood then return void end if
  value=effect("render","bleed");value.leType=LE_EXPLOSION;value.startTime=state.time;value.endTime=state.time+500;value.position=copy3(origin);value.reType=RT_SPRITE;value.rotation=(randInt(state)%360)*1.0;value.radius=24.0;value.shader=BLOOD_EXPLOSION_SHADER;if entityNum==state.predictedClient then value.renderfx=value.renderfx|RF_THIRD_PERSON end if;return publish(state,value,retailActive)
end function

/// Calls `mq3.client.cgame_effects.effect`, `mq3.compat.numeric.trunc32`, `mq3.client.cgame_effects.randomFloat` and additional helpers from client game effects `fragment`. The final path returns `publish(state,value,retailActive)`.
/// @param state Record read through `state.time`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param velocity Velocity vector used to advance or orient the effect.
/// @param model Value assigned to `value.model`.
/// @param duration Lifetime or interval in the same units as this operation's clock.
/// @param spread Value used by `value.endTime=state.time+duration+n.trunc32(randomFloat(state)*spread)`.
/// @param bounce Value assigned to `value.bounceFactor`.
/// @param bounceSound Value assigned to `value.bounceSound`.
/// @param markType Value assigned to `value.markType`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function fragment(state,kind,origin,velocity,model,duration,spread,bounce,bounceSound,markType,retailActive)
  value=effect("render",kind);value.leType=LE_FRAGMENT;value.trajectoryType=TR_GRAVITY;value.startTime=state.time;value.endTime=state.time+duration+n.trunc32(randomFloat(state)*spread);value.position=copy3(origin);value.velocity=copy3(velocity);value.model=model;value.bounceFactor=bounce;value.bounceSound=bounceSound;value.markType=markType;return publish(state,value,retailActive)
end function

// CG_LaunchGib
/// @param state Argument 1 of `mq3.client.cgame_effects.fragment`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_effects.fragment`.
/// @param velocity Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_effects.fragment`.
/// @param model Argument 5 of `mq3.client.cgame_effects.fragment`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_effects.fragment`.
function launchGib(state,origin,velocity,model,retailActive) return fragment(state,"gib",origin,velocity,model,5000,3000.0,0.6,LEBS_BLOOD,LEMT_BLOOD,retailActive) end function
// CG_LaunchExplode
/// @param state Argument 1 of `mq3.client.cgame_effects.fragment`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_effects.fragment`.
/// @param velocity Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_effects.fragment`.
/// @param model Argument 5 of `mq3.client.cgame_effects.fragment`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_effects.fragment`.
function launchExplode(state,origin,velocity,model,retailActive) return fragment(state,"explode-fragment",origin,velocity,model,10000,6000.0,0.1,LEBS_BRASS,LEMT_NONE,retailActive) end function

/// Builds the client game effects `gibVelocity` sequence from `[crandom(state)*horizontal,crandom(state)*horizontal,jump+crandom(state)*horizontal]`.
/// @param state Shared client game effects state passed to the helper calls in `gibVelocity`.
/// @param horizontal Whether the control/operation uses horizontal rather than vertical layout.
/// @param jump Value used by `return [crandom(state)*horizontal,crandom(state)*horizontal,jump+crandom(state)*horizontal]`.
function gibVelocity(state,horizontal,jump) return [crandom(state)*horizontal,crandom(state)*horizontal,jump+crandom(state)*horizontal] end function

// CG_GibPlayer
/// @param state Record read through `state.blood`, `state.gibs`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function gibPlayer(state,origin,retailActive)
  if not state.blood then return [] end if;result=[];velocity=gibVelocity(state,250.0,250.0);model="models/gibs/brain.md3";if (randInt(state)&1)!=0 then model="models/gibs/skull.md3" end if;result=result+[launchGib(state,origin,velocity,model,retailActive)]
  if not state.gibs then return result end if
  models=["models/gibs/abdomen.md3","models/gibs/arm.md3","models/gibs/chest.md3","models/gibs/fist.md3","models/gibs/foot.md3","models/gibs/forearm.md3","models/gibs/intestine.md3","models/gibs/leg.md3","models/gibs/leg.md3"]
  for each name in models result=result+[launchGib(state,origin,gibVelocity(state,250.0,250.0),name,retailActive)] end for;return result
end function

// CG_BigExplode
/// @param state Record read through `state.blood`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function bigExplode(state,origin,retailActive)
  if not state.blood then return [] end if;result=[];scales=[1.0,1.0,1.5,2.0,2.5]
  for each scale in scales velocity=[crandom(state)*100.0*scale,crandom(state)*100.0*scale,150.0+crandom(state)*100.0];result=result+[launchExplode(state,origin,velocity,SMOKE2_MODEL,retailActive)] end for;return result
end function
