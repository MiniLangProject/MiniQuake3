// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Fixed handle pools and reset semantics from be_ai_chat/goal/move/weap.c.
package mq3.botlib.ai_resource_pools

import mq3.botlib.public_headers as publicHeaders
/// Maximum number of client slots supported by these interfaces.
const MAX_CLIENTS=64
/// Maximum number of goals stored on one bot goal stack.
const MAX_GOALSTACK=publicHeaders.MAX_GOALSTACK
/// Maximum number of temporarily avoided goal identifiers retained per bot.
const MAX_AVOIDGOALS=publicHeaders.MAX_AVOIDGOALS
/// Maximum number of temporarily avoided reachabilities retained per bot.
const MAX_AVOIDREACH=publicHeaders.MAX_AVOIDREACH
/// Maximum number of spatial avoidance spots retained per bot.
const MAX_AVOIDSPOTS=publicHeaders.MAX_AVOIDSPOTS

/// Bot-library syscall identifier for alloc chat state.
const OP_ALLOC_CHAT_STATE=507
/// Bot-library syscall identifier for free chat state.
const OP_FREE_CHAT_STATE=508
/// Bot-library syscall identifier for reset goal state.
const OP_RESET_GOAL_STATE=525
/// Bot-library syscall identifier for alloc goal state.
const OP_ALLOC_GOAL_STATE=546
/// Bot-library syscall identifier for free goal state.
const OP_FREE_GOAL_STATE=547
/// Bot-library syscall identifier for reset move state.
const OP_RESET_MOVE_STATE=548
/// Bot-library syscall identifier for reset avoid reach.
const OP_RESET_AVOID_REACH=551
/// Bot-library syscall identifier for reset last avoid reach.
const OP_RESET_LAST_AVOID_REACH=552
/// Bot-library syscall identifier for alloc move state.
const OP_ALLOC_MOVE_STATE=555
/// Bot-library syscall identifier for free move state.
const OP_FREE_MOVE_STATE=556
/// Bot-library syscall identifier for alloc weapon state.
const OP_ALLOC_WEAPON_STATE=561
/// Bot-library syscall identifier for free weapon state.
const OP_FREE_WEAPON_STATE=562
/// Bot-library syscall identifier for reset weapon state.
const OP_RESET_WEAPON_STATE=563

/// Test `op==OP_ALLOC_CHAT_STATE or op==OP_FREE_CHAT_STATE or op==OP_RESET_GOAL_STATE or op==OP_ALLOC_GOAL_STATE or op==OP_FREE_GOAL_STATE or op==OP_RESET_M...` as the condition for `supportsTrap`.
/// @param op Numeric syscall operation identifier.
function supportsTrap(op)
  return op==OP_ALLOC_CHAT_STATE or op==OP_FREE_CHAT_STATE or op==OP_RESET_GOAL_STATE or op==OP_ALLOC_GOAL_STATE or op==OP_FREE_GOAL_STATE or op==OP_RESET_MOVE_STATE or op==OP_RESET_AVOID_REACH or op==OP_RESET_LAST_AVOID_REACH or op==OP_ALLOC_MOVE_STATE or op==OP_FREE_MOVE_STATE or op==OP_ALLOC_WEAPON_STATE or op==OP_FREE_WEAPON_STATE or op==OP_RESET_WEAPON_STATE
end function

/// `ChatState` record for ai resource pools, containing `gender`, `client`, `name`, `chatMessage` and `handle` and related fields.
struct ChatState
  /// Gender identifier used by player sounds or bot chat selection.
  gender
  /// Server client number associated with the bot chat state.
  client
  /// Name of the bot.
  name
  /// Chat message string.
  chatMessage
  /// Managed handle identifying this allocated chat state.
  handle
  /// Queued console-message slots owned by this bot chat state.
  consoleMessages
  /// Number of queued console messages owned by this bot chat state.
  numConsoleMessages
  /// Loaded initial-chat profile selected for this bot.
  chat
end struct
/// `Goal` record for ai resource pools, containing `origin`, `areaNum`, `mins`, `maxs` and `entityNum` and related fields.
struct Goal
  /// World-space target position of this stored bot goal.
  origin
  /// Navigation area containing the position of this bot goal.
  areaNum
  /// Minimum XYZ corner of the bot goal volume relative to the goal position.
  mins
  /// Maximum XYZ corner of the bot goal volume relative to the goal position.
  maxs
  /// Number of the game entity associated with this result.
  entityNum
  /// Goal identifier associated with the level item or named destination.
  number
  /// Combined goal-property flags, including item, dropped, and roam markers.
  flags
  /// Item-configuration index associated with this bot goal.
  itemInfo
end struct
/// `GoalState` record for ai resource pools, containing `itemWeightConfig`, `itemWeightIndex`, `client`, `lastReachabilityArea` and `goalStack` and related fields.
struct GoalState
  /// Fuzzy-weight configuration used to score item goals.
  itemWeightConfig
  /// Index from item to weight.
  itemWeightIndex
  /// Client using this goal state.
  client
  /// Last area with reachabilities the bot was in.
  lastReachabilityArea
  /// Stack of active and suspended goals for this bot.
  goalStack
  /// The top of the goal stack.
  goalStackTop
  /// Goals to avoid.
  avoidGoals
  /// Times to avoid the goals.
  avoidGoalTimes
end struct
/// `AvoidSpot` record for ai resource pools, containing `origin`, `radius` and `type`.
struct AvoidSpot
  /// World-space center of the spatial region the bot should avoid.
  origin
  /// Radius of the represented sphere or capsule.
  radius
  /// Avoidance policy deciding whether this spot blocks or only influences movement.
  type
end struct
/// `MoveState` record for ai resource pools, containing `origin`, `velocity`, `viewOffset`, `entityNum` and `client` and related fields.
struct MoveState
  /// Current bot position used by navigation and movement decisions.
  origin
  /// World-space linear velocity associated with the moving entity.
  velocity
  /// Offset from the entity origin to the viewing position.
  viewOffset
  /// Number of the game entity associated with this result.
  entityNum
  /// Client number of the bot.
  client
  /// Time the bot thinks.
  thinkTime
  /// Presence-type mask describing the bot hull or stance allowed here.
  presenceType
  /// Pitch, yaw, and roll angles describing the current view direction.
  viewAngles
  /// Navigation area currently occupied by the moving bot.
  areaNum
  /// Last area the bot was in.
  lastAreaNum
  /// Last goal area number.
  lastGoalAreaNum
  /// Last reachability number.
  lastReachNum
  /// Origin previous cycle.
  lastOrigin
  /// Area number of the reachabilty.
  reachAreaNum
  /// Bit mask describing the bot's current movement state.
  moveFlags
  /// Set when jumped.
  jumpReach
  /// Last time the grapple was visible.
  grappleVisibleTime
  /// Last distance to the grapple end.
  lastGrappleDist
  /// Time to use current reachability.
  reachabilityTime
  /// Reachabilities to avoid.
  avoidReach
  /// Times to avoid the reachabilities.
  avoidReachTimes
  /// Number of tries before avoiding.
  avoidReachTries
  /// Spots to avoid.
  avoidSpots
  /// Number of avoid spots represented by this record.
  numAvoidSpots
end struct
/// `WeaponState` record for ai resource pools, containing `weaponWeightConfig` and `weaponWeightIndex`.
struct WeaponState
  /// Loaded fuzzy-weight configuration used to score weapon choices.
  weaponWeightConfig
  /// Mapping from weapon identifiers to fuzzy-weight configuration entries.
  weaponWeightIndex
end struct
/// `Pools` record for ai resource pools, containing `chatStates`, `goalStates`, `moveStates` and `weaponStates`.
struct Pools
  /// Allocated per-bot chat-state slots.
  chatStates
  /// Allocated per-bot goal-stack and avoidance-state slots.
  goalStates
  /// Allocated per-bot movement-state slots.
  moveStates
  /// Allocated per-bot weapon-selection-state slots.
  weaponStates
end struct

/// Allocate an integer array of the requested length initialized to zero.
/// @param count Number of entries or bytes processed by this call.
function zeros(count) values=array(count,0);return values end function
/// Allocate a floating-point array of the requested length initialized to zero.
/// @param count Number of entries or bytes processed by this call.
function floatZeros(count) values=array(count,0.0);return values end function
/// Return a new array `[0.0,0.0,0.0]` for `vec3`.
function vec3() return [0.0,0.0,0.0] end function
/// Create a `mq3.botlib.ai_resource_pools.Goal` record, initializing `origin` as `vec3()`, `mins` as `vec3()` and `maxs` as `vec3()`.
function emptyGoal() return Goal(vec3(),0,vec3(),vec3(),0,0,0,0) end function
/// Apply `mq3.botlib.ai_resource_pools.emptyGoal` while evaluating `emptyGoalStack`. Return paths include `values`.
function emptyGoalStack() values=array(MAX_GOALSTACK,void);for i=0 to MAX_GOALSTACK-1 values[i]=emptyGoal() end for;return values end function
/// Apply `mq3.botlib.ai_resource_pools.vec3` while evaluating `emptyAvoidSpots`. Return paths include `values`.
function emptyAvoidSpots() values=array(MAX_AVOIDSPOTS,void);for i=0 to MAX_AVOIDSPOTS-1 values[i]=AvoidSpot(vec3(),0.0,0) end for;return values end function
/// Create a `mq3.botlib.ai_resource_pools.ChatState` record with the declared empty defaults.
function emptyChatState() return ChatState(0,0,"","",0,[],0,void) end function
/// Create a `mq3.botlib.ai_resource_pools.GoalState` record, initializing `client` from `client`, `goalStack` as `emptyGoalStack()` and `avoidGoals` as `zeros(MAX_AVOIDGOALS)`.
/// @param client Initial value stored in `mq3.botlib.ai_resource_pools.GoalState.client`.
function emptyGoalState(client) return GoalState(void,void,client,0,emptyGoalStack(),0,zeros(MAX_AVOIDGOALS),floatZeros(MAX_AVOIDGOALS)) end function
/// Create a `mq3.botlib.ai_resource_pools.MoveState` record, initializing `origin` as `vec3()`, `velocity` as `vec3()` and `viewOffset` as `vec3()`.
function emptyMoveState() return MoveState(vec3(),vec3(),vec3(),0,0,0.0,0,vec3(),0,0,0,0,vec3(),0,0,0,0.0,0.0,0.0,zeros(MAX_AVOIDREACH),floatZeros(MAX_AVOIDREACH),zeros(MAX_AVOIDREACH),emptyAvoidSpots(),0) end function
/// Create a `mq3.botlib.ai_resource_pools.WeaponState` record with the declared empty defaults.
function emptyWeaponState() return WeaponState(void,void) end function

/// Create a `mq3.botlib.ai_resource_pools.Pools` record, initializing `chatStates` as `array(MAX_CLIENTS+1,void)`, `goalStates` as `array(MAX_CLIENTS+1,void)` and `moveStates` as `array(MAX_CLIENTS+1,void)`.
function create() return Pools(array(MAX_CLIENTS+1,void),array(MAX_CLIENTS+1,void),array(MAX_CLIENTS+1,void),array(MAX_CLIENTS+1,void)) end function
/// Test `handle>0 and handle<=MAX_CLIENTS` as the condition for `validHandle`.
/// @param handle Resource handle resolved by the owning pool or host service.
function validHandle(handle) return handle>0 and handle<=MAX_CLIENTS end function
/// Apply `mq3.botlib.ai_resource_pools.validHandle` while evaluating `chatState`. Return paths include `pools.chatStates[handle]`.
/// @param pools Bot resource pools; accesses `chatStates`.
/// @param handle Handle identifying the allocated bot chat state.
function chatState(pools,handle) if pools==void or not validHandle(handle) then return void end if;return pools.chatStates[handle] end function
/// Apply `mq3.botlib.ai_resource_pools.validHandle` while evaluating `goalState`. Return paths include `pools.goalStates[handle]`.
/// @param pools Bot resource pools; accesses `goalStates`.
/// @param handle Handle identifying the allocated bot goal state.
function goalState(pools,handle) if pools==void or not validHandle(handle) then return void end if;return pools.goalStates[handle] end function
/// Apply `mq3.botlib.ai_resource_pools.validHandle` while evaluating `moveState`. Return paths include `pools.moveStates[handle]`.
/// @param pools Bot resource pools; accesses `moveStates`.
/// @param handle Handle identifying the allocated bot movement state.
function moveState(pools,handle) if pools==void or not validHandle(handle) then return void end if;return pools.moveStates[handle] end function
/// Apply `mq3.botlib.ai_resource_pools.validHandle` while evaluating `weaponState`. Return paths include `pools.weaponStates[handle]`.
/// @param pools Bot resource pools; accesses `weaponStates`.
/// @param handle Handle identifying the allocated bot weapon state.
function weaponState(pools,handle) if pools==void or not validHandle(handle) then return void end if;return pools.weaponStates[handle] end function

/// Set `pools.chatStates[handle]` to `emptyChatState()` in `mq3.botlib.ai_resource_pools.allocChatState`.
/// @param pools Bot resource pools; accesses `chatStates`. May update `pools.chatStates[handle]` in place.
function allocChatState(pools)
  if pools==void then return 0 end if
  for handle=1 to MAX_CLIENTS if pools.chatStates[handle]==void then pools.chatStates[handle]=emptyChatState();return handle end if end for;return 0
end function
/// Set `pools.chatStates[handle]` to `void` in `mq3.botlib.ai_resource_pools.freeChatState`.
/// @param pools Bot resource pools; accesses `chatStates`. May update `pools.chatStates[handle]` in place.
/// @param handle Handle identifying the allocated bot chat state.
function freeChatState(pools,handle)
  value=chatState(pools,handle);if value==void then return 0 end if
  // Console-message nodes and chat data are owned by the later chat subsystem.
  value.consoleMessages=[];value.numConsoleMessages=0;value.chat=void;pools.chatStates[handle]=void;return 0
end function

/// Set `pools.goalStates[handle]` to `emptyGoalState(client)` in `mq3.botlib.ai_resource_pools.allocGoalState`.
/// @param pools Bot resource pools; accesses `goalStates`. May update `pools.goalStates[handle]` in place.
/// @param client Initial value stored in `mq3.botlib.ai_resource_pools.GoalState.client`.
function allocGoalState(pools,client)
  if pools==void then return 0 end if
  for handle=1 to MAX_CLIENTS if pools.goalStates[handle]==void then pools.goalStates[handle]=emptyGoalState(client);return handle end if end for;return 0
end function
/// Set `value.avoidGoals` to `zeros(MAX_AVOIDGOALS)` and `value.avoidGoalTimes` to `floatZeros(MAX_AVOIDGOALS)` in `mq3.botlib.ai_resource_pools.resetAvoidGoalsState`.
/// @param value Value record; accesses `avoidGoals` and `avoidGoalTimes`. May update `value.avoidGoals` and `value.avoidGoalTimes` in place.
function resetAvoidGoalsState(value)
  if value==void then return 0 end if
  value.avoidGoals=zeros(MAX_AVOIDGOALS);value.avoidGoalTimes=floatZeros(MAX_AVOIDGOALS);return 0
end function
/// Apply `mq3.botlib.ai_resource_pools.goalState`, `mq3.botlib.ai_resource_pools.emptyGoalStack` and `mq3.botlib.ai_resource_pools.resetAvoidGoalsState` while evaluating `resetGoalState`. Return paths include `resetAvoidGoalsState(value)`.
/// @param pools Bot resource pools; accesses `goalStates`.
/// @param handle Handle identifying the allocated bot goal state.
function resetGoalState(pools,handle)
  value=goalState(pools,handle);if value==void then return 0 end if
  // be_ai_goal.c deliberately preserves weights, client and last reachability area.
  value.goalStack=emptyGoalStack();value.goalStackTop=0;return resetAvoidGoalsState(value)
end function
/// Set `pools.goalStates[handle]` to `void` in `mq3.botlib.ai_resource_pools.freeGoalState`.
/// @param pools Bot resource pools; accesses `goalStates`. May update `pools.goalStates[handle]` in place.
/// @param handle Handle identifying the allocated bot goal state.
function freeGoalState(pools,handle)
  value=goalState(pools,handle);if value==void then return 0 end if
  value.itemWeightConfig=void;value.itemWeightIndex=void;pools.goalStates[handle]=void;return 0
end function

/// Set `pools.moveStates[handle]` to `emptyMoveState()` in `mq3.botlib.ai_resource_pools.allocMoveState`.
/// @param pools Bot resource pools; accesses `moveStates`. May update `pools.moveStates[handle]` in place.
function allocMoveState(pools)
  if pools==void then return 0 end if
  for handle=1 to MAX_CLIENTS if pools.moveStates[handle]==void then pools.moveStates[handle]=emptyMoveState();return handle end if end for;return 0
end function
/// Apply `mq3.botlib.ai_resource_pools.moveState`, `mq3.botlib.ai_resource_pools.zeros` and `mq3.botlib.ai_resource_pools.floatZeros` while evaluating `resetAvoidReach`.
/// @param pools Bot resource pools; accesses `moveStates`.
/// @param handle Handle identifying the allocated bot movement state.
function resetAvoidReach(pools,handle)
  value=moveState(pools,handle);if value==void then return 0 end if
  value.avoidReach=zeros(MAX_AVOIDREACH);value.avoidReachTimes=floatZeros(MAX_AVOIDREACH);value.avoidReachTries=zeros(MAX_AVOIDREACH);return 0
end function
/// Apply `mq3.botlib.ai_resource_pools.moveState` while evaluating `resetLastAvoidReach`.
/// @param pools Bot resource pools; accesses `moveStates`.
/// @param handle Handle identifying the allocated bot movement state.
function resetLastAvoidReach(pools,handle)
  value=moveState(pools,handle);if value==void then return 0 end if
  latest=0;latestTime=0.0
  for i=0 to MAX_AVOIDREACH-1 if value.avoidReachTimes[i]>latestTime then latestTime=value.avoidReachTimes[i];latest=i end if end for
  if latestTime!=0.0 then value.avoidReachTimes[latest]=0.0;if value.avoidReachTries[latest]>0 then value.avoidReachTries[latest]=value.avoidReachTries[latest]-1 end if end if;return 0
end function
/// Set `pools.moveStates[handle]` to `emptyMoveState()` in `mq3.botlib.ai_resource_pools.resetMoveState`.
/// @param pools Bot resource pools; accesses `moveStates`. May update `pools.moveStates[handle]` in place.
/// @param handle Handle identifying the allocated bot movement state.
function resetMoveState(pools,handle) if moveState(pools,handle)==void then return 0 end if;pools.moveStates[handle]=emptyMoveState();return 0 end function
/// Set `pools.moveStates[handle]` to `void` in `mq3.botlib.ai_resource_pools.freeMoveState`.
/// @param pools Bot resource pools; accesses `moveStates`. May update `pools.moveStates[handle]` in place.
/// @param handle Handle identifying the allocated bot movement state.
function freeMoveState(pools,handle) if moveState(pools,handle)==void then return 0 end if;pools.moveStates[handle]=void;return 0 end function

/// Set `pools.weaponStates[handle]` to `emptyWeaponState()` in `mq3.botlib.ai_resource_pools.allocWeaponState`.
/// @param pools Bot resource pools; accesses `weaponStates`. May update `pools.weaponStates[handle]` in place.
function allocWeaponState(pools)
  if pools==void then return 0 end if
  for handle=1 to MAX_CLIENTS if pools.weaponStates[handle]==void then pools.weaponStates[handle]=emptyWeaponState();return handle end if end for;return 0
end function
// The released BotResetWeaponState has its memset commented out and restores
// both existing pointers, so it intentionally leaves the complete state intact.
/// @param pools Bot resource pools; accesses `weaponStates`.
/// @param handle Handle identifying the allocated bot weapon state.
function resetWeaponState(pools,handle) if weaponState(pools,handle)==void then return 0 end if;return 0 end function
/// Set `pools.weaponStates[handle]` to `void` in `mq3.botlib.ai_resource_pools.freeWeaponState`.
/// @param pools Bot resource pools; accesses `weaponStates`. May update `pools.weaponStates[handle]` in place.
/// @param handle Handle identifying the allocated bot weapon state.
function freeWeaponState(pools,handle)
  value=weaponState(pools,handle);if value==void then return 0 end if
  value.weaponWeightConfig=void;value.weaponWeightIndex=void;pools.weaponStates[handle]=void;return 0
end function

/// Apply `mq3.botlib.ai_resource_pools.freeChatState`, `mq3.botlib.ai_resource_pools.freeGoalState` and `mq3.botlib.ai_resource_pools.freeMoveState` while evaluating `shutdown`.
/// @param pools Bot resource pools; accesses `chatStates`, `goalStates`, `moveStates` and `weaponStates`.
function shutdown(pools)
  if pools==void then return 0 end if
  for handle=1 to MAX_CLIENTS
    if pools.chatStates[handle]!=void then freeChatState(pools,handle) end if
    if pools.goalStates[handle]!=void then freeGoalState(pools,handle) end if
    if pools.moveStates[handle]!=void then freeMoveState(pools,handle) end if
    if pools.weaponStates[handle]!=void then freeWeaponState(pools,handle) end if
  end for;return 0
end function
