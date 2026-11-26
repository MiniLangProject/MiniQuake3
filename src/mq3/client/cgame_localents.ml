// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/cgame/cg_localents.c. Renderer, audio and mark
// calls are typed boundary actions; the retail cgame QVM remains their owner
// while it is active, which prevents duplicate presentation effects.
package mq3.client.cgame_localents
import mq3.client.cg_local as cgabi
import mq3.game.trajectory as trajectory
import mq3.shared.math as qmath
import mq3.compat.numeric as n
import mq3.compat.transcendental as trans

/// Capacity limit for the local entities collection or bounded storage used by this client module.
const MAX_LOCAL_ENTITIES=512
/// Duration in milliseconds over which an expiring local entity sinks away.
const SINK_TIME=cgabi.SINK_TIME
/// Collision-content bit identifying nodrop volumes or surfaces during client traces.
const CONTENTS_NODROP=0x80000000
/// Trajectory kind whose position remains at its stored base value.
const TR_STATIONARY=0
/// Renderer-entity type selecting the sprite primitive.
const RT_SPRITE=2
/// Renderer flag that samples lighting at the entity's explicit lighting-origin position.
const RF_LIGHTING_ORIGIN=0x80
/// Local-effect entity kind selecting a persistent impact decal.
const LE_MARK=cgabi.LE_MARK
/// Local-effect entity kind selecting a model-based explosion.
const LE_EXPLOSION=cgabi.LE_EXPLOSION
/// Local-effect entity kind selecting a sprite-based explosion.
const LE_SPRITE_EXPLOSION=cgabi.LE_SPRITE_EXPLOSION
/// Local-effect entity kind selecting a moving fragment with collision and bounce handling.
const LE_FRAGMENT=cgabi.LE_FRAGMENT
/// Local-effect entity kind selecting an effect that moves, scales, and fades over its lifetime.
const LE_MOVE_SCALE_FADE=cgabi.LE_MOVE_SCALE_FADE
/// Local-effect entity kind selecting an effect that falls while scaling and fading.
const LE_FALL_SCALE_FADE=cgabi.LE_FALL_SCALE_FADE
/// Local-effect entity kind selecting an effect that fades its RGB color components.
const LE_FADE_RGB=cgabi.LE_FADE_RGB
/// Local-effect entity kind selecting an effect that scales and fades in place.
const LE_SCALE_FADE=cgabi.LE_SCALE_FADE
/// Local-effect entity kind selecting a floating score indicator.
const LE_SCOREPLUM=cgabi.LE_SCOREPLUM
/// Local-effect entity kind selecting the Missionpack kamikaze explosion sequence.
const LE_KAMIKAZE=cgabi.LE_KAMIKAZE
/// Local-effect entity kind selecting an impact against the invulnerability shield.
const LE_INVULIMPACT=cgabi.LE_INVULIMPACT
/// Local-effect entity kind selecting the invulnerability elimination effect.
const LE_INVULJUICED=cgabi.LE_INVULJUICED
/// Local-effect entity kind selecting a renderer entity displayed without another local-effect update
/// mode.
const LE_SHOWREFENTITY=cgabi.LE_SHOWREFENTITY
/// Local-effect flag controlling the puff dont scale behavior of the temporary entity.
const LEF_PUFF_DONT_SCALE=cgabi.LEF_PUFF_DONT_SCALE
/// Local-effect flag controlling the tumble behavior of the temporary entity.
const LEF_TUMBLE=cgabi.LEF_TUMBLE
/// Local-effect flag controlling the sound1 behavior of the temporary entity.
const LEF_SOUND1=cgabi.LEF_SOUND1
/// Local-effect flag controlling the sound2 behavior of the temporary entity.
const LEF_SOUND2=cgabi.LEF_SOUND2
/// Local-fragment impact-decal kind selecting none marks.
const LEMT_NONE=cgabi.LEMT_NONE
/// Local-fragment impact-decal kind selecting burn marks.
const LEMT_BURN=cgabi.LEMT_BURN
/// Local-fragment impact-decal kind selecting blood marks.
const LEMT_BLOOD=cgabi.LEMT_BLOOD
/// Local-fragment bounce-sound kind selecting none impact feedback.
const LEBS_NONE=cgabi.LEBS_NONE
/// Local-fragment bounce-sound kind selecting blood impact feedback.
const LEBS_BLOOD=cgabi.LEBS_BLOOD
/// Local-fragment bounce-sound kind selecting brass impact feedback.
const LEBS_BRASS=cgabi.LEBS_BRASS
/// World-space digit size used by floating score indicators.
const NUMBER_SIZE=8
/// Kamikaze-effect phase timing for shockwave starttime, measured from effect start in milliseconds.
const KAMI_SHOCKWAVE_STARTTIME=0
/// Kamikaze-effect phase timing for shockwavefade starttime, measured from effect start in
/// milliseconds.
const KAMI_SHOCKWAVEFADE_STARTTIME=1500
/// Kamikaze-effect phase timing for shockwave endtime, measured from effect start in milliseconds.
const KAMI_SHOCKWAVE_ENDTIME=2000
/// Kamikaze-effect phase timing for explode starttime, measured from effect start in milliseconds.
const KAMI_EXPLODE_STARTTIME=250
/// Kamikaze-effect phase timing for implode starttime, measured from effect start in milliseconds.
const KAMI_IMPLODE_STARTTIME=2000
/// Kamikaze-effect phase timing for implode endtime, measured from effect start in milliseconds.
const KAMI_IMPLODE_ENDTIME=2250
/// Kamikaze-effect phase timing for shockwave2 starttime, measured from effect start in milliseconds.
const KAMI_SHOCKWAVE2_STARTTIME=2000
/// Kamikaze-effect phase timing for shockwave2 fade starttime, measured from effect start in
/// milliseconds.
const KAMI_SHOCKWAVE2FADE_STARTTIME=2500
/// Kamikaze-effect phase timing for shockwave2 endtime, measured from effect start in milliseconds.
const KAMI_SHOCKWAVE2_ENDTIME=3000
/// Kamikaze-effect radius parameter for shockwavemodel geometry, in world units.
const KAMI_SHOCKWAVEMODEL_RADIUS=88.0
/// Kamikaze-effect radius parameter for boomspheremodel geometry, in world units.
const KAMI_BOOMSPHEREMODEL_RADIUS=72.0
/// Kamikaze-effect radius parameter for shockwave ma geometry, in world units.
const KAMI_SHOCKWAVE_MAXRADIUS=1320.0
/// Kamikaze-effect radius parameter for boomsphere ma geometry, in world units.
const KAMI_BOOMSPHERE_MAXRADIUS=720.0
/// Kamikaze-effect radius parameter for shockwave2 ma geometry, in world units.
const KAMI_SHOCKWAVE2_MAXRADIUS=704.0

/// Stores client game localents ref entity record, including `reType`, `origin`, `lightingOrigin`, `axis`, `shaderRGBA`, `radius` and additional values.
struct RefEntity
  /// When constructing this record, `newRefEntity` supplies `0` for this member.
  reType
  /// Current renderer-facing position of a local fragment, sprite, or other temporary effect.
  origin
  /// When constructing this record, `newRefEntity` supplies `[0.0,0.0,0.0]` for this member. Used by
  /// `addFragment` during subsequent processing.
  lightingOrigin
  /// Three orientation basis vectors used to transform the rendered object.
  axis
  /// When constructing this record, `newRefEntity` supplies `[255,255,255,255]` for this member. Used
  /// by `addFragment` and `addFadeRGB` during subsequent processing.
  shaderRGBA
  /// Current world-space sprite radius submitted for a temporary local effect.
  radius
  /// Model resource selected for the h presentation.
  hModel
  /// Shader resource selected for custom rendering.
  customShader
  /// When constructing this record, `newRefEntity` supplies `0.0` for this member.
  shaderTime
  /// Renderer-entity flags controlling lighting, view restrictions, depth handling, and related
  /// effects.
  renderfx
  /// When constructing this record, `newRefEntity` supplies `false` for this member.
  nonNormalizedAxes
end struct
/// Stores client game localents local entity record, including `id`, `active`, `leType`, `leFlags`, `startTime`, `endTime` and additional values.
struct LocalEntity
  /// Stable effect identifier used to track or replace this projectile, particle, or mark.
  id
  /// When constructing this record, `newLocalEntity` supplies `false` for this member.
  active
  /// Local-effect entity kind selecting its update and rendering behavior.
  leType
  /// Local-effect flags controlling fading, scaling, tumbling, or sound behavior.
  leFlags
  /// When constructing this record, `newLocalEntity` supplies `0` for this member.
  startTime
  /// When constructing this record, `newLocalEntity` supplies `0` for this member.
  endTime
  /// When constructing this record, `newLocalEntity` supplies `0` for this member.
  fadeInTime
  /// Reciprocal effect lifetime used to normalize the fade or growth fraction.
  lifeRate
  /// When constructing this record, `newLocalEntity` supplies `newTrajectory()` for this member.
  pos
  /// Euler orientation used to place or animate the object.
  angles
  /// Velocity multiplier after an impact; zero stops the fragment and one preserves its speed.
  bounceFactor
  /// Normalized RGBA base color used to compute the temporary effect fade.
  color
  /// Base world-space effect radius used when computing temporary sprite growth.
  radius
  /// Dynamic-light intensity emitted by the local effect.
  light
  /// RGB components of the dynamic light emitted by the effect.
  lightColor
  /// Decal category to leave when an effect fragment strikes a surface.
  leMarkType
  /// Impact-sound category used when an effect fragment bounces.
  leBounceSoundType
  /// Renderer-facing entity description submitted for this local effect.
  refEntity
end struct
/// Stores client game localents queued engine action, including `boundary`, `kind`, `entity`, `origin`, `normal`, `scalar` and additional values.
struct Action
  /// Host service category recorded with a request emitted while advancing temporary fragments, puffs,
  /// marks, and other local effects.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while advancing temporary
  /// fragments, puffs, marks, and other local effects.
  kind
  /// When constructing this record, `boundary` supplies `le.id` for this member.
  entity
  /// World-space location at which the local-entity update requests a render, mark, or sound effect.
  origin
  /// Collision-surface normal supplied when a local effect requests a blood or burn mark.
  normal
  /// When constructing this record, `boundary` supplies `scalar` for this member.
  scalar
  /// Color payload of the local-effect host action, such as faded shader RGBA or light RGB.
  color
  /// When constructing this record, `boundary` supplies `data` for this member.
  data
  /// True when this request is marked for native dispatch while advancing temporary fragments, puffs,
  /// marks, and other local effects; false when its native effect is suppressed.
  dispatched
end struct
/// Stores client game localents host-service callbacks, including `traceFn`, `pointContentsFn`, `randomFn`, `context`.
struct Services
  /// Host callback for the trace operation; an unset callback leaves that host operation unavailable.
  traceFn
  /// Host callback for the point contents operation; an unset callback leaves that host operation
  /// unavailable.
  pointContentsFn
  /// Host callback for the random operation; an unset callback leaves that host operation unavailable.
  randomFn
  /// Caller-supplied value forwarded unchanged to the service callbacks for short-lived client effect
  /// entities.
  context
end struct
/// Stores client game localents state, including `entities`, `free`, `active`, `time`, `frametime`, `vieworg` and additional values.
struct State
  /// Entity-state or renderer-entity entries represented by the current snapshot or scene.
  entities
  /// When constructing this record, `initLocalEntities` supplies `free` for this member. Used by
  /// `freeLocalEntity` and `allocLocalEntity` during subsequent processing.
  free
  /// When constructing this record, `initLocalEntities` supplies an empty list for this member.
  active
  /// Current client-game time in milliseconds used to update, fade, and expire local entities.
  time
  /// Elapsed client time in milliseconds since the preceding frame.
  frametime
  /// When constructing this record, `initLocalEntities` supplies `[0.0,0.0,0.0]` for this member. Used
  /// by `nearView` and `addScorePlum` during subsequent processing.
  vieworg
  /// True when the retail QVM owns short-lived client effect entities, so the native observer records
  /// requests without emitting duplicate host effects.
  retailActive
  /// Service callbacks and context used to access the host engine from this client subsystem.
  services
  /// Host requests queued while advancing temporary fragments, puffs, marks, and other local effects,
  /// retained in request order.
  actions
  /// When constructing this record, `initLocalEntities` supplies `0` for this member. Used by
  /// `boundary` and `clearBoundaryActions` during subsequent processing.
  rendered
  /// When constructing this record, `initLocalEntities` supplies `0` for this member. Used by
  /// `boundary` and `clearBoundaryActions` during subsequent processing.
  audio
  /// When constructing this record, `initLocalEntities` supplies `0` for this member. Used by
  /// `boundary` and `clearBoundaryActions` during subsequent processing.
  marks
  /// When constructing this record, `initLocalEntities` supplies `0` for this member. Used by
  /// `allocLocalEntity` during subsequent processing.
  spawned
  /// When constructing this record, `initLocalEntities` supplies `0` for this member. Used by
  /// `freeLocalEntity` during subsequent processing.
  freed
  /// Diagnostic messages collected while parsing or processing the input.
  errors
end struct

/// Creates the three orthonormal unit axes used as the identity orientation in client game localents.
function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
/// Creates a `mq3.client.cgame_localents.RefEntity` record. Initializes the record with the defaults written in this constructor.
function newRefEntity() return RefEntity(0,[0.0,0.0,0.0],[0.0,0.0,0.0],identityAxis(),[255,255,255,255],0.0,0,0,0.0,0,false) end function
/// Adapts `mq3.game.trajectory.Trajectory` to client game localents `newTrajectory`, returning its result for `TR_STATIONARY, 0, 0, [0.0,0.0,0.0], [0.0,0.0,0.0]`.
function newTrajectory() return trajectory.Trajectory(TR_STATIONARY,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
/// Creates a `mq3.client.cgame_localents.LocalEntity` record. Assigns `id` from `id`.
/// @param id Value used to initialize `LocalEntity.id`.
function newLocalEntity(id) return LocalEntity(id,false,LE_MARK,0,0,0,0,0.0,newTrajectory(),newTrajectory(),0.0,[0.0,0.0,0.0,0.0],0.0,0.0,[0.0,0.0,0.0],LEMT_NONE,LEBS_NONE,newRefEntity()) end function
/// Reads `void` for client game localents `defaultTrace`.
/// @param context Accepted for compatibility with `defaultTrace`; the current implementation does not read it.
/// @param start Accepted for compatibility with `defaultTrace`; the current implementation does not read it.
/// @param finish Accepted for compatibility with `defaultTrace`; the current implementation does not read it.
function defaultTrace(context,start,finish) return void end function
/// Returns the fixed `0` value for client game localents `defaultPointContents`.
/// @param context Accepted for compatibility with `defaultPointContents`; the current implementation does not read it.
/// @param point Accepted for compatibility with `defaultPointContents`; the current implementation does not read it.
function defaultPointContents(context,point) return 0 end function
/// Returns the fixed `0` value for client game localents `defaultRandom`.
/// @param context Accepted for compatibility with `defaultRandom`; the current implementation does not read it.
function defaultRandom(context) return 0 end function
/// Creates a `mq3.client.cgame_localents.Services` record. Initializes the record with the defaults written in this constructor.
function defaultServices() return Services(defaultTrace,defaultPointContents,defaultRandom,void) end function

// CG_InitLocalEntities
/// @param services services record passed to the client game localents helper calls.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function initLocalEntities(services,retailActive)
  if services==void then services=defaultServices() end if
  entities=[];free=[];for index=0 to MAX_LOCAL_ENTITIES-1 entities=entities+[newLocalEntity(index)];free=free+[index] end for
  return State(entities,free,[],0,0,[0.0,0.0,0.0],retailActive,services,[],0,0,0,0,0,[])
end function

/// Updates `le.active`, `le.leType`, `le.leFlags`, `le.startTime` and additional values during client game localents `resetLocalEntity`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.active`, `le.leType`, `le.leFlags`, `le.startTime` and additional values.
function resetLocalEntity(le)
  id=le.id;fresh=newLocalEntity(id);le.active=fresh.active;le.leType=fresh.leType;le.leFlags=fresh.leFlags;le.startTime=0;le.endTime=0;le.fadeInTime=0;le.lifeRate=0.0;le.pos=fresh.pos;le.angles=fresh.angles;le.bounceFactor=0.0;le.color=fresh.color;le.radius=0.0;le.light=0.0;le.lightColor=fresh.lightColor;le.leMarkType=LEMT_NONE;le.leBounceSoundType=LEBS_NONE;le.refEntity=fresh.refEntity;return le
end function

// CG_FreeLocalEntity
/// @param state Mutable client game localents record/storage; this routine assigns `state.errors`, `state.active`, `state.free`, `state.freed`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.active`.
function freeLocalEntity(state,le)
  if le==void or not le.active then state.errors=state.errors+["CG_FreeLocalEntity: not active"];return false end if
  kept=[];for each id in state.active if id!=le.id then kept=kept+[id] end if end for;state.active=kept;le.active=false;state.free=[le.id]+state.free;state.freed=state.freed+1;return true
end function

// CG_AllocLocalEntity
/// @param state Mutable client game localents record/storage; this routine assigns `state.free`, `state.active`, `state.spawned`.
function allocLocalEntity(state)
  if len(state.free)==0 then freeLocalEntity(state,state.entities[state.active[len(state.active)-1]]) end if
  id=state.free[0];rest=[];if len(state.free)>1 then for index=1 to len(state.free)-1 rest=rest+[state.free[index]] end for end if;state.free=rest
  le=resetLocalEntity(state.entities[id]);le.active=true;state.active=[id]+state.active;state.spawned=state.spawned+1;return le
end function

/// Updates `state.actions`, `state.rendered`, `state.audio`, `state.marks` during client game localents `boundary`.
/// @param state Mutable client game localents record/storage; this routine assigns `state.actions`, `state.rendered`, `state.audio`, `state.marks`.
/// @param boundaryName Value used by `item=Action(boundaryName,kind,le.id,origin,normal,scalar,color,data,not state.retailActive)`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.id`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param normal Surface-normal vector used to orient or offset the effect.
/// @param scalar Value used by `item=Action(boundaryName,kind,le.id,origin,normal,scalar,color,data,not state.retailActive)`.
/// @param color Color value used by the client game localents drawing or interpolation operation.
/// @param data Value used by `item=Action(boundaryName,kind,le.id,origin,normal,scalar,color,data,not state.retailActive)`.
function boundary(state,boundaryName,kind,le,origin,normal,scalar,color,data)
  item=Action(boundaryName,kind,le.id,origin,normal,scalar,color,data,not state.retailActive);state.actions=state.actions+[item]
  if boundaryName=="render" then state.rendered=state.rendered+1 else if boundaryName=="audio" then state.audio=state.audio+1 else if boundaryName=="mark" then state.marks=state.marks+1 end if;return item
end function
/// Adapts `mq3.client.cgame_localents.boundary` to client game localents `render`, returning its result for `state, "render", kind, le, origin, void, scalar, color, data`.
/// @param state Argument 1 of `mq3.client.cgame_localents.boundary`.
/// @param kind Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_localents.boundary`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Forwarded to `mq3.client.cgame_localents.boundary`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_localents.boundary`.
/// @param scalar Argument 7 of `mq3.client.cgame_localents.boundary`.
/// @param color Argument 8 of `mq3.client.cgame_localents.boundary`.
/// @param data Argument 9 of `mq3.client.cgame_localents.boundary`.
function render(state,kind,le,origin,scalar,color,data) return boundary(state,"render",kind,le,origin,void,scalar,color,data) end function
/// Adapts `mq3.client.cgame_localents.boundary` to client game localents `sound`, returning its result for `state, "audio", kind, le, origin, void, 0.0, void, data`.
/// @param state Argument 1 of `mq3.client.cgame_localents.boundary`.
/// @param kind Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_localents.boundary`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Forwarded to `mq3.client.cgame_localents.boundary`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_localents.boundary`.
/// @param data Argument 9 of `mq3.client.cgame_localents.boundary`.
function sound(state,kind,le,origin,data) return boundary(state,"audio",kind,le,origin,void,0.0,void,data) end function
/// Adapts `mq3.client.cgame_localents.boundary` to client game localents `mark`, returning its result for `state, "mark", kind, le, origin, normal, scalar, void, orientation`.
/// @param state Argument 1 of `mq3.client.cgame_localents.boundary`.
/// @param kind Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_localents.boundary`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Forwarded to `mq3.client.cgame_localents.boundary`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_localents.boundary`.
/// @param normal Surface-normal vector used to orient or offset the effect. Forwarded to `mq3.client.cgame_localents.boundary`.
/// @param scalar Argument 7 of `mq3.client.cgame_localents.boundary`.
/// @param orientation Argument 9 of `mq3.client.cgame_localents.boundary`.
function mark(state,kind,le,origin,normal,scalar,orientation) return boundary(state,"mark",kind,le,origin,normal,scalar,void,orientation) end function

// CG_BloodTrail (the ledger's spurious `way` candidate comes from this routine's prose).
/// @param state Record read through `state.time`, `state.frametime`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.pos`.
function bloodTrail(state,le)
  step=150;t=step*n.trunc32((state.time-state.frametime+step)/step);t2=step*n.trunc32(state.time/step);created=0
  while t<=t2
    origin=trajectory.evaluate(le.pos,t);blood=allocLocalEntity(state);blood.leType=LE_FALL_SCALE_FADE;blood.startTime=t;blood.endTime=t+2000;blood.lifeRate=1.0/2000.0;blood.radius=20.0;blood.color=[1.0,1.0,1.0,1.0];blood.pos.trType=2;blood.pos.trBase=origin;blood.pos.trDelta[2]=40.0;blood.refEntity.origin=[origin[0],origin[1],origin[2]];blood.refEntity.radius=20.0;created=created+1;t=t+step
  end while;return created
end function

// CG_FragmentBounceMark
/// @param state Record read through `state.services.randomFn`, `state.services.context`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.leMarkType`.
/// @param trace Record read through `trace.endpos`, `trace.normal`.
function fragmentBounceMark(state,le,trace)
  if le.leMarkType==LEMT_BLOOD then radius=16+(state.services.randomFn(state.services.context)&31);orientation=(state.services.randomFn(state.services.context)&0x7fff)*360.0/32767.0;mark(state,"blood",le,trace.endpos,trace.normal,radius,orientation)
  else if le.leMarkType==LEMT_BURN then radius=8+(state.services.randomFn(state.services.context)&15);orientation=(state.services.randomFn(state.services.context)&0x7fff)*360.0/32767.0;mark(state,"burn",le,trace.endpos,trace.normal,radius,orientation) end if
  le.leMarkType=LEMT_NONE;return void
end function

// CG_FragmentBounceSound
/// @param state Record read through `state.services.randomFn`, `state.services.context`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.leBounceSoundType`.
/// @param trace Record read through `trace.endpos`.
function fragmentBounceSound(state,le,trace)
  if le.leBounceSoundType==LEBS_BLOOD and (state.services.randomFn(state.services.context)&1)!=0 then choice=state.services.randomFn(state.services.context)&3;if choice>2 then choice=2 end if;sound(state,"gib-bounce-"+str(choice+1),le,trace.endpos,choice) end if
  le.leBounceSoundType=LEBS_NONE;return void
end function

// CG_ReflectVelocity
/// @param state Record read through `state.time`, `state.frametime`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.pos.trDelta`, `le.pos.trBase`, `le.pos.trTime`, `le.pos.trType`.
/// @param trace Record read through `trace.fraction`, `trace.normal`, `trace.endpos`, `trace.allsolid`.
function reflectVelocity(state,le,trace)
  hitTime=state.time-state.frametime+state.frametime*trace.fraction;velocity=trajectory.evaluateDelta(le.pos,hitTime);dot=qmath.DotProduct(velocity,trace.normal);le.pos.trDelta=qmath.VectorScale(qmath.VectorMA(velocity,-2.0*dot,trace.normal),le.bounceFactor);le.pos.trBase=[trace.endpos[0],trace.endpos[1],trace.endpos[2]];le.pos.trTime=state.time
  if trace.allsolid or (trace.normal[2]>0.0 and (le.pos.trDelta[2]<40.0 or le.pos.trDelta[2]< -state.frametime*le.pos.trDelta[2])) then le.pos.trType=TR_STATIONARY end if;return le.pos.trDelta
end function

/// Calls `mq3.shared.math.AngleVectors`, `mq3.shared.math.VectorScale` from client game localents `anglesToAxis`. The final path returns `[basis[0],qmath.VectorScale(basis[1],-1.0),basis[2]]`.
/// @param angles Value used by `basis=qmath.AngleVectors(angles)`.
function anglesToAxis(angles) basis=qmath.AngleVectors(angles);return [basis[0],qmath.VectorScale(basis[1],-1.0),basis[2]] end function

// CG_AddFragment
/// @param state Record read through `state.time`, `state.services.traceFn`, `state.services.context`, `state.services.pointContentsFn`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.refEntity.lightingOrigin`, `le.refEntity.renderfx`, `le.refEntity.origin`, `le.refEntity.axis`.
function addFragment(state,le)
  if le.pos.trType==TR_STATIONARY then
    remaining=le.endTime-state.time;origin=[le.refEntity.origin[0],le.refEntity.origin[1],le.refEntity.origin[2]]
    if remaining<SINK_TIME then le.refEntity.lightingOrigin=origin;le.refEntity.renderfx=le.refEntity.renderfx|RF_LIGHTING_ORIGIN;origin[2]=origin[2]-16.0*(1.0-remaining/SINK_TIME) end if
    render(state,"fragment",le,origin,le.refEntity.radius,le.refEntity.shaderRGBA,void);return void
  end if
  newOrigin=trajectory.evaluate(le.pos,state.time);trace=state.services.traceFn(state.services.context,le.refEntity.origin,newOrigin)
  if trace==void then le.refEntity.origin=newOrigin;render(state,"fragment",le,newOrigin,le.refEntity.radius,le.refEntity.shaderRGBA,void);return void end if
  if trace.fraction==1.0 then le.refEntity.origin=newOrigin;if (le.leFlags&LEF_TUMBLE)!=0 then le.refEntity.axis=anglesToAxis(trajectory.evaluate(le.angles,state.time)) end if;render(state,"fragment",le,newOrigin,le.refEntity.radius,le.refEntity.shaderRGBA,void);if le.leBounceSoundType==LEBS_BLOOD then bloodTrail(state,le) end if;return void end if
  if (state.services.pointContentsFn(state.services.context,trace.endpos)&CONTENTS_NODROP)!=0 then freeLocalEntity(state,le);return void end if
  fragmentBounceMark(state,le,trace);fragmentBounceSound(state,le,trace);reflectVelocity(state,le,trace);render(state,"fragment",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void);return void
end function

/// Computes `(le.endTime-state.time)*le.lifeRate` for client game localents `remainingFraction`.
/// @param state Record read through `state.time`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.endTime`, `le.lifeRate`.
function remainingFraction(state,le) return (le.endTime-state.time)*le.lifeRate end function
/// Calls `mq3.shared.math.VectorLength` from client game localents `nearView`. The final path returns `qmath.VectorLength(delta)<radius`.
/// @param state Record read through `state.vieworg`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param radius Radius used by the spatial or visual calculation.
function nearView(state,origin,radius) delta=[origin[0]-state.vieworg[0],origin[1]-state.vieworg[1],origin[2]-state.vieworg[2]];return qmath.VectorLength(delta)<radius end function

// CG_AddFadeRGB
/// @param state Shared client game localents state passed to the helper calls in `addFadeRGB`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.refEntity.shaderRGBA`.
function addFadeRGB(state,le) c=remainingFraction(state,le)*255.0;le.refEntity.shaderRGBA=[n.trunc32(le.color[0]*c),n.trunc32(le.color[1]*c),n.trunc32(le.color[2]*c),n.trunc32(le.color[3]*c)];return render(state,"fade-rgb",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end function

// CG_AddMoveScaleFade
/// @param state Record read through `state.time`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.refEntity.shaderRGBA[3]`, `le.refEntity.radius`, `le.refEntity.origin`.
function addMoveScaleFade(state,le)
  c=0.0
  if le.fadeInTime>le.startTime and state.time<le.fadeInTime then c=1.0-(le.fadeInTime-state.time)/(le.fadeInTime-le.startTime) else c=remainingFraction(state,le) end if
  le.refEntity.shaderRGBA[3]=n.trunc32(255.0*c*le.color[3]);if (le.leFlags&LEF_PUFF_DONT_SCALE)==0 then le.refEntity.radius=le.radius*(1.0-c)+8.0 end if;le.refEntity.origin=trajectory.evaluate(le.pos,state.time)
  if nearView(state,le.refEntity.origin,le.radius) then freeLocalEntity(state,le);return void end if;return render(state,"move-scale-fade",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void)
end function

// CG_AddScaleFade
/// @param state Shared client game localents state passed to the helper calls in `addScaleFade`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.refEntity.shaderRGBA[3]`, `le.refEntity.radius`.
function addScaleFade(state,le) c=remainingFraction(state,le);le.refEntity.shaderRGBA[3]=n.trunc32(255.0*c*le.color[3]);le.refEntity.radius=le.radius*(1.0-c)+8.0;if nearView(state,le.refEntity.origin,le.radius) then freeLocalEntity(state,le);return void end if;return render(state,"scale-fade",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end function

// CG_AddFallScaleFade
/// @param state Shared client game localents state passed to the helper calls in `addFallScaleFade`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.refEntity.shaderRGBA[3]`, `le.refEntity.origin[2]`, `le.refEntity.radius`.
function addFallScaleFade(state,le) c=remainingFraction(state,le);le.refEntity.shaderRGBA[3]=n.trunc32(255.0*c*le.color[3]);le.refEntity.origin[2]=le.pos.trBase[2]-(1.0-c)*le.pos.trDelta[2];le.refEntity.radius=le.radius*(1.0-c)+16.0;if nearView(state,le.refEntity.origin,le.radius) then freeLocalEntity(state,le);return void end if;return render(state,"fall-scale-fade",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end function

/// Calls `mq3.client.cgame_localents.render` from client game localents `dynamicLight`. The final path returns `render(state,"dynamic-light",le,origin,intensity,le.lightColor,void)`.
/// @param state Shared client game localents state passed to the helper calls in `dynamicLight`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.light`, `le.lightColor`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param progress Value used by `if progress<0.5 then intensity=le.light else intensity=le.light*(1.0-(progress-0.5)*2.0) end if`.
function dynamicLight(state,le,origin,progress)
  if le.light==0.0 then return void end if;intensity=0.0;if progress<0.5 then intensity=le.light else intensity=le.light*(1.0-(progress-0.5)*2.0) end if;return render(state,"dynamic-light",le,origin,intensity,le.lightColor,void)
end function

// CG_AddExplosion
/// @param state Record read through `state.time`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.refEntity.origin`, `le.refEntity.radius`, `le.refEntity.shaderRGBA`, `le.startTime` and additional values.
function addExplosion(state,le) render(state,"explosion",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void);progress=(state.time-le.startTime)/(le.endTime-le.startTime);dynamicLight(state,le,le.refEntity.origin,progress);return void end function

// CG_AddSpriteExplosion
/// @param state Record read through `state.time`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.endTime`, `le.startTime`, `le.refEntity.origin`.
function addSpriteExplosion(state,le)
  c=(le.endTime-state.time)/(le.endTime-le.startTime);if c>1.0 then c=1.0 end if;color=[255,255,255,n.trunc32(255.0*c*0.33)];radius=42.0*(1.0-c)+30.0;render(state,"sprite-explosion",le,le.refEntity.origin,radius,color,RT_SPRITE);progress=(state.time-le.startTime)/(le.endTime-le.startTime);dynamicLight(state,le,le.refEntity.origin,progress);return void
end function

/// Calls `mq3.client.cgame_localents.anglesToAxis`, `mq3.client.cgame_localents.render` from client game localents `kamiWave`. The final path returns `render(state,kind,le,le.refEntity.origin,scale,[color,color,color,color],axis)`.
/// @param state Shared client game localents state passed to the helper calls in `kamiWave`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.refEntity.origin`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param t Value tested by `t>fadeTime` before the calculation continues.
/// @param startTime Value used by `c=(t-startTime)/(endTime-startTime)`.
/// @param fadeTime Value used by `if t>fadeTime then color=255.0*(1.0-(t-fadeTime)/(endTime-fadeTime)) end if`.
/// @param endTime Value used by `c=(t-startTime)/(endTime-startTime)`.
/// @param maxRadius Value used by `scale=c*maxRadius/KAMI_SHOCKWAVEMODEL_RADIUS`.
/// @param angles Value used by `axis=anglesToAxis(angles)`.
function kamiWave(state,le,kind,t,startTime,fadeTime,endTime,maxRadius,angles)
  axis=anglesToAxis(angles);c=(t-startTime)/(endTime-startTime);scale=c*maxRadius/KAMI_SHOCKWAVEMODEL_RADIUS;color=255.0;if t>fadeTime then color=255.0*(1.0-(t-fadeTime)/(endTime-fadeTime)) end if;return render(state,kind,le,le.refEntity.origin,scale,[color,color,color,color],axis)
end function

// CG_AddKamikaze
/// @param state Record read through `state.time`, `state.services.randomFn`, `state.services.context`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.leFlags`, `le.refEntity.shaderRGBA`, `le.angles.trBase`.
function addKamikaze(state,le)
  t=state.time-le.startTime;c=0.0
  if t>KAMI_SHOCKWAVE_STARTTIME and t<KAMI_SHOCKWAVE_ENDTIME then if (le.leFlags&LEF_SOUND1)==0 then sound(state,"kamikaze-explode",le,le.refEntity.origin,0);le.leFlags=le.leFlags|LEF_SOUND1 end if;kamiWave(state,le,"kamikaze-wave-1",t,KAMI_SHOCKWAVE_STARTTIME,KAMI_SHOCKWAVEFADE_STARTTIME,KAMI_SHOCKWAVE_ENDTIME,KAMI_SHOCKWAVE_MAXRADIUS,[0.0,0.0,0.0]) end if
  if t>KAMI_EXPLODE_STARTTIME and t<KAMI_IMPLODE_ENDTIME then
    if t<KAMI_IMPLODE_STARTTIME then
      c=(t-KAMI_EXPLODE_STARTTIME)/(KAMI_IMPLODE_STARTTIME-KAMI_EXPLODE_STARTTIME)
    else
      if (le.leFlags&LEF_SOUND2)==0 then sound(state,"kamikaze-implode",le,le.refEntity.origin,0);le.leFlags=le.leFlags|LEF_SOUND2 end if
      c=(KAMI_IMPLODE_ENDTIME-t)/(KAMI_IMPLODE_ENDTIME-KAMI_IMPLODE_STARTTIME)
    end if
    fade=remainingFraction(state,le)*255.0;le.refEntity.shaderRGBA=[n.trunc32(le.color[0]*fade),n.trunc32(le.color[1]*fade),n.trunc32(le.color[2]*fade),n.trunc32(le.color[3]*fade)];render(state,"kamikaze-sphere",le,le.refEntity.origin,c*KAMI_BOOMSPHERE_MAXRADIUS/KAMI_BOOMSPHEREMODEL_RADIUS,le.refEntity.shaderRGBA,void);render(state,"dynamic-light",le,le.refEntity.origin,c*1000.0,[1.0,1.0,c],void)
  end if
  if t>KAMI_SHOCKWAVE2_STARTTIME and t<KAMI_SHOCKWAVE2_ENDTIME then if le.angles.trBase==[0.0,0.0,0.0] then le.angles.trBase=[(state.services.randomFn(state.services.context)&0x7fff)*360.0/32767.0,(state.services.randomFn(state.services.context)&0x7fff)*360.0/32767.0,(state.services.randomFn(state.services.context)&0x7fff)*360.0/32767.0] end if;kamiWave(state,le,"kamikaze-wave-2",t,KAMI_SHOCKWAVE2_STARTTIME,KAMI_SHOCKWAVE2FADE_STARTTIME,KAMI_SHOCKWAVE2_ENDTIME,KAMI_SHOCKWAVE2_MAXRADIUS,le.angles.trBase) end if;return void
end function

// CG_AddInvulnerabilityImpact
/// @param state Argument 1 of `mq3.client.cgame_localents.render`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.refEntity.origin`, `le.refEntity.radius`, `le.refEntity.shaderRGBA`.
function addInvulnerabilityImpact(state,le) return render(state,"invulnerability-impact",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end function

// CG_AddInvulnerabilityJuiced
/// @param state Record read through `state.time`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.refEntity.axis[0][0]`, `le.refEntity.axis[1][1]`, `le.refEntity.axis[2][2]`, `le.endTime`.
function addInvulnerabilityJuiced(state,le)
  t=state.time-le.startTime;if t>3000 then le.refEntity.axis[0][0]=1.0+0.3*(t-3000)/2000.0;le.refEntity.axis[1][1]=le.refEntity.axis[0][0];le.refEntity.axis[2][2]=0.7+0.3*(2000-(t-3000))/2000.0 end if
  if t>5000 then le.endTime=0;boundary(state,"state","gib-player",le,le.refEntity.origin,void,0.0,void,void) else render(state,"invulnerability-juiced",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end if;return void
end function

// CG_AddRefEntity
/// @param state Record read through `state.time`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.endTime`, `le.refEntity.origin`, `le.refEntity.radius`, `le.refEntity.shaderRGBA`.
function addRefEntity(state,le) if le.endTime<state.time then freeLocalEntity(state,le);return void end if;return render(state,"ref-entity",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end function

/// Evaluates client game localents `scoreColor` and returns `[255,17,17]`, `[255,0,255]`, `[0,0,255]` and additional values according to its guard/selection conditions.
/// @param score Value used by `if score<0 then return [255,17,17] end if`.
function scoreColor(score) if score<0 then return [255,17,17] end if;if score>=50 then return [255,0,255] end if;if score>=20 then return [0,0,255] end if;if score>=10 then return [255,255,0] end if;if score>=2 then return [0,255,0] end if;return [255,255,255] end function
/// Calls `mq3.compat.numeric.trunc32` from client game localents `scoreDigits`. The final path returns `result`.
/// @param score Value used by `score=n.trunc32(score)`.
function scoreDigits(score) score=n.trunc32(score);result=[];negative=false;if score<0 then negative=true;score= -score end if;while len(result)==0 or score!=0 result=result+[score%10];score=n.trunc32(score/10) end while;if negative then result=result+[10] end if;return result end function

// CG_AddScorePlum
/// @param state Record read through `state.vieworg`.
/// @param le Mutable client game localents record/storage; this routine assigns `le.refEntity.radius`.
function addScorePlum(state,le)
  c=remainingFraction(state,le);rgb=scoreColor(le.radius);alpha=255;if c<0.25 then alpha=n.trunc32(255.0*4.0*c) end if;origin=[le.pos.trBase[0],le.pos.trBase[1],le.pos.trBase[2]+110.0-c*100.0];dir=[state.vieworg[0]-origin[0],state.vieworg[1]-origin[1],state.vieworg[2]-origin[2]];vec=qmath.CrossProduct(dir,[0.0,0.0,1.0]);qmath.VectorNormalize(vec);origin=qmath.VectorMA(origin,-10.0+20.0*trans.sin(c*2.0*3.14159265358979323846),vec)
  if nearView(state,origin,20.0) then freeLocalEntity(state,le);return void end if;le.refEntity.radius=NUMBER_SIZE/2.0;digits=scoreDigits(le.radius)
  for index=0 to len(digits)-1 place=qmath.VectorMA(origin,(len(digits)/2.0-index)*NUMBER_SIZE,vec);render(state,"score-digit",le,place,NUMBER_SIZE/2.0,[rgb[0],rgb[1],rgb[2],alpha],digits[len(digits)-1-index]) end for;return len(digits)
end function

/// Updates `state.errors` during client game localents `dispatchLocalEntity`.
/// @param state Mutable client game localents record/storage; this routine assigns `state.errors`.
/// @param le Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.leType`.
function dispatchLocalEntity(state,le)
  switch le.leType
    case LE_MARK return void end case
    case LE_SPRITE_EXPLOSION return addSpriteExplosion(state,le) end case
    case LE_EXPLOSION return addExplosion(state,le) end case
    case LE_FRAGMENT return addFragment(state,le) end case
    case LE_MOVE_SCALE_FADE return addMoveScaleFade(state,le) end case
    case LE_FADE_RGB return addFadeRGB(state,le) end case
    case LE_FALL_SCALE_FADE return addFallScaleFade(state,le) end case
    case LE_SCALE_FADE return addScaleFade(state,le) end case
    case LE_SCOREPLUM return addScorePlum(state,le) end case
    case LE_KAMIKAZE return addKamikaze(state,le) end case
    case LE_INVULIMPACT return addInvulnerabilityImpact(state,le) end case
    case LE_INVULJUICED return addInvulnerabilityJuiced(state,le) end case
    case LE_SHOWREFENTITY return addRefEntity(state,le) end case
    case default state.errors=state.errors+["Bad leType: "+str(le.leType)];return void end case
  end switch
end function

// CG_AddLocalEntities
/// @param state Mutable client game localents record/storage; this routine assigns `state.time`, `state.frametime`, `state.vieworg`.
/// @param time Value assigned to `state.time`.
/// @param frametime Value assigned to `state.frametime`.
/// @param vieworg Value assigned to `state.vieworg`.
function addLocalEntities(state,time,frametime,vieworg)
  state.time=time;state.frametime=frametime;state.vieworg=vieworg;visit=[];for each id in state.active visit=[id]+visit end for
  for each id in visit le=state.entities[id];if not le.active then continue end if;if state.time>=le.endTime then freeLocalEntity(state,le);continue end if;dispatchLocalEntity(state,le) end for;return len(visit)
end function

/// Updates `state.actions`, `state.rendered`, `state.audio`, `state.marks` during client game localents `clearBoundaryActions`.
/// @param state Mutable client game localents record/storage; this routine assigns `state.actions`, `state.rendered`, `state.audio`, `state.marks`.
function clearBoundaryActions(state) state.actions=[];state.rendered=0;state.audio=0;state.marks=0;return void end function
