// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete source-symbol facade for code/game/bg_pmove.c.
// The productive client prediction and server ClientThink paths share pmove.ml.
package mq3.game.bg_pmove_runtime
import mq3.game.pmove as pm
import mq3.game.movement as movement
import mq3.compat.transcendental as crt

/// Forward `PM_Accelerate` to `mq3.game.pmove.accelerate` and return the delegated result.
/// @param p Player movement context; accesses `k`.
/// @param wishdir Value passed as argument 2 to `mq3.shared.math.DotProduct`.
/// @param wishspeed Requested movement speed.
/// @param accel Value passed as argument 1 to `mq3.compat.numeric.fmul`.
function PM_Accelerate(p,wishdir,wishspeed,accel) return pm.accelerate(p,wishdir,wishspeed,accel) end function
/// Forward `PM_AddEvent` to `mq3.game.pmove.addEvent` and return the delegated result.
/// @param p Player movement context; accesses `ps`. May update `p.ps.events[slot]`, `p.ps.eventParms[slot]` and `p.ps.eventSequence` in place.
/// @param event Player or entity event identifier.
function PM_AddEvent(p,event) return pm.addEvent(p,event) end function
/// Forward `PM_AddTouchEnt` to `mq3.game.movement.addTouchEnt` and return the delegated result.
/// @param p Player movement context; accesses `k`.
/// @param entity Value used by `addTouchEnt` in `if entity == 1022 or len(state.touches) == 32 then return void end if`.
function PM_AddTouchEnt(p,entity) return movement.addTouchEnt(p.k,entity) end function
/// Forward `PM_AirMove` to `mq3.game.pmove.airMove` and return the delegated result.
/// @param p Player movement context; accesses `forward`, `right`, `cmd`, `k` and `ps`. May update `p.forward[2]`, `p.right[2]` and `p.ps.velocity` in place.
function PM_AirMove(p) return pm.airMove(p) end function
/// Forward `PM_Animate` to `mq3.game.pmove.animate` and return the delegated result.
/// @param p Player movement context; accesses `cmd` and `ps`. May update `p.ps.torsoTimer` in place.
function PM_Animate(p) return pm.animate(p) end function
/// Forward `PM_BeginWeaponChange` to `mq3.game.pmove.beginWeaponChange` and return the delegated result.
/// @param p Player movement context; accesses `ps`. May update `p.ps.weaponstate` and `p.ps.weaponTime` in place.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function PM_BeginWeaponChange(p,weapon) return pm.beginWeaponChange(p,weapon) end function
/// Forward `PM_CheckDuck` to `mq3.game.pmove.checkDuck` and return the delegated result.
/// @param p Player movement context; accesses `ps`, `k`, `cmd` and `traceFn`. May update `p.k.mins`, `p.k.maxs` and `p.ps.pm_flags` and additional fields in place.
function PM_CheckDuck(p) return pm.checkDuck(p) end function
/// Forward `PM_CheckJump` to `mq3.game.pmove.checkJump` and return the delegated result.
/// @param p Player movement context; accesses `ps`, `cmd` and `k`. May update `p.cmd.upmove`, `p.k.groundPlane` and `p.k.walking` and additional fields in place.
function PM_CheckJump(p) return pm.checkJump(p) end function
/// Forward `PM_CheckStuck` to `mq3.game.pmove.checkStuck` and return the delegated result.
/// @param p Player movement context; accesses `traceFn` and `ps`.
function PM_CheckStuck(p) return pm.checkStuck(p) end function
/// Forward `PM_CheckWaterJump` to `mq3.game.pmove.checkWaterJump` and return the delegated result.
/// @param p Player movement context; accesses `ps`, `k`, `forward` and `pointFn`. May update `p.ps.velocity`, `p.ps.velocity[2]` and `p.ps.pm_flags` and additional fields in place.
function PM_CheckWaterJump(p) return pm.checkWaterJump(p) end function
/// Forward `PM_ClipVelocity` to `mq3.game.movement.clipVelocity` and return the delegated result.
/// @param velocity Three-component movement velocity.
/// @param normal Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param overbounce Value passed as argument 2 to `mq3.compat.numeric.fmul`.
function PM_ClipVelocity(velocity,normal,overbounce) return movement.clipVelocity(velocity,normal,overbounce) end function
/// Forward `PM_CmdScale` to `mq3.game.pmove.scale` and return the delegated result.
/// @param p Player movement context; accesses `k`, `ps` and `cmd`. May update `p.k.speed` in place.
function PM_CmdScale(p) return pm.scale(p) end function
/// Forward `PM_ContinueLegsAnim` to `mq3.game.pmove.continueLegs` and return the delegated result.
/// @param p Player movement context; accesses `ps`.
/// @param anim Value used by `startLegs` in `p.ps.legsAnim = ((p.ps.legsAnim & 128)^128)|anim`.
function PM_ContinueLegsAnim(p,anim) return pm.continueLegs(p,anim) end function
/// Forward `PM_ContinueTorsoAnim` to `mq3.game.pmove.continueTorso` and return the delegated result.
/// @param p Player movement context; accesses `ps`.
/// @param anim Value used by `startTorso` in `p.ps.torsoAnim = ((p.ps.torsoAnim & 128)^128)|anim`.
function PM_ContinueTorsoAnim(p,anim) return pm.continueTorso(p,anim) end function
/// Forward `PM_CorrectAllSolid` to `mq3.game.pmove.correctAllSolid` and return the delegated result.
/// @param p Player movement context; accesses `ps` and `traceFn`.
function PM_CorrectAllSolid(p) return pm.correctAllSolid(p) end function
/// Forward `PM_CrashLand` to `mq3.game.pmove.crashLand` and return the delegated result.
/// @param p Player movement context; accesses `ps`, `previousOrigin`, `previousVelocity` and `k`. May update `p.ps.legsTimer` and `p.ps.bobCycle` in place.
function PM_CrashLand(p) return pm.crashLand(p) end function
/// Forward `PM_DeadMove` to `mq3.game.pmove.deadMove` and return the delegated result.
/// @param p Player movement context; accesses `k` and `ps`. May update `p.ps.velocity` in place.
function PM_DeadMove(p) return pm.deadMove(p) end function
/// Forward `PM_DropTimers` to `mq3.game.pmove.dropTimers` and return the delegated result.
/// @param p Player movement context; accesses `ps` and `msec`.
function PM_DropTimers(p) return pm.dropTimers(p) end function
/// Forward `PM_FinishWeaponChange` to `mq3.game.pmove.finishWeaponChange` and return the delegated result.
/// @param p Player movement context; accesses `cmd` and `ps`. May update `p.ps.weapon`, `p.ps.weaponstate` and `p.ps.weaponTime` in place.
function PM_FinishWeaponChange(p) return pm.finishWeaponChange(p) end function
/// Forward `PM_FlyMove` to `mq3.game.pmove.flyMove` and return the delegated result.
/// @param p Player movement context; accesses `k`.
function PM_FlyMove(p) return pm.flyMove(p) end function
/// Forward `PM_FootstepForSurface` to `mq3.game.pmove.footstepForSurface` and return the delegated result.
/// @param p Player movement context; accesses `k`.
function PM_FootstepForSurface(p) return pm.footstepForSurface(p) end function
/// Forward `PM_Footsteps` to `mq3.game.pmove.footsteps` and return the delegated result.
/// @param p Player movement context; accesses `xyspeed`, `ps`, `k`, `cmd` and `msec` and related fields. May update `p.xyspeed` and `p.ps.bobCycle` in place.
function PM_Footsteps(p) return pm.footsteps(p) end function
/// Forward `PM_ForceLegsAnim` to `mq3.game.pmove.forceLegs` and return the delegated result.
/// @param p Player movement context; accesses `ps`. May update `p.ps.legsTimer` in place.
/// @param anim Value used by `startLegs` in `p.ps.legsAnim = ((p.ps.legsAnim & 128)^128)|anim`.
function PM_ForceLegsAnim(p,anim) return pm.forceLegs(p,anim) end function
/// Forward `PM_Friction` to `mq3.game.pmove.friction` and return the delegated result.
/// @param p Player movement context; accesses `k`.
function PM_Friction(p) return pm.friction(p) end function
/// Forward `PM_GrappleMove` to `mq3.game.pmove.grappleMove` and return the delegated result.
/// @param p Player movement context; accesses `ps`, `forward` and `k`. May update `p.ps.velocity` and `p.k.groundPlane` in place.
function PM_GrappleMove(p) return pm.grappleMove(p) end function
/// Forward `PM_GroundTrace` to `mq3.game.pmove.groundTrace` and return the delegated result.
/// @param p Player movement context; accesses `ps`, `traceFn`, `groundTrace`, `k` and `previousVelocity`. May update `p.ps.groundEntityNum`, `p.k.groundPlane` and `p.k.walking` and additional fields in place.
function PM_GroundTrace(p) return pm.groundTrace(p) end function
/// Forward `PM_GroundTraceMissed` to `mq3.game.pmove.groundTraceMissed` and return the delegated result.
/// @param p Player movement context; accesses `ps` and `traceFn`.
function PM_GroundTraceMissed(p) return pm.groundTraceMissed(p) end function
/// Forward `PM_InvulnerabilityMove` to `mq3.game.pmove.invulnerabilityMove` and return the delegated result.
/// @param p Player movement context; accesses `cmd` and `ps`. May update `p.cmd.forwardmove`, `p.cmd.rightmove` and `p.cmd.upmove` and additional fields in place.
function PM_InvulnerabilityMove(p) return pm.invulnerabilityMove(p) end function
/// Forward `PM_NoclipMove` to `mq3.game.pmove.noclipMove` and return the delegated result.
/// @param p Player movement context; accesses `ps`, `k`, `forward`, `cmd` and `right`. May update `p.ps.viewheight`, `p.ps.velocity` and `p.ps.origin` in place.
function PM_NoclipMove(p) return pm.noclipMove(p) end function
/// Forward `PM_SetMovementDir` to `mq3.game.pmove.movementDir` and return the delegated result.
/// @param p Player movement context; accesses `cmd` and `ps`. May update `p.ps.movementDir` in place.
function PM_SetMovementDir(p) return pm.movementDir(p) end function
/// Forward `PM_SetWaterLevel` to `mq3.game.pmove.setWaterLevel` and return the delegated result.
/// @param p Player movement context; accesses `k`, `watertype`, `ps` and `pointFn`. May update `p.k.waterlevel` and `p.watertype` in place.
function PM_SetWaterLevel(p) return pm.setWaterLevel(p) end function
/// Forward `PM_StartLegsAnim` to `mq3.game.pmove.startLegs` and return the delegated result.
/// @param p Player movement context; accesses `ps`. May update `p.ps.legsAnim` in place.
/// @param anim Value used by `startLegs` in `p.ps.legsAnim = ((p.ps.legsAnim & 128)^128)|anim`.
function PM_StartLegsAnim(p,anim) return pm.startLegs(p,anim) end function
/// Forward `PM_StartTorsoAnim` to `mq3.game.pmove.startTorso` and return the delegated result.
/// @param p Player movement context; accesses `ps`. May update `p.ps.torsoAnim` in place.
/// @param anim Value used by `startTorso` in `p.ps.torsoAnim = ((p.ps.torsoAnim & 128)^128)|anim`.
function PM_StartTorsoAnim(p,anim) return pm.startTorso(p,anim) end function
/// Forward `PM_TorsoAnimation` to `mq3.game.pmove.torsoAnimation` and return the delegated result.
/// @param p Player movement context; accesses `ps`.
function PM_TorsoAnimation(p) return pm.torsoAnimation(p) end function
/// Forward `PM_UpdateViewAngles` to `mq3.game.pmove.updateViewAngles` and return the delegated result.
/// @param ps Player movement state; accesses `pm_type`, `stats`, `delta_angles` and `viewangles`. May update `ps.delta_angles[axis]` and `ps.viewangles[axis]` in place.
/// @param cmd Input user command; accesses `angles`.
function PM_UpdateViewAngles(ps,cmd) return pm.updateViewAngles(ps,cmd) end function
/// Forward `PM_WalkMove` to `mq3.game.pmove.walkMove` and return the delegated result.
/// @param p Player movement context; accesses `k`, `forward`, `right`, `cmd` and `ps`. May update `p.forward[2]`, `p.right[2]` and `p.forward` and additional fields in place.
function PM_WalkMove(p) return pm.walkMove(p) end function
/// Forward `PM_WaterEvents` to `mq3.game.pmove.waterEvents` and return the delegated result.
/// @param p Player movement context; accesses `previousWaterlevel` and `k`.
function PM_WaterEvents(p) return pm.waterEvents(p) end function
/// Forward `PM_WaterJumpMove` to `mq3.game.pmove.waterJumpMove` and return the delegated result.
/// @param p Player movement context; accesses `ps` and `k`. May update `p.ps.velocity[2]`, `p.ps.pm_flags` and `p.ps.pm_time` in place.
function PM_WaterJumpMove(p) return pm.waterJumpMove(p) end function
/// Forward `PM_WaterMove` to `mq3.game.pmove.waterMove` and return the delegated result.
/// @param p Player movement context; accesses `ps` and `k`. May update `p.ps.velocity` in place.
function PM_WaterMove(p) return pm.waterMove(p) end function
/// Forward `PM_Weapon` to `mq3.game.pmove.weapon` and return the delegated result.
/// @param p Player movement context; accesses `ps`, `cmd`, `msec` and `gauntletHit`.
function PM_Weapon(p) return pm.weapon(p) end function
/// Forward `Pmove` to `mq3.game.pmove.move` and return the delegated result.
/// @param p Player movement context; accesses `fixed`, `fixedMsec`, `ps` and `cmd`. May update `p.cmd.weapon`, `p.cmd.forwardmove` and `p.cmd.rightmove` and additional fields in place.
function Pmove(p) return pm.move(p) end function
/// Forward `PmoveSingle` to `mq3.game.pmove.single` and return the delegated result.
/// @param p Player movement context; accesses `ps`, `cmd`, `k`, `watertype` and `previousWaterlevel` and related fields. May update `p.watertype`, `p.previousWaterlevel` and `p.msec` and additional fields in place.
function PmoveSingle(p) return pm.single(p) end function
/// Forward `sqrt` to `mq3.compat.transcendental.sqrt` and return the delegated result.
/// @param value Value passed as argument 1 to `mq3.compat.transcendental.sqrt`.
function sqrt(value) return crt.sqrt(value) end function
