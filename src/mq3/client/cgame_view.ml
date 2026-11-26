// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Renderer-neutral semantic port of code/cgame/cg_view.c.  The retail QVM may
// remain the actual producer; every native renderer/audio/system call is kept
// as a typed boundary record and can be suppressed to avoid double dispatch.
package mq3.client.cgame_view
import mq3.client.cg_local as cgabi

import mq3.compat.numeric as n
import mq3.compat.transcendental as crt
import mq3.compat.textnumbers as textNumbers
import mq3.game.constants as c
import mq3.game.playerstate as playerstate
import mq3.shared.math as q
/// Evaluates the tangent of an angle in radians using the Windows C runtime. This binding is used by client game view.
/// @param value Angle in radians, passed as a native double.
/// @returns The tangent of the supplied angle.
extern function tan(value as double) from "ucrtbase.dll" returns double

const PMF_DUCKED=1
const DF_FIXED_FOV=16
const CONTENTS_LAVA=8
const CONTENTS_SLIME=16
const CONTENTS_WATER=32
const MASK_WATER=56
const RF_MINLIGHT=1
const RF_FIRST_PERSON=4
const RF_DEPTHHACK=8
const RT_SPRITE=2
const RDF_NOWORLDMODEL=1
const RDF_HYPERSPACE=4
const SNAPFLAG_NOT_ACTIVE=2
const STEREO_RIGHT=2
const CHAN_ITEM=4
const CHAN_ANNOUNCER=7
const MAX_POWERUPS=16
const MAX_SOUNDBUFFER=cgabi.MAX_SOUNDBUFFER
const STEP_TIME=cgabi.STEP_TIME
const DUCK_TIME=cgabi.DUCK_TIME
const LAND_DEFLECT_TIME=cgabi.LAND_DEFLECT_TIME
const LAND_RETURN_TIME=cgabi.LAND_RETURN_TIME
const DAMAGE_DEFLECT_TIME=cgabi.DAMAGE_DEFLECT_TIME
const DAMAGE_RETURN_TIME=cgabi.DAMAGE_RETURN_TIME
const DAMAGE_TIME=cgabi.DAMAGE_TIME
const ZOOM_TIME=cgabi.ZOOM_TIME
const POWERUP_BLINKS=cgabi.POWERUP_BLINKS
const POWERUP_BLINK_TIME=cgabi.POWERUP_BLINK_TIME
const FOCUS_DISTANCE=512.0
const PI=3.14159265358979323846

/// Stores client game view render entity record, including `reType`, `origin`, `axis`, `frame`, `oldframe`, `backlerp` and additional values.
struct RenderEntity reType origin axis frame oldframe backlerp model skinNum renderfx radius shader rgba dispatched end struct
/// Stores client game view ref def record, including `x`, `y`, `width`, `height`, `fovX`, `fovY` and additional values.
struct RefDef x y width height fovX fovY vieworg viewaxis rdflags time areamask end struct
/// Stores client game view snapshot metadata and contents, including `ps`, `snapFlags`, `areamask`.
struct Snapshot ps snapFlags areamask end struct
/// Stores client game view trace record, including `fraction`, `endpos`.
struct Trace fraction endpos end struct
/// Stores client game view boundary record, including `domain`, `kind`, `entity`, `sound`, `value`, `dispatched`.
struct Boundary domain kind entity sound value dispatched end struct
/// Stores client game view state, including `time`, `oldTime`, `frameTime`, `demoPlayback`, `infoScreenText`, `snap` and additional values.
struct State
  time oldTime frameTime demoPlayback infoScreenText snap predicted refdef viewAngles
  vidWidth vidHeight viewsize fov zoomFov dmflags contents zoomed zoomTime zoomSensitivity
  renderingThirdPerson thirdPerson thirdPersonAngle thirdPersonRange cameraMode cameraOrbit cameraOrbitDelay nextOrbitTime
  kickAngles kickOrigin damageTime damagePitch damageRoll damageValue damageX damageY ragePro viewBloodShader
  xySpeed bobCycle bobFracSin runPitch runRoll bobPitch bobRoll bobUp duckTime duckChange landTime landChange stepTime stepChange
  predictedError predictedErrorTime errorDecay hyperspace weaponSelect clientFrame
  testModelName testModel testGun gunX gunY gunZ
  soundBuffer soundBufferIn soundBufferOut soundTime wearOffSound
  timescale timescaleFadeEnd timescaleFadeSpeed traces traceAt actions scene audio system emitted suppressed
end struct

/// Copies the X, Y and Z components into a fresh client game view vector.
/// @param v Sequence read at `v[0]`, `v[1]`, `v[2]`.
function copy3(v) return [v[0],v[1],v[2]] end function
/// Creates the three orthonormal unit axes used as the identity orientation in client game view.
function identityAxis() return [[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]] end function
/// Creates a `mq3.client.cgame_view.RenderEntity` record. Initializes the record with the defaults written in this constructor.
function renderEntity() return RenderEntity(0,[0.0,0.0,0.0],identityAxis(),0,0,0.0,0,0,0,0.0,0,[0,0,0,0],false) end function
/// Creates a `mq3.client.cgame_view.RefDef` record. Initializes the record with the defaults written in this constructor.
function refDef() return RefDef(0,0,0,0,90.0,90.0,[0.0,0.0,0.0],identityAxis(),0,0,[]) end function
/// Creates a `mq3.client.cgame_view.Snapshot` record. Assigns `ps` from `ps`, `snapFlags` from `flags`, `areamask` from `areamask`.
/// @param ps Value used to initialize `Snapshot.ps`.
/// @param flags Value used to initialize `Snapshot.snapFlags`.
/// @param areamask Value used to initialize `Snapshot.areamask`.
function snapshot(ps,flags,areamask) return Snapshot(ps,flags,areamask) end function

/// Calls `mq3.game.playerstate.create`, `mq3.client.cgame_view.State`, `mq3.client.cgame_view.refDef` and additional helpers from client game view `create`.
function create()
  ps=playerstate.create()
  return State(0,0,0,false,"",void,ps,refDef(),[0.0,0.0,0.0],640,480,100,90.0,22.5,0,0,false,0,1.0,false,false,0.0,80.0,false,0,0,0,[0.0,0.0,0.0],[0.0,0.0,0.0],0,0.0,0.0,0,0.0,0.0,false,"gfx/2d/bloodScreen",0.0,0,0.0,0.002,0.005,0.002,0.002,0.005,0,0.0,0,0.0,0,0.0,[0.0,0.0,0.0],0,100.0,false,0,0,"",renderEntity(),false,0.0,0.0,0.0,array(MAX_SOUNDBUFFER,0),0,0,0,"sound/items/wearoff.wav",1.0,1.0,0.0,[],0,[],[],[],[],0,0)
end function

/// Updates `state.actions`, `state.scene`, `state.audio`, `state.system` and additional values during client game view `boundary`.
/// @param state Mutable client game view record/storage; this routine assigns `state.actions`, `state.scene`, `state.audio`, `state.system` and additional values.
/// @param domain Value used by `action=Boundary(domain,kind,entity,sound,value,emit)`.
/// @param kind Action/operation identifier used to select the engine service request.
/// @param entity Value used by `action=Boundary(domain,kind,entity,sound,value,emit)`.
/// @param sound Sound handle or asset name passed to the audio action.
/// @param value Value used by `action=Boundary(domain,kind,entity,sound,value,emit)`.
/// @param emit Value used by `action=Boundary(domain,kind,entity,sound,value,emit)`.
function boundary(state,domain,kind,entity,sound,value,emit)
  action=Boundary(domain,kind,entity,sound,value,emit);state.actions=state.actions+[action]
  if domain=="scene" then state.scene=state.scene+[action] else if domain=="audio" then state.audio=state.audio+[action] else state.system=state.system+[action] end if
  if emit then state.emitted=state.emitted+1 else state.suppressed=state.suppressed+1 end if
  return action
end function
/// Adapts `mq3.client.cgame_view.boundary` to client game view `dispatch`, returning its result for `state, domain, kind, entity, sound, value, not retailActive`.
/// @param state Argument 1 of `mq3.client.cgame_view.boundary`.
/// @param domain Argument 2 of `mq3.client.cgame_view.boundary`.
/// @param kind Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_view.boundary`.
/// @param entity Argument 4 of `mq3.client.cgame_view.boundary`.
/// @param sound Argument 5 of `mq3.client.cgame_view.boundary`.
/// @param value Argument 6 of `mq3.client.cgame_view.boundary`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_view.boundary`.
function dispatch(state,domain,kind,entity,sound,value,retailActive) return boundary(state,domain,kind,entity,sound,value,not retailActive) end function
/// Updates `state.actions`, `state.scene`, `state.audio`, `state.system` during client game view `clearBoundaries`.
/// @param state Mutable client game view record/storage; this routine assigns `state.actions`, `state.scene`, `state.audio`, `state.system`.
function clearBoundaries(state) state.actions=[];state.scene=[];state.audio=[];state.system=[];return void end function

// CG_TestModel_f
/// @param state Mutable client game view record/storage; this routine assigns `state.testModel`, `state.testModelName`, `state.testGun`, `state.testModel.model` and additional values.
/// @param args Sequence read at `args[1]`, `args[2]`.
/// @param modelHandle Value assigned to `state.testModel.model`.
function testModel(state,args,modelHandle)
  state.testModel=renderEntity();state.testModelName="";state.testGun=false
  if len(args)<2 then return false end if
  state.testModelName=args[1];state.testModel.model=modelHandle
  if len(args)==3 then state.testModel.backlerp=textNumbers.atof32(args[2]);state.testModel.frame=1;state.testModel.oldframe=0 end if
  if modelHandle==0 then return false end if
  state.testModel.origin=q.VectorMA(state.refdef.vieworg,100.0,state.refdef.viewaxis[0])
  state.testModel.axis=q.AngleVectors([0.0,n.fadd(180.0,state.viewAngles[1]),0.0]);return true
end function

// CG_TestGun_f
/// @param state Mutable client game view record/storage; this routine assigns `state.testGun`, `state.testModel.renderfx`.
/// @param args Value used by `ok=testModel(state,args,modelHandle)`.
/// @param modelHandle Value used by `ok=testModel(state,args,modelHandle)`.
function testGun(state,args,modelHandle)
  ok=testModel(state,args,modelHandle);state.testGun=true;state.testModel.renderfx=RF_MINLIGHT|RF_DEPTHHACK|RF_FIRST_PERSON;return ok
end function
// CG_TestModelNextFrame_f
/// @param state Mutable client game view record/storage; this routine assigns `state.testModel.frame`.
function testModelNextFrame(state) state.testModel.frame=state.testModel.frame+1;return state.testModel.frame end function
// CG_TestModelPrevFrame_f
/// @param state Mutable client game view record/storage; this routine assigns `state.testModel.frame`.
function testModelPrevFrame(state) state.testModel.frame=state.testModel.frame-1;if state.testModel.frame<0 then state.testModel.frame=0 end if;return state.testModel.frame end function
// CG_TestModelNextSkin_f
/// @param state Mutable client game view record/storage; this routine assigns `state.testModel.skinNum`.
function testModelNextSkin(state) state.testModel.skinNum=state.testModel.skinNum+1;return state.testModel.skinNum end function
// CG_TestModelPrevSkin_f
/// @param state Mutable client game view record/storage; this routine assigns `state.testModel.skinNum`.
function testModelPrevSkin(state) state.testModel.skinNum=state.testModel.skinNum-1;if state.testModel.skinNum<0 then state.testModel.skinNum=0 end if;return state.testModel.skinNum end function

// CG_AddTestModel
/// @param state Mutable client game view record/storage; this routine assigns `state.testModel.model`, `state.testModel.origin`, `state.testModel.axis`, `state.testModel.dispatched`.
/// @param modelHandle Value assigned to `state.testModel.model`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function addTestModel(state,modelHandle,retailActive)
  state.testModel.model=modelHandle;if modelHandle==0 then return void end if
  if state.testGun then
    state.testModel.origin=copy3(state.refdef.vieworg);state.testModel.axis=[copy3(state.refdef.viewaxis[0]),copy3(state.refdef.viewaxis[1]),copy3(state.refdef.viewaxis[2])]
    state.testModel.origin=q.VectorMA(state.testModel.origin,state.gunX,state.refdef.viewaxis[0]);state.testModel.origin=q.VectorMA(state.testModel.origin,state.gunY,state.refdef.viewaxis[1]);state.testModel.origin=q.VectorMA(state.testModel.origin,state.gunZ,state.refdef.viewaxis[2])
  end if
  state.testModel.dispatched=not retailActive;return dispatch(state,"scene","test-model",0,0,state.testModel,retailActive)
end function

// CG_CalcVrect
/// @param state Mutable client game view record/storage; this routine assigns `state.viewsize`, `state.refdef.width`, `state.refdef.height`, `state.refdef.x` and additional values.
function calcVrect(state)
  size=state.viewsize
  if state.predicted.pm_type==c.PM_INTERMISSION then size=100 else if size<30 then size=30;state.viewsize=30 else if size>100 then size=100;state.viewsize=100 end if
  state.refdef.width=n.trunc32(state.vidWidth*size/100)&~1;state.refdef.height=n.trunc32(state.vidHeight*size/100)&~1
  state.refdef.x=n.trunc32((state.vidWidth-state.refdef.width)/2);state.refdef.y=n.trunc32((state.vidHeight-state.refdef.height)/2);return size
end function

/// Updates `state.traceAt` during client game view `nextTrace`.
/// @param state Mutable client game view record/storage; this routine assigns `state.traceAt`.
/// @param target Value used by `return Trace(1.0,copy3(target))`.
function nextTrace(state,target)
  if state.traceAt<len(state.traces) then value=state.traces[state.traceAt];state.traceAt=state.traceAt+1;return value end if
  return Trace(1.0,copy3(target))
end function

// CG_OffsetThirdPersonView
/// @param state Mutable client game view record/storage; this routine assigns `state.refdef.vieworg[2]`, `state.viewAngles[1]`, `state.viewAngles[0]`, `state.refdef.vieworg`.
function offsetThirdPersonView(state)
  state.refdef.vieworg[2]=n.fadd(state.refdef.vieworg[2],state.predicted.viewheight);focusAngles=copy3(state.viewAngles)
  if state.predicted.stats[c.STAT_HEALTH]<=0 then focusAngles[1]=state.predicted.stats[c.STAT_DEAD_YAW];state.viewAngles[1]=focusAngles[1] end if
  if focusAngles[0]>45.0 then focusAngles[0]=45.0 end if;focusAxis=q.AngleVectors(focusAngles);focusPoint=q.VectorMA(state.refdef.vieworg,FOCUS_DISTANCE,focusAxis[0]);view=copy3(state.refdef.vieworg);view[2]=n.fadd(view[2],8.0);state.viewAngles[0]=n.fmul(state.viewAngles[0],0.5);axis=q.AngleVectors(state.viewAngles)
  angle=n.fmul(n.fdiv(state.thirdPersonAngle,180.0),n.f32(PI));forwardScale=n.f32(crt.cos(angle));sideScale=n.f32(crt.sin(angle));view=q.VectorMA(view,n.fneg(n.fmul(state.thirdPersonRange,forwardScale)),axis[0]);view=q.VectorMA(view,n.fneg(n.fmul(state.thirdPersonRange,sideScale)),axis[1])
  if not state.cameraMode then first=nextTrace(state,view);if first.fraction!=1.0 then view=copy3(first.endpos);view[2]=n.fadd(view[2],n.fmul(n.fsub(1.0,first.fraction),32.0));second=nextTrace(state,view);view=copy3(second.endpos) end if end if
  state.refdef.vieworg=copy3(view);focusPoint=[n.fsub(focusPoint[0],view[0]),n.fsub(focusPoint[1],view[1]),n.fsub(focusPoint[2],view[2])];focusDist=n.fsqrt(n.fadd(n.fmul(focusPoint[0],focusPoint[0]),n.fmul(focusPoint[1],focusPoint[1])));if focusDist<1.0 then focusDist=1.0 end if
  state.viewAngles[0]=n.fneg(n.f32(n.fdiv(n.fmul(180.0,crt.atan2(focusPoint[2],focusDist)),n.f32(PI))));state.viewAngles[1]=n.fsub(state.viewAngles[1],state.thirdPersonAngle);return void
end function

// CG_StepOffset
/// @param state Mutable client game view record/storage; this routine assigns `state.refdef.vieworg[2]`.
function stepOffset(state)
  delta=state.time-state.stepTime;if delta<STEP_TIME then state.refdef.vieworg[2]=n.fsub(state.refdef.vieworg[2],n.fdiv(n.fmul(state.stepChange,STEP_TIME-delta),STEP_TIME)) end if;return void
end function

// CG_OffsetFirstPersonView
/// @param state Mutable client game view record/storage; this routine assigns `state.viewAngles[2]`, `state.viewAngles[0]`, `state.viewAngles[1]`, `state.refdef.vieworg[2]` and additional values.
function offsetFirstPersonView(state)
  if state.predicted.pm_type==c.PM_INTERMISSION then return void end if
  if state.snap.ps.stats[c.STAT_HEALTH]<=0 then state.viewAngles[2]=40.0;state.viewAngles[0]=-15.0;state.viewAngles[1]=state.snap.ps.stats[c.STAT_DEAD_YAW];state.refdef.vieworg[2]=n.fadd(state.refdef.vieworg[2],state.predicted.viewheight);return void end if
  for i=0 to 2 state.viewAngles[i]=n.fadd(state.viewAngles[i],state.kickAngles[i]) end for
  if state.damageTime!=0 then ratio=state.time-state.damageTime;if ratio<DAMAGE_DEFLECT_TIME then ratio=n.fdiv(ratio,DAMAGE_DEFLECT_TIME);state.viewAngles[0]=n.fadd(state.viewAngles[0],n.fmul(ratio,state.damagePitch));state.viewAngles[2]=n.fadd(state.viewAngles[2],n.fmul(ratio,state.damageRoll)) else ratio=n.fsub(1.0,n.fdiv(ratio-DAMAGE_DEFLECT_TIME,DAMAGE_RETURN_TIME));if ratio>0 then state.viewAngles[0]=n.fadd(state.viewAngles[0],n.fmul(ratio,state.damagePitch));state.viewAngles[2]=n.fadd(state.viewAngles[2],n.fmul(ratio,state.damageRoll)) end if end if end if
  delta=q.DotProduct(state.predicted.velocity,state.refdef.viewaxis[0]);state.viewAngles[0]=n.fadd(state.viewAngles[0],n.fmul(delta,state.runPitch));delta=q.DotProduct(state.predicted.velocity,state.refdef.viewaxis[1]);state.viewAngles[2]=n.fsub(state.viewAngles[2],n.fmul(delta,state.runRoll));speed=state.xySpeed;if speed<200.0 then speed=200.0 end if
  delta=n.fmul(n.fmul(state.bobFracSin,state.bobPitch),speed);if (state.predicted.pm_flags&PMF_DUCKED)!=0 then delta=n.fmul(delta,3.0) end if;state.viewAngles[0]=n.fadd(state.viewAngles[0],delta)
  delta=n.fmul(n.fmul(state.bobFracSin,state.bobRoll),speed);if (state.predicted.pm_flags&PMF_DUCKED)!=0 then delta=n.fmul(delta,3.0) end if;if (state.bobCycle&1)!=0 then delta=n.fneg(delta) end if;state.viewAngles[2]=n.fadd(state.viewAngles[2],delta)
  state.refdef.vieworg[2]=n.fadd(state.refdef.vieworg[2],state.predicted.viewheight);timeDelta=state.time-state.duckTime;if timeDelta<DUCK_TIME then state.refdef.vieworg[2]=n.fsub(state.refdef.vieworg[2],n.fdiv(n.fmul(state.duckChange,DUCK_TIME-timeDelta),DUCK_TIME)) end if
  bob=n.fmul(n.fmul(state.bobFracSin,state.xySpeed),state.bobUp);if bob>6.0 then bob=6.0 end if;state.refdef.vieworg[2]=n.fadd(state.refdef.vieworg[2],bob)
  delta=state.time-state.landTime;if delta<LAND_DEFLECT_TIME then state.refdef.vieworg[2]=n.fadd(state.refdef.vieworg[2],n.fmul(state.landChange,n.fdiv(delta,LAND_DEFLECT_TIME))) else if delta<LAND_DEFLECT_TIME+LAND_RETURN_TIME then state.refdef.vieworg[2]=n.fadd(state.refdef.vieworg[2],n.fmul(state.landChange,n.fsub(1.0,n.fdiv(delta-LAND_DEFLECT_TIME,LAND_RETURN_TIME)))) end if
  stepOffset(state);for i=0 to 2 state.refdef.vieworg[i]=n.fadd(state.refdef.vieworg[i],state.kickOrigin[i]) end for;return void
end function

// CG_ZoomDown_f / CG_ZoomUp_f
/// @param state Mutable client game view record/storage; this routine assigns `state.zoomed`, `state.zoomTime`.
function zoomDown(state) if state.zoomed then return false end if;state.zoomed=true;state.zoomTime=state.time;return true end function
/// Updates `state.zoomed`, `state.zoomTime` during client game view `zoomUp`.
/// @param state Mutable client game view record/storage; this routine assigns `state.zoomed`, `state.zoomTime`.
function zoomUp(state) if not state.zoomed then return false end if;state.zoomed=false;state.zoomTime=state.time;return true end function

// CG_CalcFov
/// @param state Mutable client game view record/storage; this routine assigns `state.refdef.fovX`, `state.refdef.fovY`, `state.zoomSensitivity`.
function calcFov(state)
  fovX=state.fov
  if state.predicted.pm_type==c.PM_INTERMISSION or (state.dmflags&DF_FIXED_FOV)!=0 then
    fovX=90.0
  else
    if fovX<1.0 then fovX=1.0 end if
    if fovX>160.0 then fovX=160.0 end if
  end if
  zoom=state.zoomFov;if zoom<1.0 then zoom=1.0 end if;if zoom>160.0 then zoom=160.0 end if
  fraction=n.fdiv(state.time-state.zoomTime,ZOOM_TIME)
  if state.zoomed then
    if fraction>1.0 then fovX=zoom else fovX=n.fadd(fovX,n.fmul(fraction,n.fsub(zoom,fovX))) end if
  else
    if fraction<=1.0 then fovX=n.fadd(zoom,n.fmul(fraction,n.fsub(fovX,zoom))) end if
  end if
  width=n.f32(state.refdef.width);height=n.f32(state.refdef.height);angle=n.fmul(n.fdiv(fovX,360.0),n.f32(PI));x=n.f32(width/tan(angle));fovY=n.f32(crt.atan2(height,x)*360.0/n.f32(PI));inwater=(state.contents&MASK_WATER)!=0
  if inwater then phase=n.f32(state.time/1000.0*0.4*n.f32(PI)*2.0);wave=n.f32(crt.sin(phase));fovX=n.fadd(fovX,wave);fovY=n.fsub(fovY,wave) end if
  state.refdef.fovX=fovX;state.refdef.fovY=fovY;if state.zoomed then state.zoomSensitivity=n.f32(fovY/75.0) else state.zoomSensitivity=1.0 end if;return inwater
end function

// CG_DamageBlendBlob
/// @param state Record read through `state.damageValue`, `state.ragePro`, `state.time`, `state.damageTime` and additional values.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function damageBlendBlob(state,retailActive)
  if state.damageValue==0 or state.ragePro then return void end if;t=state.time-state.damageTime;if t<=0 or t>=DAMAGE_TIME then return void end if
  ent=renderEntity();ent.reType=RT_SPRITE;ent.renderfx=RF_FIRST_PERSON;ent.origin=q.VectorMA(state.refdef.vieworg,8.0,state.refdef.viewaxis[0]);ent.origin=q.VectorMA(ent.origin,n.fmul(state.damageX,-8.0),state.refdef.viewaxis[1]);ent.origin=q.VectorMA(ent.origin,n.fmul(state.damageY,8.0),state.refdef.viewaxis[2]);ent.radius=n.fmul(state.damageValue,3.0);ent.shader=state.viewBloodShader;ent.rgba=[255,255,255,n.trunc32(n.fmul(200.0,n.fsub(1.0,n.fdiv(t,DAMAGE_TIME))))];ent.dispatched=not retailActive;dispatch(state,"scene","damage-blend",0,0,ent,retailActive);return ent
end function

// CG_CalcViewValues
/// @param state Mutable client game view record/storage; this routine assigns `state.refdef`, `state.refdef.vieworg`, `state.viewAngles`, `state.refdef.viewaxis` and additional values.
function calcViewValues(state)
  state.refdef=refDef();calcVrect(state);ps=state.predicted
  if ps.pm_type==c.PM_INTERMISSION then state.refdef.vieworg=copy3(ps.origin);state.viewAngles=copy3(ps.viewangles);state.refdef.viewaxis=q.AngleVectors(state.viewAngles);return calcFov(state) end if
  state.bobCycle=(ps.bobCycle&128)>>7;state.bobFracSin=q.Q_fabs(n.f32(crt.sin(n.fmul(n.fdiv(ps.bobCycle&127,127.0),n.f32(PI)))));state.xySpeed=n.fsqrt(n.fadd(n.fmul(ps.velocity[0],ps.velocity[0]),n.fmul(ps.velocity[1],ps.velocity[1])));state.refdef.vieworg=copy3(ps.origin);state.viewAngles=copy3(ps.viewangles)
  if state.cameraOrbit!=0 and state.time>state.nextOrbitTime then state.nextOrbitTime=state.time+state.cameraOrbitDelay;state.thirdPersonAngle=n.fadd(state.thirdPersonAngle,state.cameraOrbit) end if
  if state.errorDecay>0 then elapsed=state.time-state.predictedErrorTime;fraction=n.fdiv(state.errorDecay-elapsed,state.errorDecay);if fraction>0 and fraction<1 then state.refdef.vieworg=q.VectorMA(state.refdef.vieworg,fraction,state.predictedError) else state.predictedErrorTime=0 end if end if
  if state.renderingThirdPerson then offsetThirdPersonView(state) else offsetFirstPersonView(state) end if;state.refdef.viewaxis=q.AngleVectors(state.viewAngles);if state.hyperspace then state.refdef.rdflags=state.refdef.rdflags|RDF_NOWORLDMODEL|RDF_HYPERSPACE end if;return calcFov(state)
end function

// CG_PowerupTimerSounds
/// @param state Record read through `state.snap.ps.powerups`, `state.time`, `state.oldTime`, `state.snap.ps.clientNum` and additional values.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function powerupTimerSounds(state,retailActive)
  count=0;for i=0 to MAX_POWERUPS-1 expires=state.snap.ps.powerups[i];if expires>state.time and expires-state.time<POWERUP_BLINKS*POWERUP_BLINK_TIME and n.trunc32((expires-state.time)/POWERUP_BLINK_TIME)!=n.trunc32((expires-state.oldTime)/POWERUP_BLINK_TIME) then dispatch(state,"audio","powerup-wearoff",state.snap.ps.clientNum,state.wearOffSound,void,retailActive);count=count+1 end if end for;return count
end function

// CG_AddBufferedSound
/// @param state Mutable client game view record/storage; this routine assigns `state.soundBuffer[state.soundBufferIn]`, `state.soundBufferIn`, `state.soundBufferOut`.
/// @param sound Sound handle or asset name passed to the audio action.
function addBufferedSound(state,sound)
  if sound==0 then return false end if;state.soundBuffer[state.soundBufferIn]=sound;state.soundBufferIn=(state.soundBufferIn+1)%MAX_SOUNDBUFFER;if state.soundBufferIn==state.soundBufferOut then state.soundBufferOut=state.soundBufferOut+1 end if;return true
end function

// CG_PlayBufferedSounds
/// @param state Mutable client game view record/storage; this routine assigns `state.soundBuffer[state.soundBufferOut]`, `state.soundBufferOut`, `state.soundTime`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function playBufferedSounds(state,retailActive)
  if state.soundTime<state.time and state.soundBufferOut!=state.soundBufferIn and state.soundBuffer[state.soundBufferOut]!=0 then sound=state.soundBuffer[state.soundBufferOut];dispatch(state,"audio","buffered-announcer",-1,sound,void,retailActive);state.soundBuffer[state.soundBufferOut]=0;state.soundBufferOut=(state.soundBufferOut+1)%MAX_SOUNDBUFFER;state.soundTime=state.time+750;return sound end if;return 0
end function

/// Adapts `mq3.client.cgame_view.dispatch` to client game view `frameBoundary`, returning its result for `state, "system", kind, 0, 0, void, retailActive`.
/// @param state Argument 1 of `mq3.client.cgame_view.dispatch`.
/// @param kind Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_view.dispatch`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. Forwarded to `mq3.client.cgame_view.dispatch`.
function frameBoundary(state,kind,retailActive) return dispatch(state,"system",kind,0,0,void,retailActive) end function

// CG_DrawActiveFrame.  The subsystem calls retain original ordering.  The
// producer is selected by retailActive; observers still receive every action.
/// @param state Mutable client game view record/storage; this routine assigns `state.time`, `state.demoPlayback`, `state.clientFrame`, `state.renderingThirdPerson` and additional values.
/// @param serverTime Authoritative server timestamp in milliseconds.
/// @param stereoView Value used by `if stereoView!=STEREO_RIGHT then state.frameTime=state.time-state.oldTime`.
/// @param demoPlayback Value assigned to `state.demoPlayback`.
/// @param retailActive Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag.
function drawActiveFrame(state,serverTime,stereoView,demoPlayback,retailActive)
  state.time=serverTime;state.demoPlayback=demoPlayback;frameBoundary(state,"update-cvars",retailActive)
  if state.infoScreenText!="" then frameBoundary(state,"draw-information",retailActive);return false end if
  dispatch(state,"audio","clear-looping",0,0,void,retailActive);frameBoundary(state,"clear-scene",retailActive);frameBoundary(state,"process-snapshots",retailActive)
  if state.snap==void or (state.snap.snapFlags&SNAPFLAG_NOT_ACTIVE)!=0 then frameBoundary(state,"draw-information",retailActive);return false end if
  dispatch(state,"system","set-usercmd",state.weaponSelect,0,state.zoomSensitivity,retailActive);state.clientFrame=state.clientFrame+1;frameBoundary(state,"predict-player-state",retailActive);state.renderingThirdPerson=state.thirdPerson or state.snap.ps.stats[c.STAT_HEALTH]<=0;inwater=calcViewValues(state)
  if not state.renderingThirdPerson then damageBlendBlob(state,retailActive) end if
  if not state.hyperspace then frameBoundary(state,"add-packet-entities",retailActive);frameBoundary(state,"add-marks",retailActive);frameBoundary(state,"add-particles",retailActive);frameBoundary(state,"add-local-entities",retailActive) end if
  frameBoundary(state,"add-view-weapon",retailActive);playBufferedSounds(state,retailActive);frameBoundary(state,"play-buffered-voice",retailActive);if state.testModel.model!=0 then addTestModel(state,state.testModel.model,retailActive) end if;state.refdef.time=state.time;state.refdef.areamask=state.snap.areamask;powerupTimerSounds(state,retailActive);dispatch(state,"audio","respatialize",state.snap.ps.clientNum,0,[copy3(state.refdef.vieworg),state.refdef.viewaxis,inwater],retailActive)
  if stereoView!=STEREO_RIGHT then state.frameTime=state.time-state.oldTime;if state.frameTime<0 then state.frameTime=0 end if;state.oldTime=state.time;frameBoundary(state,"lagometer-frame",retailActive) end if
  if state.timescale!=state.timescaleFadeEnd then if state.timescale<state.timescaleFadeEnd then state.timescale=n.fadd(state.timescale,n.fmul(state.timescaleFadeSpeed,n.fdiv(state.frameTime,1000.0)));if state.timescale>state.timescaleFadeEnd then state.timescale=state.timescaleFadeEnd end if else state.timescale=n.fsub(state.timescale,n.fmul(state.timescaleFadeSpeed,n.fdiv(state.frameTime,1000.0)));if state.timescale<state.timescaleFadeEnd then state.timescale=state.timescaleFadeEnd end if end if;if state.timescaleFadeSpeed!=0 then dispatch(state,"system","set-timescale",0,0,state.timescale,retailActive) end if end if
  frameBoundary(state,"draw-active",retailActive);return true
end function
