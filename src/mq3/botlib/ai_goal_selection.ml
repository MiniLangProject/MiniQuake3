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

const OP_CHOOSE_LTG_ITEM=535
const OP_CHOOSE_NBG_ITEM=536
const OP_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE=538
const OP_GET_LEVEL_ITEM_GOAL=539
const OP_SAVE_GOAL_FUZZY_LOGIC=545
const OP_GENETIC_PARENTS_AND_CHILD_SELECTION=564
// Baseq3 g_public.h assigns INTERBREED to 565 and MUTATE to 566.
const OP_INTERBREED_GOAL_FUZZY_LOGIC=565
const OP_MUTATE_GOAL_FUZZY_LOGIC=566
const GFL_ITEM=1
const GFL_ROAM=2
const GFL_DROPPED=4
const CONTENTS_SOLID=1
const AVOID_MINIMUM_TIME=10.0
const AVOID_DEFAULT_TIME=30.0
const AVOID_DROPPED_TIME=10.0
const TRAVELTIME_SCALE=0.01
const DEFAULT_DROPPED_WEIGHT=1000.0

struct Services context reachabilityAreaFn areaReachabilityFn travelTimeFn traceFn entityInfoFn itemQueryFn end struct
struct Runtime levelItems goals services droppedWeight randomSeed end struct
struct ItemScore weight time end struct

function services(context) return Services(context,void,void,void,void,void,void) end function
function create(items,goals,host) return Runtime(items,goals,host,DEFAULT_DROPPED_WEIGHT,1) end function
function setDroppedWeight(runtime,value) if runtime!=void then runtime.droppedWeight=goalSelectNumeric.f32(value) end if;return value end function
function setRandomSeed(runtime,value) if runtime!=void then runtime.randomSeed=goalSelectNumeric.i32(value) end if;return value end function
function randomFloat(runtime)
  // Baseq3's native botlib uses the process rand(), whose Windows sequence is
  // the same 214013/2531011 LCG used by the original Windows executable.
  runtime.randomSeed=goalSelectNumeric.add32(goalSelectNumeric.mul32(runtime.randomSeed,214013),2531011)
  return goalSelectNumeric.fdiv((goalSelectNumeric.u32(runtime.randomSeed)>>16)&32767,32767.0)
end function
function copyVector(value) return [value[0],value[1],value[2]] end function
function fail(message) return error(7594,"AI goal selection: "+message) end function

function reachabilityArea(runtime,origin,client)
  if runtime.services!=void and runtime.services.reachabilityAreaFn!=void then return runtime.services.reachabilityAreaFn(runtime.services.context,origin,client) end if
  if runtime.levelItems==void or runtime.levelItems.aas==void then return 0 end if;return aasRuntime.pointAreaNum(runtime.levelItems.aas,origin)
end function
function areaReachability(runtime,area)
  if runtime.services!=void and runtime.services.areaReachabilityFn!=void then return runtime.services.areaReachabilityFn(runtime.services.context,area) end if
  if runtime.levelItems==void or runtime.levelItems.aas==void then return 0 end if;return aasRuntime.areaReachability(runtime.levelItems.aas,area)
end function
function travelTime(runtime,area,origin,goalArea,travelFlags)
  if runtime.services==void or runtime.services.travelTimeFn==void then return 0 end if
  return runtime.services.travelTimeFn(runtime.services.context,area,origin,goalArea,travelFlags)
end function
function entityInfo(runtime,number)
  if runtime.services!=void and runtime.services.entityInfoFn!=void then return runtime.services.entityInfoFn(runtime.services.context,number) end if
  if runtime.levelItems==void then return void end if;return aasEntities.info(runtime.levelItems.aasEntities,number)
end function
function trace(runtime,start,finish,viewer)
  if runtime.services==void or runtime.services.traceFn==void then return fail("trace service missing") end if
  return runtime.services.traceFn(runtime.services.context,start,finish,viewer,CONTENTS_SOLID)
end function
function currentTime(runtime) return goalRuntime.currentTime(runtime.goals) end function
function itemConfig(runtime)
  if runtime==void or runtime.levelItems==void or runtime.levelItems.itemRuntime==void then return void end if
  return itemWeights.ensureItems(runtime.levelItems.itemRuntime)
end function
function permitted(runtime,item)
  if not levelItems.permitted(runtime.levelItems,item) then return false end if;return (item.flags&levelItems.IFL_NOTBOT)==0
end function
function makeItemGoal(info,item)
  flags=GFL_ITEM;if item.timeout!=0.0 then flags=flags|GFL_DROPPED end if;if (item.flags&levelItems.IFL_ROAM)!=0 then flags=flags|GFL_ROAM end if
  return goalResources.Goal(copyVector(item.goalOrigin),item.goalAreaNum,copyVector(info.mins),copyVector(info.maxs),item.entityNum,item.number,flags,item.itemInfo)
end function
function avoidTime(info,item)
  if item.timeout!=0.0 then return AVOID_DROPPED_TIME end if;value=info.respawnTime;if value==0.0 then value=AVOID_DEFAULT_TIME end if;if value<AVOID_MINIMUM_TIME then value=AVOID_MINIMUM_TIME end if;return value
end function
function originArea(runtime,value,origin)
  area=reachabilityArea(runtime,origin,value.client);if area==0 or areaReachability(runtime,area)==0 then area=value.lastReachabilityArea end if;value.lastReachabilityArea=area;return area
end function
function startItemQuery(runtime,area,origin,travelFlags)
  if runtime.services==void or runtime.services.itemQueryFn==void then return void end if
  return runtime.services.itemQueryFn(runtime.services.context,area,origin,travelFlags)
end function
function itemTime(runtime,query,area,origin,goal,travelFlags)
  if query!=void then return routes.itemQueryTravelTime(query,goal) end if
  return travelTime(runtime,area,origin,goal,travelFlags)
end function

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

function chooseLTGItem(runtime,handle,origin,inventory,travelFlags)
  if runtime==void then return 0 end if;value=goalResources.goalState(runtime.goals.pools,handle);if value==void or value.itemWeightConfig==void then return 0 end if;area=originArea(runtime,value,origin);if area==0 then return 0 end if
  config=itemConfig(runtime);if config==void or config is error then return 0 end if;best=void;bestWeight=0.0;fuzzyCache=array(len(value.itemWeightConfig.weights),void);score=ItemScore(0.0,0)
  itemQuery=startItemQuery(runtime,area,origin,travelFlags)
  for each item in runtime.levelItems.levelItems weighted(runtime,handle,value,config,inventory,item,area,origin,travelFlags,itemQuery,fuzzyCache,score);if score.weight>bestWeight then bestWeight=score.weight;best=item end if end for
  if best==void then return 0 end if;info=config[best.itemInfo];goal=makeItemGoal(info,best);goalRuntime.addToAvoidGoals(runtime.goals,handle,best.number,avoidTime(info,best));goalRuntime.pushGoal(runtime.goals,handle,goal);return 1
end function
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

function itemGoalInVisButNotVisible(runtime,viewer,eye,viewAngles,goal)
  if runtime==void or goal==void or (goal.flags&GFL_ITEM)==0 then return false end if
  // Preserve Baseq3's released VectorAdd(goal->mins, goal->mins, middle).
  middle=[];for axis=0 to 2 middle=middle+[goalSelectNumeric.fadd(goal.origin[axis],goal.mins[axis])] end for
  sight=trace(runtime,eye,middle,viewer);if sight is error then return sight end if
  if sight.fraction>=1.0 then if goal.entityNum<=0 then return false end if;info=entityInfo(runtime,goal.entityNum);if info!=void and info.ltime<goalSelectNumeric.fsub(currentTime(runtime),0.5) then return true end if end if
  return false
end function
function getLevelItemGoal(runtime,index,name,goal)
  config=itemConfig(runtime);if config==void or config is error or goal==void then return -1 end if;start=0
  if index>=0 then found=false;for position=0 to len(runtime.levelItems.levelItems)-1 if runtime.levelItems.levelItems[position].number==index then start=position+1;found=true;break end if end for;if not found then return -1 end if end if
  if start>=len(runtime.levelItems.levelItems) then return -1 end if
  for position=start to len(runtime.levelItems.levelItems)-1 item=runtime.levelItems.levelItems[position];if not permitted(runtime,item) then continue end if;info=config[item.itemInfo]
    if stringEqualsIgnoreCaseAscii(name,info.name) then goal.areaNum=item.goalAreaNum;goal.origin=copyVector(item.goalOrigin);goal.entityNum=item.entityNum;goal.mins=copyVector(info.mins);goal.maxs=copyVector(info.maxs);goal.number=item.number;goal.flags=GFL_ITEM;if item.timeout!=0.0 then goal.flags=goal.flags|GFL_DROPPED end if;return item.number end if
  end for;return -1
end function

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
function interbreedGoalFuzzyLogic(runtime,parent1,parent2,child)
  if runtime==void then return 0 end if;one=goalResources.goalState(runtime.goals.pools,parent1);two=goalResources.goalState(runtime.goals.pools,parent2);offspring=goalResources.goalState(runtime.goals.pools,child)
  if one==void or two==void or offspring==void or one.itemWeightConfig==void or two.itemWeightConfig==void or offspring.itemWeightConfig==void then return 0 end if
  a=one.itemWeightConfig;b=two.itemWeightConfig;c=offspring.itemWeightConfig;if len(a.weights)!=len(b.weights) or len(a.weights)!=len(c.weights) then goalRuntime.emitPrint(runtime.goals,goalRuntime.PRT_ERROR,"cannot interbreed weight configs, unequal numweights\n");return 0 end if
  for index=0 to len(a.weights)-1 if not interbreedSeparators(runtime,a.weights[index].separators,b.weights[index].separators,c.weights[index].separators) then return 0 end if end for;return 0
end function

function saveGoalFuzzyLogic(runtime,handle,filename)
  // WriteWeightConfig is commented out in the released be_ai_goal.c. The
  // handle lookup remains observable through its fatal diagnostic only.
  if runtime==void then return 0 end if;goalResources.goalState(runtime.goals.pools,handle);return 0
end function
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
function mutateGoalFuzzyLogic(runtime,handle,range)
  if runtime==void then return 0 end if;goal=goalResources.goalState(runtime.goals.pools,handle);if goal==void or goal.itemWeightConfig==void then return 0 end if
  // The range argument is unused by released Baseq3.
  for each weight in goal.itemWeightConfig.weights mutateSeparators(runtime,weight.separators) end for;return 0
end function
function geneticSelection(runtime,numRanks,rankings)
  return genetic.selection(runtime,numRanks,rankings)
end function
function geneticParentsAndChildSelection(runtime,numRanks,ranks)
  return genetic.parentsAndChild(runtime,numRanks,ranks)
end function
function supportsTrap(op) return op==OP_CHOOSE_LTG_ITEM or op==OP_CHOOSE_NBG_ITEM or op==OP_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE or op==OP_GET_LEVEL_ITEM_GOAL or op==OP_SAVE_GOAL_FUZZY_LOGIC or op==OP_GENETIC_PARENTS_AND_CHILD_SELECTION or op==OP_INTERBREED_GOAL_FUZZY_LOGIC or op==OP_MUTATE_GOAL_FUZZY_LOGIC end function
