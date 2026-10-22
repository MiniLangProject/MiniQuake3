// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete source-symbol facade for code/game/g_mover.c. The productive
// spawn and frame paths enter this package, while movers.ml owns the kernels.
package mq3.game.g_mover
import mq3.game.movers as moverKernel

function G_TestEntityPosition(level,ent) return moverKernel.testEntityPosition(level,ent) end function
function G_CreateRotationMatrix(angles) return moverKernel.createRotationMatrix(angles) end function
function G_TransposeMatrix(matrix) return moverKernel.transposeMatrix(matrix) end function
function G_RotatePoint(point,matrix) return moverKernel.rotatePoint(point,matrix) end function
function G_TryPushingEntity(level,check,pusher,move,amove)
  result = moverKernel.tryPush(level,check,pusher,move,amove)
  return result[0]
end function
function G_CheckProxMinePosition(level,check) return moverKernel.checkProxMinePosition(level,check) end function
function G_TryPushingProxMine(level,check,pusher,move,amove) return moverKernel.tryPushingProxMine(level,check,pusher,move,amove) end function
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
function G_MoverTeam(level,ent) return moverKernel.moveTeam(level,ent) end function
function G_RunMover(level,ent) return moverKernel.run(level,ent) end function
function SetMoverState(level,ent,state,time) return moverKernel.setMoverState(level,ent,state,time) end function
function MatchTeam(level,leader,state,time) return moverKernel.matchTeam(level,leader,state,time) end function
function ReturnToPos1(level,ent) return moverKernel.returnToPos1(level,ent) end function
function Reached_BinaryMover(level,ent) return moverKernel.reachedBinary(level,ent) end function
function Use_BinaryMover(level,ent,other,activator) return moverKernel.useBinary(level,ent,other,activator) end function
function InitMover(level,ent) return moverKernel.initMover(level,ent) end function
function Blocked_Door(level,ent,other) return moverKernel.blockedDoor(level,ent,other) end function
function Touch_DoorTriggerSpectator(level,ent,other,trace) return moverKernel.touchDoorTrigger(level,ent,other,trace) end function
function Touch_DoorTrigger(level,ent,other,trace) return moverKernel.touchDoorTrigger(level,ent,other,trace) end function
function Think_SpawnNewDoorTrigger(level,ent) return moverKernel.spawnDoorTrigger(level,ent) end function
function Think_MatchTeam(level,ent) return moverKernel.thinkMatchTeam(level,ent) end function
function SP_func_door(level,ent) return moverKernel.spawnDoor(level,ent) end function
function Touch_Plat(level,ent,other,trace) return moverKernel.touchPlat(level,ent,other,trace) end function
function Touch_PlatCenterTrigger(level,ent,other,trace) return moverKernel.touchPlatTrigger(level,ent,other,trace) end function
function SpawnPlatTrigger(level,ent) return moverKernel.spawnPlatTrigger(level,ent) end function
function SP_func_plat(level,ent) return moverKernel.spawnPlat(level,ent) end function
function Touch_Button(level,ent,other,trace) return moverKernel.touchButton(level,ent,other,trace) end function
function SP_func_button(level,ent) return moverKernel.spawnButton(level,ent) end function
function Think_BeginMoving(level,ent) return moverKernel.beginMoving(level,ent) end function
function Reached_Train(level,ent) return moverKernel.reachedTrain(level,ent) end function
function Think_SetupTrainTargets(level,ent) return moverKernel.setupTrain(level,ent) end function
function SP_path_corner(level,ent) return moverKernel.spawnPathCorner(level,ent) end function
function SP_func_train(level,ent) return moverKernel.spawnTrain(level,ent) end function
function SP_func_static(level,ent) return moverKernel.spawnStatic(level,ent) end function
function SP_func_rotating(level,ent) return moverKernel.spawnRotating(level,ent) end function
function SP_func_bobbing(level,ent) return moverKernel.spawnBobbing(level,ent) end function
function SP_func_pendulum(level,ent) return moverKernel.spawnPendulum(level,ent) end function

function dispatch(level,ent) return moverKernel.dispatch(level,ent) end function
