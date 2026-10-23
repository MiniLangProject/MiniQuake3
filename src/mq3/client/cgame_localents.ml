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

const MAX_LOCAL_ENTITIES=512
const SINK_TIME=cgabi.SINK_TIME
const CONTENTS_NODROP=0x80000000
const TR_STATIONARY=0
const RT_SPRITE=2
const RF_LIGHTING_ORIGIN=0x80
const LE_MARK=cgabi.LE_MARK
const LE_EXPLOSION=cgabi.LE_EXPLOSION
const LE_SPRITE_EXPLOSION=cgabi.LE_SPRITE_EXPLOSION
const LE_FRAGMENT=cgabi.LE_FRAGMENT
const LE_MOVE_SCALE_FADE=cgabi.LE_MOVE_SCALE_FADE
const LE_FALL_SCALE_FADE=cgabi.LE_FALL_SCALE_FADE
const LE_FADE_RGB=cgabi.LE_FADE_RGB
const LE_SCALE_FADE=cgabi.LE_SCALE_FADE
const LE_SCOREPLUM=cgabi.LE_SCOREPLUM
const LE_KAMIKAZE=cgabi.LE_KAMIKAZE
const LE_INVULIMPACT=cgabi.LE_INVULIMPACT
const LE_INVULJUICED=cgabi.LE_INVULJUICED
const LE_SHOWREFENTITY=cgabi.LE_SHOWREFENTITY
const LEF_PUFF_DONT_SCALE=cgabi.LEF_PUFF_DONT_SCALE
const LEF_TUMBLE=cgabi.LEF_TUMBLE
const LEF_SOUND1=cgabi.LEF_SOUND1
const LEF_SOUND2=cgabi.LEF_SOUND2
const LEMT_NONE=cgabi.LEMT_NONE
const LEMT_BURN=cgabi.LEMT_BURN
const LEMT_BLOOD=cgabi.LEMT_BLOOD
const LEBS_NONE=cgabi.LEBS_NONE
const LEBS_BLOOD=cgabi.LEBS_BLOOD
const LEBS_BRASS=cgabi.LEBS_BRASS
const NUMBER_SIZE=8
const KAMI_SHOCKWAVE_STARTTIME=0
const KAMI_SHOCKWAVEFADE_STARTTIME=1500
const KAMI_SHOCKWAVE_ENDTIME=2000
const KAMI_EXPLODE_STARTTIME=250
const KAMI_IMPLODE_STARTTIME=2000
const KAMI_IMPLODE_ENDTIME=2250
const KAMI_SHOCKWAVE2_STARTTIME=2000
const KAMI_SHOCKWAVE2FADE_STARTTIME=2500
const KAMI_SHOCKWAVE2_ENDTIME=3000
const KAMI_SHOCKWAVEMODEL_RADIUS=88.0
const KAMI_BOOMSPHEREMODEL_RADIUS=72.0
const KAMI_SHOCKWAVE_MAXRADIUS=1320.0
const KAMI_BOOMSPHERE_MAXRADIUS=720.0
const KAMI_SHOCKWAVE2_MAXRADIUS=704.0

struct RefEntity reType origin lightingOrigin axis shaderRGBA radius hModel customShader shaderTime renderfx nonNormalizedAxes end struct
struct LocalEntity id active leType leFlags startTime endTime fadeInTime lifeRate pos angles bounceFactor color radius light lightColor leMarkType leBounceSoundType refEntity end struct
struct Action boundary kind entity origin normal scalar color data dispatched end struct
struct Services traceFn pointContentsFn randomFn context end struct
struct State entities free active time frametime vieworg retailActive services actions rendered audio marks spawned freed errors end struct

function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
function newRefEntity() return RefEntity(0,[0.0,0.0,0.0],[0.0,0.0,0.0],identityAxis(),[255,255,255,255],0.0,0,0,0.0,0,false) end function
function newTrajectory() return trajectory.Trajectory(TR_STATIONARY,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0]) end function
function newLocalEntity(id) return LocalEntity(id,false,LE_MARK,0,0,0,0,0.0,newTrajectory(),newTrajectory(),0.0,[0.0,0.0,0.0,0.0],0.0,0.0,[0.0,0.0,0.0],LEMT_NONE,LEBS_NONE,newRefEntity()) end function
function defaultTrace(context,start,finish) return void end function
function defaultPointContents(context,point) return 0 end function
function defaultRandom(context) return 0 end function
function defaultServices() return Services(defaultTrace,defaultPointContents,defaultRandom,void) end function

// CG_InitLocalEntities
function initLocalEntities(services,retailActive)
  if services==void then services=defaultServices() end if
  entities=[];free=[];for index=0 to MAX_LOCAL_ENTITIES-1 entities=entities+[newLocalEntity(index)];free=free+[index] end for
  return State(entities,free,[],0,0,[0.0,0.0,0.0],retailActive,services,[],0,0,0,0,0,[])
end function

function resetLocalEntity(le)
  id=le.id;fresh=newLocalEntity(id);le.active=fresh.active;le.leType=fresh.leType;le.leFlags=fresh.leFlags;le.startTime=0;le.endTime=0;le.fadeInTime=0;le.lifeRate=0.0;le.pos=fresh.pos;le.angles=fresh.angles;le.bounceFactor=0.0;le.color=fresh.color;le.radius=0.0;le.light=0.0;le.lightColor=fresh.lightColor;le.leMarkType=LEMT_NONE;le.leBounceSoundType=LEBS_NONE;le.refEntity=fresh.refEntity;return le
end function

// CG_FreeLocalEntity
function freeLocalEntity(state,le)
  if le==void or not le.active then state.errors=state.errors+["CG_FreeLocalEntity: not active"];return false end if
  kept=[];for each id in state.active if id!=le.id then kept=kept+[id] end if end for;state.active=kept;le.active=false;state.free=[le.id]+state.free;state.freed=state.freed+1;return true
end function

// CG_AllocLocalEntity
function allocLocalEntity(state)
  if len(state.free)==0 then freeLocalEntity(state,state.entities[state.active[len(state.active)-1]]) end if
  id=state.free[0];rest=[];if len(state.free)>1 then for index=1 to len(state.free)-1 rest=rest+[state.free[index]] end for end if;state.free=rest
  le=resetLocalEntity(state.entities[id]);le.active=true;state.active=[id]+state.active;state.spawned=state.spawned+1;return le
end function

function boundary(state,boundaryName,kind,le,origin,normal,scalar,color,data)
  item=Action(boundaryName,kind,le.id,origin,normal,scalar,color,data,not state.retailActive);state.actions=state.actions+[item]
  if boundaryName=="render" then state.rendered=state.rendered+1 else if boundaryName=="audio" then state.audio=state.audio+1 else if boundaryName=="mark" then state.marks=state.marks+1 end if;return item
end function
function render(state,kind,le,origin,scalar,color,data) return boundary(state,"render",kind,le,origin,void,scalar,color,data) end function
function sound(state,kind,le,origin,data) return boundary(state,"audio",kind,le,origin,void,0.0,void,data) end function
function mark(state,kind,le,origin,normal,scalar,orientation) return boundary(state,"mark",kind,le,origin,normal,scalar,void,orientation) end function

// CG_BloodTrail (the ledger's spurious `way` candidate comes from this routine's prose).
function bloodTrail(state,le)
  step=150;t=step*n.trunc32((state.time-state.frametime+step)/step);t2=step*n.trunc32(state.time/step);created=0
  while t<=t2
    origin=trajectory.evaluate(le.pos,t);blood=allocLocalEntity(state);blood.leType=LE_FALL_SCALE_FADE;blood.startTime=t;blood.endTime=t+2000;blood.lifeRate=1.0/2000.0;blood.radius=20.0;blood.color=[1.0,1.0,1.0,1.0];blood.pos.trType=2;blood.pos.trBase=origin;blood.pos.trDelta[2]=40.0;blood.refEntity.origin=[origin[0],origin[1],origin[2]];blood.refEntity.radius=20.0;created=created+1;t=t+step
  end while;return created
end function

// CG_FragmentBounceMark
function fragmentBounceMark(state,le,trace)
  if le.leMarkType==LEMT_BLOOD then radius=16+(state.services.randomFn(state.services.context)&31);orientation=(state.services.randomFn(state.services.context)&0x7fff)*360.0/32767.0;mark(state,"blood",le,trace.endpos,trace.normal,radius,orientation)
  else if le.leMarkType==LEMT_BURN then radius=8+(state.services.randomFn(state.services.context)&15);orientation=(state.services.randomFn(state.services.context)&0x7fff)*360.0/32767.0;mark(state,"burn",le,trace.endpos,trace.normal,radius,orientation) end if
  le.leMarkType=LEMT_NONE;return void
end function

// CG_FragmentBounceSound
function fragmentBounceSound(state,le,trace)
  if le.leBounceSoundType==LEBS_BLOOD and (state.services.randomFn(state.services.context)&1)!=0 then choice=state.services.randomFn(state.services.context)&3;if choice>2 then choice=2 end if;sound(state,"gib-bounce-"+str(choice+1),le,trace.endpos,choice) end if
  le.leBounceSoundType=LEBS_NONE;return void
end function

// CG_ReflectVelocity
function reflectVelocity(state,le,trace)
  hitTime=state.time-state.frametime+state.frametime*trace.fraction;velocity=trajectory.evaluateDelta(le.pos,hitTime);dot=qmath.DotProduct(velocity,trace.normal);le.pos.trDelta=qmath.VectorScale(qmath.VectorMA(velocity,-2.0*dot,trace.normal),le.bounceFactor);le.pos.trBase=[trace.endpos[0],trace.endpos[1],trace.endpos[2]];le.pos.trTime=state.time
  if trace.allsolid or (trace.normal[2]>0.0 and (le.pos.trDelta[2]<40.0 or le.pos.trDelta[2]< -state.frametime*le.pos.trDelta[2])) then le.pos.trType=TR_STATIONARY end if;return le.pos.trDelta
end function

function anglesToAxis(angles) basis=qmath.AngleVectors(angles);return [basis[0],qmath.VectorScale(basis[1],-1.0),basis[2]] end function

// CG_AddFragment
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

function remainingFraction(state,le) return (le.endTime-state.time)*le.lifeRate end function
function nearView(state,origin,radius) delta=[origin[0]-state.vieworg[0],origin[1]-state.vieworg[1],origin[2]-state.vieworg[2]];return qmath.VectorLength(delta)<radius end function

// CG_AddFadeRGB
function addFadeRGB(state,le) c=remainingFraction(state,le)*255.0;le.refEntity.shaderRGBA=[n.trunc32(le.color[0]*c),n.trunc32(le.color[1]*c),n.trunc32(le.color[2]*c),n.trunc32(le.color[3]*c)];return render(state,"fade-rgb",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end function

// CG_AddMoveScaleFade
function addMoveScaleFade(state,le)
  c=0.0
  if le.fadeInTime>le.startTime and state.time<le.fadeInTime then c=1.0-(le.fadeInTime-state.time)/(le.fadeInTime-le.startTime) else c=remainingFraction(state,le) end if
  le.refEntity.shaderRGBA[3]=n.trunc32(255.0*c*le.color[3]);if (le.leFlags&LEF_PUFF_DONT_SCALE)==0 then le.refEntity.radius=le.radius*(1.0-c)+8.0 end if;le.refEntity.origin=trajectory.evaluate(le.pos,state.time)
  if nearView(state,le.refEntity.origin,le.radius) then freeLocalEntity(state,le);return void end if;return render(state,"move-scale-fade",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void)
end function

// CG_AddScaleFade
function addScaleFade(state,le) c=remainingFraction(state,le);le.refEntity.shaderRGBA[3]=n.trunc32(255.0*c*le.color[3]);le.refEntity.radius=le.radius*(1.0-c)+8.0;if nearView(state,le.refEntity.origin,le.radius) then freeLocalEntity(state,le);return void end if;return render(state,"scale-fade",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end function

// CG_AddFallScaleFade
function addFallScaleFade(state,le) c=remainingFraction(state,le);le.refEntity.shaderRGBA[3]=n.trunc32(255.0*c*le.color[3]);le.refEntity.origin[2]=le.pos.trBase[2]-(1.0-c)*le.pos.trDelta[2];le.refEntity.radius=le.radius*(1.0-c)+16.0;if nearView(state,le.refEntity.origin,le.radius) then freeLocalEntity(state,le);return void end if;return render(state,"fall-scale-fade",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end function

function dynamicLight(state,le,origin,progress)
  if le.light==0.0 then return void end if;intensity=0.0;if progress<0.5 then intensity=le.light else intensity=le.light*(1.0-(progress-0.5)*2.0) end if;return render(state,"dynamic-light",le,origin,intensity,le.lightColor,void)
end function

// CG_AddExplosion
function addExplosion(state,le) render(state,"explosion",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void);progress=(state.time-le.startTime)/(le.endTime-le.startTime);dynamicLight(state,le,le.refEntity.origin,progress);return void end function

// CG_AddSpriteExplosion
function addSpriteExplosion(state,le)
  c=(le.endTime-state.time)/(le.endTime-le.startTime);if c>1.0 then c=1.0 end if;color=[255,255,255,n.trunc32(255.0*c*0.33)];radius=42.0*(1.0-c)+30.0;render(state,"sprite-explosion",le,le.refEntity.origin,radius,color,RT_SPRITE);progress=(state.time-le.startTime)/(le.endTime-le.startTime);dynamicLight(state,le,le.refEntity.origin,progress);return void
end function

function kamiWave(state,le,kind,t,startTime,fadeTime,endTime,maxRadius,angles)
  axis=anglesToAxis(angles);c=(t-startTime)/(endTime-startTime);scale=c*maxRadius/KAMI_SHOCKWAVEMODEL_RADIUS;color=255.0;if t>fadeTime then color=255.0*(1.0-(t-fadeTime)/(endTime-fadeTime)) end if;return render(state,kind,le,le.refEntity.origin,scale,[color,color,color,color],axis)
end function

// CG_AddKamikaze
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
function addInvulnerabilityImpact(state,le) return render(state,"invulnerability-impact",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end function

// CG_AddInvulnerabilityJuiced
function addInvulnerabilityJuiced(state,le)
  t=state.time-le.startTime;if t>3000 then le.refEntity.axis[0][0]=1.0+0.3*(t-3000)/2000.0;le.refEntity.axis[1][1]=le.refEntity.axis[0][0];le.refEntity.axis[2][2]=0.7+0.3*(2000-(t-3000))/2000.0 end if
  if t>5000 then le.endTime=0;boundary(state,"state","gib-player",le,le.refEntity.origin,void,0.0,void,void) else render(state,"invulnerability-juiced",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end if;return void
end function

// CG_AddRefEntity
function addRefEntity(state,le) if le.endTime<state.time then freeLocalEntity(state,le);return void end if;return render(state,"ref-entity",le,le.refEntity.origin,le.refEntity.radius,le.refEntity.shaderRGBA,void) end function

function scoreColor(score) if score<0 then return [255,17,17] end if;if score>=50 then return [255,0,255] end if;if score>=20 then return [0,0,255] end if;if score>=10 then return [255,255,0] end if;if score>=2 then return [0,255,0] end if;return [255,255,255] end function
function scoreDigits(score) score=n.trunc32(score);result=[];negative=false;if score<0 then negative=true;score= -score end if;while len(result)==0 or score!=0 result=result+[score%10];score=n.trunc32(score/10) end while;if negative then result=result+[10] end if;return result end function

// CG_AddScorePlum
function addScorePlum(state,le)
  c=remainingFraction(state,le);rgb=scoreColor(le.radius);alpha=255;if c<0.25 then alpha=n.trunc32(255.0*4.0*c) end if;origin=[le.pos.trBase[0],le.pos.trBase[1],le.pos.trBase[2]+110.0-c*100.0];dir=[state.vieworg[0]-origin[0],state.vieworg[1]-origin[1],state.vieworg[2]-origin[2]];vec=qmath.CrossProduct(dir,[0.0,0.0,1.0]);qmath.VectorNormalize(vec);origin=qmath.VectorMA(origin,-10.0+20.0*trans.sin(c*2.0*3.14159265358979323846),vec)
  if nearView(state,origin,20.0) then freeLocalEntity(state,le);return void end if;le.refEntity.radius=NUMBER_SIZE/2.0;digits=scoreDigits(le.radius)
  for index=0 to len(digits)-1 place=qmath.VectorMA(origin,(len(digits)/2.0-index)*NUMBER_SIZE,vec);render(state,"score-digit",le,place,NUMBER_SIZE/2.0,[rgb[0],rgb[1],rgb[2],alpha],digits[len(digits)-1-index]) end for;return len(digits)
end function

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
function addLocalEntities(state,time,frametime,vieworg)
  state.time=time;state.frametime=frametime;state.vieworg=vieworg;visit=[];for each id in state.active visit=[id]+visit end for
  for each id in visit le=state.entities[id];if not le.active then continue end if;if state.time>=le.endTime then freeLocalEntity(state,le);continue end if;dispatchLocalEntity(state,le) end for;return len(visit)
end function

function clearBoundaryActions(state) state.actions=[];state.rendered=0;state.audio=0;state.marks=0;return void end function
