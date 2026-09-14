// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// BotPredictVisiblePosition from code/botlib/be_ai_move.c.
package mq3.botlib.ai_predict_visible_position

import mq3.botlib.aas_routing as routing
import mq3.botlib.ai_resource_pools as resources

const OP_PREDICT_VISIBLE_POSITION=572
const CONTENTS_SOLID_PLAYERCLIP=0x10001
const MAX_HOPS=20

struct Runtime router context traceFn end struct
struct Result found target hops reachNums end struct
function create(router,context,traceFn) return Runtime(router,context,traceFn) end function
function copyVector(value) return [value[0],value[1],value[2]] end function
function valid(runtime,areaNum) return runtime!=void and runtime.router!=void and runtime.router.runtime!=void and areaNum>0 and areaNum<len(runtime.router.settings) end function
function visible(runtime,goal,point)
  if runtime.traceFn==void then return false end if
  // AAS_Trace(goal.origin, NULL, NULL, point, goal.entitynum,
  //           CONTENTS_SOLID|CONTENTS_PLAYERCLIP).fraction >= 1
  return runtime.traceFn(runtime.context,goal.origin,point,goal.entityNum,CONTENTS_SOLID_PLAYERCLIP)>=1.0
end function
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
