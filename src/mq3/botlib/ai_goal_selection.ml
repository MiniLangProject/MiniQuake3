// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Item-goal selection and fuzzy interbreeding from code/botlib/be_ai_goal.c/be_ai_weight.c.
package mq3.botlib.ai_goal_selection

import mq3.botlib.ai_goal_state as goalRuntime
import mq3.botlib.ai_resource_pools as goalResources
import mq3.botlib.ai_level_items as levelItems
import mq3.botlib.ai_item_weights as itemWeights
import mq3.botlib.aas_runtime as aasRuntime
import mq3.botlib.aas_routing_cache as routes
import mq3.botlib.aas_entities as aasEntities
import mq3.botlib.ai_genetic as genetic
import mq3.compat.numeric as goalSelectNumeric

/// Bot-library syscall identifier for choose long-term goal item.
const OP_CHOOSE_LTG_ITEM=535
/// Bot-library syscall identifier for choose nearby goal item.
const OP_CHOOSE_NBG_ITEM=536
/// Bot-library syscall identifier for item goal in vis but not visible.
const OP_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE=538
/// Bot-library syscall identifier for get level item goal.
const OP_GET_LEVEL_ITEM_GOAL=539
/// Bot-library syscall identifier for save goal fuzzy logic.
const OP_SAVE_GOAL_FUZZY_LOGIC=545
/// Bot-library syscall identifier for genetic parents and child selection.
const OP_GENETIC_PARENTS_AND_CHILD_SELECTION=564
// Baseq3 g_public.h assigns INTERBREED to 565 and MUTATE to 566.
const OP_INTERBREED_GOAL_FUZZY_LOGIC=565
/// Bot-library syscall identifier for mutate goal fuzzy logic.
const OP_MUTATE_GOAL_FUZZY_LOGIC=566
/// Bot goal-property flag marking item.
const GFL_ITEM=1
/// Bot goal-property flag marking roam.
const GFL_ROAM=2
/// Bot goal-property flag marking dropped.
const GFL_DROPPED=4
/// An eye is never valid in a solid.
const CONTENTS_SOLID=1
/// Minimum interval retained for a goal-avoidance request.
const AVOID_MINIMUM_TIME=10.0
/// Default interval for temporarily avoiding a selected goal.
const AVOID_DEFAULT_TIME=30.0
/// Avoidance interval applied to a recently considered dropped-item goal.
const AVOID_DROPPED_TIME=10.0
/// Factor converting AAS travel costs into the scale used by item-goal scoring.
const TRAVELTIME_SCALE=0.01
/// Default desirability bonus added when scoring a dropped item.
const DEFAULT_DROPPED_WEIGHT=1000.0

/// `Services` record for ai goal selection, containing `context`, `reachabilityAreaFn`, `areaReachabilityFn`, `travelTimeFn` and `traceFn` and related fields.
struct Services
  /// Caller-supplied data associated with navigation, collision, and entity queries used to score item
  /// goals.
  context
  /// Host callback that finds an AAS area suitable for the current movement request.
  reachabilityAreaFn
  /// Host callback that reports whether an AAS area has usable outgoing reachabilities.
  areaReachabilityFn
  /// Host callback that returns travel cost for a candidate movement link.
  travelTimeFn
  /// Host callback that performs a collision sweep through the host world.
  traceFn
  /// Host callback that retrieves navigation-relevant information about an entity.
  entityInfoFn
  /// Host callback that retrieves information about a map item.
  itemQueryFn
end struct
/// `Runtime` record for ai goal selection, containing `levelItems`, `goals`, `services`, `droppedWeight` and `randomSeed`.
struct Runtime
  /// Current item goals discovered from the map and its dynamic entities.
  levelItems
  /// Goal-state runtime supplying active stacks and avoidance policy.
  goals
  /// Route-cost, collision, and entity queries used when comparing item goals.
  services
  /// Additional scoring factor applied to dropped-item goals.
  droppedWeight
  /// Seed retained for repeatable bot-goal selection randomness.
  randomSeed
end struct
/// `ItemScore` record for ai goal selection, containing `weight` and `time`.
struct ItemScore
  /// Final item desirability after inventory weighting and route-cost scaling.
  weight
  /// Route travel cost used when scoring this candidate item goal.
  time
end struct

/// Create a `mq3.botlib.ai_goal_selection.Services` record, initializing `context` from `context`.
/// @param context Context forwarded to the configured host callbacks.
function services(context) return Services(context,void,void,void,void,void,void) end function
/// Create a `mq3.botlib.ai_goal_selection.Runtime` record, initializing `levelItems` from `items`, `goals` from `goals` and `services` from `host`.
/// @param items Initial value stored in `mq3.botlib.ai_goal_selection.Runtime.levelItems`.
/// @param goals Initial value stored in `mq3.botlib.ai_goal_selection.Runtime.goals`.
/// @param host Initial value stored in `mq3.botlib.ai_goal_selection.Runtime.services`.
function create(items,goals,host) return Runtime(items,goals,host,DEFAULT_DROPPED_WEIGHT,1) end function
/// Set `runtime.droppedWeight` to `goalSelectNumeric.f32(value)` in `mq3.botlib.ai_goal_selection.setDroppedWeight`.
/// @param runtime AI goal selection runtime; accesses `droppedWeight`. May update `runtime.droppedWeight` in place.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.f32`.
function setDroppedWeight(runtime,value) if runtime!=void then runtime.droppedWeight=goalSelectNumeric.f32(value) end if;return value end function
/// Set `runtime.randomSeed` to `goalSelectNumeric.i32(value)` in `mq3.botlib.ai_goal_selection.setRandomSeed`.
/// @param runtime AI goal selection runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place.
/// @param value Value passed as argument 1 to `mq3.compat.numeric.i32`.
function setRandomSeed(runtime,value) if runtime!=void then runtime.randomSeed=goalSelectNumeric.i32(value) end if;return value end function
/// Advance the Windows-compatible 214013/2531011 random sequence and return a value between zero and one.
/// @param runtime AI goal selection runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place.
function randomFloat(runtime)
  // Baseq3's native botlib uses the process rand(), whose Windows sequence is
  // the same 214013/2531011 LCG used by the original Windows executable.
  runtime.randomSeed=goalSelectNumeric.add32(goalSelectNumeric.mul32(runtime.randomSeed,214013),2531011)
  return goalSelectNumeric.fdiv((goalSelectNumeric.u32(runtime.randomSeed)>>16)&32767,32767.0)
end function
/// Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for ai goal selection.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function copyVector(value) return [value[0],value[1],value[2]] end function
/// Construct error `7594` with diagnostic text `"AI goal selection: "+message`.
/// @param message Message text supplied to the diagnostic or chat operation.
function fail(message) return error(7594,"AI goal selection: "+message) end function

/// Use `runtime.services.reachabilityAreaFn` to perform `reachabilityArea`. Return paths include `aasRuntime.pointAreaNum(runtime.levelItems.aas,origin)`.
/// @param runtime AI goal selection runtime; accesses `services` and `levelItems`.
/// @param origin World-space position as three coordinates.
/// @param client Value passed as argument 3 to `runtime.services.reachabilityAreaFn`.
function reachabilityArea(runtime,origin,client)
  if runtime.services!=void and runtime.services.reachabilityAreaFn!=void then return runtime.services.reachabilityAreaFn(runtime.services.context,origin,client) end if
  if runtime.levelItems==void or runtime.levelItems.aas==void then return 0 end if;return aasRuntime.pointAreaNum(runtime.levelItems.aas,origin)
end function
/// Use `runtime.services.areaReachabilityFn` to perform `areaReachability`. Return paths include `aasRuntime.areaReachability(runtime.levelItems.aas,area)`.
/// @param runtime AI goal selection runtime; accesses `services` and `levelItems`.
/// @param area AAS area number; zero denotes no area.
function areaReachability(runtime,area)
  if runtime.services!=void and runtime.services.areaReachabilityFn!=void then return runtime.services.areaReachabilityFn(runtime.services.context,area) end if
  if runtime.levelItems==void or runtime.levelItems.aas==void then return 0 end if;return aasRuntime.areaReachability(runtime.levelItems.aas,area)
end function
/// Use `runtime.services.travelTimeFn` to perform `travelTime`. Return paths include `runtime.services.travelTimeFn(runtime.services.context,area,origin,goalArea,travelFlags)`.
/// @param runtime AI goal selection runtime; accesses `services`.
/// @param area Value passed as argument 2 to `runtime.services.travelTimeFn`.
/// @param origin World-space position as three coordinates.
/// @param goalArea Destination AAS area number.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function travelTime(runtime,area,origin,goalArea,travelFlags)
  if runtime.services==void or runtime.services.travelTimeFn==void then return 0 end if
  return runtime.services.travelTimeFn(runtime.services.context,area,origin,goalArea,travelFlags)
end function
/// Use `runtime.services.entityInfoFn` to perform `entityInfo`. Return paths include `aasEntities.info(runtime.levelItems.aasEntities,number)`.
/// @param runtime AI goal selection runtime; accesses `services` and `levelItems`.
/// @param number Value used by `info` in `if state==void or number<0 or number>=state.maxEntities then return emptyInfo() end if`.
function entityInfo(runtime,number)
  if runtime.services!=void and runtime.services.entityInfoFn!=void then return runtime.services.entityInfoFn(runtime.services.context,number) end if
  if runtime.levelItems==void then return void end if;return aasEntities.info(runtime.levelItems.aasEntities,number)
end function
/// Use `runtime.services.traceFn` to perform `trace`. Return paths include `runtime.services.traceFn(runtime.services.context,start,finish,viewer,CONTENTS_SOLID)`.
/// @param runtime AI goal selection runtime; accesses `services`.
/// @param start Value passed as argument 2 to `runtime.services.traceFn`.
/// @param finish Value passed as argument 3 to `runtime.services.traceFn`.
/// @param viewer Entity number ignored by the visibility trace.
function trace(runtime,start,finish,viewer)
  if runtime.services==void or runtime.services.traceFn==void then return fail("trace service missing") end if
  return runtime.services.traceFn(runtime.services.context,start,finish,viewer,CONTENTS_SOLID)
end function
/// Forward `currentTime` to `mq3.botlib.ai_goal_state.currentTime` and return the delegated result.
/// @param runtime AI goal selection runtime; accesses `goals`.
function currentTime(runtime) return goalRuntime.currentTime(runtime.goals) end function
/// Apply `mq3.botlib.ai_item_weights.ensureItems` while evaluating `itemConfig`. Return paths include `itemWeights.ensureItems(runtime.levelItems.itemRuntime)`.
/// @param runtime AI goal selection runtime; accesses `levelItems`.
function itemConfig(runtime)
  if runtime==void or runtime.levelItems==void or runtime.levelItems.itemRuntime==void then return void end if
  return itemWeights.ensureItems(runtime.levelItems.itemRuntime)
end function
/// Apply `mq3.botlib.ai_level_items.permitted` while evaluating `permitted`. Return paths include `(item.flags&levelItems.IFL_NOTBOT)==0`.
/// @param runtime AI goal selection runtime; accesses `levelItems`.
/// @param item Item record; accesses `flags`.
function permitted(runtime,item)
  if not levelItems.permitted(runtime.levelItems,item) then return false end if;return (item.flags&levelItems.IFL_NOTBOT)==0
end function
/// Create an item goal with copied bounds and origin, including dropped-item and roaming flags.
/// @param info Item or entity information record; accesses `mins` and `maxs`.
/// @param item Item record; accesses `timeout`, `flags`, `goalOrigin`, `goalAreaNum` and `entityNum` and related fields.
function makeItemGoal(info,item)
  flags=GFL_ITEM;if item.timeout!=0.0 then flags=flags|GFL_DROPPED end if;if (item.flags&levelItems.IFL_ROAM)!=0 then flags=flags|GFL_ROAM end if
  return goalResources.Goal(copyVector(item.goalOrigin),item.goalAreaNum,copyVector(info.mins),copyVector(info.maxs),item.entityNum,item.number,flags,item.itemInfo)
end function
/// Choose the item avoidance duration from dropped-item status and respawn time, enforcing the minimum duration.
/// @param info Item or entity information record; accesses `respawnTime`.
/// @param item Item record; accesses `timeout`.
function avoidTime(info,item)
  if item.timeout!=0.0 then return AVOID_DROPPED_TIME end if;value=info.respawnTime;if value==0.0 then value=AVOID_DEFAULT_TIME end if;if value<AVOID_MINIMUM_TIME then value=AVOID_MINIMUM_TIME end if;return value
end function
/// Set `value.lastReachabilityArea` to `area` in `mq3.botlib.ai_goal_selection.originArea`. Return paths include `area`.
/// @param runtime AI goal selection runtime; accesses `services` and `levelItems`.
/// @param value Value record; accesses `client` and `lastReachabilityArea`. May update `value.lastReachabilityArea` in place.
/// @param origin World-space position as three coordinates.
function originArea(runtime,value,origin)
  area=reachabilityArea(runtime,origin,value.client);if area==0 or areaReachability(runtime,area)==0 then area=value.lastReachabilityArea end if;value.lastReachabilityArea=area;return area
end function
/// Use `runtime.services.itemQueryFn` to perform `startItemQuery`. Return paths include `runtime.services.itemQueryFn(runtime.services.context,area,origin,travelFlags)`.
/// @param runtime AI goal selection runtime; accesses `services`.
/// @param area Value passed as argument 2 to `runtime.services.itemQueryFn`.
/// @param origin World-space position as three coordinates.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function startItemQuery(runtime,area,origin,travelFlags)
  if runtime.services==void or runtime.services.itemQueryFn==void then return void end if
  return runtime.services.itemQueryFn(runtime.services.context,area,origin,travelFlags)
end function
/// Apply `mq3.botlib.aas_routing_cache.itemQueryTravelTime` and `mq3.botlib.ai_goal_selection.travelTime` while evaluating `itemTime`. Return paths include `travelTime(runtime,area,origin,goal,travelFlags)`.
/// @param runtime AI goal selection runtime; accesses `services`.
/// @param query Query record; accesses `cache`, `area`, `origin`, `flags` and `times` and related fields. May update `query.times` and `query.enterTimes` in place.
/// @param area Value passed as argument 2 to `runtime.services.travelTimeFn`.
/// @param origin World-space position as three coordinates.
/// @param goal Destination AAS area number.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function itemTime(runtime,query,area,origin,goal,travelFlags)
  if query!=void then return routes.itemQueryTravelTime(query,goal) end if
  return travelTime(runtime,area,origin,goal,travelFlags)
end function

/// Score one available item by fuzzy desirability and travel time, including dropped-item bonuses and avoidance timers.
/// @param runtime AI goal selection runtime; accesses `droppedWeight` and `goals`.
/// @param handle Resource handle resolved by the owning pool or host service.
/// @param value Value record; accesses `itemWeightIndex` and `itemWeightConfig`.
/// @param config Array or byte sequence accessed at `item.itemInfo`.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param item Item record; accesses `goalAreaNum`, `entityNum`, `flags`, `itemInfo` and `timeout` and related fields.
/// @param area Value passed as argument 2 to `runtime.services.travelTimeFn`.
/// @param origin World-space position as three coordinates.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
/// @param itemQuery Query record; accesses `cache`, `area`, `origin`, `flags` and `times` and related fields. May update `itemQuery.times` and `itemQuery.enterTimes` in place.
/// @param fuzzyCache Array or byte sequence accessed at `weightNumber`. Entries are written in place.
/// @param score Score record; accesses `weight` and `time`. May update `score.weight` and `score.time` in place.
function weighted(runtime,handle,value,config,inventory,item,area,origin,travelFlags,itemQuery,fuzzyCache,score)
  score.weight=0.0;score.time=0
  if not permitted(runtime,item) or item.goalAreaNum==0 or (item.entityNum==0 and (item.flags&levelItems.IFL_ROAM)==0) then return void end if
  info=config[item.itemInfo];if info.number<0 or info.number>=len(value.itemWeightIndex) then return void end if;weightNumber=value.itemWeightIndex[info.number];if weightNumber<0 then return void end if
  // A map has many instances of the same item class. The inventory and fuzzy
  // config stay fixed throughout one selection, so evaluate each weight once.
  weight=void;if weightNumber<len(fuzzyCache) then weight=fuzzyCache[weightNumber] end if
  if weight==void then weight=itemWeights.fuzzyWeight(inventory,value.itemWeightConfig,weightNumber);if weightNumber<len(fuzzyCache) then fuzzyCache[weightNumber]=weight end if end if
  if item.timeout!=0.0 then weight=goalSelectNumeric.fadd(weight,runtime.droppedWeight) end if;if (item.flags&levelItems.IFL_ROAM)!=0 then weight=goalSelectNumeric.fmul(weight,item.weight) end if
  if weight<=0.0 then return void end if
  score.time=itemTime(runtime,itemQuery,area,origin,item.goalAreaNum,travelFlags)
  if score.time<=0 then return void end if
  remaining=goalRuntime.avoidGoalTime(runtime.goals,handle,item.number);if goalSelectNumeric.fsub(remaining,goalSelectNumeric.fmul(score.time,0.009))>0.0 then return void end if
  score.weight=goalSelectNumeric.fdiv(weight,goalSelectNumeric.fmul(score.time,TRAVELTIME_SCALE));return void
end function

/// Select the highest-weight reachable long-term item goal, add its avoidance timer, and push it onto the goal stack.
/// @param runtime AI goal selection runtime; accesses `goals` and `levelItems`.
/// @param handle Handle identifying the allocated bot goal state.
/// @param origin World-space position as three coordinates.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function chooseLTGItem(runtime,handle,origin,inventory,travelFlags)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.goals.pools,handle);if value==void or value.itemWeightConfig==void then return 0 end if;area=originArea(runtime,value,origin);if area==0 then return 0 end if
  config=itemConfig(runtime);if config==void or config is error then return 0 end if;best=void;bestWeight=0.0;fuzzyCache=array(len(value.itemWeightConfig.weights),void);score=ItemScore(0.0,0)
  itemQuery=startItemQuery(runtime,area,origin,travelFlags)
  for each item in runtime.levelItems.levelItems weighted(runtime,handle,value,config,inventory,item,area,origin,travelFlags,itemQuery,fuzzyCache,score);if score.weight>bestWeight then bestWeight=score.weight;best=item end if end for
  if best==void then return 0 end if;info=config[best.itemInfo];goal=makeItemGoal(info,best);goalRuntime.addToAvoidGoals(runtime.goals,handle,best.number,avoidTime(info,best));goalRuntime.pushGoal(runtime.goals,handle,goal);return 1
end function
/// Select a nearby item within the travel-time limit while retaining an acceptable route back to the long-term goal.
/// @param runtime AI goal selection runtime; accesses `goals` and `levelItems`.
/// @param handle Handle identifying the allocated bot goal state.
/// @param origin World-space position as three coordinates.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
/// @param longTermGoal Long term goal record; accesses `areaNum`.
/// @param maxTime Exclusive upper bound on item travel time in AAS travel-time units.
function chooseNBGItem(runtime,handle,origin,inventory,travelFlags,longTermGoal,maxTime)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.goals.pools,handle);if value==void or value.itemWeightConfig==void then return 0 end if;area=originArea(runtime,value,origin);if area==0 then return 0 end if
  itemQuery=startItemQuery(runtime,area,origin,travelFlags)
  longTime=99999;if longTermGoal!=void then longTime=itemTime(runtime,itemQuery,area,origin,longTermGoal.areaNum,travelFlags) end if
  config=itemConfig(runtime);if config==void or config is error then return 0 end if;best=void;bestWeight=0.0;fuzzyCache=array(len(value.itemWeightConfig.weights),void);score=ItemScore(0.0,0)
  for each item in runtime.levelItems.levelItems
    weighted(runtime,handle,value,config,inventory,item,area,origin,travelFlags,itemQuery,fuzzyCache,score);if score.time<=0 or score.time>=maxTime or score.weight<=bestWeight then continue end if
    back=0;if longTermGoal!=void and item.timeout==0.0 then back=travelTime(runtime,item.goalAreaNum,item.goalOrigin,longTermGoal.areaNum,travelFlags) end if
    if back<=longTime then bestWeight=score.weight;best=item end if
  end for
  if best==void then return 0 end if;info=config[best.itemInfo];goal=makeItemGoal(info,best);goalRuntime.addToAvoidGoals(runtime.goals,handle,best.number,avoidTime(info,best));goalRuntime.pushGoal(runtime.goals,handle,goal);return 1
end function

/// Detect an unobstructed item goal whose entity information is stale, preserving the released goal-bound calculation.
/// @param runtime AI goal selection runtime; accesses `services`.
/// @param viewer Entity number ignored by the visibility trace.
/// @param eye Value passed as argument 2 to `runtime.services.traceFn`.
/// @param viewAngles Not read by this implementation; retained in the `itemGoalInVisButNotVisible` signature.
/// @param goal Bot navigation goal; accesses `flags`, `origin`, `mins` and `entityNum`.
function itemGoalInVisButNotVisible(runtime,viewer,eye,viewAngles,goal)
  if runtime==void or goal==void or (goal.flags&GFL_ITEM)==0 then return false end if
  // Preserve Baseq3's released VectorAdd(goal->mins, goal->mins, middle).
  middle=[];for axis=0 to 2 middle=middle+[goalSelectNumeric.fadd(goal.origin[axis],goal.mins[axis])] end for
  sight=trace(runtime,eye,middle,viewer);if sight is error then return sight end if
  if sight.fraction>=1.0 then if goal.entityNum<=0 then return false end if;info=entityInfo(runtime,goal.entityNum);if info!=void and info.ltime<goalSelectNumeric.fsub(currentTime(runtime),0.5) then return true end if end if
  return false
end function
/// Find the next permitted item matching a pickup name and copy it into the caller's goal record; return -1 when absent.
/// @param runtime AI goal selection runtime; accesses `levelItems`.
/// @param index Index of the entry to access.
/// @param name Name used to identify the requested entry.
/// @param goal Bot navigation goal; accesses `areaNum`, `origin`, `entityNum`, `mins` and `maxs` and related fields. May update `goal.areaNum`, `goal.origin` and `goal.entityNum` and additional fields in place.
function getLevelItemGoal(runtime,index,name,goal)
  config=itemConfig(runtime);if config==void or config is error or goal==void then return -1 end if;start=0
  if index>=0 then found=false;for position=0 to len(runtime.levelItems.levelItems)-1 if runtime.levelItems.levelItems[position].number==index then start=position+1;found=true;break end if end for;if not found then return -1 end if end if
  if start>=len(runtime.levelItems.levelItems) then return -1 end if
  for position=start to len(runtime.levelItems.levelItems)-1 item=runtime.levelItems.levelItems[position];if not permitted(runtime,item) then continue end if;info=config[item.itemInfo]
    if stringEqualsIgnoreCaseAscii(name,info.name) then goal.areaNum=item.goalAreaNum;goal.origin=copyVector(item.goalOrigin);goal.entityNum=item.entityNum;goal.mins=copyVector(info.mins);goal.maxs=copyVector(info.maxs);goal.number=item.number;goal.flags=GFL_ITEM;if item.timeout!=0.0 then goal.flags=goal.flags|GFL_DROPPED end if;return item.number end if
  end for;return -1
end function

/// Combine compatible fuzzy separator trees while preserving the released child-parent and weight-bound behavior.
/// @param runtime AI goal selection runtime; accesses `goals`.
/// @param first Array or byte sequence accessed at `index`.
/// @param second Array or byte sequence accessed at `index`.
/// @param resultGoal Array or byte sequence accessed at `index`.
function interbreedSeparators(runtime,first,second,resultGoal)
  if first==void or len(first)==0 then return true end if
  for index=0 to len(first)-1
    if index>=len(second) or index>=len(resultGoal) then goalRuntime.emitPrint(runtime.goals,goalRuntime.PRT_ERROR,"cannot interbreed weight configs, unequal next\n");return false end if;a=first[index];b=second[index];target=resultGoal[index]
    if a.child!=void then
      if b.child==void or target.child==void then goalRuntime.emitPrint(runtime.goals,goalRuntime.PRT_ERROR,"cannot interbreed weight configs, unequal child\n");return false end if
      // Released Baseq3 passes fs2->child for both parents here; retain that behavior.
      if not interbreedSeparators(runtime,b.child,b.child,target.child) then return false end if
    else if a.type==itemWeights.WT_BALANCE then
      if b.type!=itemWeights.WT_BALANCE or target.type!=itemWeights.WT_BALANCE then goalRuntime.emitPrint(runtime.goals,goalRuntime.PRT_ERROR,"cannot interbreed weight configs, unequal balance\n");return false end if
      target.weight=goalSelectNumeric.fdiv(goalSelectNumeric.fadd(a.weight,b.weight),2.0);if target.weight>target.maxWeight then target.maxWeight=target.weight end if;if target.weight>target.minWeight then target.minWeight=target.weight end if
    end if
  end for;return true
end function
/// Interbreed compatible parent fuzzy-weight configurations into the child goal state, diagnosing incompatible layouts.
/// @param runtime AI goal selection runtime; accesses `goals`.
/// @param parent1 Handle identifying the allocated bot goal state.
/// @param parent2 Handle identifying the allocated bot goal state.
/// @param child Handle identifying the allocated bot goal state.
function interbreedGoalFuzzyLogic(runtime,parent1,parent2,child)
  if runtime==void then return 0 end if;one=goalResources.goalState(runtime.goals.pools,parent1);two=goalResources.goalState(runtime.goals.pools,parent2);offspring=goalResources.goalState(runtime.goals.pools,child)
  if one==void or two==void or offspring==void or one.itemWeightConfig==void or two.itemWeightConfig==void or offspring.itemWeightConfig==void then return 0 end if
  a=one.itemWeightConfig;b=two.itemWeightConfig;c=offspring.itemWeightConfig;if len(a.weights)!=len(b.weights) or len(a.weights)!=len(c.weights) then goalRuntime.emitPrint(runtime.goals,goalRuntime.PRT_ERROR,"cannot interbreed weight configs, unequal numweights\n");return 0 end if
  for index=0 to len(a.weights)-1 if not interbreedSeparators(runtime,a.weights[index].separators,b.weights[index].separators,c.weights[index].separators) then return 0 end if end for;return 0
end function

/// Validate the goal-state handle and return zero; the released engine does not write a fuzzy-weight file here.
/// @param runtime AI goal selection runtime; accesses `goals`.
/// @param handle Handle identifying the allocated bot goal state.
/// @param filename Unused output filename retained for compatibility; this released-engine operation performs no file write.
function saveGoalFuzzyLogic(runtime,handle,filename)
  // WriteWeightConfig is commented out in the released be_ai_goal.c. The
  // handle lookup remains observable through its fatal diagnostic only.
  if runtime==void then return 0 end if;goalResources.goalState(runtime.goals.pools,handle);return 0
end function
/// Apply `mq3.botlib.ai_goal_selection.mutateSeparators` and `mq3.botlib.ai_goal_selection.randomFloat` while evaluating `mutateSeparators`.
/// @param runtime AI goal selection runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place.
/// @param separators Value used by `mutateSeparators` in `if separators==void then return void end if`.
function mutateSeparators(runtime,separators)
  if separators==void then return void end if
  for each separator in separators
    if separator.child!=void then mutateSeparators(runtime,separator.child)
    else if separator.type==itemWeights.WT_BALANCE then
      width=goalSelectNumeric.fsub(separator.maxWeight,separator.minWeight);leap=randomFloat(runtime)<0.01;centered=2.0*(randomFloat(runtime)-0.5)
      if leap then separator.weight=goalSelectNumeric.f32(separator.weight+centered*width) else separator.weight=goalSelectNumeric.f32(separator.weight+centered*width*0.5) end if
      if separator.weight<separator.minWeight then separator.minWeight=separator.weight else if separator.weight>separator.maxWeight then separator.maxWeight=separator.weight end if
    end if
  end for;return void
end function
/// Apply `mq3.botlib.ai_resource_pools.goalState` and `mq3.botlib.ai_goal_selection.mutateSeparators` while evaluating `mutateGoalFuzzyLogic`.
/// @param runtime AI goal selection runtime; accesses `goals`.
/// @param handle Handle identifying the allocated bot goal state.
/// @param range Not read by this implementation; retained in the `mutateGoalFuzzyLogic` signature.
function mutateGoalFuzzyLogic(runtime,handle,range)
  if runtime==void then return 0 end if;goal=goalResources.goalState(runtime.goals.pools,handle);if goal==void or goal.itemWeightConfig==void then return 0 end if
  // The range argument is unused by released Baseq3.
  for each weight in goal.itemWeightConfig.weights mutateSeparators(runtime,weight.separators) end for;return 0
end function
/// Forward `geneticSelection` to `mq3.botlib.ai_genetic.selection` and return the delegated result.
/// @param runtime AI genetic runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place.
/// @param numRanks Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param rankings Array or byte sequence accessed at `index`.
function geneticSelection(runtime,numRanks,rankings)
  return genetic.selection(runtime,numRanks,rankings)
end function
/// Forward `geneticParentsAndChildSelection` to `mq3.botlib.ai_genetic.parentsAndChild` and return the delegated result.
/// @param runtime AI genetic runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place.
/// @param numRanks Value passed as argument 2 to `mq3.compat.numeric.fmul`.
/// @param ranks Array or byte sequence accessed at `index`.
function geneticParentsAndChildSelection(runtime,numRanks,ranks)
  return genetic.parentsAndChild(runtime,numRanks,ranks)
end function
/// Test `op==OP_CHOOSE_LTG_ITEM or op==OP_CHOOSE_NBG_ITEM or op==OP_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE or op==OP_GET_LEVEL_ITEM_GOAL or op==OP_SAVE_GOAL_FUZZY...` as the condition for `supportsTrap`.
/// @param op Numeric syscall operation identifier.
function supportsTrap(op) return op==OP_CHOOSE_LTG_ITEM or op==OP_CHOOSE_NBG_ITEM or op==OP_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE or op==OP_GET_LEVEL_ITEM_GOAL or op==OP_SAVE_GOAL_FUZZY_LOGIC or op==OP_GENETIC_PARENTS_AND_CHILD_SELECTION or op==OP_INTERBREED_GOAL_FUZZY_LOGIC or op==OP_MUTATE_GOAL_FUZZY_LOGIC end function
