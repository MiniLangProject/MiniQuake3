// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete source-symbol facade for code/game/bg_pmove.c.
// The productive client prediction and server ClientThink paths share pmove.ml.
package mq3.game.bg_pmove_runtime
import mq3.game.pmove as pm
import mq3.game.movement as movement
import mq3.compat.transcendental as crt

function PM_Accelerate(p,wishdir,wishspeed,accel) return pm.accelerate(p,wishdir,wishspeed,accel) end function
function PM_AddEvent(p,event) return pm.addEvent(p,event) end function
function PM_AddTouchEnt(p,entity) return movement.addTouchEnt(p.k,entity) end function
function PM_AirMove(p) return pm.airMove(p) end function
function PM_Animate(p) return pm.animate(p) end function
function PM_BeginWeaponChange(p,weapon) return pm.beginWeaponChange(p,weapon) end function
function PM_CheckDuck(p) return pm.checkDuck(p) end function
function PM_CheckJump(p) return pm.checkJump(p) end function
function PM_CheckStuck(p) return pm.checkStuck(p) end function
function PM_CheckWaterJump(p) return pm.checkWaterJump(p) end function
function PM_ClipVelocity(velocity,normal,overbounce) return movement.clipVelocity(velocity,normal,overbounce) end function
function PM_CmdScale(p) return pm.scale(p) end function
function PM_ContinueLegsAnim(p,anim) return pm.continueLegs(p,anim) end function
function PM_ContinueTorsoAnim(p,anim) return pm.continueTorso(p,anim) end function
function PM_CorrectAllSolid(p) return pm.correctAllSolid(p) end function
function PM_CrashLand(p) return pm.crashLand(p) end function
function PM_DeadMove(p) return pm.deadMove(p) end function
function PM_DropTimers(p) return pm.dropTimers(p) end function
function PM_FinishWeaponChange(p) return pm.finishWeaponChange(p) end function
function PM_FlyMove(p) return pm.flyMove(p) end function
function PM_FootstepForSurface(p) return pm.footstepForSurface(p) end function
function PM_Footsteps(p) return pm.footsteps(p) end function
function PM_ForceLegsAnim(p,anim) return pm.forceLegs(p,anim) end function
function PM_Friction(p) return pm.friction(p) end function
function PM_GrappleMove(p) return pm.grappleMove(p) end function
function PM_GroundTrace(p) return pm.groundTrace(p) end function
function PM_GroundTraceMissed(p) return pm.groundTraceMissed(p) end function
function PM_InvulnerabilityMove(p) return pm.invulnerabilityMove(p) end function
function PM_NoclipMove(p) return pm.noclipMove(p) end function
function PM_SetMovementDir(p) return pm.movementDir(p) end function
function PM_SetWaterLevel(p) return pm.setWaterLevel(p) end function
function PM_StartLegsAnim(p,anim) return pm.startLegs(p,anim) end function
function PM_StartTorsoAnim(p,anim) return pm.startTorso(p,anim) end function
function PM_TorsoAnimation(p) return pm.torsoAnimation(p) end function
function PM_UpdateViewAngles(ps,cmd) return pm.updateViewAngles(ps,cmd) end function
function PM_WalkMove(p) return pm.walkMove(p) end function
function PM_WaterEvents(p) return pm.waterEvents(p) end function
function PM_WaterJumpMove(p) return pm.waterJumpMove(p) end function
function PM_WaterMove(p) return pm.waterMove(p) end function
function PM_Weapon(p) return pm.weapon(p) end function
function Pmove(p) return pm.move(p) end function
function PmoveSingle(p) return pm.single(p) end function
function sqrt(value) return crt.sqrt(value) end function
