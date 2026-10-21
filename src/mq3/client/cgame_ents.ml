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

const SOLID_BMODEL=0xFFFFFF
const MAX_CLIENTS=64
const ENTITYNUM_MAX_NORMAL=1022
const ITEM_SCALEUP_TIME=1000
const EF_NODRAW=0x80
const RF_THIRD_PERSON=2
const RF_MINLIGHT=1
const RF_NOSHADOW=0x40
const RT_MODEL=0
const RT_SPRITE=2
const RT_BEAM=4
const RT_PORTALSURFACE=6
const GT_CTF=4
const TEAM_RED=1
const TEAM_BLUE=2
const CHAN_ITEM=3
const WP_PLASMAGUN=8
const WP_NUM_WEAPONS=11

struct RenderEntity reType origin oldorigin lightingOrigin axis frame oldframe backlerp model model2 shader skin radius rotation renderfx nonNormalized end struct
struct Boundary boundary kind entity origin velocity render sound value dispatched end struct
struct Cent currentState nextState interpolate lerpOrigin lerpAngles miscTime end struct
struct Snapshot serverTime playerState entities end struct
struct State time snap nextSnap frameInterpolation smoothClients simpleItems gametype localClient predictedEntity entities inlineMidpoints weaponMidpoints missileLights missileSounds random actions scene audio soundPositions errors suppressed dispatched end struct

function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
function copy3(value) return [value[0],value[1],value[2]] end function
function add3(first,second) return [n.fadd(first[0],second[0]),n.fadd(first[1],second[1]),n.fadd(first[2],second[2])] end function
function sub3(first,second) return [n.fsub(first[0],second[0]),n.fsub(first[1],second[1]),n.fsub(first[2],second[2])] end function
function renderEntity()
  return RenderEntity(RT_MODEL,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],identityAxis(),0,0,0.0,0,0,0,0,0.0,0.0,0,false)
end function
function cent(source)
  return Cent(source,entitystate.copy(source),false,copy3(source.origin),copy3(source.angles),0)
end function
function create(maxEntities)
  return State(0,void,void,0.0,true,false,0,0,void,array(maxEntities,void),[],[],array(WP_NUM_WEAPONS+1,0.0),array(WP_NUM_WEAPONS+1,0),q.RandomState(1),[],[],[],[],[],0,0)
end function
function boundary(state,boundaryName,kind,entity,origin,velocity,renderValue,sound,value,emit)
  item=Boundary(boundaryName,kind,entity,copy3(origin),copy3(velocity),renderValue,sound,value,emit);state.actions=state.actions+[item]
  if boundaryName=="scene" then state.scene=state.scene+[item] else if boundaryName=="audio" then state.audio=state.audio+[item] else state.soundPositions=state.soundPositions+[item] end if
  if emit then state.dispatched=state.dispatched+1 else state.suppressed=state.suppressed+1 end if
  return item
end function
function scene(state,kind,entity,value,emit) return boundary(state,"scene",kind,entity,value.origin,[0.0,0.0,0.0],value,0,0,emit) end function
function audio(state,kind,entity,origin,velocity,sound,emit) return boundary(state,"audio",kind,entity,origin,velocity,void,sound,0,emit) end function

// CG_PositionEntityOnTag
function positionEntityOnTag(entity,parent,model,name)
  orientation=modelTags.lerpTag(model,parent.oldframe,parent.frame,n.fsub(1.0,parent.backlerp),name);if orientation is error then return orientation end if;if not orientation.found then return error(7750,"attachment tag missing") end if
  entity.origin=copy3(parent.origin)
  for i=0 to 2 entity.origin=q.VectorMA(entity.origin,orientation.origin[i],parent.axis[i]) end for
  entity.axis=assembly.multiplyAxis(orientation.axis,parent.axis);entity.backlerp=parent.backlerp;return entity
end function

// CG_PositionRotatedEntityOnTag
function positionRotatedEntityOnTag(entity,parent,model,name)
  orientation=modelTags.lerpTag(model,parent.oldframe,parent.frame,n.fsub(1.0,parent.backlerp),name);if orientation is error then return orientation end if;if not orientation.found then return error(7750,"attachment tag missing") end if
  entity.origin=copy3(parent.origin);for i=0 to 2 entity.origin=q.VectorMA(entity.origin,orientation.origin[i],parent.axis[i]) end for
  entity.axis=assembly.multiplyAxis(assembly.multiplyAxis(entity.axis,orientation.axis),parent.axis);return entity
end function

// CG_SetEntitySoundPosition
function setEntitySoundPosition(state,value,emit)
  origin=copy3(value.lerpOrigin);es=value.currentState
  if es.solid==SOLID_BMODEL and es.modelindex>=0 and es.modelindex<len(state.inlineMidpoints) then origin=add3(origin,state.inlineMidpoints[es.modelindex]) end if
  boundary(state,"sound-position","update",es.number,origin,[0.0,0.0,0.0],void,0,0,emit);return origin
end function

// CG_EntityEffects
function entityEffects(state,value,emit)
  es=value.currentState;setEntitySoundPosition(state,value,emit)
  if es.loopSound!=0 then kind="loop";if es.eType==c.ET_SPEAKER then kind="real-loop" end if;audio(state,kind,es.number,value.lerpOrigin,[0.0,0.0,0.0],es.loopSound,emit) end if
  if es.constantLight!=0 then
    light=renderEntity();light.origin=copy3(value.lerpOrigin);light.radius=((es.constantLight>>24)&255)*4;light.shader=(es.constantLight&255)|(((es.constantLight>>8)&255)<<8)|(((es.constantLight>>16)&255)<<16);scene(state,"constant-light",es.number,light,emit)
  end if
  return void
end function

// CG_General
function general(state,value,emit)
  es=value.currentState;if es.modelindex==0 then return void end if;ent=renderEntity();ent.frame=es.frame;ent.oldframe=es.frame;ent.origin=copy3(value.lerpOrigin);ent.oldorigin=copy3(value.lerpOrigin);ent.model=es.modelindex;if es.number==state.localClient then ent.renderfx=ent.renderfx|RF_THIRD_PERSON end if;ent.axis=q.AngleVectors(value.lerpAngles);return scene(state,"general",es.number,ent,emit)
end function

// CG_Speaker
function speaker(state,value,emit)
  es=value.currentState;if es.clientNum==0 or state.time<value.miscTime then return void end if;result=audio(state,"speaker",es.number,value.lerpOrigin,[0.0,0.0,0.0],es.eventParm,emit);value.miscTime=state.time+es.frame*100+n.trunc32(es.clientNum*100*q.Q_crandom(state.random));return result
end function

function weaponMidpoint(state,weapon)
  if weapon>=0 and weapon<len(state.weaponMidpoints) then return state.weaponMidpoints[weapon] end if;return [0.0,0.0,0.0]
end function

// CG_Item
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

function directionAxis(direction,spin)
  forward=q.VectorNormalize2(direction);if q.VectorLength(forward)==0 then forward=[0.0,0.0,1.0] end if;right=directions.perpendicular(forward);up=q.CrossProduct(forward,right);axis=[forward,right,up]
  if spin!=0 then roll=q.AngleVectors([0.0,0.0,spin]);axis=assembly.multiplyAxis(roll,axis) end if;return axis
end function

// CG_Missile
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
function grapple(state,value,emit)
  es=value.currentState;weapon=es.weapon;if weapon<0 or weapon>WP_NUM_WEAPONS then weapon=0;es.weapon=0 end if;value.lerpAngles=copy3(es.angles);trail=renderEntity();trail.origin=copy3(value.lerpOrigin);trail.model=weapon;scene(state,"grapple-trail",es.number,trail,emit);ent=renderEntity();ent.origin=copy3(value.lerpOrigin);ent.oldorigin=copy3(value.lerpOrigin);ent.model=weapon;ent.skin=state.time&1;ent.renderfx=RF_NOSHADOW;ent.axis=directionAxis(es.pos.trDelta,0);scene(state,"grapple",es.number,ent,emit);return ent
end function

// CG_Mover
function mover(state,value,emit)
  es=value.currentState;ent=renderEntity();ent.origin=copy3(value.lerpOrigin);ent.oldorigin=copy3(value.lerpOrigin);ent.axis=q.AngleVectors(value.lerpAngles);ent.renderfx=RF_NOSHADOW;ent.skin=(state.time>>6)&1;ent.model=es.modelindex;scene(state,"mover",es.number,ent,emit);if es.modelindex2!=0 then second=renderEntity();second.origin=copy3(ent.origin);second.oldorigin=copy3(ent.oldorigin);second.axis=ent.axis;second.renderfx=ent.renderfx;second.model=es.modelindex2;scene(state,"mover-secondary",es.number,second,emit) end if;return ent
end function

// CG_Beam
function beam(state,value,emit)
  es=value.currentState;ent=renderEntity();ent.reType=RT_BEAM;ent.origin=copy3(es.pos.trBase);ent.oldorigin=copy3(es.origin2);ent.renderfx=RF_NOSHADOW;scene(state,"beam",es.number,ent,emit);return ent
end function

// CG_Portal
function portal(state,value,emit)
  es=value.currentState;ent=renderEntity();ent.reType=RT_PORTALSURFACE;ent.origin=copy3(value.lerpOrigin);ent.oldorigin=copy3(es.origin2);values=bytedirs.values();index=es.eventParm;if index<0 or index>=len(values) then index=0 end if;ent.axis[0]=copy3(values[index]);ent.axis[1]=q.VectorScale(directions.perpendicular(ent.axis[0]),-1.0);ent.axis[2]=q.CrossProduct(ent.axis[0],ent.axis[1]);ent.oldframe=es.powerups;ent.frame=es.frame;ent.skin=n.f32(es.clientNum/256.0*360.0);scene(state,"portal",es.number,ent,emit);return ent
end function

// CG_AdjustPositionForMover
function adjustPositionForMover(input,moverValue,fromTime,toTime)
  if moverValue==void or moverValue.currentState.number<=0 or moverValue.currentState.number>=ENTITYNUM_MAX_NORMAL or moverValue.currentState.eType!=c.ET_MOVER then return copy3(input) end if
  oldOrigin=trajectory.evaluate(moverValue.currentState.pos,fromTime);if oldOrigin is error then return oldOrigin end if;origin=trajectory.evaluate(moverValue.currentState.pos,toTime);if origin is error then return origin end if;return add3(input,sub3(origin,oldOrigin))
end function

// CG_InterpolateEntityPosition
function interpolateEntityPosition(value,snapTime,nextSnapTime,fraction)
  if value==void then return error(7752,"entity required") end if
  current=trajectory.evaluate(value.currentState.pos,snapTime);if current is error then return current end if;next=trajectory.evaluate(value.nextState.pos,nextSnapTime);if next is error then return next end if;value.lerpOrigin=[]
  for axis=0 to 2 value.lerpOrigin=value.lerpOrigin+[n.fadd(current[axis],n.fmul(fraction,n.fsub(next[axis],current[axis])))] end for
  current=trajectory.evaluate(value.currentState.apos,snapTime);if current is error then return current end if;next=trajectory.evaluate(value.nextState.apos,nextSnapTime);if next is error then return next end if;value.lerpAngles=[]
  for axis=0 to 2 value.lerpAngles=value.lerpAngles+[q.LerpAngle(current[axis],next[axis],fraction)] end for;return value
end function

// CG_CalcEntityLerpPositions
function calcEntityLerpPositions(state,value,predicted)
  es=value.currentState;if not state.smoothClients and es.number<MAX_CLIENTS then es.pos.trType=c.TR_INTERPOLATE;value.nextState.pos.trType=c.TR_INTERPOLATE end if
  if value.interpolate and (es.pos.trType==c.TR_INTERPOLATE or (es.pos.trType==c.TR_LINEAR_STOP and es.number<MAX_CLIENTS)) then if state.nextSnap==void then return error(7752,"interpolation without next snapshot") end if;return interpolateEntityPosition(value,state.snap.serverTime,state.nextSnap.serverTime,state.frameInterpolation) end if
  value.lerpOrigin=trajectory.evaluate(es.pos,state.time);if value.lerpOrigin is error then return value.lerpOrigin end if;value.lerpAngles=trajectory.evaluate(es.apos,state.time);if value.lerpAngles is error then return value.lerpAngles end if
  if not predicted and es.groundEntityNum>0 and es.groundEntityNum<len(state.entities) then adjusted=adjustPositionForMover(value.lerpOrigin,state.entities[es.groundEntityNum],state.snap.serverTime,state.time);if adjusted is error then return adjusted end if;value.lerpOrigin=adjusted end if;return value
end function

// CG_TeamBase (baseq3 branch)
function teamBase(state,value,emit)
  es=value.currentState;if state.gametype!=GT_CTF then return void end if;ent=renderEntity();ent.origin=copy3(value.lerpOrigin);ent.lightingOrigin=copy3(value.lerpOrigin);ent.axis=q.AngleVectors(es.angles);ent.model=es.modelindex;kind="team-base-neutral";if es.modelindex==TEAM_RED then kind="team-base-red" else if es.modelindex==TEAM_BLUE then kind="team-base-blue" end if;scene(state,kind,es.number,ent,emit);return ent
end function

// CG_AddCEntity
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

function ensureCent(state,source)
  if source.number<0 or source.number>=len(state.entities) then return error(7753,"entity number out of range") end if;if state.entities[source.number]==void then state.entities[source.number]=cent(source) else state.entities[source.number].currentState=source end if;return state.entities[source.number]
end function

// CG_AddPacketEntities.  Snapshot entities are observed through private Cent
// records.  Boundary decisions are therefore read-only with respect to the VM.
function addPacketEntities(state,snap,nextSnap,predictedEntity,retailActive)
  if state==void or snap==void then return error(7754,"snapshot required") end if;state.snap=snap;state.nextSnap=nextSnap;state.localClient=snap.playerState.clientNum;state.predictedEntity=predictedEntity
  if nextSnap!=void then delta=nextSnap.serverTime-snap.serverTime;if delta==0 then state.frameInterpolation=0.0 else state.frameInterpolation=n.f32((state.time-snap.serverTime)*1.0/delta) end if else state.frameInterpolation=0.0 end if
  if predictedEntity!=void then result=addCEntity(state,predictedEntity,true,retailActive);if result is error then return result end if end if
  local=void;if state.localClient>=0 and state.localClient<len(state.entities) then local=state.entities[state.localClient] end if;if local!=void then calcEntityLerpPositions(state,local,false) end if
  before=len(state.actions);for each source in snap.entities value=ensureCent(state,source);if value is error then return value end if;if nextSnap!=void then for each following in nextSnap.entities if following.number==source.number then value.nextState=following;value.interpolate=true end if end for end if;result=addCEntity(state,value,false,retailActive);if result is error then return result end if end for;return len(state.actions)-before
end function

function clearBoundaries(state) state.actions=[];state.scene=[];state.audio=[];state.soundPositions=[];return void end function
