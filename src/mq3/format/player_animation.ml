// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Player animation.cfg parsing and frame sampling from cgame/cg_players.c.
package mq3.format.player_animation

import mq3.compat.numeric as n
import mq3.compat.textnumbers as numbers
import mq3.format.md3 as md3
import mq3.shared.parser as parser
import std.string as strings

const BOTH_DEATH1=0
const BOTH_DEAD1=1
const TORSO_GESTURE=6
const TORSO_ATTACK=7
const TORSO_RAISE=10
const TORSO_STAND=11
const LEGS_WALKCR=13
const LEGS_WALK=14
const LEGS_RUN=15
const LEGS_IDLE=22
const TORSO_GETFLAG=25
const TORSO_NEGATIVE=30
const MAX_ANIMATIONS=31
const LEGS_BACKCR=31
const LEGS_BACKWALK=32
const FLAG_RUN=33
const FLAG_STAND=34
const FLAG_STAND2RUN=35
const MAX_TOTALANIMATIONS=36

/// Animation record for format.player_animation, containing `firstFrame`, `numFrames`, `loopFrames`, `frameLerp`, `initialLerp`, `reversed`, and 1 further fields.
struct Animation firstFrame numFrames loopFrames frameLerp initialLerp reversed flipflop end struct
/// Config record for format.player_animation, containing `animations`, `footsteps`, `headOffset`, `gender`, `fixedLegs`, `fixedTorso`.
struct Config animations footsteps headOffset gender fixedLegs fixedTorso end struct
/// FrameSample record for format.player_animation, containing `oldFrame`, `frame`, `backlerp`, `finished`.
struct FrameSample oldFrame frame backlerp finished end struct
/// PlayerSample record for format.player_animation, containing `lower`, `upper`.
struct PlayerSample lower upper end struct
/// LerpFrame record for format.player_animation, containing `oldFrame`, `oldFrameTime`, `frame`, `frameTime`, `backlerp`, `animationNumber`, and 2 further fields.
struct LerpFrame oldFrame oldFrameTime frame frameTime backlerp animationNumber animation animationTime end struct

/// Create the format.player_animation error for `fail` with 7520 and the supplied diagnostic text.
/// @param message Message used in `("animation.cfg: " + message)` and `error(7520, ("animation.cfg: " + message))`.
function fail(message) return error(7520,"animation.cfg: "+message) end function
/// Create `mq3.format.player_animation.Animation` with firstFrame=firstFrame; numFrames=numFrames; loopFrames=loopFrames; frameLerp=frameLerp; initialLerp=frameLerp; reversed=reversed; flipflop=false.
/// @param firstFrame Initial `firstFrame` field stored in the returned or constructed `mq3.format.player_animation.Animation` record.
/// @param numFrames Initial `numFrames` field stored in the returned or constructed `mq3.format.player_animation.Animation` record.
/// @param loopFrames Initial `loopFrames` field stored in the returned or constructed `mq3.format.player_animation.Animation` record.
/// @param frameLerp Initial `frameLerp` field stored in the returned or constructed `mq3.format.player_animation.Animation` record.
/// @param reversed Initial `reversed` field stored in the returned or constructed `mq3.format.player_animation.Animation` record.
function animation(firstFrame,numFrames,loopFrames,frameLerp,reversed)
  return Animation(firstFrame,numFrames,loopFrames,frameLerp,frameLerp,reversed,false)
end function
/// Create `mq3.format.player_animation.Animation` with firstFrame=value.firstFrame; numFrames=value.numFrames; loopFrames=value.loopFrames; frameLerp=value.frameLerp; initialLerp=value.initialLerp; reversed=reversed; flipflop=value.flipflop.
/// @param value Record exposing `firstFrame`, `numFrames`, `loopFrames`, `frameLerp`, `initialLerp`, `flipflop`.
/// @param reversed Initial `reversed` field stored in the returned or constructed `mq3.format.player_animation.Animation` record.
function clone(value,reversed)
  return Animation(value.firstFrame,value.numFrames,value.loopFrames,value.frameLerp,value.initialLerp,reversed,value.flipflop)
end function

// Stateful CG_SetLerpFrameAnimation / CG_RunLerpFrame.  Unlike sample(), this
// preserves the original initial-lerp, animation-toggle and hitch-clamp state
// across rendered frames.
function lerpFrame() return LerpFrame(0,0,0,0,0.0,-1,void,0) end function
/// Set lerp frame animation in format.player_animation; the normal completion returns `state`.
///
/// Direct state writes: `state.animationNumber`, `state.animation`, `state.animationTime`.
/// @param config Record exposing `animations`.
/// @param state Record exposing `frameTime`, `animation`. Updated in place: `animationNumber`, `animation`, `animationTime`.
/// @param newAnimation New animation used in `(newAnimation & ~ 128)`.
function setLerpFrameAnimation(config,state,newAnimation)
  if config==void or state==void then return fail("lerp frame and config required") end if
  state.animationNumber=newAnimation;index=newAnimation&(~128)
  if index<0 or index>=MAX_TOTALANIMATIONS or index>=len(config.animations) then return fail("animation index outside table") end if
  state.animation=config.animations[index];state.animationTime=state.frameTime+state.animation.initialLerp;return state
end function
/// Update `state.oldFrame`, `state.frame`, `state.backlerp`, `state.oldFrameTime` in format.player_animation; the normal completion returns `FrameSample(state.oldFrame, state.frame, state.backlerp, finished)`.
///
/// Direct state writes: `state.oldFrame`, `state.frame`, `state.backlerp`, `state.oldFrameTime`, `state.frameTime`.
/// @param config Config passed as `config` to `mq3.format.player_animation.setLerpFrameAnimation`.
/// @param state Record exposing `animationNumber`, `animation`, `frameTime`, `frame`, `oldFrame`, `backlerp`, `animationTime` and further fields. Updated in place: `oldFrame`, `frame`, `backlerp`, `oldFrameTime`, `frameTime`.
/// @param newAnimation New animation passed as `newAnimation` to `mq3.format.player_animation.setLerpFrameAnimation`.
/// @param speedScale Speed scale used in `(speedScale < 0.0)` and `(frame * speedScale)`.
/// @param now Now used in `(now < 0)` and `(now + 200)`.
/// @param enabled Enabled operand used by `runLerpFrame`; its reads are shown in the implementation.
function runLerpFrame(config,state,newAnimation,speedScale,now,enabled)
  if config==void or state==void or now<0 or speedScale<0.0 then return fail("invalid lerp-frame inputs") end if
  if not enabled then state.oldFrame=0;state.frame=0;state.backlerp=0.0;return FrameSample(0,0,0.0,false) end if
  if newAnimation!=state.animationNumber or state.animation==void then selected=setLerpFrameAnimation(config,state,newAnimation);if selected is error then return selected end if end if
  if now>=state.frameTime then
    state.oldFrame=state.frame;state.oldFrameTime=state.frameTime;value=state.animation
    if value.frameLerp==0 then return FrameSample(state.oldFrame,state.frame,state.backlerp,false) end if
    if now<state.animationTime then state.frameTime=state.animationTime else state.frameTime=state.oldFrameTime+value.frameLerp end if
    frame=n.quotient(state.frameTime-state.animationTime,value.frameLerp);frame=n.trunc32(frame*speedScale)
    total=value.numFrames;if value.flipflop then total=total*2 end if;finished=false
    if frame>=total then
      frame=frame-total
      if value.loopFrames!=0 then frame=frame%value.loopFrames;frame=frame+value.numFrames-value.loopFrames
      else frame=total-1;state.frameTime=now;finished=true end if
    end if
    if value.reversed then state.frame=value.firstFrame+value.numFrames-1-frame
    else if value.flipflop and frame>=value.numFrames then state.frame=value.firstFrame+value.numFrames-1-(frame%value.numFrames)
    else state.frame=value.firstFrame+frame end if
    if now>state.frameTime then state.frameTime=now end if
  end if
  if state.frameTime>now+200 then state.frameTime=now end if
  if state.oldFrameTime>now then state.oldFrameTime=now end if
  if state.frameTime==state.oldFrameTime then state.backlerp=0.0 else fraction=n.fdiv(n.f32(now-state.oldFrameTime),n.f32(state.frameTime-state.oldFrameTime));state.backlerp=n.fsub(1.0,fraction) end if
  finished=state.animation.loopFrames==0 and state.frame==frameAt(state.animation,state.animation.numFrames-1) and state.frameTime==now
  return FrameSample(state.oldFrame,state.frame,state.backlerp,finished)
end function
/// Clear lerp frame in format.player_animation; the normal completion returns `state`.
///
/// Direct state writes: `state.frameTime`, `state.oldFrameTime`, `state.oldFrame`, `state.frame`, `state.backlerp`.
/// @param config Config passed as `config` to `mq3.format.player_animation.setLerpFrameAnimation`.
/// @param state Record exposing `animation`. Updated in place: `frameTime`, `oldFrameTime`, `oldFrame`, `frame`, `backlerp`.
/// @param animationNumber New animation passed as `newAnimation` to `mq3.format.player_animation.setLerpFrameAnimation`.
/// @param now Now used in `(now < 0)` and `((state == void) or (now < 0))`.
function clearLerpFrame(config,state,animationNumber,now)
  if state==void or now<0 then return fail("invalid clear-lerp input") end if
  state.frameTime=now;state.oldFrameTime=now;selected=setLerpFrameAnimation(config,state,animationNumber);if selected is error then return selected end if
  state.oldFrame=state.animation.firstFrame;state.frame=state.animation.firstFrame;state.backlerp=0.0;return state
end function
/// Compute number starts in format.player_animation; the normal completion returns `((raw[0] >= 48) and (raw[0] <= 57))`.
/// @param token Token used in `bytes(token)` and `(token == "")`.
function numberStarts(token)
  if token=="" then return false end if
  raw=bytes(token);return raw[0]>=48 and raw[0]<=57
end function

// Matches CG_ParseAnimationFile, including optional directives, the lower.md3
// frame-base correction, negative numFrames reversal and zero-fps fallback.
/// @param text Text passed as `text` to `mq3.shared.parser.create`.
function parse(text)
  if text==void or typeof(text)!="string" then return fail("text required") end if
  if len(bytes(text))>=19999 then return fail("file too long") end if
  state=parser.create(text);footsteps="normal";headOffset=[0.0,0.0,0.0];gender="male";fixedLegs=false;fixedTorso=false
  first=""
  while true
    token=parser.parseExt(state,true);if token=="" then break end if
    lower=strings.toLowerAscii(token)
    if lower=="footsteps" then
      value=parser.parseExt(state,true);if value=="" then return fail("missing footsteps value") end if
      value=strings.toLowerAscii(value)
      if value=="default" or value=="normal" then footsteps="normal"
      else if value=="boot" or value=="flesh" or value=="mech" or value=="energy" then footsteps=value end if
    else if lower=="headoffset" then
      for axis=0 to 2 value=parser.parseExt(state,true);if value=="" then return fail("incomplete headoffset") end if;headOffset[axis]=n.f32(numbers.atof(value)) end for
    else if lower=="sex" then
      value=strings.toLowerAscii(parser.parseExt(state,true));if value=="" then return fail("missing sex value") end if
      raw=bytes(value);gender="male";if raw[0]==102 then gender="female" else if raw[0]==110 then gender="neuter" end if
    else if lower=="fixedlegs" then fixedLegs=true
    else if lower=="fixedtorso" then fixedTorso=true
    else if numberStarts(token) then first=token;break
    end if
  end while

  animations=[];skip=0
  for index=0 to MAX_ANIMATIONS-1
    firstToken=first;first="";if firstToken=="" then firstToken=parser.parseExt(state,true) end if
    if firstToken=="" then
      if index>=TORSO_GETFLAG and index<=TORSO_NEGATIVE then animations=animations+[clone(animations[TORSO_GESTURE],false)];continue end if
      return fail("incomplete animation table")
    end if
    firstFrame=numbers.atoi(firstToken)
    if index==LEGS_WALKCR then skip=firstFrame-animations[TORSO_GESTURE].firstFrame end if
    if index>=LEGS_WALKCR and index<TORSO_GETFLAG then firstFrame=firstFrame-skip end if
    countToken=parser.parseExt(state,true);loopToken=parser.parseExt(state,true);fpsToken=parser.parseExt(state,true)
    if countToken=="" or loopToken=="" or fpsToken=="" then return fail("incomplete animation row") end if
    count=numbers.atoi(countToken);reversed=false;if count<0 then count=0-count;reversed=true end if
    loops=numbers.atoi(loopToken);fps=numbers.atof(fpsToken);if fps==0.0 then fps=1.0 end if
    frameLerp=numbers.truncDouble32(1000.0/fps)
    animations=animations+[animation(firstFrame,count,loops,frameLerp,reversed)]
  end for
  animations=animations+[clone(animations[LEGS_WALKCR],true),clone(animations[LEGS_WALK],true)]
  animations=animations+[animation(0,16,16,66,false),animation(16,5,0,50,false),animation(16,5,1,66,true)]
  return Config(animations,footsteps,headOffset,gender,fixedLegs,fixedTorso)
end function

/// Compute frame at in format.player_animation; the normal completion returns `(value.firstFrame + frame)`.
/// @param value Record exposing `flipflop`, `numFrames`, `reversed`, `firstFrame`.
/// @param ordinal Ordinal operand used by `frameAt`; its reads are shown in the implementation.
function frameAt(value,ordinal)
  frame=ordinal
  if value.flipflop and frame>=value.numFrames then frame=value.numFrames-1-(frame%value.numFrames)
  else if value.reversed then frame=value.numFrames-1-frame end if
  return value.firstFrame+frame
end function

/// Compute ordinal at in format.player_animation; the normal completion returns `(total - 1)`.
/// @param value Record exposing `numFrames`, `flipflop`, `loopFrames`.
/// @param ordinal Ordinal used in `(ordinal < total)` and `(ordinal - total)`.
function ordinalAt(value,ordinal)
  total=value.numFrames;if value.flipflop then total=total*2 end if
  if ordinal<total then return ordinal end if
  if value.loopFrames>0 then return total-value.loopFrames+((ordinal-total)%value.loopFrames) end if
  return total-1
end function

// Samples a sequence at elapsed milliseconds. backlerp is the weight of
// oldFrame expected by md3.renderTriangles/LerpMeshVertexes.
/// @param value Record exposing `numFrames`, `frameLerp`, `loopFrames`, `flipflop`.
/// @param elapsedMs A passed as `a` to `mq3.compat.numeric.quotient`.
function sample(value,elapsedMs)
  if value==void or value.numFrames<1 then return fail("animation needs frames") end if
  if value.frameLerp<=0 then return fail("animation needs positive frame lerp") end if
  if value.loopFrames<0 or value.loopFrames>value.numFrames then return fail("loop frame count outside animation") end if
  if elapsedMs<0 then elapsedMs=0 end if
  step=n.quotient(elapsedMs,value.frameLerp);remainder=elapsedMs-step*value.frameLerp
  oldOrdinal=ordinalAt(value,step);nextOrdinal=ordinalAt(value,step+1)
  oldFrame=frameAt(value,oldOrdinal);frame=frameAt(value,nextOrdinal)
  backlerp=n.f32(1.0-(remainder*1.0/value.frameLerp))
  if elapsedMs==0 or oldFrame==frame then backlerp=0.0 end if
  total=value.numFrames;if value.flipflop then total=total*2 end if
  finished=value.loopFrames==0 and step>=total-1
  return FrameSample(oldFrame,frame,backlerp,finished)
end function

/// Sample animation in format.player_animation; the normal completion returns `sample(config.animations[index], elapsedMs)`.
/// @param config Record exposing `animations`.
/// @param index Zero-based index into `config.animations`.
/// @param elapsedMs Elapsed ms passed as `elapsedMs` to `mq3.format.player_animation.sample`.
function sampleAnimation(config,index,elapsedMs)
  if config==void or index<0 or index>=len(config.animations) then return fail("animation index outside table") end if
  return sample(config.animations[index],elapsedMs)
end function

/// Sample player in format.player_animation; the normal completion returns `PlayerSample(lower, upper)`.
/// @param config Config passed as `config` to `mq3.format.player_animation.sampleAnimation`.
/// @param lowerAnimation Index passed as `index` to `mq3.format.player_animation.sampleAnimation`.
/// @param upperAnimation Index passed as `index` to `mq3.format.player_animation.sampleAnimation`.
/// @param elapsedMs Elapsed ms passed as `elapsedMs` to `mq3.format.player_animation.sampleAnimation`.
function samplePlayer(config,lowerAnimation,upperAnimation,elapsedMs)
  lower=sampleAnimation(config,lowerAnimation,elapsedMs);if lower is error then return lower end if
  upper=sampleAnimation(config,upperAnimation,elapsedMs);if upper is error then return upper end if
  return PlayerSample(lower,upper)
end function

/// Render player animation in format.player_animation; the normal completion returns `md3.renderTriangles(model, surfaceIndex, value.frame, value.oldFrame, value.backlerp, maxTriangles)`.
/// @param model Model passed as `model` to `mq3.format.md3.renderTriangles`.
/// @param surfaceIndex Surface index passed as `surfaceIndex` to `mq3.format.md3.renderTriangles`.
/// @param value Record exposing `frame`, `oldFrame`, `backlerp`.
/// @param maxTriangles Max triangles passed as `maxTriangles` to `mq3.format.md3.renderTriangles`.
function render(model,surfaceIndex,value,maxTriangles)
  if value==void then return fail("frame sample required") end if
  return md3.renderTriangles(model,surfaceIndex,value.frame,value.oldFrame,value.backlerp,maxTriangles)
end function

/// Render at in format.player_animation; the normal completion returns `render(model, surfaceIndex, value, maxTriangles)`.
/// @param model Model passed as `model` to `mq3.format.player_animation.render`.
/// @param surfaceIndex Surface index passed as `surfaceIndex` to `mq3.format.player_animation.render`.
/// @param config Config passed as `config` to `mq3.format.player_animation.sampleAnimation`.
/// @param animationIndex Index passed as `index` to `mq3.format.player_animation.sampleAnimation`.
/// @param elapsedMs Elapsed ms passed as `elapsedMs` to `mq3.format.player_animation.sampleAnimation`.
/// @param maxTriangles Max triangles passed as `maxTriangles` to `mq3.format.player_animation.render`.
function renderAt(model,surfaceIndex,config,animationIndex,elapsedMs,maxTriangles)
  value=sampleAnimation(config,animationIndex,elapsedMs);if value is error then return value end if
  return render(model,surfaceIndex,value,maxTriangles)
end function

// Standalone hostile-preview animation controller. One-shot sequences keep
// their final frame in the returned sample and change state for the next call.
struct EnemyAnimationState mode resumeMode startedAt deathVariant transitionCount lowerLerp upperLerp end struct
/// EnemyAnimationSelection record for format.player_animation, containing `lowerAnimation`, `upperAnimation`.
struct EnemyAnimationSelection lowerAnimation upperAnimation end struct
/// EnemyAnimationSample record for format.player_animation, containing `mode`, `nextMode`, `lowerAnimation`, `upperAnimation`, `elapsed`, `lower`, and 2 further fields.
struct EnemyAnimationSample mode nextMode lowerAnimation upperAnimation elapsed lower upper transitioned end struct

/// Create the format.player_animation error for `enemyFail` with 7540 and the supplied diagnostic text.
/// @param message Message used in `("preview enemy animation: " + message)` and `error(7540, ("preview enemy animation: " + message))`.
function enemyFail(message) return error(7540,"preview enemy animation: "+message) end function
/// Compute format.player_animation.enemyIsLocomotion as `(((mode == "idle") or (mode == "walk")) or (mode == "run"))`.
/// @param mode Mode used in `(mode == "run")` and `(mode == "idle")`.
function enemyIsLocomotion(mode) return mode=="idle" or mode=="walk" or mode=="run" end function
/// Compute format.player_animation.enemyIsTerminal as `((mode == "death") or (mode == "dead"))`.
/// @param mode Mode used in `(mode == "dead")` and `(mode == "death")`.
function enemyIsTerminal(mode) return mode=="death" or mode=="dead" end function
/// Compute format.player_animation.enemyValidMode as `((((enemyIsLocomotion(mode) or (mode == "attack")) or (mode == "pain")) or enemyIsTerminal(mode)) or (mode == "respawn"))`.
/// @param mode Mode passed as `mode` to `mq3.format.player_animation.enemyIsLocomotion`.
function enemyValidMode(mode) return enemyIsLocomotion(mode) or mode=="attack" or mode=="pain" or enemyIsTerminal(mode) or mode=="respawn" end function

/// Compute enemy create in format.player_animation; the normal completion returns `EnemyAnimationState("idle", "idle", now, 0, 0, lerpFrame(), lerpFrame())`.
/// @param now Initial `startedAt` field stored in the returned or constructed `mq3.format.player_animation.EnemyAnimationState` record.
function enemyCreate(now)
  if now<0 then return enemyFail("non-negative time is required") end if
  return EnemyAnimationState("idle","idle",now,0,0,lerpFrame(),lerpFrame())
end function

/// Update `state.resumeMode`, `state.mode`, `state.startedAt`, `state.transitionCount` in format.player_animation.
///
/// Direct state writes: `state.resumeMode`, `state.mode`, `state.startedAt`, `state.transitionCount`.
/// @param state Record exposing `startedAt`, `mode`, `transitionCount`. Updated in place: `resumeMode`, `mode`, `startedAt`, `transitionCount`.
/// @param mode Mode passed as `mode` to `mq3.format.player_animation.enemyValidMode`.
/// @param now Now used in `(now < state.startedAt)` and `(((state == void) or not enemyValidMode(mode)) or (now < state.startedAt))`.
function enemyBegin(state,mode,now)
  if state==void or not enemyValidMode(mode) or now<state.startedAt then return enemyFail("state, mode and monotonic time are required") end if
  if (mode=="attack" or mode=="pain") and enemyIsLocomotion(state.mode) then state.resumeMode=state.mode end if
  if enemyIsLocomotion(mode) then state.resumeMode=mode end if
  state.mode=mode;state.startedAt=now;state.transitionCount=state.transitionCount+1
  return void
end function

/// Test enemy locomote in format.player_animation; the normal completion returns `true`.
/// @param state Record exposing `mode`.
/// @param mode Mode passed as `mode` to `mq3.format.player_animation.enemyIsLocomotion`.
/// @param now Now passed as `now` to `mq3.format.player_animation.enemyBegin`.
function enemyLocomote(state,mode,now)
  if not enemyIsLocomotion(mode) then return enemyFail("locomotion must be idle, walk or run") end if
  if state==void then return enemyFail("state is required") end if
  if enemyIsTerminal(state.mode) then return false end if
  result=enemyBegin(state,mode,now);if result is error then return result end if;return true
end function

/// Test enemy attack in format.player_animation; the normal completion returns `true`.
/// @param state Record exposing `mode`.
/// @param now Now passed as `now` to `mq3.format.player_animation.enemyBegin`.
function enemyAttack(state,now)
  if state==void then return enemyFail("state is required") end if
  if enemyIsTerminal(state.mode) then return false end if
  result=enemyBegin(state,"attack",now);if result is error then return result end if;return true
end function

/// Test enemy pain in format.player_animation; the normal completion returns `true`.
/// @param state Record exposing `mode`.
/// @param now Now passed as `now` to `mq3.format.player_animation.enemyBegin`.
function enemyPain(state,now)
  if state==void then return enemyFail("state is required") end if
  if enemyIsTerminal(state.mode) then return false end if
  result=enemyBegin(state,"pain",now);if result is error then return result end if;return true
end function

/// Update `state.deathVariant` in format.player_animation; the normal completion returns `enemyBegin(state, "death", now)`.
///
/// Direct state writes: `state.deathVariant`.
/// @param state Updated in place: `deathVariant`.
/// @param now Now passed as `now` to `mq3.format.player_animation.enemyBegin`.
/// @param variant Variant used in `(variant < 0)` and `(variant > 2)`.
function enemyDie(state,now,variant)
  if state==void or variant<0 or variant>2 then return enemyFail("state and death variant 0..2 are required") end if
  state.deathVariant=variant;return enemyBegin(state,"death",now)
end function

/// Update `state.resumeMode` in format.player_animation; the normal completion returns `true`.
///
/// Direct state writes: `state.resumeMode`.
/// @param state Record exposing `mode`. Updated in place: `resumeMode`.
/// @param now Now passed as `now` to `mq3.format.player_animation.enemyBegin`.
function enemyRespawn(state,now)
  if state==void then return enemyFail("state is required") end if
  if not enemyIsTerminal(state.mode) then return false end if
  state.resumeMode="idle";result=enemyBegin(state,"respawn",now);if result is error then return result end if;return true
end function

/// Compute enemy locomotion lower in format.player_animation; the normal completion returns `LEGS_IDLE`.
/// @param mode Mode used in `(mode == "run")` and `(mode == "walk")`.
function enemyLocomotionLower(mode)
  if mode=="walk" then return LEGS_WALK end if
  if mode=="run" then return LEGS_RUN end if
  return LEGS_IDLE
end function

// Baseq3 has no player pain row; TORSO_GESTURE is used as the preview flinch.
/// @param state Record exposing `mode`, `resumeMode`, `deathVariant`.
function enemySelect(state)
  if state==void then return enemyFail("state is required") end if
  mode=state.mode
  if enemyIsLocomotion(mode) then return EnemyAnimationSelection(enemyLocomotionLower(mode),TORSO_STAND) end if
  if mode=="attack" then return EnemyAnimationSelection(enemyLocomotionLower(state.resumeMode),TORSO_ATTACK) end if
  if mode=="pain" then return EnemyAnimationSelection(enemyLocomotionLower(state.resumeMode),TORSO_GESTURE) end if
  if mode=="death" then index=BOTH_DEATH1+state.deathVariant*2;return EnemyAnimationSelection(index,index) end if
  if mode=="dead" then index=BOTH_DEAD1+state.deathVariant*2;return EnemyAnimationSelection(index,index) end if
  if mode=="respawn" then return EnemyAnimationSelection(LEGS_IDLE,TORSO_RAISE) end if
  return enemyFail("unknown mode")
end function

/// Update `state.mode`, `state.startedAt`, `state.transitionCount` in format.player_animation; the normal completion returns `true`.
///
/// Direct state writes: `state.mode`, `state.startedAt`, `state.transitionCount`.
/// @param state Record exposing `mode`, `resumeMode`, `transitionCount`. Updated in place: `mode`, `startedAt`, `transitionCount`.
/// @param now Now operand used by `enemyAdvanceFinished`; its reads are shown in the implementation.
/// @param lower Record exposing `finished`.
/// @param upper Record exposing `finished`.
function enemyAdvanceFinished(state,now,lower,upper)
  mode=state.mode;finished=false
  if mode=="attack" or mode=="pain" or mode=="respawn" then finished=upper.finished
  else if mode=="death" then finished=lower.finished and upper.finished end if
  if not finished then return false end if
  next=state.resumeMode
  if mode=="death" then next="dead" else if mode=="respawn" then next="idle" end if
  state.mode=next;state.startedAt=now;state.transitionCount=state.transitionCount+1
  return true
end function

/// Apply `mq3.format.player_animation.enemyFail`, `mq3.format.player_animation.enemySelect`, `mq3.format.player_animation.clearLerpFrame` for enemy sample in format.player_animation.
/// @param config Config passed as `config` to `mq3.format.player_animation.clearLerpFrame`.
/// @param state Record exposing `startedAt`, `lowerLerp`, `upperLerp`, `mode`.
/// @param now Now passed as `now` to `mq3.format.player_animation.runLerpFrame`.
function enemySample(config,state,now)
  if config==void or state==void or now<state.startedAt then return enemyFail("config, state and monotonic time are required") end if
  selected=enemySelect(state);if selected is error then return selected end if
  elapsed=now-state.startedAt
  if state.lowerLerp.animation==void then initialized=clearLerpFrame(config,state.lowerLerp,selected.lowerAnimation,state.startedAt);if initialized is error then return initialized end if end if
  if state.upperLerp.animation==void then initialized=clearLerpFrame(config,state.upperLerp,selected.upperAnimation,state.startedAt);if initialized is error then return initialized end if end if
  lower=runLerpFrame(config,state.lowerLerp,selected.lowerAnimation,1.0,now,true);if lower is error then return lower end if
  upper=runLerpFrame(config,state.upperLerp,selected.upperAnimation,1.0,now,true);if upper is error then return upper end if
  mode=state.mode;transitioned=enemyAdvanceFinished(state,now,lower,upper)
  return EnemyAnimationSample(mode,state.mode,selected.lowerAnimation,selected.upperAnimation,elapsed,lower,upper,transitioned)
end function
