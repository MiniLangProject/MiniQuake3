// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Semantic native port of the complete code/cgame/cg_marks.c translation unit.
// The Retail source appends cg_particles.c to the mark implementation; those
// particle entry points delegate to the independently ported particle runtime.
package mq3.client.cgame_marks

import mq3.client.cgame_particles as particles
import mq3.shared.math as qmath
import mq3.compat.numeric as n
import mq3.compat.transcendental as trans

const MAX_MARK_POLYS=256
const MAX_MARK_FRAGMENTS=128
const MAX_MARK_POINTS=384
const MAX_VERTS_ON_POLY=64
const MARK_TOTAL_TIME=10000
const MARK_FADE_TIME=1000
const PI=3.14159265358979323846

struct Vertex xyz st modulate end struct
struct Fragment points end struct
struct Mark id active time alphaFade shader color verts end struct
// Projection and polygon submission are explicit engine boundaries.  A Retail
// QVM observer records them but leaves dispatched=false, avoiding double draw.
struct Boundary boundary kind shader points projection vertices dispatched temporary end struct
struct State capacity marks free active time addMarks retailActive energyMarkShader actions projected rendered suppressed allocated freed evicted errors end struct

function zero3() return [0.0,0.0,0.0] end function
function copy3(value) return [value[0],value[1],value[2]] end function
function freshMark(id) return Mark(id,false,0,false,"",[0.0,0.0,0.0,0.0],[]) end function
function create(capacity,retailActive)
  if capacity<=0 then capacity=MAX_MARK_POLYS end if
  state=State(capacity,[],[],[],0,true,retailActive,"energyMarkShader",[],0,0,0,0,0,0,[])
  return initMarkPolys(state)
end function

// CG_InitMarkPolys
function initMarkPolys(state)
  state.marks=[];state.free=[];state.active=[];state.actions=[];state.projected=0;state.rendered=0;state.suppressed=0;state.allocated=0;state.freed=0;state.evicted=0;state.errors=[]
  for id=0 to state.capacity-1 state.marks=state.marks+[freshMark(id)];state.free=state.free+[id] end for
  return state
end function

function removeId(values,id)
  result=[];for each value in values if value!=id then result=result+[value] end if end for;return result
end function
function resetMark(mark)
  mark.active=false;mark.time=0;mark.alphaFade=false;mark.shader="";mark.color=[0.0,0.0,0.0,0.0];mark.verts=[];return mark
end function

// CG_FreeMarkPoly
function freeMarkPoly(state,mark)
  if mark==void or not mark.active then state.errors=state.errors+["CG_FreeLocalEntity: not active"];return error(7680,"CG_FreeLocalEntity: not active") end if
  state.active=removeId(state.active,mark.id);resetMark(mark);state.free=[mark.id]+state.free;state.freed=state.freed+1;return void
end function

// CG_AllocMark -- just like Baseq3 this always succeeds.  When the pool is
// full every fragment born in the oldest impact batch is reclaimed together.
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

function perpendicular(normal)
  minelem=1.0;pos=0
  for i=0 to 2 value=normal[i];if value<0.0 then value=0.0-value end if;if value<minelem then pos=i;minelem=value end if end for
  temp=[0.0,0.0,0.0];temp[pos]=1.0;dot=qmath.DotProduct(temp,normal);dst=[temp[0]-dot*normal[0],temp[1]-dot*normal[1],temp[2]-dot*normal[2]];qmath.VectorNormalize(dst);return dst
end function
function rotateAround(axis,point,degrees)
  radians=degrees*PI/180.0;c=trans.cos(radians);s=trans.sin(radians);cross=qmath.CrossProduct(axis,point);dot=qmath.DotProduct(axis,point)
  return [point[0]*c+cross[0]*s+axis[0]*dot*(1.0-c),point[1]*c+cross[1]*s+axis[1]*dot*(1.0-c),point[2]*c+cross[2]*s+axis[2]*dot*(1.0-c)]
end function
function byteColor(value) result=n.trunc32(value*255.0);if result<0 then result=0 else if result>255 then result=255 end if;return result end function
function makeVertex(point,origin,axis1,axis2,scale,color)
  delta=[point[0]-origin[0],point[1]-origin[1],point[2]-origin[2]]
  return Vertex(copy3(point),[0.5+qmath.DotProduct(delta,axis1)*scale,0.5+qmath.DotProduct(delta,axis2)*scale],[color[0],color[1],color[2],color[3]])
end function
function pushBoundary(state,kind,shader,points,projection,vertices,temporary)
  dispatched=not state.retailActive;value=Boundary("cgame-marks",kind,shader,points,projection,vertices,dispatched,temporary);state.actions=state.actions+[value]
  if dispatched then state.rendered=state.rendered+1 else state.suppressed=state.suppressed+1 end if;return value
end function
function originalQuad(origin,axis1,axis2,radius)
  return [[origin[0]-radius*axis1[0]-radius*axis2[0],origin[1]-radius*axis1[1]-radius*axis2[1],origin[2]-radius*axis1[2]-radius*axis2[2]],[origin[0]+radius*axis1[0]-radius*axis2[0],origin[1]+radius*axis1[1]-radius*axis2[1],origin[2]+radius*axis1[2]-radius*axis2[2]],[origin[0]+radius*axis1[0]+radius*axis2[0],origin[1]+radius*axis1[1]+radius*axis2[1],origin[2]+radius*axis1[2]+radius*axis2[2]],[origin[0]-radius*axis1[0]+radius*axis2[0],origin[1]-radius*axis1[1]+radius*axis2[1],origin[2]-radius*axis1[2]+radius*axis2[2]]]
end function

// CG_ImpactMark.  fragments carries trap_CM_MarkFragments output.  Passing
// void keeps a usable native fallback by submitting the unclipped source quad;
// production collision integrations pass clipped Fragment values here.
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
function clearParticles(state) return particles.clearParticles(state) end function
function addParticleToScene(state,p,origin,alpha) return particles.addParticleToScene(state,p,origin,alpha) end function
function addParticles(state,time,vieworg,vforward,vright,vup) return particles.addParticles(state,time,vieworg,vforward,vright,vup) end function
function particleSnowFlurry(state,shader,cent) return particles.particleSnowFlurry(state,shader,cent) end function
function particleSnow(state,shader,origin,origin2,turb,range,snum) return particles.particleSnow(state,shader,origin,origin2,turb,range,snum) end function
function particleBubble(state,shader,origin,origin2,turb,range,snum) return particles.particleBubble(state,shader,origin,origin2,turb,range,snum) end function
function particleSmoke(state,shader,cent) return particles.particleSmoke(state,shader,cent) end function
function particleBulletDebris(state,origin,velocity,duration,tracerShader) return particles.particleBulletDebris(state,origin,velocity,duration,tracerShader) end function
function particleExplosion(state,animName,origin,velocity,duration,sizeStart,sizeEnd) return particles.particleExplosion(state,animName,origin,velocity,duration,sizeStart,sizeEnd) end function
function addParticleShrapnel(state,localEntity) return particles.addParticleShrapnel(state,localEntity) end function
function newParticleArea(state,text,shader) return particles.newParticleArea(state,text,shader) end function
function snowLink(state,id,particleOn) return particles.snowLink(state,id,particleOn) end function
function particleImpactSmokePuff(state,shader,origin) return particles.particleImpactSmokePuff(state,shader,origin) end function
function particleBleed(state,shader,start,direction,fleshEntityNum,duration) return particles.particleBleed(state,shader,start,direction,fleshEntityNum,duration) end function
function particleOilParticle(state,shader,cent) return particles.particleOilParticle(state,shader,cent) end function
function particleOilSlick(state,shader,cent) return particles.particleOilSlick(state,shader,cent) end function
function oilSlickRemove(state,cent) return particles.oilSlickRemove(state,cent) end function
function validBloodPool(start,traceFn,context) return particles.validBloodPool(start,traceFn,context) end function
function bloodPool(state,shader,trace,traceFn,context) return particles.bloodPool(state,shader,trace,traceFn,context) end function
function particleBloodCloud(state,cent,origin,direction,smokeShader) return particles.particleBloodCloud(state,cent,origin,direction,smokeShader) end function
function particleSparks(state,origin,velocity,duration,x,y,speed,tracerShader) return particles.particleSparks(state,origin,velocity,duration,x,y,speed,tracerShader) end function
function particleDust(state,cent,origin,direction,smokeShader) return particles.particleDust(state,cent,origin,direction,smokeShader) end function
function particleMisc(state,shader,origin,size,duration,alpha) return particles.particleMisc(state,shader,origin,size,duration,alpha) end function
