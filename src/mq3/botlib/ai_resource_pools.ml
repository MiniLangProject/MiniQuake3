// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Fixed handle pools and reset semantics from be_ai_chat/goal/move/weap.c.
package mq3.botlib.ai_resource_pools

import mq3.botlib.public_headers as publicHeaders
const MAX_CLIENTS=64
const MAX_GOALSTACK=publicHeaders.MAX_GOALSTACK
const MAX_AVOIDGOALS=publicHeaders.MAX_AVOIDGOALS
const MAX_AVOIDREACH=publicHeaders.MAX_AVOIDREACH
const MAX_AVOIDSPOTS=publicHeaders.MAX_AVOIDSPOTS

const OP_ALLOC_CHAT_STATE=507
const OP_FREE_CHAT_STATE=508
const OP_RESET_GOAL_STATE=525
const OP_ALLOC_GOAL_STATE=546
const OP_FREE_GOAL_STATE=547
const OP_RESET_MOVE_STATE=548
const OP_RESET_AVOID_REACH=551
const OP_RESET_LAST_AVOID_REACH=552
const OP_ALLOC_MOVE_STATE=555
const OP_FREE_MOVE_STATE=556
const OP_ALLOC_WEAPON_STATE=561
const OP_FREE_WEAPON_STATE=562
const OP_RESET_WEAPON_STATE=563

function supportsTrap(op)
  return op==OP_ALLOC_CHAT_STATE or op==OP_FREE_CHAT_STATE or op==OP_RESET_GOAL_STATE or op==OP_ALLOC_GOAL_STATE or op==OP_FREE_GOAL_STATE or op==OP_RESET_MOVE_STATE or op==OP_RESET_AVOID_REACH or op==OP_RESET_LAST_AVOID_REACH or op==OP_ALLOC_MOVE_STATE or op==OP_FREE_MOVE_STATE or op==OP_ALLOC_WEAPON_STATE or op==OP_FREE_WEAPON_STATE or op==OP_RESET_WEAPON_STATE
end function

struct ChatState gender client name chatMessage handle consoleMessages numConsoleMessages chat end struct
struct Goal origin areaNum mins maxs entityNum number flags itemInfo end struct
struct GoalState itemWeightConfig itemWeightIndex client lastReachabilityArea goalStack goalStackTop avoidGoals avoidGoalTimes end struct
struct AvoidSpot origin radius type end struct
struct MoveState origin velocity viewOffset entityNum client thinkTime presenceType viewAngles areaNum lastAreaNum lastGoalAreaNum lastReachNum lastOrigin reachAreaNum moveFlags jumpReach grappleVisibleTime lastGrappleDist reachabilityTime avoidReach avoidReachTimes avoidReachTries avoidSpots numAvoidSpots end struct
struct WeaponState weaponWeightConfig weaponWeightIndex end struct
struct Pools chatStates goalStates moveStates weaponStates end struct

function zeros(count) values=array(count,0);return values end function
function floatZeros(count) values=array(count,0.0);return values end function
function vec3() return [0.0,0.0,0.0] end function
function emptyGoal() return Goal(vec3(),0,vec3(),vec3(),0,0,0,0) end function
function emptyGoalStack() values=array(MAX_GOALSTACK,void);for i=0 to MAX_GOALSTACK-1 values[i]=emptyGoal() end for;return values end function
function emptyAvoidSpots() values=array(MAX_AVOIDSPOTS,void);for i=0 to MAX_AVOIDSPOTS-1 values[i]=AvoidSpot(vec3(),0.0,0) end for;return values end function
function emptyChatState() return ChatState(0,0,"","",0,[],0,void) end function
function emptyGoalState(client) return GoalState(void,void,client,0,emptyGoalStack(),0,zeros(MAX_AVOIDGOALS),floatZeros(MAX_AVOIDGOALS)) end function
function emptyMoveState() return MoveState(vec3(),vec3(),vec3(),0,0,0.0,0,vec3(),0,0,0,0,vec3(),0,0,0,0.0,0.0,0.0,zeros(MAX_AVOIDREACH),floatZeros(MAX_AVOIDREACH),zeros(MAX_AVOIDREACH),emptyAvoidSpots(),0) end function
function emptyWeaponState() return WeaponState(void,void) end function

function create() return Pools(array(MAX_CLIENTS+1,void),array(MAX_CLIENTS+1,void),array(MAX_CLIENTS+1,void),array(MAX_CLIENTS+1,void)) end function
function validHandle(handle) return handle>0 and handle<=MAX_CLIENTS end function
function chatState(pools,handle) if pools==void or not validHandle(handle) then return void end if;return pools.chatStates[handle] end function
function goalState(pools,handle) if pools==void or not validHandle(handle) then return void end if;return pools.goalStates[handle] end function
function moveState(pools,handle) if pools==void or not validHandle(handle) then return void end if;return pools.moveStates[handle] end function
function weaponState(pools,handle) if pools==void or not validHandle(handle) then return void end if;return pools.weaponStates[handle] end function

function allocChatState(pools)
  if pools==void then return 0 end if
  for handle=1 to MAX_CLIENTS if pools.chatStates[handle]==void then pools.chatStates[handle]=emptyChatState();return handle end if end for;return 0
end function
function freeChatState(pools,handle)
  value=chatState(pools,handle);if value==void then return 0 end if
  // Console-message nodes and chat data are owned by the later chat subsystem.
  value.consoleMessages=[];value.numConsoleMessages=0;value.chat=void;pools.chatStates[handle]=void;return 0
end function

function allocGoalState(pools,client)
  if pools==void then return 0 end if
  for handle=1 to MAX_CLIENTS if pools.goalStates[handle]==void then pools.goalStates[handle]=emptyGoalState(client);return handle end if end for;return 0
end function
function resetAvoidGoalsState(value)
  if value==void then return 0 end if
  value.avoidGoals=zeros(MAX_AVOIDGOALS);value.avoidGoalTimes=floatZeros(MAX_AVOIDGOALS);return 0
end function
function resetGoalState(pools,handle)
  value=goalState(pools,handle);if value==void then return 0 end if
  // be_ai_goal.c deliberately preserves weights, client and last reachability area.
  value.goalStack=emptyGoalStack();value.goalStackTop=0;return resetAvoidGoalsState(value)
end function
function freeGoalState(pools,handle)
  value=goalState(pools,handle);if value==void then return 0 end if
  value.itemWeightConfig=void;value.itemWeightIndex=void;pools.goalStates[handle]=void;return 0
end function

function allocMoveState(pools)
  if pools==void then return 0 end if
  for handle=1 to MAX_CLIENTS if pools.moveStates[handle]==void then pools.moveStates[handle]=emptyMoveState();return handle end if end for;return 0
end function
function resetAvoidReach(pools,handle)
  value=moveState(pools,handle);if value==void then return 0 end if
  value.avoidReach=zeros(MAX_AVOIDREACH);value.avoidReachTimes=floatZeros(MAX_AVOIDREACH);value.avoidReachTries=zeros(MAX_AVOIDREACH);return 0
end function
function resetLastAvoidReach(pools,handle)
  value=moveState(pools,handle);if value==void then return 0 end if
  latest=0;latestTime=0.0
  for i=0 to MAX_AVOIDREACH-1 if value.avoidReachTimes[i]>latestTime then latestTime=value.avoidReachTimes[i];latest=i end if end for
  if latestTime!=0.0 then value.avoidReachTimes[latest]=0.0;if value.avoidReachTries[latest]>0 then value.avoidReachTries[latest]=value.avoidReachTries[latest]-1 end if end if;return 0
end function
function resetMoveState(pools,handle) if moveState(pools,handle)==void then return 0 end if;pools.moveStates[handle]=emptyMoveState();return 0 end function
function freeMoveState(pools,handle) if moveState(pools,handle)==void then return 0 end if;pools.moveStates[handle]=void;return 0 end function

function allocWeaponState(pools)
  if pools==void then return 0 end if
  for handle=1 to MAX_CLIENTS if pools.weaponStates[handle]==void then pools.weaponStates[handle]=emptyWeaponState();return handle end if end for;return 0
end function
// The released BotResetWeaponState has its memset commented out and restores
// both existing pointers, so it intentionally leaves the complete state intact.
function resetWeaponState(pools,handle) if weaponState(pools,handle)==void then return 0 end if;return 0 end function
function freeWeaponState(pools,handle)
  value=weaponState(pools,handle);if value==void then return 0 end if
  value.weaponWeightConfig=void;value.weaponWeightIndex=void;pools.weaponStates[handle]=void;return 0
end function

function shutdown(pools)
  if pools==void then return 0 end if
  for handle=1 to MAX_CLIENTS
    if pools.chatStates[handle]!=void then freeChatState(pools,handle) end if
    if pools.goalStates[handle]!=void then freeGoalState(pools,handle) end if
    if pools.moveStates[handle]!=void then freeMoveState(pools,handle) end if
    if pools.weaponStates[handle]!=void then freeWeaponState(pools,handle) end if
  end for;return 0
end function
