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

const AVOID_MINIMUM_TIME=10.0
const AVOID_DEFAULT_TIME=30.0

struct Host userContext timeFn logFn printFn levelItems end struct
struct State pools itemWeights levelItems goals selection mapGoals host aasEntities aas bspEntities gameType placeFn freeLevelItems setup end struct

function hostTime(host) if host==void or host.timeFn==void then return 0.0 end if;return host.timeFn(host.userContext) end function
function hostName(host,number) if host==void or host.levelItems==void then return "" end if;return levelItems.goalName(host.levelItems,number) end function
function hostLog(host,text) if host!=void and host.logFn!=void then host.logFn(host.userContext,text) end if;return void end function
function hostPrint(host,level,text) if host!=void and host.printFn!=void then host.printFn(host.userContext,level,text) end if;return void end function

function create(context,readFn,timeFn,logFn,printFn,services)
  resources=pools.create();itemRuntime=weights.create(context,readFn);items=levelItems.create(itemRuntime);host=Host(context,timeFn,logFn,printFn,items);goalState=goals.create(resources,host,hostTime,hostName,hostLog,hostPrint);chooser=selection.create(items,goalState,services)
  return State(resources,itemRuntime,items,goalState,chooser,mapGoals.create(),host,void,void,[],0,void,0,false)
end function
function bindWorld(state,aasEntities,aas,bspEntities,gameType,placeFn)
  state.aasEntities=aasEntities;state.aas=aas;state.bspEntities=bspEntities;state.gameType=gameType;state.placeFn=placeFn;levelItems.bind(state.levelItems,aasEntities,aas,bspEntities,gameType,state.host.userContext,placeFn);return state
end function

// Fuzzy weights and goal-state lifecycle ---------------------------------
function botGoalStateFromHandle(state,handle) return pools.goalState(state.pools,handle) end function
function botInterbreedGoalFuzzyLogic(state,parent1,parent2,child) return selection.interbreedGoalFuzzyLogic(state.selection,parent1,parent2,child) end function
function botSaveGoalFuzzyLogic(state,goalState,filename) return selection.saveGoalFuzzyLogic(state.selection,goalState,filename) end function
function botMutateGoalFuzzyLogic(state,goalState,range) return selection.mutateGoalFuzzyLogic(state.selection,goalState,range) end function
function loadItemConfig(state,filename) value=weights.parseItems(state.itemWeights,filename);if value is error then return value end if;state.itemWeights.items=value;return value end function
function itemWeightIndex(weightConfig,itemConfig) return weights.itemWeightIndex(weightConfig,itemConfig) end function
function botLoadItemWeights(state,goalState,filename) return weights.loadItemWeights(state.itemWeights,state.pools,goalState,filename) end function
function botFreeItemWeights(state,goalState) return weights.freeItemWeights(state.itemWeights,state.pools,goalState) end function
function botAllocGoalState(state,client) return pools.allocGoalState(state.pools,client) end function
function botFreeGoalState(state,handle) botFreeItemWeights(state,handle);return pools.freeGoalState(state.pools,handle) end function
function botResetGoalState(state,handle) return pools.resetGoalState(state.pools,handle) end function

// Level-item heap/list ownership -----------------------------------------
function initLevelItemHeap(state,capacity)
  if capacity<=0 then return error(7640,"AI goal level-item capacity must be positive") end if;state.levelItems.maxLevelItems=capacity;state.levelItems.levelItems=[];state.levelItems.numLevelItems=0;state.freeLevelItems=capacity;return capacity
end function
function allocLevelItem(state)
  if state.freeLevelItems<=0 then return void end if;state.freeLevelItems=state.freeLevelItems-1;return levelItems.BotLevelItem(0,0,0,0.0,[0.0,0.0,0.0],0,[0.0,0.0,0.0],0,0.0)
end function
function removeLevelItemFromList(state,item)
  values=[];removed=false;for each candidate in state.levelItems.levelItems if not removed and candidate==item then removed=true else values=values+[candidate] end if end for;state.levelItems.levelItems=values;return removed
end function
function freeLevelItem(state,item) if item==void then return 0 end if;removeLevelItemFromList(state,item);state.freeLevelItems=state.freeLevelItems+1;if state.freeLevelItems>state.levelItems.maxLevelItems then state.freeLevelItems=state.levelItems.maxLevelItems end if;return 0 end function
function addLevelItemToList(state,item) if item==void then return 0 end if;state.levelItems.levelItems=[item]+state.levelItems.levelItems;return 1 end function

// Map/static/dropped entity population -----------------------------------
function botFreeInfoEntities(state) return mapGoals.clear(state.mapGoals) end function
function botInitInfoEntities(state) return mapGoals.initialize(state.mapGoals,state.aas,state.bspEntities) end function
function botInitLevelItems(state)
  botInitInfoEntities(state);initLevelItemHeap(state,state.levelItems.maxLevelItems);result=levelItems.initialize(state.levelItems);if result is error then return result end if;state.freeLevelItems=state.levelItems.maxLevelItems-len(state.levelItems.levelItems);return result
end function
function botGoalName(state,number,size)
  value=levelItems.goalName(state.levelItems,number);if size<=0 then return "" end if;data=bytes(value);count=len(data);if count>=size then count=size-1 end if;return decode(slice(data,0,count))
end function
function botFindEntityForLevelItem(state,item)
  if item==void then return 0 end if;levelItems.update(state.levelItems);for each current in state.levelItems.levelItems if current.number==item.number then return current.entityNum end if end for;return 0
end function
function botUpdateEntityItems(state) return levelItems.update(state.levelItems) end function

// Avoid-goal table and stack ---------------------------------------------
function botResetAvoidGoals(state,goalState) return goals.resetAvoidGoals(state.goals,goalState) end function
function botDumpAvoidGoals(state,goalState) return goals.dumpAvoidGoals(state.goals,goalState) end function
function botAddToAvoidGoals(state,goalState,number,avoidTime) return goals.addToAvoidGoals(state.goals,goalState,number,avoidTime) end function
function botRemoveFromAvoidGoals(state,goalState,number) return goals.removeFromAvoidGoals(state.goals,goalState,number) end function
function botAvoidGoalTime(state,goalState,number) return goals.avoidGoalTime(state.goals,goalState,number) end function
function botSetAvoidGoalTime(state,goalState,number,avoidTime)
  value=avoidTime;if value<0.0 then
    items=weights.ensureItems(state.itemWeights);if items is error then return 0 end if;found=false
    for each item in state.levelItems.levelItems if item.number==number then value=items[item.itemInfo].respawnTime;if value==0.0 then value=AVOID_DEFAULT_TIME end if;if value<AVOID_MINIMUM_TIME then value=AVOID_MINIMUM_TIME end if;found=true;break end if end for;if not found then return 0 end if
  end if;return goals.addToAvoidGoals(state.goals,goalState,number,value)
end function
function botDumpGoalStack(state,goalState) return goals.dumpGoalStack(state.goals,goalState) end function
function botPushGoal(state,goalState,goal) return goals.pushGoal(state.goals,goalState,goal) end function
function botPopGoal(state,goalState) return goals.popGoal(state.goals,goalState) end function
function botEmptyGoalStack(state,goalState) return goals.emptyGoalStack(state.goals,goalState) end function
function botGetTopGoal(state,goalState) return goals.topGoal(state.goals,goalState) end function
function botGetSecondGoal(state,goalState) return goals.secondGoal(state.goals,goalState) end function
function botTouchingGoal(origin,goal) return goals.touchingGoal(origin,goal) end function

// Selection, visibility, routing and map goals ---------------------------
function botGetLevelItemGoal(state,index,name,goal) return selection.getLevelItemGoal(state.selection,index,name,goal) end function
function botGetMapLocationGoal(state,name) return mapGoals.mapLocationGoal(state.mapGoals,name) end function
function botGetNextCampSpotGoal(state,number) return mapGoals.nextCampSpotGoal(state.mapGoals,number) end function
function botChooseLTGItem(state,goalState,origin,inventory,travelFlags) return selection.chooseLTGItem(state.selection,goalState,origin,inventory,travelFlags) end function
function botChooseNBGItem(state,goalState,origin,inventory,travelFlags,longTermGoal,maxTime) return selection.chooseNBGItem(state.selection,goalState,origin,inventory,travelFlags,longTermGoal,maxTime) end function
function botItemGoalInVisButNotVisible(state,viewer,eye,viewAngles,goal) return selection.itemGoalInVisButNotVisible(state.selection,viewer,eye,viewAngles,goal) end function

// File-level setup/shutdown ----------------------------------------------
function botSetupGoalAI(state,itemConfigFile,gameType,droppedWeight)
  config=loadItemConfig(state,itemConfigFile);if config is error then return config end if;state.gameType=gameType;levelItems.setGameType(state.levelItems,gameType);selection.setDroppedWeight(state.selection,droppedWeight);state.setup=true;return 0
end function
function botShutdownGoalAI(state)
  if state==void then return 0 end if;for handle=1 to pools.MAX_CLIENTS if pools.goalState(state.pools,handle)!=void then botFreeGoalState(state,handle) end if end for;botFreeInfoEntities(state);levelItems.shutdown(state.levelItems);weights.shutdown(state.itemWeights);state.freeLevelItems=0;state.setup=false;return 0
end function
