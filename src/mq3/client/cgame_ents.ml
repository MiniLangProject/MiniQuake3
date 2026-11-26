// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Renderer-neutral semantic port of code/cgame/cg_ents.c.  The retail cgame
// remains the scene producer; this module records the same boundary decisions
// and suppresses dispatch while a retail QVM is active.
package mq3.client.cgame_ents

import mq3.compat.numeric as n
import mq3.compat.transcendental as crt
import mq3.game.constants as c
import mq3.game.entitystate as entitystate
import mq3.game.trajectory as trajectory
import mq3.renderer.model_tags as modelTags
import mq3.renderer.player_model_assembly as assembly
import mq3.shared.bytedirs as bytedirs
import mq3.shared.directions as directions
import mq3.shared.math as q

/// Encoded solid value indicating that the entity uses an inline brush collision model.
const SOLID_BMODEL=0xFFFFFF
/// Capacity limit for the clients collection or bounded storage used by this client module.
const MAX_CLIENTS=64
/// Highest range bound reserved for ordinary entities before protocol sentinel values.
const ENTITYNUM_MAX_NORMAL=1022
/// Duration in milliseconds of the item-pickup scale animation.
const ITEM_SCALEUP_TIME=1000
/// Entity-state flag selecting nodraw behavior in client presentation.
const EF_NODRAW=0x80
/// Renderer flag excluding the entity from its own first-person view while allowing external or
/// reflected views.
const RF_THIRD_PERSON=2
/// Renderer flag guaranteeing a minimum amount of lighting for the entity.
const RF_MINLIGHT=1
/// Renderer flag suppressing shadow generation for the entity.
const RF_NOSHADOW=0x40
/// Renderer-entity type selecting the model primitive.
const RT_MODEL=0
/// Renderer-entity type selecting the sprite primitive.
const RT_SPRITE=2
/// Renderer-entity type selecting the beam primitive.
const RT_BEAM=4
/// Renderer-entity type selecting the portalsurface primitive.
const RT_PORTALSURFACE=6
/// Native game-type value for capture the flag, used when selecting flag and item presentation for
/// snapshot entities.
const GT_CTF=4
/// Native team identifier for red, used by player and team presentation.
const TEAM_RED=1
/// Native team identifier for blue, used by player and team presentation.
const TEAM_BLUE=2
/// Sound channel used for item-related sounds associated with an entity.
const CHAN_ITEM=3
/// Native weapon identifier selecting the plasma gun.
const WP_PLASMAGUN=8
/// Number of native weapon slots, used to size weapon-indexed tables rather than select a weapon.
const WP_NUM_WEAPONS=11

/// Stores client game ents render entity record, including `reType`, `origin`, `oldorigin`, `lightingOrigin`, `axis`, `frame` and additional values.
struct RenderEntity
  /// When constructing this record, `renderEntity` supplies `RT_MODEL` for this member.
  reType
  /// Interpolated world-space origin of the entity submitted to the renderer.
  origin
  /// Previous position used for interpolation, trails, or rendering a line segment.
  oldorigin
  /// When constructing this record, `renderEntity` supplies `[0.0,0.0,0.0]` for this member.
  lightingOrigin
  /// Three orientation basis vectors used to transform the rendered object.
  axis
  /// Current model frame submitted when presenting the client-game entity.
  frame
  /// Previous model frame used as the interpolation starting point.
  oldframe
  /// Previous-frame weight used to interpolate the submitted model entity presented by snapshot-entity
  /// presentation.
  backlerp
  /// Model resource selected for rendering the object.
  model
  /// When constructing this record, `renderEntity` supplies `0` for this member.
  model2
  /// Scene-kind-dependent payload holding an item or weapon selector, or packed RGB for a
  /// constant-light request.
  shader
  /// Skin resource selected for rendering the model.
  skin
  /// World-space sprite radius carried by this client entity render submission.
  radius
  /// When constructing this record, `renderEntity` supplies `0.0` for this member.
  rotation
  /// Renderer-entity flags controlling lighting, view restrictions, depth handling, and related
  /// effects.
  renderfx
  /// When constructing this record, `renderEntity` supplies `false` for this member.
  nonNormalized
end struct
/// Stores client game ents boundary record, including `boundary`, `kind`, `entity`, `origin`, `velocity`, `render` and additional values.
struct Boundary
  /// Host service category recorded with a request emitted while presenting snapshot entities through
  /// scene and sound services.
  boundary
  /// Operation selector telling the host how to interpret a request emitted while presenting snapshot
  /// entities through scene and sound services.
  kind
  /// When constructing this record, `boundary` supplies `entity` for this member.
  entity
  /// World-space position accompanying a snapshot entity's scene or sound request.
  origin
  /// Linear rate of change of position used by movement or effect integration.
  velocity
  /// When constructing this record, `boundary` supplies `renderValue` for this member.
  render
  /// Sound resource carried by an entity audio action at the host dispatch boundary.
  sound
  /// Value payload supplied to the selected host operation while presenting snapshot entities through
  /// scene and sound services.
  value
  /// True when this request is marked for native dispatch while presenting snapshot entities through
  /// scene and sound services; false when its native effect is suppressed.
  dispatched
end struct
/// Stores client game ents cent record, including `currentState`, `nextState`, `interpolate`, `lerpOrigin`, `lerpAngles`, `miscTime`.
struct Cent
  /// Entity state received in the current server snapshot.
  currentState
  /// Entity state from the following snapshot, used when interpolation is available.
  nextState
  /// True when a valid following snapshot permits interpolation of this entity.
  interpolate
  /// Entity position after snapshot interpolation and smoothing.
  lerpOrigin
  /// Entity orientation after snapshot interpolation and smoothing.
  lerpAngles
  /// When constructing this record, `cent` supplies `0` for this member.
  miscTime
end struct
/// Stores client game ents snapshot metadata and contents, including `serverTime`, `playerState`, `entities`.
struct Snapshot
  /// Server simulation timestamp in milliseconds used when interpolating rendered entity snapshots.
  serverTime
  /// Player-state record associated with this client snapshot.
  playerState
  /// Entity-state or renderer-entity entries represented by the current snapshot or scene.
  entities
end struct
/// Stores client game ents state, including `time`, `snap`, `nextSnap`, `frameInterpolation`, `smoothClients`, `simpleItems` and additional values.
struct State
  /// Client presentation time in milliseconds used to evaluate and interpolate entity rendering and
  /// sound.
  time
  /// Current snapshot used as the lower endpoint of client interpolation.
  snap
  /// Following snapshot used as the upper endpoint of client interpolation, when available.
  nextSnap
  /// Fraction between the current and following snapshot times used for interpolation.
  frameInterpolation
  /// When constructing this record, `create` supplies `true` for this member. Used by
  /// `calcEntityLerpPositions` during subsequent processing.
  smoothClients
  /// When constructing this record, `create` supplies `false` for this member. Used by `item` during
  /// subsequent processing.
  simpleItems
  /// Active game-rule identifier used to decide whether capture-the-flag base entities are rendered.
  gametype
  /// When constructing this record, `create` supplies `0` for this member. Used by `general` and
  /// `addPacketEntities` during subsequent processing.
  localClient
  /// When constructing this record, `create` supplies an absent (`void`) value for this member. Used by
  /// `addPacketEntities` during subsequent processing.
  predictedEntity
  /// Entity-state or renderer-entity entries represented by the current snapshot or scene.
  entities
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `setEntitySoundPosition` during subsequent processing.
  inlineMidpoints
  /// When constructing this record, `create` supplies an empty list for this member. Used by
  /// `weaponMidpoint` during subsequent processing.
  weaponMidpoints
  /// When constructing this record, `create` supplies `array(WP_NUM_WEAPONS+1,0.0)` for this member.
  /// Used by `missile` during subsequent processing.
  missileLights
  /// Sound resources selected for the missile event or effect.
  missileSounds
  /// When constructing this record, `create` supplies `q.RandomState(1)` for this member. Used by
  /// `speaker` during subsequent processing.
  random
  /// Host requests queued while presenting snapshot entities through scene and sound services, retained
  /// in request order.
  actions
  /// When constructing this record, `create` supplies an empty list for this member. Used by `boundary`
  /// and `clearBoundaries` during subsequent processing.
  scene
  /// When constructing this record, `create` supplies an empty list for this member. Used by `boundary`
  /// and `clearBoundaries` during subsequent processing.
  audio
  /// When constructing this record, `create` supplies an empty list for this member. Used by `boundary`
  /// and `clearBoundaries` during subsequent processing.
  soundPositions
  /// Diagnostic messages collected while parsing or processing the input.
  errors
  /// Number of snapshot-entity requests withheld because the retail CGame QVM owns their presentation.
  suppressed
  /// Number of snapshot-entity scene and sound requests marked for native dispatch.
  dispatched
end struct

/// Creates the three orthonormal unit axes used as the identity orientation in client game ents.
function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
/// Copies the X, Y and Z components into a fresh client game ents vector.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function copy3(value) return [value[0],value[1],value[2]] end function
/// Builds the client game ents `add3` sequence from `[n.fadd(first[0],second[0]),n.fadd(first[1],second[1]),n.fadd(first[2],second[2])]`.
/// @param first Sequence read at `first[0]`, `first[1]`, `first[2]`.
/// @param second Sequence read at `second[0]`, `second[1]`, `second[2]`.
function add3(first,second) return [n.fadd(first[0],second[0]),n.fadd(first[1],second[1]),n.fadd(first[2],second[2])] end function
/// Builds the client game ents `sub3` sequence from `[n.fsub(first[0],second[0]),n.fsub(first[1],second[1]),n.fsub(first[2],second[2])]`.
/// @param first Sequence read at `first[0]`, `first[1]`, `first[2]`.
/// @param second Sequence read at `second[0]`, `second[1]`, `second[2]`.
function sub3(first,second) return [n.fsub(first[0],second[0]),n.fsub(first[1],second[1]),n.fsub(first[2],second[2])] end function
/// Creates a `mq3.client.cgame_ents.RenderEntity` record. Initializes the record with the defaults written in this constructor.
function renderEntity()
  return RenderEntity(RT_MODEL,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],identityAxis(),0,0,0.0,0,0,0,0,0.0,0.0,0,false)
end function
/// Creates a `mq3.client.cgame_ents.Cent` record. Assigns `currentState` from `source`.
/// @param source Record read through `source.origin`, `source.angles`.
function cent(source)
  return Cent(source,entitystate.copy(source),false,copy3(source.origin),copy3(source.angles),0)
end function
/// Creates a `mq3.client.cgame_ents.State` record.
/// @param maxEntities Value used to initialize `State.entities`.
function create(maxEntities)
  return State(0,void,void,0.0,true,false,0,0,void,array(maxEntities,void),[],[],array(WP_NUM_WEAPONS+1,0.0),array(WP_NUM_WEAPONS+1,0),q.RandomState(1),[],[],[],[],[],0,0)
end function
/// Updates `state.actions`, `state.scene`, `state.audio`, `state.soundPositions` and additional values during client game ents `boundary`.
/// @param state Mutable client game ents record/storage; this routine assigns `state.actions`, `state.scene`, `state.audio`, `state.soundPositions` and additional values.
/// @param boundaryName Value used by `item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit)`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param entity Value used by `item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit)`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param velocity Velocity vector used to advance or orient the effect.
/// @param renderValue Value used by `item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit)`.
/// @param sound Sound handle or asset name passed to the audio action.
/// @param value Value used by `item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit)`.
/// @param emit Value used by `item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit)`.
function boundary(state,boundaryName,kind,entity,origin,velocity,renderValue,sound,value,emit)
  item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit);state.actions=state.actions+[item]
  if boundaryName=="scene" then state.scene=state.scene+[item] else if boundaryName=="audio" then state.audio=state.audio+[item] else state.soundPositions=state.soundPositions+[item] end if
  if emit then state.dispatched=state.dispatched+1 else state.suppressed=state.suppressed+1 end if
  return item
end function
/// Adapts `mq3.client.cgame_ents.boundary` to client game ents `scene`, returning its result for `state, "scene", kind, entity, value.origin, [0.0,0.0,0.0], value, 0, 0, emit`.
/// @param state Argument 1 of `mq3.client.cgame_ents.boundary`.
/// @param kind Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_ents.boundary`.
/// @param entity Argument 4 of `mq3.client.cgame_ents.boundary`.
/// @param value Record read through `value.origin`.
/// @param emit Argument 10 of `mq3.client.cgame_ents.boundary`.
function scene(state,kind,entity,value,emit) return boundary(state,"scene",kind,entity,value.origin,[0.0,0.0,0.0],value,0,0,emit) end function
/// Adapts `mq3.client.cgame_ents.boundary` to client game ents `audio`, returning its result for `state, "audio", kind, entity, origin, velocity, void, sound, 0, emit`.
/// @param state Argument 1 of `mq3.client.cgame_ents.boundary`.
/// @param kind Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_ents.boundary`.
/// @param entity Argument 4 of `mq3.client.cgame_ents.boundary`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_ents.boundary`.
/// @param velocity Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_ents.boundary`.
/// @param sound Argument 8 of `mq3.client.cgame_ents.boundary`.
/// @param emit Argument 10 of `mq3.client.cgame_ents.boundary`.
function audio(state,kind,entity,origin,velocity,sound,emit) return boundary(state,"audio",kind,entity,origin,velocity,void,sound,0,emit) end function

// CG_PositionEntityOnTag
/// @param entity Mutable client game ents record/storage; this routine assigns `entity.origin`, `entity.axis`, `entity.backlerp`.
/// @param parent Record read through `parent.oldframe`, `parent.frame`, `parent.backlerp`, `parent.origin` and additional values.
/// @param model Model handle, asset or preview record used by this client game ents operation.
/// @param name Name used to select or register the corresponding client game ents resource.
function positionEntityOnTag(entity,parent,model,name)
  orientation=modelTags.lerpTag(model,parent.oldframe,parent.frame,n.fsub(1.0,parent.backlerp),name);if orientation is error then return orientation end if;if not orientation.found then return error(7750,"attachment tag missing") end if
  entity.origin=copy3(parent.origin)
  for i=0 to 2 entity.origin=q.VectorMA(entity.origin,orientation.origin[i],parent.axis[i]) end for
  entity.axis=assembly.multiplyAxis(orientation.axis,parent.axis);entity.backlerp=parent.backlerp;return entity
end function

// CG_PositionRotatedEntityOnTag
/// @param entity Mutable client game ents record/storage; this routine assigns `entity.origin`, `entity.axis`.
/// @param parent Record read through `parent.oldframe`, `parent.frame`, `parent.backlerp`, `parent.origin` and additional values.
/// @param model Model handle, asset or preview record used by this client game ents operation.
/// @param name Name used to select or register the corresponding client game ents resource.
function positionRotatedEntityOnTag(entity,parent,model,name)
  orientation=modelTags.lerpTag(model,parent.oldframe,parent.frame,n.fsub(1.0,parent.backlerp),name);if orientation is error then return orientation end if;if not orientation.found then return error(7750,"attachment tag missing") end if
  entity.origin=copy3(parent.origin);for i=0 to 2 entity.origin=q.VectorMA(entity.origin,orientation.origin[i],parent.axis[i]) end for
  entity.axis=assembly.multiplyAxis(assembly.multiplyAxis(entity.axis,orientation.axis),parent.axis);return entity
end function

// CG_SetEntitySoundPosition
/// @param state Record read through `state.inlineMidpoints`.
/// @param value Record read through `value.lerpOrigin`, `value.currentState`.
/// @param emit Value used by `boundary(state,"sound-position","update",es.number,origin,[0.0,0.0,0.0],void,0,0,emit)`.
function setEntitySoundPosition(state,value,emit)
  origin=copy3(value.lerpOrigin);es=value.currentState
  if es.solid==SOLID_BMODEL and es.modelindex>=0 and es.modelindex<len(state.inlineMidpoints) then origin=add3(origin,state.inlineMidpoints[es.modelindex]) end if
  boundary(state,"sound-position","update",es.number,origin,[0.0,0.0,0.0],void,0,0,emit);return origin
end function

// CG_EntityEffects
/// @param state Shared client game ents state passed to the helper calls in `entityEffects`.
/// @param value Record read through `value.currentState`, `value.lerpOrigin`.
/// @param emit Value used by `setEntitySoundPosition(state,value,emit)`.
function entityEffects(state,value,emit)
  es=value.currentState;setEntitySoundPosition(state,value,emit)
  if es.loopSound!=0 then kind="loop";if es.eType==c.ET_SPEAKER then kind="real-loop" end if;audio(state,kind,es.number,value.lerpOrigin,[0.0,0.0,0.0],es.loopSound,emit) end if
  if es.constantLight!=0 then
    light=renderEntity();light.origin=copy3(value.lerpOrigin);light.radius=((es.constantLight>>24)&255)*4;light.shader=(es.constantLight&255)|(((es.constantLight>>8)&255)<<8)|(((es.constantLight>>16)&255)<<16);scene(state,"constant-light",es.number,light,emit)
  end if
  return void
end function

// CG_General
/// @param state Record read through `state.localClient`.
/// @param value Record read through `value.currentState`, `value.lerpOrigin`, `value.lerpAngles`.
/// @param emit Value used by `return scene(state,"general",es.number,ent,emit)`.
function general(state,value,emit)
  es=value.currentState;if es.modelindex==0 then return void end if;ent=renderEntity();ent.frame=es.frame;ent.oldframe=es.frame;ent.origin=copy3(value.lerpOrigin);ent.oldorigin=copy3(value.lerpOrigin);ent.model=es.modelindex;if es.number==state.localClient then ent.renderfx=ent.renderfx|RF_THIRD_PERSON end if;ent.axis=q.AngleVectors(value.lerpAngles);return scene(state,"general",es.number,ent,emit)
end function

// CG_Speaker
/// @param state Record read through `state.time`, `state.random`.
/// @param value Mutable client game ents record/storage; this routine assigns `value.miscTime`.
/// @param emit Value used by `result=audio(state,"speaker",es.number,value.lerpOrigin,[0.0,0.0,0.0],es.eventParm,emit)`.
function speaker(state,value,emit)
  es=value.currentState;if es.clientNum==0 or state.time<value.miscTime then return void end if;result=audio(state,"speaker",es.number,value.lerpOrigin,[0.0,0.0,0.0],es.eventParm,emit);value.miscTime=state.time+es.frame*100+n.trunc32(es.clientNum*100*q.Q_crandom(state.random));return result
end function

/// Evaluates client game ents `weaponMidpoint` and returns `state.weaponMidpoints[weapon]`, `[0.0,0.0,0.0]` according to its guard/selection conditions.
/// @param state Record read through `state.weaponMidpoints`.
/// @param weapon Value used by `if weapon>=0 and weapon<len(state.weaponMidpoints) then return state.weaponMidpoints[weapon] end if`.
function weaponMidpoint(state,weapon)
  if weapon>=0 and weapon<len(state.weaponMidpoints) then return state.weaponMidpoints[weapon] end if;return [0.0,0.0,0.0]
end function

// CG_Item
/// @param state Record read through `state.simpleItems`, `state.time`.
/// @param value Mutable client game ents record/storage; this routine assigns `value.lerpAngles`.
/// @param emit Value used by `return scene(state,"item-sprite",es.number,ent,emit) end if`.
function item(state,value,emit)
  es=value.currentState;if es.modelindex<0 or es.modelindex>35 then return error(7751,"Bad item index") end if;if es.modelindex==0 or (es.eFlags&EF_NODRAW)!=0 then return void end if
  type=c.itemType(es.modelindex);if type is error then return type end if
  ent=renderEntity();ent.origin=copy3(value.lerpOrigin)
  if state.simpleItems and type!=c.IT_TEAM then ent.reType=RT_SPRITE;ent.radius=14.0;ent.shader=es.modelindex;return scene(state,"item-sprite",es.number,ent,emit) end if
  scale=n.fadd(0.005,n.fmul(es.number,0.00001));ent.origin[2]=n.fadd(ent.origin[2],n.fadd(4.0,n.fmul(4.0,crt.cos(n.fmul(state.time+1000,scale)))))
  angles=[0.0,n.f32((state.time&2047)*360.0/2048.0),0.0];if type==c.IT_HEALTH then angles=[0.0,n.f32((state.time&1023)*360.0/1024.0),0.0] end if;value.lerpAngles=angles;ent.axis=q.AngleVectors(angles)
  if type==c.IT_WEAPON then midpoint=weaponMidpoint(state,c.itemTag(es.modelindex));for axis=0 to 2 ent.origin[axis]=n.fsub(ent.origin[axis],n.fadd(n.fadd(n.fmul(midpoint[0],ent.axis[0][axis]),n.fmul(midpoint[1],ent.axis[1][axis])),n.fmul(midpoint[2],ent.axis[2][axis]))) end for;ent.origin[2]=n.fadd(ent.origin[2],8.0) end if
  ent.oldorigin=copy3(ent.origin);ent.model=es.modelindex;msec=state.time-value.miscTime;frac=1.0;if msec>=0 and msec<ITEM_SCALEUP_TIME then frac=n.f32(msec*1.0/ITEM_SCALEUP_TIME);for row=0 to 2 ent.axis[row]=q.VectorScale(ent.axis[row],frac) end for;ent.nonNormalized=true end if
  if type==c.IT_WEAPON or type==c.IT_ARMOR then ent.renderfx=ent.renderfx|RF_MINLIGHT end if;if type==c.IT_WEAPON then for row=0 to 2 ent.axis[row]=q.VectorScale(ent.axis[row],1.5) end for;ent.nonNormalized=true end if
  scene(state,"item",es.number,ent,emit)
  if (type==c.IT_HEALTH or type==c.IT_POWERUP) and es.modelindex2!=0 then ring=renderEntity();ring.origin=copy3(ent.origin);ring.model=es.modelindex2;if type==c.IT_POWERUP then ring.origin[2]=n.fadd(ring.origin[2],12.0);ring.axis=q.AngleVectors([0.0,n.f32((state.time&1023)*360.0/-1024.0),0.0]) end if;if frac!=1.0 then for row=0 to 2 ring.axis[row]=q.VectorScale(ring.axis[row],frac) end for;ring.nonNormalized=true end if;scene(state,"item-ring",es.number,ring,emit) end if
  return ent
end function

/// Calls `mq3.shared.math.VectorNormalize2`, `mq3.shared.math.VectorLength`, `mq3.shared.directions.perpendicular` and additional helpers from client game ents `directionAxis`. The final path returns `axis`.
/// @param direction Direction vector used by the spatial calculation.
/// @param spin Value used by `if spin!=0 then roll=q.AngleVectors([0.0,0.0,spin])`.
function directionAxis(direction,spin)
  forward=q.VectorNormalize2(direction);if q.VectorLength(forward)==0 then forward=[0.0,0.0,1.0] end if;right=directions.perpendicular(forward);up=q.CrossProduct(forward,right);axis=[forward,right,up]
  if spin!=0 then roll=q.AngleVectors([0.0,0.0,spin]);axis=assembly.multiplyAxis(roll,axis) end if;return axis
end function

// CG_Missile
/// @param state Record read through `state.missileLights`, `state.missileSounds`, `state.time`.
/// @param value Mutable client game ents record/storage; this routine assigns `value.lerpAngles`.
/// @param emit Value used by `scene(state,"missile-trail",es.number,trail,emit)`.
function missile(state,value,emit)
  es=value.currentState;weapon=es.weapon;if weapon<0 or weapon>WP_NUM_WEAPONS then weapon=0;es.weapon=0 end if;value.lerpAngles=copy3(es.angles)
  trail=renderEntity();trail.origin=copy3(value.lerpOrigin);trail.model=weapon;scene(state,"missile-trail",es.number,trail,emit)
  if state.missileLights[weapon]!=0 then light=renderEntity();light.origin=copy3(value.lerpOrigin);light.radius=state.missileLights[weapon];light.shader=weapon;scene(state,"missile-light",es.number,light,emit) end if
  if state.missileSounds[weapon]!=0 then velocity=trajectory.evaluateDelta(es.pos,state.time);if velocity is error then return velocity end if;audio(state,"missile-loop",es.number,value.lerpOrigin,velocity,state.missileSounds[weapon],emit) end if
  ent=renderEntity();ent.origin=copy3(value.lerpOrigin);ent.oldorigin=copy3(value.lerpOrigin);ent.model=weapon;ent.skin=state.time&1;ent.renderfx=RF_NOSHADOW
  if weapon==WP_PLASMAGUN then ent.reType=RT_SPRITE;ent.radius=16.0;ent.shader=weapon;scene(state,"plasma-ball",es.number,ent,emit);return ent end if
  spin=es.time;if es.pos.trType!=c.TR_STATIONARY then spin=state.time/4 end if;ent.axis=directionAxis(es.pos.trDelta,spin);scene(state,"missile",es.number,ent,emit);return ent
end function

// CG_Grapple
/// @param state Record read through `state.time`.
/// @param value Mutable client game ents record/storage; this routine assigns `value.lerpAngles`.
/// @param emit Value used by `scene(state,"grapple-trail",es.number,trail,emit)`.
function grapple(state,value,emit)
  es=value.currentState;weapon=es.weapon;if weapon<0 or weapon>WP_NUM_WEAPONS then weapon=0;es.weapon=0 end if;value.lerpAngles=copy3(es.angles);trail=renderEntity();trail.origin=copy3(value.lerpOrigin);trail.model=weapon;scene(state,"grapple-trail",es.number,trail,emit);ent=renderEntity();ent.origin=copy3(value.lerpOrigin);ent.oldorigin=copy3(value.lerpOrigin);ent.model=weapon;ent.skin=state.time&1;ent.renderfx=RF_NOSHADOW;ent.axis=directionAxis(es.pos.trDelta,0);scene(state,"grapple",es.number,ent,emit);return ent
end function

// CG_Mover
/// @param state Record read through `state.time`.
/// @param value Record read through `value.currentState`, `value.lerpOrigin`, `value.lerpAngles`.
/// @param emit Value used by `scene(state,"mover",es.number,ent,emit)`.
function mover(state,value,emit)
  es=value.currentState;ent=renderEntity();ent.origin=copy3(value.lerpOrigin);ent.oldorigin=copy3(value.lerpOrigin);ent.axis=q.AngleVectors(value.lerpAngles);ent.renderfx=RF_NOSHADOW;ent.skin=(state.time>>6)&1;ent.model=es.modelindex;scene(state,"mover",es.number,ent,emit);if es.modelindex2!=0 then second=renderEntity();second.origin=copy3(ent.origin);second.oldorigin=copy3(ent.oldorigin);second.axis=ent.axis;second.renderfx=ent.renderfx;second.model=es.modelindex2;scene(state,"mover-secondary",es.number,second,emit) end if;return ent
end function

// CG_Beam
/// @param state Shared client game ents state passed to the helper calls in `beam`.
/// @param value Record read through `value.currentState`.
/// @param emit Value used by `scene(state,"beam",es.number,ent,emit)`.
function beam(state,value,emit)
  es=value.currentState;ent=renderEntity();ent.reType=RT_BEAM;ent.origin=copy3(es.pos.trBase);ent.oldorigin=copy3(es.origin2);ent.renderfx=RF_NOSHADOW;scene(state,"beam",es.number,ent,emit);return ent
end function

// CG_Portal
/// @param state Shared client game ents state passed to the helper calls in `portal`.
/// @param value Record read through `value.currentState`, `value.lerpOrigin`.
/// @param emit Value used by `scene(state,"portal",es.number,ent,emit)`.
function portal(state,value,emit)
  es=value.currentState;ent=renderEntity();ent.reType=RT_PORTALSURFACE;ent.origin=copy3(value.lerpOrigin);ent.oldorigin=copy3(es.origin2);values=bytedirs.values();index=es.eventParm;if index<0 or index>=len(values) then index=0 end if;ent.axis[0]=copy3(values[index]);ent.axis[1]=q.VectorScale(directions.perpendicular(ent.axis[0]),-1.0);ent.axis[2]=q.CrossProduct(ent.axis[0],ent.axis[1]);ent.oldframe=es.powerups;ent.frame=es.frame;ent.skin=n.f32(es.clientNum/256.0*360.0);scene(state,"portal",es.number,ent,emit);return ent
end function

// CG_AdjustPositionForMover
/// @param input Value used by `if moverValue==void or moverValue.currentState.number<=0 or moverValue.currentState.number>=ENTITYNUM_MAX_NORMAL or moverValue.currentState.eT...`.
/// @param moverValue Record read through `moverValue.currentState.number`, `moverValue.currentState.eType`, `moverValue.currentState.pos`.
/// @param fromTime Value used by `oldOrigin=trajectory.evaluate(moverValue.currentState.pos,fromTime)`.
/// @param toTime Value used by `origin=trajectory.evaluate(moverValue.currentState.pos,toTime)`.
function adjustPositionForMover(input,moverValue,fromTime,toTime)
  if moverValue==void or moverValue.currentState.number<=0 or moverValue.currentState.number>=ENTITYNUM_MAX_NORMAL or moverValue.currentState.eType!=c.ET_MOVER then return copy3(input) end if
  oldOrigin=trajectory.evaluate(moverValue.currentState.pos,fromTime);if oldOrigin is error then return oldOrigin end if;origin=trajectory.evaluate(moverValue.currentState.pos,toTime);if origin is error then return origin end if;return add3(input,sub3(origin,oldOrigin))
end function

// CG_InterpolateEntityPosition
/// @param value Mutable client game ents record/storage; this routine assigns `value.lerpOrigin`, `value.lerpAngles`.
/// @param snapTime Value used by `current=trajectory.evaluate(value.currentState.pos,snapTime)`.
/// @param nextSnapTime Value used by `next=trajectory.evaluate(value.nextState.pos,nextSnapTime)`.
/// @param fraction Interpolation or blend fraction between the endpoint values.
function interpolateEntityPosition(value,snapTime,nextSnapTime,fraction)
  if value==void then return error(7752,"entity required") end if
  current=trajectory.evaluate(value.currentState.pos,snapTime);if current is error then return current end if;next=trajectory.evaluate(value.nextState.pos,nextSnapTime);if next is error then return next end if;value.lerpOrigin=[]
  for axis=0 to 2 value.lerpOrigin=value.lerpOrigin+[n.fadd(current[axis],n.fmul(fraction,n.fsub(next[axis],current[axis])))] end for
  current=trajectory.evaluate(value.currentState.apos,snapTime);if current is error then return current end if;next=trajectory.evaluate(value.nextState.apos,nextSnapTime);if next is error then return next end if;value.lerpAngles=[]
  for axis=0 to 2 value.lerpAngles=value.lerpAngles+[q.LerpAngle(current[axis],next[axis],fraction)] end for;return value
end function

// CG_CalcEntityLerpPositions
/// @param state Record read through `state.smoothClients`, `state.nextSnap`, `state.snap.serverTime`, `state.nextSnap.serverTime` and additional values.
/// @param value Mutable client game ents record/storage; this routine assigns `value.nextState.pos.trType`, `value.lerpOrigin`, `value.lerpAngles`.
/// @param predicted Value used by `if not predicted and es.groundEntityNum>0 and es.groundEntityNum<len(state.entities) then adjusted=adjustPositionForMover(value.lerpOrigin,sta...`.
function calcEntityLerpPositions(state,value,predicted)
  es=value.currentState;if not state.smoothClients and es.number<MAX_CLIENTS then es.pos.trType=c.TR_INTERPOLATE;value.nextState.pos.trType=c.TR_INTERPOLATE end if
  if value.interpolate and (es.pos.trType==c.TR_INTERPOLATE or (es.pos.trType==c.TR_LINEAR_STOP and es.number<MAX_CLIENTS)) then if state.nextSnap==void then return error(7752,"interpolation without next snapshot") end if;return interpolateEntityPosition(value,state.snap.serverTime,state.nextSnap.serverTime,state.frameInterpolation) end if
  value.lerpOrigin=trajectory.evaluate(es.pos,state.time);if value.lerpOrigin is error then return value.lerpOrigin end if;value.lerpAngles=trajectory.evaluate(es.apos,state.time);if value.lerpAngles is error then return value.lerpAngles end if
  if not predicted and es.groundEntityNum>0 and es.groundEntityNum<len(state.entities) then adjusted=adjustPositionForMover(value.lerpOrigin,state.entities[es.groundEntityNum],state.snap.serverTime,state.time);if adjusted is error then return adjusted end if;value.lerpOrigin=adjusted end if;return value
end function

// CG_TeamBase (baseq3 branch)
/// @param state Record read through `state.gametype`.
/// @param value Record read through `value.currentState`, `value.lerpOrigin`.
/// @param emit Value used by `scene(state,kind,es.number,ent,emit)`.
function teamBase(state,value,emit)
  es=value.currentState;if state.gametype!=GT_CTF then return void end if;ent=renderEntity();ent.origin=copy3(value.lerpOrigin);ent.lightingOrigin=copy3(value.lerpOrigin);ent.axis=q.AngleVectors(es.angles);ent.model=es.modelindex;kind="team-base-neutral";if es.modelindex==TEAM_RED then kind="team-base-red" else if es.modelindex==TEAM_BLUE then kind="team-base-blue" end if;scene(state,kind,es.number,ent,emit);return ent
end function

// CG_AddCEntity
/// @param state Mutable client game ents record/storage; this routine assigns `state.errors`.
/// @param value Record read through `value.currentState`, `value.lerpOrigin`.
/// @param predicted Value used by `calculated=calcEntityLerpPositions(state,value,predicted)`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function addCEntity(state,value,predicted,retailActive)
  es=value.currentState;if es.eType>=c.ET_EVENTS then return void end if;calculated=calcEntityLerpPositions(state,value,predicted);if calculated is error then state.errors=state.errors+["lerp"];return calculated end if;emit=not retailActive;entityEffects(state,value,emit)
  switch es.eType
    case c.ET_INVISIBLE,c.ET_PUSH_TRIGGER,c.ET_TELEPORT_TRIGGER return void end case
    case c.ET_GENERAL return general(state,value,emit) end case
    case c.ET_PLAYER player=renderEntity();player.origin=copy3(value.lerpOrigin);player.oldorigin=copy3(value.lerpOrigin);player.model=es.clientNum;return scene(state,"player",es.number,player,emit) end case
    case c.ET_ITEM return item(state,value,emit) end case
    case c.ET_MISSILE return missile(state,value,emit) end case
    case c.ET_MOVER return mover(state,value,emit) end case
    case c.ET_BEAM return beam(state,value,emit) end case
    case c.ET_PORTAL return portal(state,value,emit) end case
    case c.ET_SPEAKER return speaker(state,value,emit) end case
    case c.ET_GRAPPLE return grapple(state,value,emit) end case
    case c.ET_TEAM return teamBase(state,value,emit) end case
    case default state.errors=state.errors+["Bad entity type: "+str(es.eType)];return error(7753,"bad entity type") end case
  end switch
end function

/// Updates `state.entities[source.number]`, `state.entities[source.number].currentState` during client game ents `ensureCent`.
/// @param state Mutable client game ents record/storage; this routine assigns `state.entities[source.number]`, `state.entities[source.number].currentState`.
/// @param source Record read through `source.number`.
function ensureCent(state,source)
  if source.number<0 or source.number>=len(state.entities) then return error(7753,"entity number out of range") end if;if state.entities[source.number]==void then state.entities[source.number]=cent(source) else state.entities[source.number].currentState=source end if;return state.entities[source.number]
end function

// CG_AddPacketEntities.  Snapshot entities are observed through private Cent
// records.  Boundary decisions are therefore read-only with respect to the VM.
/// @param state Mutable client game ents record/storage; this routine assigns `state.snap`, `state.nextSnap`, `state.localClient`, `state.predictedEntity` and additional values.
/// @param snap Record read through `snap.playerState.clientNum`, `snap.serverTime`, `snap.entities`.
/// @param nextSnap Record read through `nextSnap.serverTime`, `nextSnap.entities`.
/// @param predictedEntity Value assigned to `state.predictedEntity`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function addPacketEntities(state,snap,nextSnap,predictedEntity,retailActive)
  if state==void or snap==void then return error(7754,"snapshot required") end if;state.snap=snap;state.nextSnap=nextSnap;state.localClient=snap.playerState.clientNum;state.predictedEntity=predictedEntity
  if nextSnap!=void then delta=nextSnap.serverTime-snap.serverTime;if delta==0 then state.frameInterpolation=0.0 else state.frameInterpolation=n.f32((state.time-snap.serverTime)*1.0/delta) end if else state.frameInterpolation=0.0 end if
  if predictedEntity!=void then result=addCEntity(state,predictedEntity,true,retailActive);if result is error then return result end if end if
  local=void;if state.localClient>=0 and state.localClient<len(state.entities) then local=state.entities[state.localClient] end if;if local!=void then calcEntityLerpPositions(state,local,false) end if
  before=len(state.actions);for each source in snap.entities value=ensureCent(state,source);if value is error then return value end if;if nextSnap!=void then for each following in nextSnap.entities if following.number==source.number then value.nextState=following;value.interpolate=true end if end for end if;result=addCEntity(state,value,false,retailActive);if result is error then return result end if end for;return len(state.actions)-before
end function

/// Updates `state.actions`, `state.scene`, `state.audio`, `state.soundPositions` during client game ents `clearBoundaries`.
/// @param state Mutable client game ents record/storage; this routine assigns `state.actions`, `state.scene`, `state.audio`, `state.soundPositions`.
function clearBoundaries(state) state.actions=[];state.scene=[];state.audio=[];state.soundPositions=[];return void end function
