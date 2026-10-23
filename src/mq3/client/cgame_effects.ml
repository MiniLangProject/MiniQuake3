// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native semantic port of code/cgame/cg_effects.c.  The original functions
// allocate local entities; this module describes the same render/audio
// boundary actions.  retailActive suppresses dispatch beside cgame.qvm.
package mq3.client.cgame_effects
import mq3.client.cg_local as cgabi

import mq3.compat.numeric as n
import mq3.shared.math as qmath

const LE_MOVE_SCALE_FADE=cgabi.LE_MOVE_SCALE_FADE
const LE_FADE_RGB=cgabi.LE_FADE_RGB
const LE_EXPLOSION=cgabi.LE_EXPLOSION
const LE_SPRITE_EXPLOSION=cgabi.LE_SPRITE_EXPLOSION
const LE_FRAGMENT=cgabi.LE_FRAGMENT
const LE_SCOREPLUM=cgabi.LE_SCOREPLUM
const LE_SHOWREFENTITY=cgabi.LE_SHOWREFENTITY
const LE_KAMIKAZE=cgabi.LE_KAMIKAZE
const LE_INVULIMPACT=cgabi.LE_INVULIMPACT
const LE_INVULJUICED=cgabi.LE_INVULJUICED
const LEF_PUFF_DONT_SCALE=cgabi.LEF_PUFF_DONT_SCALE
const TR_LINEAR=2
const TR_GRAVITY=5
const RT_MODEL=1
const RT_SPRITE=2
const RT_LIGHTNING=5
const RF_THIRD_PERSON=2
const LEBS_NONE=cgabi.LEBS_NONE
const LEBS_BLOOD=cgabi.LEBS_BLOOD
const LEBS_BRASS=cgabi.LEBS_BRASS
const LEMT_NONE=cgabi.LEMT_NONE
const LEMT_BLOOD=cgabi.LEMT_BLOOD
const ENTITYNUM_NONE=1023
const CHAN_BODY=4

const WATER_BUBBLE_SHADER="waterBubble"
const SMOKE_RAGEPRO_SHADER="smokePuffRagePro"
const TELEPORT_SHADER="teleportEffect"
const TELEPORT_MODEL="models/misc/telep.md3"
const TELEPORT_MISSIONPACK_MODEL="models/powerups/pop.md3"
const LIGHTNING_SHADER="lightningBoltNew"
const KAMIKAZE_MODEL="models/weaphits/kamboom2.md3"
const DISH_FLASH_MODEL="models/weaphits/boom01.md3"
const ROCKET_EXPLOSION_SHADER="rocketExplosion"
const INVUL_IMPACT_MODEL="models/powerups/shield/impact.md3"
const INVUL_JUICED_MODEL="models/powerups/shield/juicer.md3"
const BLOOD_EXPLOSION_SHADER="bloodExplosion"
const SMOKE2_MODEL="models/weapons2/shells/s_shell.md3"

// An Effect contains every field written by cg_effects.c.  Unused scalar
// fields are zero and unused names are empty strings.
struct Effect boundary kind leType startTime fadeInTime endTime lifeRate flags trajectoryType position oldPosition velocity angles radius color shaderColor model shader shaderTime rotation bounceFactor bounceSound markType reType renderfx light lightColor entity channel dispatched end struct
struct State time predictedClient blood gibs scorePlum noProjectileTrail missionpack ragePro randomSeed randomInts randomAt smokeSeed lastScorePosition actions emitted suppressed end struct

function create()
  return State(0,0,true,true,true,false,false,false,1,[],0,0x92,[0.0,0.0,0.0],[],0,0)
end function

function effect(boundary,kind)
  return Effect(boundary,kind,0,0,0,0,0.0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0],0.0,[0.0,0.0,0.0,0.0],[0.0,0.0,0.0,0.0],"","",0.0,0.0,0.0,LEBS_NONE,LEMT_NONE,0,0,0.0,[0.0,0.0,0.0],0,0,false)
end function

function publish(state,value,retailActive)
  value.dispatched=not retailActive;state.actions=state.actions+[value]
  if value.dispatched then state.emitted=state.emitted+1 else state.suppressed=state.suppressed+1 end if
  return value
end function

function clear(state) state.actions=[];return void end function
function setRandomInts(state,values) state.randomInts=values;state.randomAt=0;return void end function
function randInt(state)
  if state.randomAt<len(state.randomInts) then value=state.randomInts[state.randomAt];state.randomAt=state.randomAt+1;return value end if
  state.randomSeed=n.add32(n.mul32(state.randomSeed,214013),2531011);return (n.u32(state.randomSeed)>>16)&32767
end function
function randomFloat(state) return n.fdiv(randInt(state),32767.0) end function
function crandom(state) return 2.0*(randomFloat(state)-0.5) end function
function smokeRandom(state)
  state.smokeSeed=n.add32(n.mul32(69069,state.smokeSeed),1)
  return n.fdiv(state.smokeSeed&65535,65536.0)
end function
function copy3(value) return [value[0],value[1],value[2]] end function
function white() return [1.0,1.0,1.0,1.0] end function

// CG_BubbleTrail
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
function smokePuff(state,p,velocity,radius,r,g,b,a,duration,startTime,fadeInTime,flags,shader,retailActive)
  value=effect("render","smoke-puff");value.leType=LE_MOVE_SCALE_FADE;value.flags=flags;value.trajectoryType=TR_LINEAR;value.startTime=startTime;value.fadeInTime=fadeInTime;value.endTime=startTime+n.trunc32(duration);fadeStart=fadeInTime;if fadeStart<=startTime then fadeStart=startTime end if;value.lifeRate=1.0/(value.endTime-fadeStart);value.position=copy3(p);value.velocity=copy3(velocity);value.radius=radius;value.color=[r,g,b,a];value.shaderColor=[r*255.0,g*255.0,b*255.0,255.0];value.rotation=smokeRandom(state)*360.0;value.shader=shader;value.shaderTime=startTime/1000.0
  if state.ragePro then value.shader=SMOKE_RAGEPRO_SHADER;value.shaderColor=[255.0,255.0,255.0,255.0] end if;value.reType=RT_SPRITE;return publish(state,value,retailActive)
end function

// CG_SpawnEffect
function spawnEffect(state,origin,retailActive)
  value=effect("render","spawn-effect");value.leType=LE_FADE_RGB;value.startTime=state.time;value.endTime=state.time+500;value.lifeRate=1.0/500.0;value.color=white();value.reType=RT_MODEL;value.shaderTime=state.time/1000.0;value.position=copy3(origin)
  if state.missionpack then value.position[2]=value.position[2]+16.0;value.model=TELEPORT_MISSIONPACK_MODEL else value.position[2]=value.position[2]-24.0;value.model=TELEPORT_MODEL;value.shader=TELEPORT_SHADER end if
  return publish(state,value,retailActive)
end function

// CG_LightningBoltBeam
function lightningBoltBeam(state,start,finish,retailActive)
  value=effect("render","lightning-bolt-beam");value.leType=LE_SHOWREFENTITY;value.startTime=state.time;value.endTime=state.time+50;value.position=copy3(start);value.oldPosition=copy3(finish);value.reType=RT_LIGHTNING;value.shader=LIGHTNING_SHADER;return publish(state,value,retailActive)
end function

// CG_KamikazeEffect
function kamikazeEffect(state,origin,retailActive)
  value=effect("render","kamikaze");value.leType=LE_KAMIKAZE;value.startTime=state.time;value.endTime=state.time+3000;value.lifeRate=1.0/3000.0;value.color=white();value.reType=RT_MODEL;value.shaderTime=state.time/1000.0;value.model=KAMIKAZE_MODEL;value.position=copy3(origin);return publish(state,value,retailActive)
end function

// CG_MakeExplosion
function makeExplosion(state,origin,direction,model,shader,msec,isSprite,retailActive)
  if msec<=0 then return error(7720,"CG_MakeExplosion: msec must be positive") end if
  offset=randInt(state)&63;value=effect("render","explosion");value.startTime=state.time-offset;value.endTime=value.startTime+msec;value.model=model;value.shader=shader;value.shaderTime=value.startTime/1000.0;value.color=[1.0,1.0,1.0,0.0]
  if isSprite then value.leType=LE_SPRITE_EXPLOSION;value.rotation=(randInt(state)%360)*1.0;if direction==void then direction=[0.0,0.0,0.0] end if;value.position=[origin[0]+direction[0]*16.0,origin[1]+direction[1]*16.0,origin[2]+direction[2]*16.0]
  else value.leType=LE_EXPLOSION;value.position=copy3(origin);if direction!=void then value.angles=copy3(direction);value.rotation=(randInt(state)%360)*1.0 end if end if
  value.oldPosition=copy3(value.position);return publish(state,value,retailActive)
end function

// CG_ObeliskExplode
function obeliskExplode(state,origin,entityNum,retailActive)
  raised=[origin[0],origin[1],origin[2]+64.0];value=makeExplosion(state,raised,[0.0,0.0,0.0],DISH_FLASH_MODEL,ROCKET_EXPLOSION_SHADER,600,true,retailActive);if value is error then return value end if;value.kind="obelisk-explode";value.entity=entityNum;value.light=300.0;value.lightColor=[1.0,0.75,0.0];return value
end function

function variationSound(prefix,choice)
  suffix="01.wav";if choice==2 then suffix="02.wav" else if choice==3 then suffix="03.wav" end if;return "sound/items/"+prefix+suffix
end function
function soundAction(state,kind,origin,sound,retailActive)
  value=effect("audio",kind);value.position=copy3(origin);value.shader=sound;value.entity=ENTITYNUM_NONE;value.channel=CHAN_BODY;return publish(state,value,retailActive)
end function

// CG_ObeliskPain
function obeliskPain(state,origin,retailActive)
  choice=randInt(state)&3;if choice<2 then choice=1 end if;return soundAction(state,"obelisk-pain",origin,variationSound("obelisk_hit_",choice),retailActive)
end function

// CG_InvulnerabilityImpact
function invulnerabilityImpact(state,origin,angles,retailActive)
  value=effect("render","invulnerability-impact");value.leType=LE_INVULIMPACT;value.startTime=state.time;value.endTime=state.time+1000;value.lifeRate=1.0/1000.0;value.color=white();value.reType=RT_MODEL;value.shaderTime=state.time/1000.0;value.model=INVUL_IMPACT_MODEL;value.position=copy3(origin);value.angles=copy3(angles);publish(state,value,retailActive)
  choice=randInt(state)&3;if choice<2 then choice=1 end if;soundAction(state,"invulnerability-impact-sound",origin,variationSound("invul_impact_",choice),retailActive);return value
end function

// CG_InvulnerabilityJuiced
function invulnerabilityJuiced(state,origin,retailActive)
  value=effect("render","invulnerability-juiced");value.leType=LE_INVULJUICED;value.startTime=state.time;value.endTime=state.time+10000;value.lifeRate=1.0/10000.0;value.color=white();value.reType=RT_MODEL;value.shaderTime=state.time/1000.0;value.model=INVUL_JUICED_MODEL;value.position=copy3(origin);publish(state,value,retailActive);soundAction(state,"invulnerability-juiced-sound",origin,"sound/items/invul_juiced.wav",retailActive);return value
end function

// CG_ScorePlum
function scorePlum(state,client,origin,score,retailActive)
  if client!=state.predictedClient or not state.scorePlum then return void end if
  value=effect("render","score-plum");value.leType=LE_SCOREPLUM;value.startTime=state.time;value.endTime=state.time+4000;value.lifeRate=1.0/4000.0;value.color=white();value.radius=score*1.0;value.position=copy3(origin);if origin[2]>=state.lastScorePosition[2]-20.0 and origin[2]<=state.lastScorePosition[2]+20.0 then value.position[2]=value.position[2]-20.0 end if;state.lastScorePosition=copy3(origin);value.reType=RT_SPRITE;return publish(state,value,retailActive)
end function

// CG_Bleed
function bleed(state,origin,entityNum,retailActive)
  if not state.blood then return void end if
  value=effect("render","bleed");value.leType=LE_EXPLOSION;value.startTime=state.time;value.endTime=state.time+500;value.position=copy3(origin);value.reType=RT_SPRITE;value.rotation=(randInt(state)%360)*1.0;value.radius=24.0;value.shader=BLOOD_EXPLOSION_SHADER;if entityNum==state.predictedClient then value.renderfx=value.renderfx|RF_THIRD_PERSON end if;return publish(state,value,retailActive)
end function

function fragment(state,kind,origin,velocity,model,duration,spread,bounce,bounceSound,markType,retailActive)
  value=effect("render",kind);value.leType=LE_FRAGMENT;value.trajectoryType=TR_GRAVITY;value.startTime=state.time;value.endTime=state.time+duration+n.trunc32(randomFloat(state)*spread);value.position=copy3(origin);value.velocity=copy3(velocity);value.model=model;value.bounceFactor=bounce;value.bounceSound=bounceSound;value.markType=markType;return publish(state,value,retailActive)
end function

// CG_LaunchGib
function launchGib(state,origin,velocity,model,retailActive) return fragment(state,"gib",origin,velocity,model,5000,3000.0,0.6,LEBS_BLOOD,LEMT_BLOOD,retailActive) end function
// CG_LaunchExplode
function launchExplode(state,origin,velocity,model,retailActive) return fragment(state,"explode-fragment",origin,velocity,model,10000,6000.0,0.1,LEBS_BRASS,LEMT_NONE,retailActive) end function

function gibVelocity(state,horizontal,jump) return [crandom(state)*horizontal,crandom(state)*horizontal,jump+crandom(state)*horizontal] end function

// CG_GibPlayer
function gibPlayer(state,origin,retailActive)
  if not state.blood then return [] end if;result=[];velocity=gibVelocity(state,250.0,250.0);model="models/gibs/brain.md3";if (randInt(state)&1)!=0 then model="models/gibs/skull.md3" end if;result=result+[launchGib(state,origin,velocity,model,retailActive)]
  if not state.gibs then return result end if
  models=["models/gibs/abdomen.md3","models/gibs/arm.md3","models/gibs/chest.md3","models/gibs/fist.md3","models/gibs/foot.md3","models/gibs/forearm.md3","models/gibs/intestine.md3","models/gibs/leg.md3","models/gibs/leg.md3"]
  for each name in models result=result+[launchGib(state,origin,gibVelocity(state,250.0,250.0),name,retailActive)] end for;return result
end function

// CG_BigExplode
function bigExplode(state,origin,retailActive)
  if not state.blood then return [] end if;result=[];scales=[1.0,1.0,1.5,2.0,2.5]
  for each scale in scales velocity=[crandom(state)*100.0*scale,crandom(state)*100.0*scale,150.0+crandom(state)*100.0];result=result+[launchExplode(state,origin,velocity,SMOKE2_MODEL,retailActive)] end for;return result
end function
