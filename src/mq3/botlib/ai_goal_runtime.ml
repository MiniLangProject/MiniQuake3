// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete native file facade for code/botlib/be_ai_goal.c.
package mq3.botlib.ai_goal_runtime

import mq3.botlib.ai_resource_pools as pools
import mq3.botlib.ai_item_weights as weights
import mq3.botlib.ai_level_items as levelItems
import mq3.botlib.ai_goal_state as goals
import mq3.botlib.ai_goal_selection as selection
import mq3.botlib.ai_map_goals as mapGoals

/// Minimum interval retained for a goal-avoidance request.
const AVOID_MINIMUM_TIME=10.0
/// Default interval for temporarily avoiding a selected goal.
const AVOID_DEFAULT_TIME=30.0

/// `Host` record for ai goal runtime, containing `userContext`, `timeFn`, `logFn`, `printFn` and `levelItems`.
struct Host
  /// Caller-owned context forwarded to the configured host services.
  userContext
  /// Host callback that supplies the current time used by the bot runtime.
  timeFn
  /// Host callback that writes a bot-runtime message to the host log.
  logFn
  /// Host callback that prints messages from the native-compatible bot goal API.
  printFn
  /// Current item goals discovered from the map and its dynamic entities.
  levelItems
end struct
/// `State` record for ai goal runtime, containing `pools`, `itemWeights`, `levelItems`, `goals` and `selection` and related fields.
struct State
  /// Managed pools containing bot chat, goal, movement, and weapon resources.
  pools
  /// Fuzzy item-weight runtime used by the goal subsystem.
  itemWeights
  /// Current item goals discovered from the map and its dynamic entities.
  levelItems
  /// Per-bot goal-stack and avoidance-state runtime.
  goals
  /// Goal-selection runtime combining item weights with route costs.
  selection
  /// Named locations and camp spots parsed from the map.
  mapGoals
  /// Host callback interface supplying external services to this runtime.
  host
  /// Navigation entity information used to track live map items.
  aasEntities
  /// AAS navigation runtime used for area and route queries.
  aas
  /// Parsed key/value definitions from the BSP entity lump.
  bspEntities
  /// Game-mode identifier used when applying mode-specific rules.
  gameType
  /// Host callback that places a discovered item goal in a usable AAS area.
  placeFn
  /// Level-item records available for reuse.
  freeLevelItems
  /// True after the bot-library setup sequence has completed.
  setup
end struct

/// Use `host.timeFn` to perform `hostTime`. Return paths include `host.timeFn(host.userContext)`.
/// @param host Host service configuration; accesses `timeFn` and `userContext`.
function hostTime(host) if host==void or host.timeFn==void then return 0.0 end if;return host.timeFn(host.userContext) end function
/// Apply `mq3.botlib.ai_level_items.goalName` while evaluating `hostName`. Return paths include `levelItems.goalName(host.levelItems,number)`.
/// @param host Host service configuration; accesses `levelItems`.
/// @param number Value used by `goalName` in `for each levelItem in state.levelItems if levelItem.number==number then return items[levelItem.itemInfo].name en...`.
function hostName(host,number) if host==void or host.levelItems==void then return "" end if;return levelItems.goalName(host.levelItems,number) end function
/// Use `host.logFn` to perform `hostLog`.
/// @param host Host service configuration; accesses `logFn` and `userContext`.
/// @param text Text to parse, format or deliver.
function hostLog(host,text) if host!=void and host.logFn!=void then host.logFn(host.userContext,text) end if;return void end function
/// Use `host.printFn` to perform `hostPrint`.
/// @param host Host service configuration; accesses `printFn` and `userContext`.
/// @param level Value passed as argument 2 to `host.printFn`.
/// @param text Text to parse, format or deliver.
function hostPrint(host,level,text) if host!=void and host.printFn!=void then host.printFn(host.userContext,level,text) end if;return void end function

/// Build the `mq3.botlib.ai_goal_runtime.State` result for `create`.
/// @param context Context forwarded to the configured host callbacks.
/// @param readFn Callback that loads a named resource through the supplied context.
/// @param timeFn Callback that supplies the current botlib time.
/// @param logFn Initial value stored in `mq3.botlib.ai_goal_runtime.Host.logFn`.
/// @param printFn Initial value stored in `mq3.botlib.ai_goal_runtime.Host.printFn`.
/// @param services Initial value stored in `mq3.botlib.ai_goal_selection.Runtime.services`.
function create(context,readFn,timeFn,logFn,printFn,services)
  resources=pools.create();itemRuntime=weights.create(context,readFn);items=levelItems.create(itemRuntime);host=Host(context,timeFn,logFn,printFn,items);goalState=goals.create(resources,host,hostTime,hostName,hostLog,hostPrint);chooser=selection.create(items,goalState,services)
  return State(resources,itemRuntime,items,goalState,chooser,mapGoals.create(),host,void,void,[],0,void,0,false)
end function
/// Update `state.aasEntities`, `state.aas`, `state.bspEntities` and `state.gameType` and related state during `bindWorld`. Return paths include `state`.
/// @param state AI goal runtime state; accesses `aasEntities`, `aas`, `bspEntities`, `gameType` and `placeFn` and related fields. May update `state.aasEntities`, `state.aas` and `state.bspEntities` and additional fields in place.
/// @param aasEntities Value used by `bind` in `state.aasEntities=entities`.
/// @param aas Value used by `bind` in `state.aas=aas`.
/// @param bspEntities Value used by `bind` in `state.bspEntities=bspEntities`.
/// @param gameType Value used by `bind` in `state.gameType=gameType`.
/// @param placeFn Value used by `bind` in `state.placeFn=placeFn`.
function bindWorld(state,aasEntities,aas,bspEntities,gameType,placeFn)
  state.aasEntities=aasEntities;state.aas=aas;state.bspEntities=bspEntities;state.gameType=gameType;state.placeFn=placeFn;levelItems.bind(state.levelItems,aasEntities,aas,bspEntities,gameType,state.host.userContext,placeFn);return state
end function

// Fuzzy weights and goal-state lifecycle ---------------------------------
/// @param state AI goal runtime state; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
function botGoalStateFromHandle(state,handle) return pools.goalState(state.pools,handle) end function
/// Forward `botInterbreedGoalFuzzyLogic` to `mq3.botlib.ai_goal_selection.interbreedGoalFuzzyLogic` and return the delegated result.
/// @param state AI goal runtime state; accesses `selection`.
/// @param parent1 Handle identifying the allocated bot goal state.
/// @param parent2 Handle identifying the allocated bot goal state.
/// @param child Handle identifying the allocated bot goal state.
function botInterbreedGoalFuzzyLogic(state,parent1,parent2,child) return selection.interbreedGoalFuzzyLogic(state.selection,parent1,parent2,child) end function
/// Forward `botSaveGoalFuzzyLogic` to `mq3.botlib.ai_goal_selection.saveGoalFuzzyLogic` and return the delegated result.
/// @param state AI goal runtime state; accesses `selection`.
/// @param goalState Handle of the pooled bot goal state.
/// @param filename Filename supplied to the configured loader or file service.
function botSaveGoalFuzzyLogic(state,goalState,filename) return selection.saveGoalFuzzyLogic(state.selection,goalState,filename) end function
/// Forward `botMutateGoalFuzzyLogic` to `mq3.botlib.ai_goal_selection.mutateGoalFuzzyLogic` and return the delegated result.
/// @param state AI goal runtime state; accesses `selection`.
/// @param goalState Handle of the pooled bot goal state.
/// @param range Value passed as argument 3 to `mq3.botlib.ai_goal_selection.mutateGoalFuzzyLogic`.
function botMutateGoalFuzzyLogic(state,goalState,range) return selection.mutateGoalFuzzyLogic(state.selection,goalState,range) end function
/// Set `state.itemWeights.items` to `value` in `mq3.botlib.ai_goal_runtime.loadItemConfig`.
/// @param state AI goal runtime state; accesses `itemWeights`. May update `state.itemWeights.items` in place.
/// @param filename Filename supplied to the configured loader or file service.
function loadItemConfig(state,filename) value=weights.parseItems(state.itemWeights,filename);if value is error then return value end if;state.itemWeights.items=value;return value end function
/// Forward `itemWeightIndex` to `mq3.botlib.ai_item_weights.itemWeightIndex` and return the delegated result.
/// @param weightConfig Configuration record; accesses `weights`.
/// @param itemConfig Value used by `itemWeightIndex` in `for each item in items result=result+[findWeight(config,item.classname)] end for`.
function itemWeightIndex(weightConfig,itemConfig) return weights.itemWeightIndex(weightConfig,itemConfig) end function
/// Forward `botLoadItemWeights` to `mq3.botlib.ai_item_weights.loadItemWeights` and return the delegated result.
/// @param state AI goal runtime state; accesses `itemWeights` and `pools`.
/// @param goalState Handle of the pooled bot goal state.
/// @param filename Filename supplied to the configured loader or file service.
function botLoadItemWeights(state,goalState,filename) return weights.loadItemWeights(state.itemWeights,state.pools,goalState,filename) end function
/// Forward `botFreeItemWeights` to `mq3.botlib.ai_item_weights.freeItemWeights` and return the delegated result.
/// @param state AI goal runtime state; accesses `itemWeights` and `pools`.
/// @param goalState Handle of the pooled bot goal state.
function botFreeItemWeights(state,goalState) return weights.freeItemWeights(state.itemWeights,state.pools,goalState) end function
/// Forward `botAllocGoalState` to `mq3.botlib.ai_resource_pools.allocGoalState` and return the delegated result.
/// @param state AI goal runtime state; accesses `pools`.
/// @param client Initial value stored in `mq3.botlib.ai_resource_pools.GoalState.client`.
function botAllocGoalState(state,client) return pools.allocGoalState(state.pools,client) end function
/// Apply `mq3.botlib.ai_goal_runtime.botFreeItemWeights` and `mq3.botlib.ai_resource_pools.freeGoalState` while evaluating `botFreeGoalState`. Return paths include `pools.freeGoalState(state.pools,handle)`.
/// @param state AI goal runtime state; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
function botFreeGoalState(state,handle) botFreeItemWeights(state,handle);return pools.freeGoalState(state.pools,handle) end function
/// Forward `botResetGoalState` to `mq3.botlib.ai_resource_pools.resetGoalState` and return the delegated result.
/// @param state AI goal runtime state; accesses `pools`.
/// @param handle Handle identifying the allocated bot goal state.
function botResetGoalState(state,handle) return pools.resetGoalState(state.pools,handle) end function

// Level-item heap/list ownership -----------------------------------------
/// @param state AI goal runtime state; accesses `levelItems` and `freeLevelItems`. May update `state.levelItems.maxLevelItems`, `state.levelItems.levelItems` and `state.levelItems.numLevelItems` and additional fields in place.
/// @param capacity Maximum number of entries to allocate or retain.
function initLevelItemHeap(state,capacity)
  if capacity<=0 then return error(7640,"AI goal level-item capacity must be positive") end if;state.levelItems.maxLevelItems=capacity;state.levelItems.levelItems=[];state.levelItems.numLevelItems=0;state.freeLevelItems=capacity;return capacity
end function
/// Set `state.freeLevelItems` to `state.freeLevelItems-1` in `mq3.botlib.ai_goal_runtime.allocLevelItem`. Return paths include `levelItems.BotLevelItem(0,0,0,0.0,[0.0,0.0,0.0],0,[0.0,0.0,0.0],0,0.0)`.
/// @param state AI goal runtime state; accesses `freeLevelItems`. May update `state.freeLevelItems` in place.
function allocLevelItem(state)
  if state.freeLevelItems<=0 then return void end if;state.freeLevelItems=state.freeLevelItems-1;return levelItems.BotLevelItem(0,0,0,0.0,[0.0,0.0,0.0],0,[0.0,0.0,0.0],0,0.0)
end function
/// Set `state.levelItems.levelItems` to `values` in `mq3.botlib.ai_goal_runtime.removeLevelItemFromList`. Return paths include `removed`.
/// @param state AI goal runtime state; accesses `levelItems`. May update `state.levelItems.levelItems` in place.
/// @param item Value used by `removeLevelItemFromList` in `for each candidate in state.levelItems.levelItems if not removed and candidate==item then removed=true else valu...`.
function removeLevelItemFromList(state,item)
  values=[];removed=false;for each candidate in state.levelItems.levelItems if not removed and candidate==item then removed=true else values=values+[candidate] end if end for;state.levelItems.levelItems=values;return removed
end function
/// Set `state.freeLevelItems` to `state.freeLevelItems+1` and `state.freeLevelItems` to `state.levelItems.maxLevelItems` in `mq3.botlib.ai_goal_runtime.freeLevelItem`.
/// @param state AI goal runtime state; accesses `freeLevelItems` and `levelItems`. May update `state.freeLevelItems` in place.
/// @param item Value used by `removeLevelItemFromList` in `for each candidate in state.levelItems.levelItems if not removed and candidate==item then removed=true else valu...`.
function freeLevelItem(state,item) if item==void then return 0 end if;removeLevelItemFromList(state,item);state.freeLevelItems=state.freeLevelItems+1;if state.freeLevelItems>state.levelItems.maxLevelItems then state.freeLevelItems=state.levelItems.maxLevelItems end if;return 0 end function
/// Set `state.levelItems.levelItems` to `[item]+state.levelItems.levelItems` in `mq3.botlib.ai_goal_runtime.addLevelItemToList`.
/// @param state AI goal runtime state; accesses `levelItems`. May update `state.levelItems.levelItems` in place.
/// @param item Value used by `addLevelItemToList` in `if item==void then return 0 end if`.
function addLevelItemToList(state,item) if item==void then return 0 end if;state.levelItems.levelItems=[item]+state.levelItems.levelItems;return 1 end function

// Map/static/dropped entity population -----------------------------------
/// @param state AI goal runtime state; accesses `mapGoals`.
function botFreeInfoEntities(state) return mapGoals.clear(state.mapGoals) end function
/// Forward `botInitInfoEntities` to `mq3.botlib.ai_map_goals.initialize` and return the delegated result.
/// @param state AI goal runtime state; accesses `mapGoals`, `aas` and `bspEntities`.
function botInitInfoEntities(state) return mapGoals.initialize(state.mapGoals,state.aas,state.bspEntities) end function
/// Set `state.freeLevelItems` to `state.levelItems.maxLevelItems-len(state.levelItems.levelItems)` in `mq3.botlib.ai_goal_runtime.botInitLevelItems`.
/// @param state AI goal runtime state; accesses `levelItems` and `freeLevelItems`. May update `state.freeLevelItems` in place.
function botInitLevelItems(state)
  botInitInfoEntities(state);initLevelItemHeap(state,state.levelItems.maxLevelItems);result=levelItems.initialize(state.levelItems);if result is error then return result end if;state.freeLevelItems=state.levelItems.maxLevelItems-len(state.levelItems.levelItems);return result
end function
/// Apply `mq3.botlib.ai_level_items.goalName` while evaluating `botGoalName`. Return paths include `decode(slice(data,0,count))`.
/// @param state AI goal runtime state; accesses `levelItems`.
/// @param number Value used by `goalName` in `for each levelItem in state.levelItems if levelItem.number==number then return items[levelItem.itemInfo].name en...`.
/// @param size Size or capacity supplied to the buffer operation.
function botGoalName(state,number,size)
  value=levelItems.goalName(state.levelItems,number);if size<=0 then return "" end if;data=bytes(value);count=len(data);if count>=size then count=size-1 end if;return decode(slice(data,0,count))
end function
/// Apply `mq3.botlib.ai_level_items.update` while evaluating `botFindEntityForLevelItem`.
/// @param state AI goal runtime state; accesses `levelItems`.
/// @param item Item record; accesses `number`.
function botFindEntityForLevelItem(state,item)
  if item==void then return 0 end if;levelItems.update(state.levelItems);for each current in state.levelItems.levelItems if current.number==item.number then return current.entityNum end if end for;return 0
end function
/// Forward `botUpdateEntityItems` to `mq3.botlib.ai_level_items.update` and return the delegated result.
/// @param state AI goal runtime state; accesses `levelItems`.
function botUpdateEntityItems(state) return levelItems.update(state.levelItems) end function

// Avoid-goal table and stack ---------------------------------------------
/// @param state AI goal runtime state; accesses `goals`.
/// @param goalState Handle of the pooled bot goal state.
function botResetAvoidGoals(state,goalState) return goals.resetAvoidGoals(state.goals,goalState) end function
/// Forward `botDumpAvoidGoals` to `mq3.botlib.ai_goal_state.dumpAvoidGoals` and return the delegated result.
/// @param state AI goal runtime state; accesses `goals`.
/// @param goalState Handle of the pooled bot goal state.
function botDumpAvoidGoals(state,goalState) return goals.dumpAvoidGoals(state.goals,goalState) end function
/// Forward `botAddToAvoidGoals` to `mq3.botlib.ai_goal_state.addToAvoidGoals` and return the delegated result.
/// @param state AI goal runtime state; accesses `goals`.
/// @param goalState Handle of the pooled bot goal state.
/// @param number Value used by `addToAvoidGoals` in `if value.avoidGoals[index]==number then value.avoidGoals[index]=number`.
/// @param avoidTime Value passed as argument 2 to `mq3.compat.numeric.fadd`.
function botAddToAvoidGoals(state,goalState,number,avoidTime) return goals.addToAvoidGoals(state.goals,goalState,number,avoidTime) end function
/// Forward `botRemoveFromAvoidGoals` to `mq3.botlib.ai_goal_state.removeFromAvoidGoals` and return the delegated result.
/// @param state AI goal runtime state; accesses `goals`.
/// @param goalState Handle of the pooled bot goal state.
/// @param number Value used by `removeFromAvoidGoals` in `if value.avoidGoals[index]==number and value.avoidGoalTimes[index]>=now then value.avoidGoalTimes[index]=0.0`.
function botRemoveFromAvoidGoals(state,goalState,number) return goals.removeFromAvoidGoals(state.goals,goalState,number) end function
/// Forward `botAvoidGoalTime` to `mq3.botlib.ai_goal_state.avoidGoalTime` and return the delegated result.
/// @param state AI goal runtime state; accesses `goals`.
/// @param goalState Handle of the pooled bot goal state.
/// @param number Value used by `avoidGoalTime` in `if value.avoidGoals[index]==number and value.avoidGoalTimes[index]>=now then return goalNumeric.fsub(value.avoid...`.
function botAvoidGoalTime(state,goalState,number) return goals.avoidGoalTime(state.goals,goalState,number) end function
/// Apply `mq3.botlib.ai_item_weights.ensureItems` and `mq3.botlib.ai_goal_state.addToAvoidGoals` while evaluating `botSetAvoidGoalTime`. Return paths include `goals.addToAvoidGoals(state.goals,goalState,number,value)`.
/// @param state AI goal runtime state; accesses `itemWeights`, `levelItems` and `goals`.
/// @param goalState Handle of the pooled bot goal state.
/// @param number Value used by `addToAvoidGoals` in `if value.avoidGoals[index]==number then value.avoidGoals[index]=number`.
/// @param avoidTime Value used by `botSetAvoidGoalTime` in `value=avoidTime`.
function botSetAvoidGoalTime(state,goalState,number,avoidTime)
  value=avoidTime;if value<0.0 then
    items=weights.ensureItems(state.itemWeights);if items is error then return 0 end if;found=false
    for each item in state.levelItems.levelItems if item.number==number then value=items[item.itemInfo].respawnTime;if value==0.0 then value=AVOID_DEFAULT_TIME end if;if value<AVOID_MINIMUM_TIME then value=AVOID_MINIMUM_TIME end if;found=true;break end if end for;if not found then return 0 end if
  end if;return goals.addToAvoidGoals(state.goals,goalState,number,value)
end function
/// Forward `botDumpGoalStack` to `mq3.botlib.ai_goal_state.dumpGoalStack` and return the delegated result.
/// @param state AI goal runtime state; accesses `goals`.
/// @param goalState Handle of the pooled bot goal state.
function botDumpGoalStack(state,goalState) return goals.dumpGoalStack(state.goals,goalState) end function
/// Forward `botPushGoal` to `mq3.botlib.ai_goal_state.pushGoal` and return the delegated result.
/// @param state AI goal runtime state; accesses `goals`.
/// @param goalState Handle of the pooled bot goal state.
/// @param goal Value record; accesses `origin`, `areaNum`, `mins`, `maxs` and `entityNum` and related fields.
function botPushGoal(state,goalState,goal) return goals.pushGoal(state.goals,goalState,goal) end function
/// Forward `botPopGoal` to `mq3.botlib.ai_goal_state.popGoal` and return the delegated result.
/// @param state AI goal runtime state; accesses `goals`.
/// @param goalState Handle of the pooled bot goal state.
function botPopGoal(state,goalState) return goals.popGoal(state.goals,goalState) end function
/// Forward `botEmptyGoalStack` to `mq3.botlib.ai_goal_state.emptyGoalStack` and return the delegated result.
/// @param state AI goal runtime state; accesses `goals`.
/// @param goalState Handle of the pooled bot goal state.
function botEmptyGoalStack(state,goalState) return goals.emptyGoalStack(state.goals,goalState) end function
/// Forward `botGetTopGoal` to `mq3.botlib.ai_goal_state.topGoal` and return the delegated result.
/// @param state AI goal runtime state; accesses `goals`.
/// @param goalState Handle of the pooled bot goal state.
function botGetTopGoal(state,goalState) return goals.topGoal(state.goals,goalState) end function
/// Forward `botGetSecondGoal` to `mq3.botlib.ai_goal_state.secondGoal` and return the delegated result.
/// @param state AI goal runtime state; accesses `goals`.
/// @param goalState Handle of the pooled bot goal state.
function botGetSecondGoal(state,goalState) return goals.secondGoal(state.goals,goalState) end function
/// Forward `botTouchingGoal` to `mq3.botlib.ai_goal_state.touchingGoal` and return the delegated result.
/// @param origin World-space position as three coordinates.
/// @param goal Bot navigation goal; accesses `mins`, `origin` and `maxs`.
function botTouchingGoal(origin,goal) return goals.touchingGoal(origin,goal) end function

// Selection, visibility, routing and map goals ---------------------------
/// @param state AI goal runtime state; accesses `selection`.
/// @param index Index of the entry to access.
/// @param name Name used to identify the requested entry.
/// @param goal Bot navigation goal; accesses `areaNum`, `origin`, `entityNum`, `mins` and `maxs` and related fields. May update `goal.areaNum`, `goal.origin` and `goal.entityNum` and additional fields in place.
function botGetLevelItemGoal(state,index,name,goal) return selection.getLevelItemGoal(state.selection,index,name,goal) end function
/// Forward `botGetMapLocationGoal` to `mq3.botlib.ai_map_goals.mapLocationGoal` and return the delegated result.
/// @param state AI goal runtime state; accesses `mapGoals`.
/// @param name Name used to identify the requested entry.
function botGetMapLocationGoal(state,name) return mapGoals.mapLocationGoal(state.mapGoals,name) end function
/// Forward `botGetNextCampSpotGoal` to `mq3.botlib.ai_map_goals.nextCampSpotGoal` and return the delegated result.
/// @param state AI goal runtime state; accesses `mapGoals`.
/// @param number Operand used to evaluate the returned expression `CampResult(number+1,state.campSpots[index].goal)`.
function botGetNextCampSpotGoal(state,number) return mapGoals.nextCampSpotGoal(state.mapGoals,number) end function
/// Forward `botChooseLTGItem` to `mq3.botlib.ai_goal_selection.chooseLTGItem` and return the delegated result.
/// @param state AI goal runtime state; accesses `selection`.
/// @param goalState Handle of the pooled bot goal state.
/// @param origin World-space position as three coordinates.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
function botChooseLTGItem(state,goalState,origin,inventory,travelFlags) return selection.chooseLTGItem(state.selection,goalState,origin,inventory,travelFlags) end function
/// Forward `botChooseNBGItem` to `mq3.botlib.ai_goal_selection.chooseNBGItem` and return the delegated result.
/// @param state AI goal runtime state; accesses `selection`.
/// @param goalState Handle of the pooled bot goal state.
/// @param origin World-space position as three coordinates.
/// @param inventory Bot inventory indexed by the corresponding inventory constants.
/// @param travelFlags Bit mask of permitted AAS travel modes and area restrictions.
/// @param longTermGoal Long term goal record; accesses `areaNum`.
/// @param maxTime Upper limit on the route travel-time value.
function botChooseNBGItem(state,goalState,origin,inventory,travelFlags,longTermGoal,maxTime) return selection.chooseNBGItem(state.selection,goalState,origin,inventory,travelFlags,longTermGoal,maxTime) end function
/// Forward `botItemGoalInVisButNotVisible` to `mq3.botlib.ai_goal_selection.itemGoalInVisButNotVisible` and return the delegated result.
/// @param state AI goal runtime state; accesses `selection`.
/// @param viewer Entity number ignored by the visibility trace.
/// @param eye Value passed as argument 2 to `runtime.services.traceFn`.
/// @param viewAngles Pitch, yaw and roll of the bot view in degrees.
/// @param goal Bot navigation goal; accesses `flags`, `origin`, `mins` and `entityNum`.
function botItemGoalInVisButNotVisible(state,viewer,eye,viewAngles,goal) return selection.itemGoalInVisButNotVisible(state.selection,viewer,eye,viewAngles,goal) end function

// File-level setup/shutdown ----------------------------------------------
/// @param state AI goal runtime state; accesses `gameType`, `levelItems`, `selection` and `setup`. May update `state.gameType` and `state.setup` in place.
/// @param itemConfigFile Filename supplied to the configured loader or file service.
/// @param gameType Operand used to evaluate the returned expression `value`.
/// @param droppedWeight Value passed as argument 1 to `mq3.compat.numeric.f32`.
function botSetupGoalAI(state,itemConfigFile,gameType,droppedWeight)
  config=loadItemConfig(state,itemConfigFile);if config is error then return config end if;state.gameType=gameType;levelItems.setGameType(state.levelItems,gameType);selection.setDroppedWeight(state.selection,droppedWeight);state.setup=true;return 0
end function
/// Set `state.freeLevelItems` to `0` and `state.setup` to `false` in `mq3.botlib.ai_goal_runtime.botShutdownGoalAI`.
/// @param state AI goal runtime state; accesses `pools`, `levelItems`, `itemWeights`, `freeLevelItems` and `setup`. May update `state.freeLevelItems` and `state.setup` in place.
function botShutdownGoalAI(state)
  if state==void then return 0 end if;for handle=1 to pools.MAX_CLIENTS if pools.goalState(state.pools,handle)!=void then botFreeGoalState(state,handle) end if end for;botFreeInfoEntities(state);levelItems.shutdown(state.levelItems);weights.shutdown(state.itemWeights);state.freeLevelItems=0;state.setup=false;return 0
end function
