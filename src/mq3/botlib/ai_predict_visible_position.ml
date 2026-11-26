// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BotPredictVisiblePosition from code/botlib/be_ai_move.c.
package mq3.botlib.ai_predict_visible_position

import mq3.botlib.aas_routing as routing
import mq3.botlib.ai_resource_pools as resources

const OP_PREDICT_VISIBLE_POSITION=572
const CONTENTS_SOLID_PLAYERCLIP=0x10001
const MAX_HOPS=20

/// `Runtime` record for ai predict visible position, containing `router`, `context` and `traceFn`.
struct Runtime router context traceFn end struct
/// `Result` record for ai predict visible position, containing `found`, `target`, `hops` and `reachNums`.
struct Result found target hops reachNums end struct
/// Create a `mq3.botlib.ai_predict_visible_position.Runtime` record, initializing `router` from `router`, `context` from `context` and `traceFn` from `traceFn`.
/// @param router Initial value stored in `mq3.botlib.ai_predict_visible_position.Runtime.router`.
/// @param context Context forwarded to the configured host callbacks.
/// @param traceFn Initial value stored in `mq3.botlib.ai_predict_visible_position.Runtime.traceFn`.
function create(router,context,traceFn) return Runtime(router,context,traceFn) end function
/// Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for ai predict visible position.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function copyVector(value) return [value[0],value[1],value[2]] end function
/// Test `runtime!=void and runtime.router!=void and runtime.router.runtime!=void and areaNum>0 and areaNum<len(runtime.router.settings)` as the condition for `valid`.
/// @param runtime AI predict visible position runtime; accesses `router`.
/// @param areaNum AAS area number; zero denotes no area.
function valid(runtime,areaNum) return runtime!=void and runtime.router!=void and runtime.router.runtime!=void and areaNum>0 and areaNum<len(runtime.router.settings) end function
/// Use `runtime.traceFn` to perform `visible`.
/// @param runtime AI predict visible position runtime; accesses `traceFn` and `context`.
/// @param goal Bot navigation goal; accesses `origin` and `entityNum`.
/// @param point Three-component point used by the geometric query.
function visible(runtime,goal,point)
  if runtime.traceFn==void then return false end if
  // AAS_Trace(goal.origin, NULL, NULL, point, goal.entitynum,
  //           CONTENTS_SOLID|CONTENTS_PLAYERCLIP).fraction >= 1
  return runtime.traceFn(runtime.context,goal.origin,point,goal.entityNum,CONTENTS_SOLID_PLAYERCLIP)>=1.0
end function
/// Apply `mq3.botlib.ai_predict_visible_position.valid`, `mq3.botlib.aas_routing.edgeAllowed` and `mq3.botlib.aas_routing.areaTravelTimeToGoalArea` while evaluating `nextReachability`. Return paths include `bestReach`.
/// @param runtime AI predict visible position runtime; accesses `router`.
/// @param origin Not read by this implementation; retained in the `nextReachability` signature.
/// @param areaNum AAS area number; zero denotes no area.
/// @param lastGoalAreaNum Value used by `nextReachability` in `if lastGoalAreaNum==goal.areaNum and reach.areaNum==lastAreaNum then continue end if`.
/// @param lastAreaNum Previously visited AAS area number.
/// @param goal Bot navigation goal; accesses `areaNum`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function nextReachability(runtime,origin,areaNum,lastGoalAreaNum,lastAreaNum,goal,travelFlags)
  if not valid(runtime,areaNum) or not valid(runtime,goal.areaNum) then return 0 end if;effectiveFlags=travelFlags
  if (runtime.router.settings[areaNum].contents&routing.AREACONTENTS_DONOTENTER)!=0 or (runtime.router.settings[goal.areaNum].contents&routing.AREACONTENTS_DONOTENTER)!=0 then effectiveFlags=effectiveFlags|routing.TFL_DONOTENTER end if
  settings=runtime.router.settings[areaNum];bestTime=0;bestReach=0
  if settings.numReachableAreas>0 then for reachNum=settings.firstReachableArea to settings.firstReachableArea+settings.numReachableAreas-1
    reach=runtime.router.reaches[reachNum]
    // PredictVisiblePosition supplies zeroed avoid-reach arrays and no avoid
    // spots, leaving only local-minimum, travel and route-time filtering.
    if lastGoalAreaNum==goal.areaNum and reach.areaNum==lastAreaNum then continue end if
    if not routing.edgeAllowed(runtime.router,reach,effectiveFlags) then continue end if
    routeTime=routing.areaTravelTimeToGoalArea(runtime.router,reach.areaNum,reach.finish,goal.areaNum,effectiveFlags);if routeTime==0 then continue end if
    total=routeTime+reach.travelTime;if bestTime==0 or total<bestTime then bestTime=total;bestReach=reachNum end if
  end for end if;return bestReach
end function
/// Apply `mq3.botlib.ai_predict_visible_position.copyVector`, `mq3.botlib.ai_predict_visible_position.valid` and `mq3.botlib.ai_predict_visible_position.nextReachability` while evaluating `predict`.
/// @param runtime AI predict visible position runtime; accesses `router`.
/// @param origin World-space position as three coordinates.
/// @param areaNum AAS area number; zero denotes no area.
/// @param goal Bot navigation goal; accesses `areaNum`.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function predict(runtime,origin,areaNum,goal,travelFlags)
  result=Result(false,copyVector(origin),0,[])
  if goal==void or not valid(runtime,areaNum) or not valid(runtime,goal.areaNum) then return result end if
  lastGoalAreaNum=goal.areaNum;lastAreaNum=areaNum;currentArea=areaNum;finish=copyVector(origin)
  while result.hops<MAX_HOPS and currentArea!=goal.areaNum
    reachNum=nextReachability(runtime,finish,currentArea,lastGoalAreaNum,lastAreaNum,goal,travelFlags);if reachNum==0 or reachNum<0 or reachNum>=len(runtime.router.reaches) then return result end if
    reach=runtime.router.reaches[reachNum];result.reachNums=result.reachNums+[reachNum];result.hops=result.hops+1
    if visible(runtime,goal,reach.start) then result.target=copyVector(reach.start);result.found=true;return result end if
    if visible(runtime,goal,reach.finish) then result.target=copyVector(reach.finish);result.found=true;return result end if
    if reach.areaNum==goal.areaNum then result.target=copyVector(reach.finish);result.found=true;return result end if
    lastAreaNum=currentArea;currentArea=reach.areaNum;finish=copyVector(reach.finish)
  end while;return result
end function
