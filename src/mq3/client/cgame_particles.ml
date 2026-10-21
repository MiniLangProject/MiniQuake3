// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Semantic native port of code/cgame/cg_particles.c. Renderer calls are typed
// boundary actions. When the Retail cgame QVM is active they remain observable
// but are not dispatched, preventing duplicate particles.
package mq3.client.cgame_particles

import mq3.shared.math as qmath
import mq3.compat.numeric as n
import mq3.compat.transcendental as trans
import std.string as strings

const BLOODRED=2
const EMISIVEFADE=3
const GREY75=4
const P_NONE=0
const P_WEATHER=1
const P_FLAT=2
const P_SMOKE=3
const P_ROTATE=4
const P_WEATHER_TURBULENT=5
const P_ANIM=6
const P_BAT=7
const P_BLEED=8
const P_FLAT_SCALEUP=9
const P_FLAT_SCALEUP_FADE=10
const P_WEATHER_FLURRY=11
const P_SMOKE_IMPACT=12
const P_BUBBLE=13
const P_BUBBLE_TURBULENT=14
const P_SPRITE=15
const PARTICLE_GRAVITY=40.0
const MAX_PARTICLES=8192
const MAX_ENTITIES=1024
const CONTENTS_SOLID=1
const PI=3.14159265358979323846

struct Particle id active time endtime org vel accel color colorvel alpha alphavel type shader height width endheight endwidth start finish startfade rotate snum link shaderAnim roll accumroll end struct
struct RenderAction boundary kind particle shader vertexCount vertices texcoords origin width height alpha color frame dispatched end struct
struct State capacity particles free active time oldtime roll initialized vieworg vforward vright vup retailActive ragePro randomSeed randomInts randomAt actions registrations rendered suppressed freed dropped errors end struct

function zero3() return [0.0,0.0,0.0] end function
function copy3(value) return [value[0],value[1],value[2]] end function
function shaderAnimNames() return ["explode1","blacksmokeanim","twiltb2","expblue","blacksmokeanimb","blood"] end function
function shaderAnimCounts() return [23,25,45,25,23,5] end function
function shaderAnimRatios() return [n.f32(1.405),1.0,1.0,1.0,1.0,1.0] end function

function newParticle(id)
  return Particle(id,false,0,0,zero3(),zero3(),zero3(),0,0.0,0.0,0.0,P_NONE,"",0.0,0.0,0.0,0.0,0.0,0.0,0,false,0,false,0,0.0,0.0)
end function

function create(capacity,retailActive)
  if capacity<=0 then capacity=MAX_PARTICLES end if
  return State(capacity,[],[],[],0,0,0.0,false,zero3(),[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0],retailActive,false,0x92,[],0,[],[],0,0,0,0,[])
end function

function setRandomInts(state,values) state.randomInts=values;state.randomAt=0;return void end function
function randInt(state)
  if state.randomAt<len(state.randomInts) then value=state.randomInts[state.randomAt];state.randomAt=state.randomAt+1;return value end if
  state.randomSeed=n.add32(n.mul32(state.randomSeed,214013),2531011);return (n.u32(state.randomSeed)>>16)&32767
end function
function randomFloat(state) return n.fdiv(randInt(state),32767.0) end function
function crandom(state) return 2.0*(randomFloat(state)-0.5) end function

function resetParticle(p)
  fresh=newParticle(p.id);p.active=false;p.time=0;p.endtime=0;p.org=fresh.org;p.vel=fresh.vel;p.accel=fresh.accel;p.color=0;p.colorvel=0.0;p.alpha=0.0;p.alphavel=0.0;p.type=P_NONE;p.shader="";p.height=0.0;p.width=0.0;p.endheight=0.0;p.endwidth=0.0;p.start=0.0;p.finish=0.0;p.startfade=0;p.rotate=false;p.snum=0;p.link=false;p.shaderAnim=0;p.roll=0.0;p.accumroll=0.0;return p
end function

// CG_ClearParticles
function clearParticles(state)
  state.particles=[];state.free=[];state.active=[];state.actions=[];state.registrations=[]
  for index=0 to state.capacity-1 state.particles=state.particles+[newParticle(index)];state.free=state.free+[index] end for
  names=shaderAnimNames();counts=shaderAnimCounts()
  for i=0 to len(names)-1 for j=0 to counts[i]-1 state.registrations=state.registrations+[names[i]+str(j+1)] end for end for
  state.oldtime=state.time;state.roll=0.0;state.initialized=true;return state
end function

function allocParticle(state)
  if len(state.free)==0 then state.dropped=state.dropped+1;return void end if
  id=state.free[0];rest=[];if len(state.free)>1 then for i=1 to len(state.free)-1 rest=rest+[state.free[i]] end for end if;state.free=rest
  p=resetParticle(state.particles[id]);p.active=true;state.active=[id]+state.active;return p
end function

function freeParticle(state,p)
  if p==void or not p.active then return false end if
  kept=[];for each id in state.active if id!=p.id then kept=kept+[id] end if end for;state.active=kept;p.active=false;p.type=P_NONE;p.color=0;p.alpha=0.0;state.free=[p.id]+state.free;state.freed=state.freed+1;return true
end function

function action(state,kind,p,shader,vertices,origin,width,height,alpha,color,frame)
  texcoords=[[0.0,0.0],[0.0,1.0],[1.0,1.0],[1.0,0.0]];if len(vertices)==3 then texcoords=[[1.0,0.0],[0.0,0.0],[0.0,1.0]] end if
  value=RenderAction("render",kind,p.id,shader,len(vertices),vertices,texcoords,copy3(origin),width,height,alpha,color,frame,not state.retailActive);state.actions=state.actions+[value]
  if value.dispatched then state.rendered=state.rendered+1 else state.suppressed=state.suppressed+1 end if;return value
end function

function rotateBasis(right,up,degrees)
  radians=degrees*PI/180.0;s=trans.sin(radians);c=trans.cos(radians);return [qmath.VectorMA(qmath.VectorScale(right,c),s,up),qmath.VectorMA(qmath.VectorScale(up,c),-s,right)]
end function
function quad(origin,width,height,right,up)
  return [qmath.VectorMA(qmath.VectorMA(origin,-height,up),-width,right),qmath.VectorMA(qmath.VectorMA(origin,-height,up),width,right),qmath.VectorMA(qmath.VectorMA(origin,height,up),width,right),qmath.VectorMA(qmath.VectorMA(origin,height,up),-width,right)]
end function
function flatQuad(origin,width,height,roll)
  radians=roll*PI/180.0;sinR=height*trans.sin(radians)*trans.sqrt(2.0);cosR=width*trans.cos(radians)*trans.sqrt(2.0)
  return [[origin[0]-sinR,origin[1]-cosR,origin[2]],[origin[0]-cosR,origin[1]+sinR,origin[2]],[origin[0]+sinR,origin[1]+cosR,origin[2]],[origin[0]+cosR,origin[1]-sinR,origin[2]]]
end function
function distance(a,b) return qmath.VectorLength([a[0]-b[0],a[1]-b[1],a[2]-b[2]]) end function
function animationFrameName(p,ratio)
  counts=shaderAnimCounts();names=shaderAnimNames();frame=n.trunc32(ratio*counts[p.shaderAnim]);if frame>=counts[p.shaderAnim] then frame=counts[p.shaderAnim]-1 end if;return [names[p.shaderAnim]+str(frame+1),frame]
end function

function renderFamily(type)
  if type==P_WEATHER or type==P_WEATHER_TURBULENT or type==P_WEATHER_FLURRY or type==P_BUBBLE or type==P_BUBBLE_TURBULENT then return 1 end if
  if type==P_SPRITE then return 2 end if
  if type==P_SMOKE or type==P_SMOKE_IMPACT then return 3 end if
  if type==P_BLEED then return 4 end if
  if type==P_FLAT_SCALEUP then return 5 end if
  if type==P_FLAT then return 6 end if
  if type==P_ANIM then return 7 end if
  return 0
end function

// CG_AddParticleToScene
function addParticleToScene(state,p,origin,alpha)
  org=copy3(origin);width=p.width;height=p.height;color=[1.0,1.0,1.0];valueAlpha=alpha;frame=0;shader=p.shader;vertices=[];kind=""
  family=renderFamily(p.type);if family==0 then return void end if
  switch family
  case 1
    if p.type!=P_WEATHER_FLURRY then
      if p.type==P_BUBBLE or p.type==P_BUBBLE_TURBULENT then
        if org[2]>p.finish then p.time=state.time;p.org=copy3(org);p.org[2]=p.start+crandom(state)*4.0;if p.type==P_BUBBLE_TURBULENT then p.vel[0]=crandom(state)*4.0;p.vel[1]=crandom(state)*4.0 end if end if
      else
        if org[2]<p.finish then p.time=state.time;p.org=copy3(org);while p.org[2]<p.finish p.org[2]=p.org[2]+(p.start-p.finish) end while;if p.type==P_WEATHER_TURBULENT then p.vel[0]=crandom(state)*16.0;p.vel[1]=crandom(state)*16.0 end if end if
      end if
      if not p.link then return void end if;p.alpha=1.0;valueAlpha=1.0
    end if
    if distance(state.vieworg,org)>1024.0 then return void end if
    vertices=quad(org,width,height,state.vright,state.vup);kind="weather";if p.type==P_BUBBLE or p.type==P_BUBBLE_TURBULENT then kind="bubble" else vertices=[vertices[0],vertices[3],vertices[2]] end if
  end case
  case 2
    ratio=(state.time-p.time)/(p.endtime-p.time);width=p.width+ratio*(p.endwidth-p.width);height=p.height+ratio*(p.endheight-p.height);basis=[state.vright,state.vup];if p.roll!=0.0 then basis=rotateBasis(state.vright,state.vup,p.roll) end if;vertices=quad(org,width,height,basis[0],basis[1]);valueAlpha=1.0;kind="sprite"
  end case
  case 3
    if p.type==P_SMOKE_IMPACT and distance(state.vieworg,org)>1024.0 then return void end if
    if p.color==BLOODRED then color=[0.22,0.0,0.0] else if p.color==GREY75 then length=distance(state.vieworg,org);if length==0.0 then length=1.0 end if;grey=0.25*(4096.0/length);if grey>0.5 then grey=0.5 end if;color=[grey,grey,grey] end if
    ratio=(state.time-p.time)/(p.endtime-p.time);invratio=p.alpha;if state.time>p.startfade then invratio=1.0-(state.time-p.startfade)/(p.endtime-p.startfade);if p.color==EMISIVEFADE then f=invratio*invratio;if f<0.0 then f=0.0 end if;color=[f,f,f] end if;invratio=invratio*p.alpha end if;if state.ragePro then invratio=1.0 end if;if invratio>1.0 then invratio=1.0 end if;valueAlpha=invratio
    width=p.width+ratio*(p.endwidth-p.width);height=p.height+ratio*(p.endheight-p.height);basis=[state.vright,state.vup];if p.type!=P_SMOKE_IMPACT then p.accumroll=p.accumroll+p.roll;basis=rotateBasis(state.vright,state.vup,p.accumroll*0.1) end if;if not p.rotate then width=p.width;height=p.height;basis=[state.vright,state.vup] end if;vertices=quad(org,width,height,basis[0],basis[1]);kind="smoke"
  end case
  case 4
    valueAlpha=p.alpha;if state.ragePro then valueAlpha=1.0 end if;color=[111.0/255.0,19.0/255.0,9.0/255.0];basis=[state.vright,state.vup];if p.roll!=0.0 then basis=rotateBasis(state.vright,state.vup,p.roll) end if;vertices=quad(org,p.width,p.height,basis[0],basis[1]);kind="bleed"
  end case
  case 5
    color=[0.5,0.5,0.5];if p.color==BLOODRED then color=[1.0,1.0,1.0] end if;ratio=(state.time-p.time)/(p.endtime-p.time);width=p.width+ratio*(p.endwidth-p.width);height=p.height+ratio*(p.endheight-p.height);if width>p.endwidth then width=p.endwidth end if;if height>p.endheight then height=p.endheight end if;vertices=flatQuad(org,width,height,p.roll);valueAlpha=1.0;kind="flat-scaleup"
  end case
  case 6
    vertices=flatQuad(org,p.width,p.height,0.0);valueAlpha=1.0;kind="flat"
  end case
  case 7
    ratio=(state.time-p.time)/(p.endtime-p.time);if ratio>=1.0 then ratio=0.9999 end if;width=p.width+ratio*(p.endwidth-p.width);height=p.height+ratio*(p.endheight-p.height);if distance(state.vieworg,org)<width/1.5 then return void end if;anim=animationFrameName(p,ratio);shader=anim[0];p.shader=shader;frame=anim[1];basis=[state.vright,state.vup];if p.roll!=0.0 then basis=rotateBasis(state.vright,state.vup,p.roll) end if;vertices=quad(org,width,height,basis[0],basis[1]);valueAlpha=1.0;kind="anim"
  end case
  end switch
  if shader=="" then return void end if;return action(state,kind,p,shader,vertices,org,width,height,valueAlpha,color,frame)
end function

function expiresByTime(p)
  return p.type==P_SMOKE or p.type==P_ANIM or p.type==P_BLEED or p.type==P_SMOKE_IMPACT or p.type==P_WEATHER_FLURRY or p.type==P_FLAT_SCALEUP_FADE
end function

// CG_AddParticles
function addParticles(state,time,vieworg,vforward,vright,vup)
  state.time=time;if not state.initialized then clearParticles(state) end if;state.vieworg=copy3(vieworg);state.vforward=copy3(vforward);state.vright=copy3(vright);state.vup=copy3(vup);state.roll=state.roll+(state.time-state.oldtime)*0.1;state.oldtime=state.time
  ids=[];for each id in state.active ids=ids+[id] end for;kept=[];rendered=[]
  for each id in ids
    p=state.particles[id];seconds=(state.time-p.time)*0.001;alpha=p.alpha+seconds*p.alphavel
    expired=alpha<=0.0 or (expiresByTime(p) and state.time>p.endtime)
    if expired then p.active=false;p.type=P_NONE;p.color=0;p.alpha=0.0;state.free=[id]+state.free;state.freed=state.freed+1;continue end if
    if (p.type==P_BAT or p.type==P_SPRITE) and p.endtime<0 then value=addParticleToScene(state,p,p.org,alpha);if value!=void then rendered=rendered+[value] end if;p.active=false;p.type=P_NONE;p.color=0;p.alpha=0.0;state.free=[id]+state.free;state.freed=state.freed+1;continue end if
    kept=kept+[id];if alpha>1.0 then alpha=1.0 end if;seconds2=seconds*seconds;org=[p.org[0]+p.vel[0]*seconds+p.accel[0]*seconds2,p.org[1]+p.vel[1]*seconds+p.accel[1]*seconds2,p.org[2]+p.vel[2]*seconds+p.accel[2]*seconds2];value=addParticleToScene(state,p,org,alpha);if value!=void then rendered=rendered+[value] end if
  end for;state.active=kept;return rendered
end function

function spawnBase(state,shader)
  p=allocParticle(state);if p==void then return void end if;p.time=state.time;p.shader=shader;p.alphavel=0.0;return p
end function

// CG_ParticleSnowFlurry
function particleSnowFlurry(state,shader,cent)
  p=spawnBase(state,shader);if p==void then return void end if;p.color=0;p.alpha=0.9;p.start=cent.origin2[0];p.finish=cent.origin2[1];p.endtime=state.time+cent.time;p.startfade=state.time+cent.time2
  if randInt(state)%100>90 then p.height=32.0;p.width=32.0;p.alpha=0.1 else p.height=1.0;p.width=1.0 end if;p.type=P_WEATHER_FLURRY;p.org=copy3(cent.origin);p.vel=[cent.angles[0]*32.0+crandom(state)*16.0,cent.angles[1]*32.0+crandom(state)*16.0,-10.0+cent.angles[2]];p.accel=[crandom(state)*16.0,crandom(state)*16.0,0.0];return p
end function

// CG_ParticleSnow
function particleSnow(state,shader,origin,origin2,turb,range,snum)
  p=spawnBase(state,shader);if p==void then return void end if;p.color=0;p.alpha=0.4;p.start=origin[2];p.finish=origin2[2];p.height=1.0;p.width=1.0;p.type=P_WEATHER;p.vel=[0.0,0.0,-50.0];if turb!=0 then p.type=P_WEATHER_TURBULENT;p.vel[2]=-65.0 end if;p.org=[origin[0]+crandom(state)*range,origin[1]+crandom(state)*range,origin[2]+crandom(state)*(p.start-p.finish)];p.vel[0]=0.0;p.vel[1]=0.0;if turb!=0 then p.vel[0]=crandom(state)*16.0;p.vel[1]=crandom(state)*16.0 end if;p.accel=zero3();p.snum=snum;p.link=true;return p
end function

// CG_ParticleBubble
function particleBubble(state,shader,origin,origin2,turb,range,snum)
  p=spawnBase(state,shader);if p==void then return void end if;p.color=0;p.alpha=0.4;p.start=origin[2];p.finish=origin2[2];size=1.0+crandom(state)*0.5;p.height=size;p.width=size;p.type=P_BUBBLE;p.vel=[0.0,0.0,50.0+crandom(state)*10.0];if turb!=0 then p.type=P_BUBBLE_TURBULENT;p.vel[2]=65.0 end if;p.org=[origin[0]+crandom(state)*range,origin[1]+crandom(state)*range,origin[2]+crandom(state)*(p.start-p.finish)];p.vel[0]=0.0;p.vel[1]=0.0;if turb!=0 then p.vel[0]=crandom(state)*4.0;p.vel[1]=crandom(state)*4.0 end if;p.accel=zero3();p.snum=snum;p.link=true;return p
end function

// CG_ParticleSmoke
function particleSmoke(state,shader,cent)
  p=spawnBase(state,shader);if p==void then return void end if;p.endtime=state.time+cent.time;p.startfade=state.time+cent.time2;p.alpha=1.0;p.start=cent.origin[2];p.finish=cent.origin2[2];p.height=8.0;p.width=8.0;p.endheight=32.0;p.endwidth=32.0;p.type=P_SMOKE;p.org=copy3(cent.origin);p.vel=[0.0,0.0,5.0];if cent.frame==1 then p.vel[2]=-5.0 end if;p.accel=zero3();p.roll=n.trunc32(8.0+crandom(state)*4.0);return p
end function

// CG_ParticleBulletDebris
function particleBulletDebris(state,origin,velocity,duration,tracerShader)
  p=spawnBase(state,tracerShader);if p==void then return void end if;p.endtime=state.time+duration;p.startfade=state.time+n.trunc32(duration/2);p.color=EMISIVEFADE;p.alpha=1.0;p.height=0.5;p.width=0.5;p.endheight=0.5;p.endwidth=0.5;p.type=P_SMOKE;p.org=copy3(origin);p.vel=[velocity[0],velocity[1],velocity[2]-20.0];p.accel=[0.0,0.0,-60.0];return p
end function

function animationIndex(name) names=shaderAnimNames();for i=0 to len(names)-1 if name==names[i] then return i end if end for;return -1 end function
// CG_ParticleExplosion
function particleExplosion(state,animName,origin,velocity,duration,sizeStart,sizeEnd)
  anim=animationIndex(animName);if anim<0 then state.errors=state.errors+["CG_ParticleExplosion: unknown animation string: "+animName];return void end if;p=spawnBase(state,"");if p==void then return void end if;p.alpha=1.0;if duration<0 then duration= -duration;p.roll=0.0 else p.roll=n.trunc32(crandom(state)*179.0) end if;p.shaderAnim=anim;ratios=shaderAnimRatios();p.width=sizeStart;p.height=n.f32(sizeStart*ratios[anim]);p.endheight=sizeEnd;p.endwidth=n.f32(sizeEnd*ratios[anim]);p.endtime=state.time+duration;p.type=P_ANIM;p.org=copy3(origin);p.vel=copy3(velocity);p.accel=zero3();return p
end function

// CG_AddParticleShrapnel is deliberately empty in the original source.
function addParticleShrapnel(state,localEntity) return void end function

// CG_NewParticleArea
function newParticleArea(state,text,shader)
  if text==void or strings.trim(text)=="" then return 0 end if;raw=strings.split(strings.trim(text)," ");tokens=[];for each token in raw if token!="" then tokens=tokens+[token] end if end for;if len(tokens)<10 then state.errors=state.errors+["CG_NewParticleArea: malformed configstring"];return 0 end if
  type=n.trunc32(toNumber(tokens[0]));ranges=[256.0,128.0,64.0,32.0,8.0,16.0,32.0,64.0];range=0.0;if type>=0 and type<len(ranges) then range=ranges[type] end if;origin=[toNumber(tokens[1]),toNumber(tokens[2]),toNumber(tokens[3])];origin2=[toNumber(tokens[4]),toNumber(tokens[5]),toNumber(tokens[6])];count=n.trunc32(toNumber(tokens[7]));turb=n.trunc32(toNumber(tokens[8]));snum=n.trunc32(toNumber(tokens[9]))
  for i=0 to count-1 if type>=4 then particleBubble(state,shader,origin,origin2,turb,range,snum) else particleSnow(state,shader,origin,origin2,turb,range,snum) end if end for;return 1
end function

// CG_SnowLink
function snowLink(state,id,particleOn)
  count=0;for each particleId in state.active p=state.particles[particleId];if (p.type==P_WEATHER or p.type==P_WEATHER_TURBULENT) and p.snum==id then p.link=particleOn;count=count+1 end if end for;return count
end function

// CG_ParticleImpactSmokePuff
function particleImpactSmokePuff(state,shader,origin)
  p=spawnBase(state,shader);if p==void then return void end if;p.alpha=0.25;p.roll=n.trunc32(crandom(state)*179.0);p.startfade=state.time+100;p.width=(randInt(state)%4)+8.0;p.height=(randInt(state)%4)+8.0;p.endheight=p.height*2.0;p.endwidth=p.width*2.0;p.endtime=state.time+500;p.type=P_SMOKE_IMPACT;p.org=copy3(origin);p.vel=[0.0,0.0,20.0];p.accel=[0.0,0.0,20.0];p.rotate=true;return p
end function

// CG_Particle_Bleed
function particleBleed(state,shader,start,direction,fleshEntityNum,duration)
  p=spawnBase(state,shader);if p==void then return void end if;p.alpha=0.75;p.endtime=state.time+duration;p.startfade=state.time+100;if fleshEntityNum!=0 then p.startfade=state.time end if;p.width=4.0;p.height=4.0;p.endheight=4.0+(randInt(state)%3);p.endwidth=p.endheight;p.type=P_SMOKE;p.org=copy3(start);p.vel=[0.0,0.0,-20.0];p.accel=zero3();p.roll=(randInt(state)%179)*1.0;p.color=BLOODRED;return p
end function

// CG_Particle_OilParticle
function particleOilParticle(state,shader,cent)
  ratio=1.0-state.time/(state.time+cent.time);p=spawnBase(state,shader);if p==void then return void end if;p.alpha=0.75;p.endtime=state.time+1500;p.startfade=p.endtime;p.width=1.0;p.height=3.0;p.endheight=3.0;p.endwidth=1.0;p.type=P_SMOKE;p.org=copy3(cent.origin);p.vel=[cent.origin2[0]*16.0*ratio,cent.origin2[1]*16.0*ratio,cent.origin2[2]];p.snum=1;p.accel=[0.0,0.0,-20.0];p.roll=(randInt(state)%179)*1.0;return p
end function

// CG_Particle_OilSlick
function particleOilSlick(state,shader,cent)
  p=spawnBase(state,shader);if p==void then return void end if;p.endtime=state.time+60000;if cent.angles2[2]!=0.0 then p.endtime=state.time+n.trunc32(cent.angles2[2]) end if;p.startfade=p.endtime;p.alpha=0.75
  if cent.angles2[0]!=0.0 or cent.angles2[1]!=0.0 then p.width=cent.angles2[0];p.height=cent.angles2[0];p.endheight=cent.angles2[1];p.endwidth=cent.angles2[1] else p.width=8.0;p.height=8.0;p.endheight=16.0;p.endwidth=16.0 end if;p.type=P_FLAT_SCALEUP;p.snum=1;p.org=copy3(cent.origin);p.org[2]=p.org[2]+0.55+crandom(state)*0.5;p.vel=zero3();p.accel=zero3();p.roll=(randInt(state)%179)*1.0;return p
end function

// CG_OilSlickRemove
function oilSlickRemove(state,cent)
  count=0;for each id in state.active p=state.particles[id];if p.type==P_FLAT_SCALEUP and p.snum==1 then p.endtime=state.time+100;p.startfade=p.endtime;p.type=P_FLAT_SCALEUP_FADE;count=count+1 end if end for;return count
end function

// ValidBloodPool. traceFn(context,start,finish) returns entityNum/startsolid/fraction.
function validBloodPool(start,traceFn,context)
  if traceFn==void then return false end if;normal=[0.0,0.0,1.0];right=[0.0,-1.0,0.0];up=[1.0,0.0,0.0];center=qmath.VectorMA(start,0.5,normal)
  for each x in [-8.0,8.0] xpos=qmath.VectorMA(center,x,right);for each y in [-8.0,8.0] pos=qmath.VectorMA(xpos,y,up);finish=qmath.VectorMA(pos,-1.0,normal);trace=traceFn(context,pos,finish);if trace==void or trace.entityNum<MAX_ENTITIES-1 or trace.startsolid or trace.fraction>=1.0 then return false end if end for end for;return true
end function

// CG_BloodPool
function bloodPool(state,shader,trace,traceFn,context)
  start=copy3(trace.endpos);if not validBloodPool(start,traceFn,context) then return void end if;p=spawnBase(state,shader);if p==void then return void end if;p.endtime=state.time+3000;p.startfade=p.endtime;p.alpha=0.75;size=0.4+randomFloat(state)*0.6;p.width=8.0*size;p.height=8.0*size;p.endheight=16.0*size;p.endwidth=16.0*size;p.type=P_FLAT_SCALEUP;p.org=start;p.vel=zero3();p.accel=zero3();p.roll=(randInt(state)%179)*1.0;p.color=BLOODRED;return p
end function

function directionUnit(direction) result=copy3(direction);length=qmath.VectorNormalize(result);return [result,length] end function
// CG_ParticleBloodCloud
function particleBloodCloud(state,cent,origin,direction,smokeShader)
  info=directionUnit(direction);forward=info[0];length=info[1];distanceCount=1.0;if length!=0.0 then distanceCount=length/32.0;if distanceCount<1.0 then distanceCount=1.0 end if end if;result=[];point=copy3(origin);i=0;while i<distanceCount point=qmath.VectorMA(point,32.0,forward);p=spawnBase(state,smokeShader);if p==void then return result end if;p.alpha=0.75;p.endtime=state.time+350+n.trunc32(crandom(state)*100.0);p.startfade=state.time;p.width=32.0;p.height=32.0;p.endheight=32.0;p.endwidth=32.0;p.type=P_SMOKE;p.org=copy3(origin);p.vel=[0.0,0.0,-1.0];p.accel=zero3();p.roll=(randInt(state)%179)*1.0;p.color=BLOODRED;result=result+[p];i=i+1 end while;return result
end function

// CG_ParticleSparks
function particleSparks(state,origin,velocity,duration,x,y,speed,tracerShader)
  p=spawnBase(state,tracerShader);if p==void then return void end if;p.endtime=state.time+duration;p.startfade=state.time+n.trunc32(duration/2);p.color=EMISIVEFADE;p.alpha=0.4;p.height=0.5;p.width=0.5;p.endheight=0.5;p.endwidth=0.5;p.type=P_SMOKE;p.org=[origin[0]+crandom(state)*x,origin[1]+crandom(state)*y,origin[2]];p.vel=[velocity[0]+crandom(state)*4.0,velocity[1]+crandom(state)*4.0,velocity[2]+(20.0+crandom(state)*10.0)*speed];p.accel=[crandom(state)*4.0,crandom(state)*4.0,0.0];return p
end function

// CG_ParticleDust; preserves the original VectorClear after gravity setup.
function particleDust(state,cent,origin,direction,smokeShader)
  direction[0]= -direction[0];direction[1]= -direction[1];direction[2]= -direction[2];info=directionUnit(direction);forward=info[0];length=info[1];distanceCount=1.0;if length!=0.0 then distanceCount=length/32.0;if distanceCount<1.0 then distanceCount=1.0 end if end if;point=copy3(origin);result=[];i=0
  while i<distanceCount point=qmath.VectorMA(point,32.0,forward);p=spawnBase(state,smokeShader);if p==void then return result end if;p.alpha=0.75;if length!=0.0 then p.endtime=state.time+4500+n.trunc32(crandom(state)*3500.0) else p.endtime=state.time+750+n.trunc32(crandom(state)*500.0) end if;p.startfade=state.time;p.width=32.0;p.height=32.0;p.endheight=96.0;p.endwidth=96.0;if length==0.0 then p.width=p.width*0.2;p.height=p.height*0.2;p.endheight=16.0;p.endwidth=16.0 end if;p.type=P_SMOKE;p.org=copy3(point);p.vel=[crandom(state)*6.0,crandom(state)*6.0,randomFloat(state)*20.0];p.accel=zero3();p.roll=(randInt(state)%179)*1.0;result=result+[p];i=i+1 end while;return result
end function

// CG_ParticleMisc. The original ignores alpha and only frees negative-duration sprites after one draw.
function particleMisc(state,shader,origin,size,duration,alpha)
  p=spawnBase(state,shader);if p==void then return void end if;p.alpha=1.0;p.roll=(randInt(state)%179)*1.0;if duration>0 then p.endtime=state.time+duration else p.endtime=duration end if;p.startfade=state.time;p.width=size;p.height=size;p.endheight=size;p.endwidth=size;p.type=P_SPRITE;p.org=copy3(origin);return p
end function
