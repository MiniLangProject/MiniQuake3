// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// ai_main.c view smoothing and elementary-action input conversion.
package mq3.game.bot_input
import mq3.game.game_headers as headers
import mq3.compat.numeric as n
import mq3.shared.math as q

/// Bot input-action bit requesting attack.
const ACTION_ATTACK=0x0000001
/// Bot input-action bit requesting use.
const ACTION_USE=0x0000002
/// Bot input-action bit requesting respawn.
const ACTION_RESPAWN=0x0000008
/// Bot input-action bit requesting jump.
const ACTION_JUMP=0x0000010
/// Bot input-action bit requesting crouch.
const ACTION_CROUCH=0x0000080
/// Bot input-action bit requesting moveforward.
const ACTION_MOVEFORWARD=0x0000200
/// Bot input-action bit requesting moveback.
const ACTION_MOVEBACK=0x0000800
/// Bot input-action bit requesting moveleft.
const ACTION_MOVELEFT=0x0001000
/// Bot input-action bit requesting moveright.
const ACTION_MOVERIGHT=0x0002000
/// Bot input-action bit requesting delayedjump.
const ACTION_DELAYEDJUMP=0x0008000
/// Bot input-action bit requesting talk.
const ACTION_TALK=0x0010000
/// Bot input-action bit requesting gesture.
const ACTION_GESTURE=0x0020000
/// Bot input-action bit requesting walk.
const ACTION_WALK=0x0080000
/// Bot input-action bit requesting affirmative.
const ACTION_AFFIRMATIVE=0x0100000
/// Bot input-action bit requesting negative.
const ACTION_NEGATIVE=0x0200000
/// Bot input-action bit requesting capture the flag.
const ACTION_GETFLAG=0x0800000
/// Bot input-action bit requesting guardbase.
const ACTION_GUARDBASE=0x1000000
/// Bot input-action bit requesting patrol.
const ACTION_PATROL=0x2000000
/// Bot input-action bit requesting followme.
const ACTION_FOLLOWME=0x8000000

/// User-command button-mask bit requesting attack.
const BUTTON_ATTACK=1
/// User-command button-mask bit requesting talk.
const BUTTON_TALK=2
/// User-command button-mask bit requesting use holdable.
const BUTTON_USE_HOLDABLE=4
/// User-command button-mask bit requesting gesture.
const BUTTON_GESTURE=8
/// User-command button-mask bit requesting walking.
const BUTTON_WALKING=16
/// User-command button-mask bit requesting affirmative.
const BUTTON_AFFIRMATIVE=32
/// User-command button-mask bit requesting negative.
const BUTTON_NEGATIVE=64
/// User-command button-mask bit requesting capture the flag.
const BUTTON_GETFLAG=128
/// User-command button-mask bit requesting guardbase.
const BUTTON_GUARDBASE=256
/// User-command button-mask bit requesting patrol.
const BUTTON_PATROL=512
/// User-command button-mask bit requesting followme.
const BUTTON_FOLLOWME=1024
/// Bot-character characteristic index for view factor. Definition: view angle difference to angle
/// change factor float <0, 1].
const CHARACTERISTIC_VIEW_FACTOR=headers.CHARACTERISTIC_VIEW_FACTOR
/// Bot-character characteristic index for view maxchange. Definition: maximum view angle change float
/// [1, 360].
const CHARACTERISTIC_VIEW_MAXCHANGE=headers.CHARACTERISTIC_VIEW_MAXCHANGE

/// `BotInput` record for bot input, containing `thinktime`, `dir`, `speed`, `viewangles` and `actionflags` and related fields.
struct BotInput
  /// Time interval used for the current bot thinking/update step.
  thinktime
  /// Requested movement direction vector supplied to bot input generation.
  dir
  /// Movement or travel speed used by this game object.
  speed
  /// Player or bot viewing angles used for aiming and command generation.
  viewangles
  /// Bot action bits describing the requested buttons and movement actions.
  actionflags
  /// Selected or reported weapon identifier.
  weapon
end struct
/// `Services` record for bot input, containing `challenge`, `characteristicFloatFn`, `viewFn`, `getInputFn` and `context`.
struct Services
  /// Connection challenge value associated with the client session.
  challenge
  /// Injected callback for characteristic float; invoked through the Services service/state record.
  characteristicFloatFn
  /// Injected callback for view; invoked through the Services service/state record.
  viewFn
  /// Injected callback for get input; invoked through the Services service/state record.
  getInputFn
  /// Opaque caller-supplied context available to bot characteristic, view-angle, and elementary-input
  /// callbacks.
  context
end struct
/// Create a `mq3.game.bot_input.Services` record with the declared empty defaults.
function create()
  return Services(false,void,void,void,void)
end function
/// Wrap an angle using the Quake III fixed-point angle representation.
/// @param value Value passed as argument 1 to `mq3.shared.math.AngleNormalize360`.
function angleMod(value) return q.AngleNormalize360(value) end function
/// Return the result of `n.fmul(n.i16(value),n.f32(360.0/65536.0))` for `shortToAngle`.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.i16`.
function shortToAngle(value) return n.fmul(n.i16(value),n.f32(360.0/65536.0)) end function
/// Convert a degree angle into the signed sixteen-bit network user-command representation.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.f32`.
function angleToShort(value)
  scaled=n.f32(value)*(65536/360.0); return n.i16(n.trunc32(scaled)&65535)
end function
/// Compute the shortest signed angular difference used by bot view steering.
/// @param a Value passed as argument 1 to `mq3.compat.numeric.fsub`.
/// @param b Value passed as argument 2 to `mq3.compat.numeric.fsub`.
function angleDifference(a,b)
  diff=n.fsub(a,b)
  if a>b then if diff>180.0 then diff=n.fsub(diff,360.0) end if
  else if diff < -180.0 then diff=n.fadd(diff,360.0) end if
  return diff
end function
/// Move one bot view angle toward its target with the specified maximum angular change.
/// @param angle Value passed as argument 1 to `mq3.shared.math.AngleNormalize360`.
/// @param ideal Value passed as argument 1 to `mq3.shared.math.AngleNormalize360`.
/// @param speed Requested movement speed.
function changeViewAngle(angle,ideal,speed)
  angle=angleMod(angle); ideal=angleMod(ideal)
  if angle==ideal then return angle end if
  move=n.fsub(ideal,angle)
  if ideal>angle then if move>180.0 then move=n.fsub(move,360.0) end if
  else if move < -180.0 then move=n.fadd(move,360.0) end if
  if move>0 then if move>speed then move=speed end if
  else if move < n.fneg(speed) then move=n.fneg(speed) end if
  return angleMod(n.fadd(angle,move))
end function
/// Update `bot.idealViewangles[0]`, `bot.viewangles[axis]`, `bot.idealViewangles[axis]` and `bot.viewanglespeed[axis]` and related state during `changeViewAngles`.
/// @param services Host service callbacks; accesses `characteristicFloatFn`, `challenge` and `viewFn`.
/// @param bot Bot AI state; accesses `idealViewangles`, `enemy`, `character`, `viewangles` and `viewanglespeed` and related fields. May update `bot.idealViewangles[0]`, `bot.viewangles[axis]` and `bot.idealViewangles[axis]` and additional fields in place.
/// @param thinktime Bot thinking interval in seconds.
function changeViewAngles(services,bot,thinktime)
  if bot.idealViewangles[0]>180.0 then bot.idealViewangles[0]=n.fsub(bot.idealViewangles[0],360.0) end if
  factor=0.05; maxchange=360.0
  if bot.enemy>=0 then
    factor=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_VIEW_FACTOR,0.01,1.0)
    maxchange=services.characteristicFloatFn(services,bot.character,CHARACTERISTIC_VIEW_MAXCHANGE,1.0,1800.0)
  else factor=0.05; maxchange=360.0 end if
  if maxchange<240.0 then maxchange=240.0 end if
  maxchange=n.fmul(maxchange,thinktime)
  for axis=0 to 1
    if services.challenge then
      // Baseq3 calls integer abs(), so the float difference truncates first.
      raw=n.trunc32(angleDifference(bot.viewangles[axis],bot.idealViewangles[axis])); if raw<0 then raw=0-raw end if
      anglespeed=n.fmul(raw,factor); if anglespeed>maxchange then anglespeed=maxchange end if
      bot.viewangles[axis]=changeViewAngle(bot.viewangles[axis],bot.idealViewangles[axis],anglespeed)
    else
      bot.viewangles[axis]=angleMod(bot.viewangles[axis]); bot.idealViewangles[axis]=angleMod(bot.idealViewangles[axis])
      diff=angleDifference(bot.viewangles[axis],bot.idealViewangles[axis]); desired=n.fmul(diff,factor)
      bot.viewanglespeed[axis]=n.fadd(bot.viewanglespeed[axis],n.fsub(bot.viewanglespeed[axis],desired))
      if bot.viewanglespeed[axis]>180.0 then bot.viewanglespeed[axis]=maxchange end if
      if bot.viewanglespeed[axis] < -180.0 then bot.viewanglespeed[axis]=n.fneg(maxchange) end if
      anglespeed=bot.viewanglespeed[axis]; if anglespeed>maxchange then anglespeed=maxchange end if; if anglespeed<n.fneg(maxchange) then anglespeed=n.fneg(maxchange) end if
      bot.viewangles[axis]=angleMod(n.fadd(bot.viewangles[axis],anglespeed))
      bot.viewanglespeed[axis]=n.fmul(bot.viewanglespeed[axis],n.fmul(0.45,n.fsub(1.0,factor)))
    end if
  end for
  if bot.viewangles[0]>180.0 then bot.viewangles[0]=n.fsub(bot.viewangles[0],360.0) end if
  services.viewFn(services,bot.client,bot.viewangles); return void
end function
/// Forward `addMove` to `mq3.compat.numeric.i8` and return the delegated result.
/// @param value Operand used to evaluate the returned expression `n.i8(value+delta)`.
/// @param delta Operand used to evaluate the returned expression `n.i8(value+delta)`.
function addMove(value,delta) return n.i8(value+delta) end function
/// Update `command.serverTime`, `command.buttons`, `command.angles` and `command.weapon` and related state during `inputToUserCommand`.
/// @param input Input record; accesses `actionflags`, `weapon`, `viewangles`, `dir` and `speed`. May update `input.actionflags` and `input.speed` in place.
/// @param command Command record; accesses `serverTime`, `buttons`, `angles`, `weapon` and `forwardmove` and related fields. May update `command.serverTime`, `command.buttons` and `command.angles` and additional fields in place.
/// @param deltaAngles Array or byte sequence accessed at `axis`.
/// @param time Time value in the units expected by this module.
function inputToUserCommand(input,command,deltaAngles,time)
  command.serverTime=time; command.buttons=0; command.angles=[0,0,0]; command.weapon=0
  command.forwardmove=0; command.rightmove=0; command.upmove=0
  if (input.actionflags&ACTION_DELAYEDJUMP)!=0 then input.actionflags=(input.actionflags|ACTION_JUMP)&(~ACTION_DELAYEDJUMP) end if
  if (input.actionflags&ACTION_RESPAWN)!=0 then command.buttons=BUTTON_ATTACK end if
  for each pair in [[ACTION_ATTACK,BUTTON_ATTACK],[ACTION_TALK,BUTTON_TALK],[ACTION_GESTURE,BUTTON_GESTURE],[ACTION_USE,BUTTON_USE_HOLDABLE],[ACTION_WALK,BUTTON_WALKING],[ACTION_AFFIRMATIVE,BUTTON_AFFIRMATIVE],[ACTION_NEGATIVE,BUTTON_NEGATIVE],[ACTION_GETFLAG,BUTTON_GETFLAG],[ACTION_GUARDBASE,BUTTON_GUARDBASE],[ACTION_PATROL,BUTTON_PATROL],[ACTION_FOLLOWME,BUTTON_FOLLOWME]]
    if (input.actionflags&pair[0])!=0 then command.buttons=command.buttons|pair[1] end if
  end for
  command.weapon=input.weapon&255
  for axis=0 to 2 command.angles[axis]=n.i16(angleToShort(input.viewangles[axis])-deltaAngles[axis]) end for
  pitch=0.0; if input.dir[2]!=0 then pitch=input.viewangles[0] end if
  vectors=q.AngleVectors([pitch,input.viewangles[1],0.0]); forward=vectors[0]; right=vectors[1]
  input.speed=n.fdiv(n.fmul(input.speed,127.0),400.0)
  f=n.fmul(n.fadd(n.fadd(n.fmul(forward[0],input.dir[0]),n.fmul(forward[1],input.dir[1])),n.fmul(forward[2],input.dir[2])),input.speed)
  r=n.fmul(n.fadd(n.fadd(n.fmul(right[0],input.dir[0]),n.fmul(right[1],input.dir[1])),n.fmul(right[2],input.dir[2])),input.speed)
  // Baseq3 resolves abs() to the integer function and truncates first.
  vertical=n.trunc32(forward[2]); if vertical<0 then vertical=0-vertical end if
  u=n.fmul(n.fmul(vertical,input.dir[2]),input.speed)
  command.forwardmove=n.i8(n.trunc32(f)); command.rightmove=n.i8(n.trunc32(r)); command.upmove=n.i8(n.trunc32(u))
  if (input.actionflags&ACTION_MOVEFORWARD)!=0 then command.forwardmove=addMove(command.forwardmove,127) end if
  if (input.actionflags&ACTION_MOVEBACK)!=0 then command.forwardmove=addMove(command.forwardmove,-127) end if
  if (input.actionflags&ACTION_MOVELEFT)!=0 then command.rightmove=addMove(command.rightmove,-127) end if
  if (input.actionflags&ACTION_MOVERIGHT)!=0 then command.rightmove=addMove(command.rightmove,127) end if
  if (input.actionflags&ACTION_JUMP)!=0 then command.upmove=addMove(command.upmove,127) end if
  if (input.actionflags&ACTION_CROUCH)!=0 then command.upmove=addMove(command.upmove,-127) end if
  return void
end function
/// Update `bot.viewangles[axis]` during `updateInput`.
/// @param services Host service callbacks; accesses `getInputFn`.
/// @param bot Bot AI state; accesses `viewangles`, `curPs` and `client`. May update `bot.viewangles[axis]` in place.
/// @param command Command record; accesses `buttons`.
/// @param time Time value in the units expected by this module.
/// @param elapsed Value passed as argument 1 to `mq3.compat.numeric.fdiv`.
function updateInput(services,bot,command,time,elapsed)
  for axis=0 to 2 bot.viewangles[axis]=angleMod(n.fadd(bot.viewangles[axis],shortToAngle(bot.curPs.delta_angles[axis]))) end for
  changeViewAngles(services,bot,n.fdiv(elapsed,1000.0))
  input=services.getInputFn(services,bot.client,n.fdiv(time,1000.0))
  if (input.actionflags&ACTION_RESPAWN)!=0 and (command.buttons&BUTTON_ATTACK)!=0 then input.actionflags=input.actionflags&(~(ACTION_RESPAWN|ACTION_ATTACK)) end if
  inputToUserCommand(input,command,bot.curPs.delta_angles,time)
  for axis=0 to 2 bot.viewangles[axis]=angleMod(n.fsub(bot.viewangles[axis],shortToAngle(bot.curPs.delta_angles[axis]))) end for
  return void
end function
