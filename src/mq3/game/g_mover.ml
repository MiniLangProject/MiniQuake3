// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete source-symbol facade for code/game/g_mover.c. The productive
// spawn and frame paths enter this package, while movers.ml owns the kernels.
package mq3.game.g_mover
import mq3.game.movers as moverKernel

/// Forward `G_TestEntityPosition` to `mq3.game.movers.testEntityPosition` and return the delegated result.
/// @param level Game-level state; accesses `scene` and `entities`.
/// @param ent Game entity; accesses `s`, `client`, `clipmask` and `r`.
function G_TestEntityPosition(level,ent) return moverKernel.testEntityPosition(level,ent) end function
/// Forward `G_CreateRotationMatrix` to `mq3.game.movers.createRotationMatrix` and return the delegated result.
/// @param angles Pitch, yaw and roll angles in degrees.
function G_CreateRotationMatrix(angles) return moverKernel.createRotationMatrix(angles) end function
/// Forward `G_TransposeMatrix` to `mq3.game.movers.transposeMatrix` and return the delegated result.
/// @param matrix Three-component array; components 0, 1 and 2 are used in their stored order.
function G_TransposeMatrix(matrix) return moverKernel.transposeMatrix(matrix) end function
/// Forward `G_RotatePoint` to `mq3.game.movers.rotatePoint` and return the delegated result.
/// @param point Three-component point used by the geometric query.
/// @param matrix Three-component array; components 0, 1 and 2 are used in their stored order.
function G_RotatePoint(point,matrix) return moverKernel.rotatePoint(point,matrix) end function
/// Apply `mq3.game.movers.tryPush` while evaluating `G_TryPushingEntity`. Return paths include `result[0]`.
/// @param level Game-level state; accesses `scene` and `entities`.
/// @param check Check record; accesses `s`, `client` and `r`. May update `check.s.pos.trBase[axis]`, `check.client.ps.origin[axis]` and `check.client.ps.delta_angles[1]` and additional fields in place.
/// @param pusher Pusher record; accesses `s` and `r`.
/// @param move Array or byte sequence accessed at `axis`.
/// @param amove Pitch, yaw and roll angles in degrees.
function G_TryPushingEntity(level,check,pusher,move,amove)
  result = moverKernel.tryPush(level,check,pusher,move,amove)
  return result[0]
end function
/// Forward `G_CheckProxMinePosition` to `mq3.game.movers.checkProxMinePosition` and return the delegated result.
/// @param level Game-level state; accesses `scene`.
/// @param check Check record; accesses `s` and `movedir`.
function G_CheckProxMinePosition(level,check) return moverKernel.checkProxMinePosition(level,check) end function
/// Forward `G_TryPushingProxMine` to `mq3.game.movers.tryPushingProxMine` and return the delegated result.
/// @param level Game-level state; accesses `scene`.
/// @param check Check record; accesses `s` and `r`. May update `check.s.pos.trBase[axis]` and `check.r.currentOrigin` in place.
/// @param pusher Pusher record; accesses `r`.
/// @param move Array or byte sequence accessed at `axis`.
/// @param amove Three-component array; components 0, 1 and 2 are used in their stored order.
function G_TryPushingProxMine(level,check,pusher,move,amove) return moverKernel.tryPushingProxMine(level,check,pusher,move,amove) end function
/// Apply `mq3.game.movers.pushPart` and `mq3.game.movers.restorePush` while evaluating `G_MoverPush`. Return paths include `[result[0],result[1]]`.
/// @param level Game-level state; accesses `scene` and `entities`.
/// @param pusher Pusher record; accesses `r` and `s`. May update `pusher.r.currentOrigin` and `pusher.r.currentAngles` in place.
/// @param move Array or byte sequence accessed at `axis`.
/// @param amove Three-component array; components 0, 1 and 2 are used in their stored order.
function G_MoverPush(level,pusher,move,amove)
  result = moverKernel.pushPart(level,pusher,move,amove,[])
  if not result[0] then
    index = len(result[2])-1
    while index >= 0
      moverKernel.restorePush(level,result[2][index]); index = index-1
    end while
  end if
  return [result[0],result[1]]
end function
/// Forward `G_MoverTeam` to `mq3.game.movers.moveTeam` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Leader record; accesses `blocked`.
function G_MoverTeam(level,ent) return moverKernel.moveTeam(level,ent) end function
/// Forward `G_RunMover` to `mq3.game.movers.run` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `flags` and `s`.
function G_RunMover(level,ent) return moverKernel.run(level,ent) end function
/// Forward `SetMoverState` to `mq3.game.movers.setMoverState` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `moverState`, `s`, `pos1`, `pos2` and `r`. May update `ent.moverState`, `ent.s.pos.trTime` and `ent.s.pos.trBase` and additional fields in place.
/// @param state Value used by `setMoverState` in `ent.moverState = state`.
/// @param time Time value in the units expected by this module.
function SetMoverState(level,ent,state,time) return moverKernel.setMoverState(level,ent,state,time) end function
/// Forward `MatchTeam` to `mq3.game.movers.matchTeam` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param leader Value used by `matchTeam` in `part = leader`.
/// @param state Value used by `setMoverState` in `ent.moverState = state`.
/// @param time Time value in the units expected by this module.
function MatchTeam(level,leader,state,time) return moverKernel.matchTeam(level,leader,state,time) end function
/// Forward `ReturnToPos1` to `mq3.game.movers.returnToPos1` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`, `soundLoop` and `sound2to1`. May update `ent.s.loopSound` in place.
function ReturnToPos1(level,ent) return moverKernel.returnToPos1(level,ent) end function
/// Forward `Reached_BinaryMover` to `mq3.game.movers.reachedBinary` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`, `soundLoop`, `moverState`, `soundPos2` and `think` and related fields. May update `ent.s.loopSound`, `ent.think` and `ent.nextthink` and additional fields in place.
function Reached_BinaryMover(level,ent) return moverKernel.reachedBinary(level,ent) end function
/// Forward `Use_BinaryMover` to `mq3.game.movers.useBinary` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `flags`, `teammaster`, `activator`, `moverState` and `sound1to2` and related fields. May update `ent.activator`, `ent.s.loopSound` and `ent.nextthink` in place.
/// @param other Value passed as argument 3 to `mq3.game.movers.useBinary`.
/// @param activator Entity responsible for activating the target.
function Use_BinaryMover(level,ent,other,activator) return moverKernel.useBinary(level,ent,other,activator) end function
/// Forward `InitMover` to `mq3.game.movers.initMover` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `model2`, `s`, `use`, `reached` and `moverState` and related fields. May update `ent.s.modelindex2`, `ent.s.loopSound` and `ent.s.constantLight` and additional fields in place.
function InitMover(level,ent) return moverKernel.initMover(level,ent) end function
/// Forward `Blocked_Door` to `mq3.game.movers.blockedDoor` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `damage` and `spawnflags`.
/// @param other Other record; accesses `client`, `s` and `item`.
function Blocked_Door(level,ent,other) return moverKernel.blockedDoor(level,ent,other) end function
/// Forward `Touch_DoorTriggerSpectator` to `mq3.game.movers.touchDoorTrigger` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `parent`, `count` and `r`.
/// @param other Other record; accesses `client` and `s`.
/// @param trace Value passed as argument 4 to `mq3.game.movers.touchDoorTrigger`.
function Touch_DoorTriggerSpectator(level,ent,other,trace) return moverKernel.touchDoorTrigger(level,ent,other,trace) end function
/// Forward `Touch_DoorTrigger` to `mq3.game.movers.touchDoorTrigger` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `parent`, `count` and `r`.
/// @param other Other record; accesses `client` and `s`.
/// @param trace Value passed as argument 4 to `mq3.game.movers.touchDoorTrigger`.
function Touch_DoorTrigger(level,ent,other,trace) return moverKernel.touchDoorTrigger(level,ent,other,trace) end function
/// Forward `Think_SpawnNewDoorTrigger` to `mq3.game.movers.spawnDoorTrigger` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `r` and `moverState`.
function Think_SpawnNewDoorTrigger(level,ent) return moverKernel.spawnDoorTrigger(level,ent) end function
/// Forward `Think_MatchTeam` to `mq3.game.movers.thinkMatchTeam` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `moverState`.
function Think_MatchTeam(level,ent) return moverKernel.thinkMatchTeam(level,ent) end function
/// Forward `SP_func_door` to `mq3.game.movers.spawnDoor` and return the delegated result.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param ent Game entity; accesses `sound1to2`, `sound2to1`, `soundPos1`, `soundPos2` and `blocked` and related fields. May update `ent.sound1to2`, `ent.sound2to1` and `ent.soundPos1` and additional fields in place.
function SP_func_door(level,ent) return moverKernel.spawnDoor(level,ent) end function
/// Forward `Touch_Plat` to `mq3.game.movers.touchPlat` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `moverState` and `nextthink`. May update `ent.nextthink` in place.
/// @param other Other record; accesses `client`.
/// @param trace Value passed as argument 4 to `mq3.game.movers.touchPlat`.
function Touch_Plat(level,ent,other,trace) return moverKernel.touchPlat(level,ent,other,trace) end function
/// Forward `Touch_PlatCenterTrigger` to `mq3.game.movers.touchPlatTrigger` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `parent`.
/// @param other Other record; accesses `client`.
/// @param trace Value passed as argument 4 to `mq3.game.movers.touchPlatTrigger`.
function Touch_PlatCenterTrigger(level,ent,other,trace) return moverKernel.touchPlatTrigger(level,ent,other,trace) end function
/// Forward `SpawnPlatTrigger` to `mq3.game.movers.spawnPlatTrigger` and return the delegated result.
/// @param level Game-level state; accesses `num_entities`, `entities`, `startTime` and `time`. May update `level.num_entities` in place.
/// @param ent Game entity; accesses `pos1` and `r`.
function SpawnPlatTrigger(level,ent) return moverKernel.spawnPlatTrigger(level,ent) end function
/// Forward `SP_func_plat` to `mq3.game.movers.spawnPlat` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `sound1to2`, `sound2to1`, `soundPos1`, `soundPos2` and `s` and related fields. May update `ent.sound1to2`, `ent.sound2to1` and `ent.soundPos1` and additional fields in place.
function SP_func_plat(level,ent) return moverKernel.spawnPlat(level,ent) end function
/// Forward `Touch_Button` to `mq3.game.movers.touchButton` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `moverState`.
/// @param other Other record; accesses `client`.
/// @param trace Value passed as argument 4 to `mq3.game.movers.touchButton`.
function Touch_Button(level,ent,other,trace) return moverKernel.touchButton(level,ent,other,trace) end function
/// Forward `SP_func_button` to `mq3.game.movers.spawnButton` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `sound1to2`, `speed`, `wait`, `pos1` and `s` and related fields. May update `ent.sound1to2`, `ent.speed` and `ent.wait` and additional fields in place.
function SP_func_button(level,ent) return moverKernel.spawnButton(level,ent) end function
/// Forward `Think_BeginMoving` to `mq3.game.movers.beginMoving` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`. May update `ent.s.pos.trTime` and `ent.s.pos.trType` in place.
function Think_BeginMoving(level,ent) return moverKernel.beginMoving(level,ent) end function
/// Forward `Reached_Train` to `mq3.game.movers.reachedTrain` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `nextTrain`, `pos1`, `pos2`, `speed` and `s` and related fields. May update `ent.nextTrain`, `ent.pos1` and `ent.pos2` and additional fields in place.
function Reached_Train(level,ent) return moverKernel.reachedTrain(level,ent) end function
/// Forward `Think_SetupTrainTargets` to `mq3.game.movers.setupTrain` and return the delegated result.
/// @param level Game-level state; accesses `num_entities` and `entities`.
/// @param ent Game entity; accesses `nextTrain`, `target` and `r`. May update `ent.nextTrain` in place.
function Think_SetupTrainTargets(level,ent) return moverKernel.setupTrain(level,ent) end function
/// Forward `SP_path_corner` to `mq3.game.movers.spawnPathCorner` and return the delegated result.
/// @param level Game-level state; accesses `gamePrintFn`.
/// @param ent Game entity; accesses `targetname` and `s`.
function SP_path_corner(level,ent) return moverKernel.spawnPathCorner(level,ent) end function
/// Forward `SP_func_train` to `mq3.game.movers.spawnTrain` and return the delegated result.
/// @param level Game-level state; accesses `time`.
/// @param ent Game entity; accesses `s`, `spawnflags`, `damage`, `speed` and `target` and related fields. May update `ent.s.angles`, `ent.damage` and `ent.speed` and additional fields in place.
function SP_func_train(level,ent) return moverKernel.spawnTrain(level,ent) end function
/// Forward `SP_func_static` to `mq3.game.movers.spawnStatic` and return the delegated result.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `model`, `s` and `r`. May update `ent.s.pos.trBase` and `ent.r.currentOrigin` in place.
function SP_func_static(level,ent) return moverKernel.spawnStatic(level,ent) end function
/// Forward `SP_func_rotating` to `mq3.game.movers.spawnRotating` and return the delegated result.
/// @param level Game-level state; accesses `scene`.
/// @param ent Game entity; accesses `speed`, `damage`, `s`, `spawnflags` and `model` and related fields. May update `ent.speed`, `ent.damage` and `ent.s.apos.trType` and additional fields in place.
function SP_func_rotating(level,ent) return moverKernel.spawnRotating(level,ent) end function
/// Forward `SP_func_bobbing` to `mq3.game.movers.spawnBobbing` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `speed`, `damage`, `model`, `s` and `r` and related fields. May update `ent.speed`, `ent.damage` and `ent.s.pos.trBase` and additional fields in place.
function SP_func_bobbing(level,ent) return moverKernel.spawnBobbing(level,ent) end function
/// Forward `SP_func_pendulum` to `mq3.game.movers.spawnPendulum` and return the delegated result.
/// @param level Game-level state; accesses `spawner`.
/// @param ent Game entity; accesses `damage`, `model`, `r` and `s`. May update `ent.damage`, `ent.s.pos.trDuration` and `ent.s.pos.trBase` and additional fields in place.
function SP_func_pendulum(level,ent) return moverKernel.spawnPendulum(level,ent) end function

/// Forward `dispatch` to `mq3.game.movers.dispatch` and return the delegated result.
/// @param level Game-level state; accesses `spawner` and `time`.
/// @param ent Game entity; accesses `classname`.
function dispatch(level,ent) return moverKernel.dispatch(level,ent) end function
