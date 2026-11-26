// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Semantic native port of the complete code/cgame/cg_marks.c translation unit.
// The Retail source appends cg_particles.c to the mark implementation; those
// particle entry points delegate to the independently ported particle runtime.
package mq3.client.cgame_marks
import mq3.client.cg_local as cgabi

import mq3.client.cgame_particles as particles
import mq3.shared.math as qmath
import mq3.compat.numeric as n
import mq3.compat.transcendental as trans

const MAX_MARK_POLYS=cgabi.MAX_MARK_POLYS
const MAX_MARK_FRAGMENTS=128
const MAX_MARK_POINTS=384
const MAX_VERTS_ON_POLY=cgabi.MAX_VERTS_ON_POLY
const MARK_TOTAL_TIME=10000
const MARK_FADE_TIME=1000
const PI=3.14159265358979323846

/// Stores client game marks vertex record, including `xyz`, `st`, `modulate`.
struct Vertex xyz st modulate end struct
/// Stores client game marks fragment record, including `points`.
struct Fragment points end struct
/// Stores client game marks mark record, including `id`, `active`, `time`, `alphaFade`, `shader`, `color` and additional values.
struct Mark id active time alphaFade shader color verts end struct
// Projection and polygon submission are explicit engine boundaries.  A Retail
// QVM observer records them but leaves dispatched=false, avoiding double draw.
struct Boundary boundary kind shader points projection vertices dispatched temporary end struct
/// Stores client game marks state, including `capacity`, `marks`, `free`, `active`, `time`, `addMarks` and additional values.
struct State capacity marks free active time addMarks retailActive energyMarkShader actions projected rendered suppressed allocated freed evicted errors end struct

/// Creates a three-component zero vector for client game marks.
function zero3() return [0.0,0.0,0.0] end function
/// Copies the X, Y and Z components into a fresh client game marks vector.
/// @param value Sequence read at `value[0]`, `value[1]`, `value[2]`.
function copy3(value) return [value[0],value[1],value[2]] end function
/// Creates a `mq3.client.cgame_marks.Mark` record. Assigns `id` from `id`.
/// @param id Value used to initialize `Mark.id`.
function freshMark(id) return Mark(id,false,0,false,"",[0.0,0.0,0.0,0.0],[]) end function
/// Calls `mq3.client.cgame_marks.State`, `mq3.client.cgame_marks.initMarkPolys` from client game marks `create`. The final path returns `initMarkPolys(state)`.
/// @param capacity Maximum number of entries or bytes accepted by this container.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function create(capacity,retailActive)
  if capacity<=0 then capacity=MAX_MARK_POLYS end if
  state=State(capacity,[],[],[],0,true,retailActive,"energyMarkShader",[],0,0,0,0,0,0,[])
  return initMarkPolys(state)
end function

// CG_InitMarkPolys
/// @param state Mutable client game marks record/storage; this routine assigns `state.marks`, `state.free`, `state.active`, `state.actions` and additional values.
function initMarkPolys(state)
  state.marks=[];state.free=[];state.active=[];state.actions=[];state.projected=0;state.rendered=0;state.suppressed=0;state.allocated=0;state.freed=0;state.evicted=0;state.errors=[]
  for id=0 to state.capacity-1 state.marks=state.marks+[freshMark(id)];state.free=state.free+[id] end for
  return state
end function

/// Evaluates client game marks `removeId` and returns `result` according to its guard/selection conditions.
/// @param values Value used by `for each value in values if value!=id then result=result+[value] end if end for`.
/// @param id Value used by `for each value in values if value!=id then result=result+[value] end if end for`.
function removeId(values,id)
  result=[];for each value in values if value!=id then result=result+[value] end if end for;return result
end function
/// Updates `mark.active`, `mark.time`, `mark.alphaFade`, `mark.shader` and additional values during client game marks `resetMark`.
/// @param mark Mutable client game marks record/storage; this routine assigns `mark.active`, `mark.time`, `mark.alphaFade`, `mark.shader` and additional values.
function resetMark(mark)
  mark.active=false;mark.time=0;mark.alphaFade=false;mark.shader="";mark.color=[0.0,0.0,0.0,0.0];mark.verts=[];return mark
end function

// CG_FreeMarkPoly
/// @param state Mutable client game marks record/storage; this routine assigns `state.errors`, `state.active`, `state.free`, `state.freed`.
/// @param mark Record read through `mark.active`, `mark.id`.
function freeMarkPoly(state,mark)
  if mark==void or not mark.active then state.errors=state.errors+["CG_FreeLocalEntity: not active"];return error(7680,"CG_FreeLocalEntity: not active") end if
  state.active=removeId(state.active,mark.id);resetMark(mark);state.free=[mark.id]+state.free;state.freed=state.freed+1;return void
end function

// CG_AllocMark -- just like Baseq3 this always succeeds.  When the pool is
// full every fragment born in the oldest impact batch is reclaimed together.
/// @param state Mutable client game marks record/storage; this routine assigns `state.evicted`, `state.free`, `state.active`, `state.allocated`.
function allocMark(state)
  if len(state.free)==0 then
    oldest=state.marks[state.active[len(state.active)-1]].time
    while len(state.active)>0 and state.marks[state.active[len(state.active)-1]].time==oldest
      old=state.marks[state.active[len(state.active)-1]];freeMarkPoly(state,old);state.evicted=state.evicted+1
    end while
  end if
  id=state.free[0];remaining=[];if len(state.free)>1 then for i=1 to len(state.free)-1 remaining=remaining+[state.free[i]] end for end if;state.free=remaining
  mark=state.marks[id];resetMark(mark);mark.active=true;state.active=[id]+state.active;state.allocated=state.allocated+1;return mark
end function

/// Calls `mq3.shared.math.DotProduct`, `mq3.shared.math.VectorNormalize` from client game marks `perpendicular`. The final path returns `dst`.
/// @param normal Surface-normal vector used to orient or offset the effect.
function perpendicular(normal)
  minelem=1.0;pos=0
  for i=0 to 2 value=normal[i];if value<0.0 then value=0.0-value end if;if value<minelem then pos=i;minelem=value end if end for
  temp=[0.0,0.0,0.0];temp[pos]=1.0;dot=qmath.DotProduct(temp,normal);dst=[temp[0]-dot*normal[0],temp[1]-dot*normal[1],temp[2]-dot*normal[2]];qmath.VectorNormalize(dst);return dst
end function
/// Calls `mq3.compat.transcendental.cos`, `mq3.compat.transcendental.sin`, `mq3.shared.math.CrossProduct` and additional helpers from client game marks `rotateAround`.
/// @param axis Sequence read at `axis[0]`, `axis[1]`, `axis[2]`.
/// @param point Sequence read at `point[0]`, `point[1]`, `point[2]`.
/// @param degrees Value used by `radians=degrees*PI/180.0`.
function rotateAround(axis,point,degrees)
  radians=degrees*PI/180.0;c=trans.cos(radians);s=trans.sin(radians);cross=qmath.CrossProduct(axis,point);dot=qmath.DotProduct(axis,point)
  return [point[0]*c+cross[0]*s+axis[0]*dot*(1.0-c),point[1]*c+cross[1]*s+axis[1]*dot*(1.0-c),point[2]*c+cross[2]*s+axis[2]*dot*(1.0-c)]
end function
/// Calls `mq3.compat.numeric.trunc32` from client game marks `byteColor`. The final path returns `result`.
/// @param value Value used by `result=n.trunc32(value*255.0)`.
function byteColor(value) result=n.trunc32(value*255.0);if result<0 then result=0 else if result>255 then result=255 end if;return result end function
/// Calls `mq3.client.cgame_marks.Vertex`, `mq3.client.cgame_marks.copy3`, `mq3.shared.math.DotProduct` from client game marks `makeVertex`.
/// @param point Sequence read at `point[0]`, `point[1]`, `point[2]`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param axis1 Value used by `return Vertex(copy3(point),[0.5+qmath.DotProduct(delta,axis1)*scale,0.5+qmath.DotProduct(delta,axis2)*scale],[color[0],color[1],color[2],color...`.
/// @param axis2 Value used by `return Vertex(copy3(point),[0.5+qmath.DotProduct(delta,axis1)*scale,0.5+qmath.DotProduct(delta,axis2)*scale],[color[0],color[1],color[2],color...`.
/// @param scale Value used by `return Vertex(copy3(point),[0.5+qmath.DotProduct(delta,axis1)*scale,0.5+qmath.DotProduct(delta,axis2)*scale],[color[0],color[1],color[2],color...`.
/// @param color Sequence read at `color[0]`, `color[1]`, `color[2]`, `color[3]`.
function makeVertex(point,origin,axis1,axis2,scale,color)
  delta=[point[0]-origin[0],point[1]-origin[1],point[2]-origin[2]]
  return Vertex(copy3(point),[0.5+qmath.DotProduct(delta,axis1)*scale,0.5+qmath.DotProduct(delta,axis2)*scale],[color[0],color[1],color[2],color[3]])
end function
/// Appends a client game marks action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.
/// @param state Mutable client game marks record/storage; this routine assigns `state.actions`, `state.rendered`, `state.suppressed`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param shader Shader handle or asset name selected for this draw operation.
/// @param points Value used by `value=Boundary("cgame-marks",kind,shader,points,projection,vertices,dispatched,temporary)`.
/// @param projection Projection parameters used to convert camera-space geometry to screen coordinates.
/// @param vertices Value used by `value=Boundary("cgame-marks",kind,shader,points,projection,vertices,dispatched,temporary)`.
/// @param temporary Value used by `value=Boundary("cgame-marks",kind,shader,points,projection,vertices,dispatched,temporary)`.
function pushBoundary(state,kind,shader,points,projection,vertices,temporary)
  dispatched=not state.retailActive;value=Boundary("cgame-marks",kind,shader,points,projection,vertices,dispatched,temporary);state.actions=state.actions+[value]
  if dispatched then state.rendered=state.rendered+1 else state.suppressed=state.suppressed+1 end if;return value
end function
/// Builds the client game marks `originalQuad` sequence from `[[origin[0]-radius*axis1[0]-radius*axis2[0],origin[1]-radius*axis1[1]-radius*axis2[1],origin[2]-radius*axis1[2]-radius*axis2[2]],[origin[0]+radius*axis1[0]-radius*axis2[0],origin[1]+radius*axis1[1]...`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param axis1 Sequence read at `axis1[0]`, `axis1[1]`, `axis1[2]`.
/// @param axis2 Sequence read at `axis2[0]`, `axis2[1]`, `axis2[2]`.
/// @param radius Radius used by the spatial or visual calculation.
function originalQuad(origin,axis1,axis2,radius)
  return [[origin[0]-radius*axis1[0]-radius*axis2[0],origin[1]-radius*axis1[1]-radius*axis2[1],origin[2]-radius*axis1[2]-radius*axis2[2]],[origin[0]+radius*axis1[0]-radius*axis2[0],origin[1]+radius*axis1[1]-radius*axis2[1],origin[2]+radius*axis1[2]-radius*axis2[2]],[origin[0]+radius*axis1[0]+radius*axis2[0],origin[1]+radius*axis1[1]+radius*axis2[1],origin[2]+radius*axis1[2]+radius*axis2[2]],[origin[0]-radius*axis1[0]+radius*axis2[0],origin[1]-radius*axis1[1]+radius*axis2[1],origin[2]-radius*axis1[2]+radius*axis2[2]]]
end function

// CG_ImpactMark.  fragments carries trap_CM_MarkFragments output.  Passing
// void keeps a usable native fallback by submitting the unclipped source quad;
// production collision integrations pass clipped Fragment values here.
/// @param state Mutable client game marks record/storage; this routine assigns `state.errors`, `state.actions`, `state.projected`, `state.suppressed`.
/// @param shader Value assigned to `mark.shader`.
/// @param origin World-space origin of the entity, sound or rendered effect.
/// @param direction Direction vector used by the spatial calculation.
/// @param orientation Value used by `axis2=rotateAround(axis0,axisSeed,orientation)`.
/// @param red Red color component.
/// @param green Green color component.
/// @param blue Blue color component.
/// @param alpha Opacity or blend weight used by the visual effect.
/// @param alphaFade Value assigned to `mark.alphaFade`.
/// @param radius Radius used by the spatial or visual calculation.
/// @param temporary Value used by `if temporary then pushBoundary(state,"poly",shader,[],[],verts,true)`.
/// @param fragments Sequence read at `fragments[i]`.
function impactMark(state,shader,origin,direction,orientation,red,green,blue,alpha,alphaFade,radius,temporary,fragments)
  if not state.addMarks then return [] end if
  if radius<=0.0 then state.errors=state.errors+["CG_ImpactMark called with <= 0 radius"];return error(7681,"CG_ImpactMark called with <= 0 radius") end if
  axis0=qmath.VectorNormalize2(direction);axisSeed=perpendicular(axis0);axis2=rotateAround(axis0,axisSeed,orientation);axis1=qmath.CrossProduct(axis0,axis2);quad=originalQuad(origin,axis1,axis2,radius);projection=[direction[0]*-20.0,direction[1]*-20.0,direction[2]*-20.0]
  projectionDispatched=not state.retailActive;request=Boundary("cgame-marks","mark-fragments","",quad,projection,[],projectionDispatched,false);state.actions=state.actions+[request];state.projected=state.projected+1;if not projectionDispatched then state.suppressed=state.suppressed+1 end if
  if fragments==void then fragments=[Fragment(quad)] end if
  scale=0.5/radius;color=[byteColor(red),byteColor(green),byteColor(blue),byteColor(alpha)];created=[];usedPoints=0;limit=len(fragments);if limit>MAX_MARK_FRAGMENTS then limit=MAX_MARK_FRAGMENTS end if
  if limit>0 then for i=0 to limit-1
    points=fragments[i].points;count=len(points);if count>MAX_VERTS_ON_POLY then count=MAX_VERTS_ON_POLY end if;if usedPoints+count>MAX_MARK_POINTS then count=MAX_MARK_POINTS-usedPoints end if;if count<0 then count=0 end if;usedPoints=usedPoints+count;verts=[]
    if count>0 then for j=0 to count-1 verts=verts+[makeVertex(points[j],origin,axis1,axis2,scale,color)] end for end if
    if temporary then pushBoundary(state,"poly",shader,[],[],verts,true)
    else mark=allocMark(state);mark.time=state.time;mark.alphaFade=alphaFade;mark.shader=shader;mark.color=[red,green,blue,alpha];mark.verts=verts;created=created+[mark] end if
  end for end if
  return created
end function

// CG_AddMarks
/// @param state Mutable client game marks record/storage; this routine assigns `state.time`.
/// @param time Value assigned to `state.time`.
function addMarks(state,time)
  state.time=time;if not state.addMarks then return [] end if;frame=[];ids=[];for each id in state.active ids=ids+[id] end for
  for each id in ids mark=state.marks[id];if mark.active then
    if state.time>mark.time+MARK_TOTAL_TIME then freeMarkPoly(state,mark)
    else
      if mark.shader==state.energyMarkShader then fade=450-n.trunc32(450.0*(state.time-mark.time)/3000.0);if fade<255 then if fade<0 then fade=0 end if;if len(mark.verts)>0 and mark.verts[0].modulate[0]!=0 then for each vert in mark.verts vert.modulate[0]=n.trunc32(mark.color[0]*fade);vert.modulate[1]=n.trunc32(mark.color[1]*fade);vert.modulate[2]=n.trunc32(mark.color[2]*fade) end for end if end if end if
      remaining=mark.time+MARK_TOTAL_TIME-state.time;if remaining<MARK_FADE_TIME then fade=n.trunc32(255.0*remaining/MARK_FADE_TIME);if mark.alphaFade then for each vert in mark.verts vert.modulate[3]=fade end for else for each vert in mark.verts vert.modulate[0]=n.trunc32(mark.color[0]*fade);vert.modulate[1]=n.trunc32(mark.color[1]*fade);vert.modulate[2]=n.trunc32(mark.color[2]*fade) end for end if end if
      frame=frame+[pushBoundary(state,"poly",mark.shader,[],[],mark.verts,false)]
    end if
  end if end for;return frame
end function

// The remaining 23 candidates belong to the appended cg_particles.c body.
// Keep one canonical particle implementation while exposing every original
// translation-unit entry point from this complete module.
/// @param state Argument 1 of `mq3.client.cgame_particles.clearParticles`.
function clearParticles(state) return particles.clearParticles(state) end function
/// Adapts `mq3.client.cgame_particles.addParticleToScene` to client game marks `addParticleToScene`, returning its result for `state, p, origin, alpha`.
/// @param state Argument 1 of `mq3.client.cgame_particles.addParticleToScene`.
/// @param p Argument 2 of `mq3.client.cgame_particles.addParticleToScene`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.addParticleToScene`.
/// @param alpha Opacity or blend weight used by the visual effect. Forwarded to `mq3.client.cgame_particles.addParticleToScene`.
function addParticleToScene(state,p,origin,alpha) return particles.addParticleToScene(state,p,origin,alpha) end function
/// Adapts `mq3.client.cgame_particles.addParticles` to client game marks `addParticles`, returning its result for `state, time, vieworg, vforward, vright, vup`.
/// @param state Argument 1 of `mq3.client.cgame_particles.addParticles`.
/// @param time Argument 2 of `mq3.client.cgame_particles.addParticles`.
/// @param vieworg Argument 3 of `mq3.client.cgame_particles.addParticles`.
/// @param vforward Argument 4 of `mq3.client.cgame_particles.addParticles`.
/// @param vright Argument 5 of `mq3.client.cgame_particles.addParticles`.
/// @param vup Argument 6 of `mq3.client.cgame_particles.addParticles`.
function addParticles(state,time,vieworg,vforward,vright,vup) return particles.addParticles(state,time,vieworg,vforward,vright,vup) end function
/// Adapts `mq3.client.cgame_particles.particleSnowFlurry` to client game marks `particleSnowFlurry`, returning its result for `state, shader, cent`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleSnowFlurry`.
/// @param shader Argument 2 of `mq3.client.cgame_particles.particleSnowFlurry`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleSnowFlurry`.
function particleSnowFlurry(state,shader,cent) return particles.particleSnowFlurry(state,shader,cent) end function
/// Adapts `mq3.client.cgame_particles.particleSnow` to client game marks `particleSnow`, returning its result for `state, shader, origin, origin2, turb, range, snum`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleSnow`.
/// @param shader Argument 2 of `mq3.client.cgame_particles.particleSnow`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleSnow`.
/// @param origin2 Second world-space endpoint of the effect. Forwarded to `mq3.client.cgame_particles.particleSnow`.
/// @param turb Argument 5 of `mq3.client.cgame_particles.particleSnow`.
/// @param range Argument 6 of `mq3.client.cgame_particles.particleSnow`.
/// @param snum Argument 7 of `mq3.client.cgame_particles.particleSnow`.
function particleSnow(state,shader,origin,origin2,turb,range,snum) return particles.particleSnow(state,shader,origin,origin2,turb,range,snum) end function
/// Adapts `mq3.client.cgame_particles.particleBubble` to client game marks `particleBubble`, returning its result for `state, shader, origin, origin2, turb, range, snum`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleBubble`.
/// @param shader Argument 2 of `mq3.client.cgame_particles.particleBubble`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleBubble`.
/// @param origin2 Second world-space endpoint of the effect. Forwarded to `mq3.client.cgame_particles.particleBubble`.
/// @param turb Argument 5 of `mq3.client.cgame_particles.particleBubble`.
/// @param range Argument 6 of `mq3.client.cgame_particles.particleBubble`.
/// @param snum Argument 7 of `mq3.client.cgame_particles.particleBubble`.
function particleBubble(state,shader,origin,origin2,turb,range,snum) return particles.particleBubble(state,shader,origin,origin2,turb,range,snum) end function
/// Adapts `mq3.client.cgame_particles.particleSmoke` to client game marks `particleSmoke`, returning its result for `state, shader, cent`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleSmoke`.
/// @param shader Argument 2 of `mq3.client.cgame_particles.particleSmoke`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleSmoke`.
function particleSmoke(state,shader,cent) return particles.particleSmoke(state,shader,cent) end function
/// Adapts `mq3.client.cgame_particles.particleBulletDebris` to client game marks `particleBulletDebris`, returning its result for `state, origin, velocity, duration, tracerShader`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleBulletDebris`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleBulletDebris`.
/// @param velocity Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_particles.particleBulletDebris`.
/// @param duration Lifetime or interval in the same units as this operation's clock. Forwarded to `mq3.client.cgame_particles.particleBulletDebris`.
/// @param tracerShader Argument 5 of `mq3.client.cgame_particles.particleBulletDebris`.
function particleBulletDebris(state,origin,velocity,duration,tracerShader) return particles.particleBulletDebris(state,origin,velocity,duration,tracerShader) end function
/// Adapts `mq3.client.cgame_particles.particleExplosion` to client game marks `particleExplosion`, returning its result for `state, animName, origin, velocity, duration, sizeStart, sizeEnd`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleExplosion`.
/// @param animName Argument 2 of `mq3.client.cgame_particles.particleExplosion`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleExplosion`.
/// @param velocity Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_particles.particleExplosion`.
/// @param duration Lifetime or interval in the same units as this operation's clock. Forwarded to `mq3.client.cgame_particles.particleExplosion`.
/// @param sizeStart Argument 6 of `mq3.client.cgame_particles.particleExplosion`.
/// @param sizeEnd Argument 7 of `mq3.client.cgame_particles.particleExplosion`.
function particleExplosion(state,animName,origin,velocity,duration,sizeStart,sizeEnd) return particles.particleExplosion(state,animName,origin,velocity,duration,sizeStart,sizeEnd) end function
/// Adapts `mq3.client.cgame_particles.addParticleShrapnel` to client game marks `addParticleShrapnel`, returning its result for `state, localEntity`.
/// @param state Argument 1 of `mq3.client.cgame_particles.addParticleShrapnel`.
/// @param localEntity Argument 2 of `mq3.client.cgame_particles.addParticleShrapnel`.
function addParticleShrapnel(state,localEntity) return particles.addParticleShrapnel(state,localEntity) end function
/// Adapts `mq3.client.cgame_particles.newParticleArea` to client game marks `newParticleArea`, returning its result for `state, text, shader`.
/// @param state Argument 1 of `mq3.client.cgame_particles.newParticleArea`.
/// @param text Argument 2 of `mq3.client.cgame_particles.newParticleArea`.
/// @param shader Argument 3 of `mq3.client.cgame_particles.newParticleArea`.
function newParticleArea(state,text,shader) return particles.newParticleArea(state,text,shader) end function
/// Adapts `mq3.client.cgame_particles.snowLink` to client game marks `snowLink`, returning its result for `state, id, particleOn`.
/// @param state Argument 1 of `mq3.client.cgame_particles.snowLink`.
/// @param id Argument 2 of `mq3.client.cgame_particles.snowLink`.
/// @param particleOn Argument 3 of `mq3.client.cgame_particles.snowLink`.
function snowLink(state,id,particleOn) return particles.snowLink(state,id,particleOn) end function
/// Adapts `mq3.client.cgame_particles.particleImpactSmokePuff` to client game marks `particleImpactSmokePuff`, returning its result for `state, shader, origin`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleImpactSmokePuff`.
/// @param shader Argument 2 of `mq3.client.cgame_particles.particleImpactSmokePuff`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleImpactSmokePuff`.
function particleImpactSmokePuff(state,shader,origin) return particles.particleImpactSmokePuff(state,shader,origin) end function
/// Adapts `mq3.client.cgame_particles.particleBleed` to client game marks `particleBleed`, returning its result for `state, shader, start, direction, fleshEntityNum, duration`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleBleed`.
/// @param shader Argument 2 of `mq3.client.cgame_particles.particleBleed`.
/// @param start Argument 3 of `mq3.client.cgame_particles.particleBleed`.
/// @param direction Direction vector used by the spatial calculation. Forwarded to `mq3.client.cgame_particles.particleBleed`.
/// @param fleshEntityNum Argument 5 of `mq3.client.cgame_particles.particleBleed`.
/// @param duration Lifetime or interval in the same units as this operation's clock. Forwarded to `mq3.client.cgame_particles.particleBleed`.
function particleBleed(state,shader,start,direction,fleshEntityNum,duration) return particles.particleBleed(state,shader,start,direction,fleshEntityNum,duration) end function
/// Adapts `mq3.client.cgame_particles.particleOilParticle` to client game marks `particleOilParticle`, returning its result for `state, shader, cent`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleOilParticle`.
/// @param shader Argument 2 of `mq3.client.cgame_particles.particleOilParticle`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleOilParticle`.
function particleOilParticle(state,shader,cent) return particles.particleOilParticle(state,shader,cent) end function
/// Adapts `mq3.client.cgame_particles.particleOilSlick` to client game marks `particleOilSlick`, returning its result for `state, shader, cent`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleOilSlick`.
/// @param shader Argument 2 of `mq3.client.cgame_particles.particleOilSlick`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleOilSlick`.
function particleOilSlick(state,shader,cent) return particles.particleOilSlick(state,shader,cent) end function
/// Adapts `mq3.client.cgame_particles.oilSlickRemove` to client game marks `oilSlickRemove`, returning its result for `state, cent`.
/// @param state Argument 1 of `mq3.client.cgame_particles.oilSlickRemove`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.oilSlickRemove`.
function oilSlickRemove(state,cent) return particles.oilSlickRemove(state,cent) end function
/// Adapts `mq3.client.cgame_particles.validBloodPool` to client game marks `validBloodPool`, returning its result for `start, traceFn, context`.
/// @param start Argument 1 of `mq3.client.cgame_particles.validBloodPool`.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment. Forwarded to `mq3.client.cgame_particles.validBloodPool`.
/// @param context Argument 3 of `mq3.client.cgame_particles.validBloodPool`.
function validBloodPool(start,traceFn,context) return particles.validBloodPool(start,traceFn,context) end function
/// Adapts `mq3.client.cgame_particles.bloodPool` to client game marks `bloodPool`, returning its result for `state, shader, trace, traceFn, context`.
/// @param state Argument 1 of `mq3.client.cgame_particles.bloodPool`.
/// @param shader Argument 2 of `mq3.client.cgame_particles.bloodPool`.
/// @param trace Argument 3 of `mq3.client.cgame_particles.bloodPool`.
/// @param traceFn Collision-trace callback used to test the requested movement or visibility segment. Forwarded to `mq3.client.cgame_particles.bloodPool`.
/// @param context Argument 5 of `mq3.client.cgame_particles.bloodPool`.
function bloodPool(state,shader,trace,traceFn,context) return particles.bloodPool(state,shader,trace,traceFn,context) end function
/// Adapts `mq3.client.cgame_particles.particleBloodCloud` to client game marks `particleBloodCloud`, returning its result for `state, cent, origin, direction, smokeShader`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleBloodCloud`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleBloodCloud`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleBloodCloud`.
/// @param direction Direction vector used by the spatial calculation. Forwarded to `mq3.client.cgame_particles.particleBloodCloud`.
/// @param smokeShader Argument 5 of `mq3.client.cgame_particles.particleBloodCloud`.
function particleBloodCloud(state,cent,origin,direction,smokeShader) return particles.particleBloodCloud(state,cent,origin,direction,smokeShader) end function
/// Adapts `mq3.client.cgame_particles.particleSparks` to client game marks `particleSparks`, returning its result for `state, origin, velocity, duration, x, y, speed, tracerShader`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleSparks`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleSparks`.
/// @param velocity Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_particles.particleSparks`.
/// @param duration Lifetime or interval in the same units as this operation's clock. Forwarded to `mq3.client.cgame_particles.particleSparks`.
/// @param x Argument 5 of `mq3.client.cgame_particles.particleSparks`.
/// @param y Argument 6 of `mq3.client.cgame_particles.particleSparks`.
/// @param speed Argument 7 of `mq3.client.cgame_particles.particleSparks`.
/// @param tracerShader Argument 8 of `mq3.client.cgame_particles.particleSparks`.
function particleSparks(state,origin,velocity,duration,x,y,speed,tracerShader) return particles.particleSparks(state,origin,velocity,duration,x,y,speed,tracerShader) end function
/// Adapts `mq3.client.cgame_particles.particleDust` to client game marks `particleDust`, returning its result for `state, cent, origin, direction, smokeShader`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleDust`.
/// @param cent Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleDust`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleDust`.
/// @param direction Direction vector used by the spatial calculation. Forwarded to `mq3.client.cgame_particles.particleDust`.
/// @param smokeShader Argument 5 of `mq3.client.cgame_particles.particleDust`.
function particleDust(state,cent,origin,direction,smokeShader) return particles.particleDust(state,cent,origin,direction,smokeShader) end function
/// Adapts `mq3.client.cgame_particles.particleMisc` to client game marks `particleMisc`, returning its result for `state, shader, origin, size, duration, alpha`.
/// @param state Argument 1 of `mq3.client.cgame_particles.particleMisc`.
/// @param shader Argument 2 of `mq3.client.cgame_particles.particleMisc`.
/// @param origin World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleMisc`.
/// @param size Argument 4 of `mq3.client.cgame_particles.particleMisc`.
/// @param duration Lifetime or interval in the same units as this operation's clock. Forwarded to `mq3.client.cgame_particles.particleMisc`.
/// @param alpha Opacity or blend weight used by the visual effect. Forwarded to `mq3.client.cgame_particles.particleMisc`.
function particleMisc(state,shader,origin,size,duration,alpha) return particles.particleMisc(state,shader,origin,size,duration,alpha) end function
