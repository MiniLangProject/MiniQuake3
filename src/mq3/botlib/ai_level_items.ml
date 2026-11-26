// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Static and dropped level-item tracking from be_ai_goal.c.
package mq3.botlib.ai_level_items

import mq3.botlib.ai_item_weights as itemWeights
import mq3.botlib.aas_runtime as aasRuntime
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textNumbers
import std.array as arrays

/// Bot-library syscall identifier for init level items.
const OP_INIT_LEVEL_ITEMS=541
/// Bot-library syscall identifier for update entity items.
const OP_UPDATE_ENTITY_ITEMS=542
/// Maximum number of item and roam-goal records tracked for one level.
const MAX_LEVEL_ITEMS=256
/// Network entity-type identifier for a collectible item.
const ET_ITEM=2
/// Game-mode identifier for single-player progression.
const GT_SINGLE_PLAYER=2
/// Game-mode identifier for team deathmatch.
const GT_TEAM=3
/// Not in free for all.
const IFL_NOTFREE=1
/// Not in team play.
const IFL_NOTTEAM=2
/// Not in single player.
const IFL_NOTSINGLE=4
/// Bot should never go for this.
const IFL_NOTBOT=8
/// Bot roam goal.
const IFL_ROAM=16
/// AAS area-contents bit marking jump pad.
const AREACONTENTS_JUMPPAD=128

/// `BotLevelItem` record for ai level items, containing `number`, `itemInfo`, `flags`, `weight` and `origin` and related fields.
struct BotLevelItem
  /// Unique level-item goal identifier used by bot goal queries.
  number
  /// Item-configuration index associated with this bot goal.
  itemInfo
  /// Item restrictions and roam-goal properties combined from IFL flags.
  flags
  /// Configured preference multiplier for a bot roam goal.
  weight
  /// World-space position of the tracked level item or roam entity.
  origin
  /// AAS area containing the destination of this route or goal.
  goalAreaNum
  /// Goal origin within the area.
  goalOrigin
  /// Number of the game entity associated with this result.
  entityNum
  /// Item is removed after this time.
  timeout
end struct
/// `LevelItemRuntime` record for ai level items, containing `itemRuntime`, `aasEntities`, `aas`, `bspEntities` and `gameType` and related fields.
struct LevelItemRuntime
  /// Runtime containing the item definitions and fuzzy-weight rules.
  itemRuntime
  /// Navigation entity information used to track live map items.
  aasEntities
  /// AAS navigation runtime used for area and route queries.
  aas
  /// Parsed key/value definitions from the BSP entity lump.
  bspEntities
  /// Game-mode identifier used when applying mode-specific rules.
  gameType
  /// Opaque host data passed to the bound callback.
  callbackContext
  /// Host callback that places a discovered item goal in a usable AAS area.
  placeFn
  /// Current item goals discovered from the map and its dynamic entities.
  levelItems
  /// Number of level items represented by this record.
  numLevelItems
  /// Maximum number of map and dynamic item goals retained by this runtime.
  maxLevelItems
  /// True after item and roam goals have been discovered for the current level.
  initialized
end struct

/// Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for ai level items.
/// @param value Three-component array; components 0, 1 and 2 are used in their stored order.
function copyVector(value) return [value[0],value[1],value[2]] end function
/// Create a `mq3.botlib.ai_level_items.LevelItemRuntime` record, initializing `itemRuntime` from `itemRuntime` and `maxLevelItems` as `MAX_LEVEL_ITEMS`.
/// @param itemRuntime Initial value stored in `mq3.botlib.ai_level_items.LevelItemRuntime.itemRuntime`.
function create(itemRuntime)
  return LevelItemRuntime(itemRuntime,void,void,[],0,void,void,[],0,MAX_LEVEL_ITEMS,false)
end function
/// Update `state.aasEntities`, `state.aas`, `state.bspEntities` and `state.gameType` and related state during `bind`. Return paths include `state`.
/// @param state AI level items state; accesses `aasEntities`, `aas`, `bspEntities`, `gameType` and `callbackContext` and related fields. May update `state.aasEntities`, `state.aas` and `state.bspEntities` and additional fields in place.
/// @param entities Value used by `bind` in `state.aasEntities=entities`.
/// @param aas Value used by `bind` in `state.aas=aas`.
/// @param bspEntities Value used by `bind` in `state.bspEntities=bspEntities`.
/// @param gameType Value used by `bind` in `state.gameType=gameType`.
/// @param callbackContext Value used by `bind` in `state.callbackContext=callbackContext`.
/// @param placeFn Value used by `bind` in `state.placeFn=placeFn`.
function bind(state,entities,aas,bspEntities,gameType,callbackContext,placeFn)
  if state==void then return error(7580,"AI level-item runtime missing") end if
  state.aasEntities=entities;state.aas=aas;state.bspEntities=bspEntities;state.gameType=gameType;state.callbackContext=callbackContext;state.placeFn=placeFn
  return state
end function
/// Set `state.gameType` to `value` in `mq3.botlib.ai_level_items.setGameType`.
/// @param state AI level items state; accesses `gameType`. May update `state.gameType` in place.
/// @param value Operand used to evaluate the returned expression `value`.
function setGameType(state,value) if state!=void then state.gameType=value end if;return value end function
/// Look up an entity key in the BSP key-value table and return a found flag with its text.
/// @param state AI level items state; accesses `bspEntities`.
/// @param entity Value used by `epair` in `if state==void or entity<1 or entity>=len(state.bspEntities) then return [false,""] end if`.
/// @param key Lookup text matched against `pair[0]`.
function epair(state,entity,key)
  if state==void or entity<1 or entity>=len(state.bspEntities) then return [false,""] end if
  for each pair in state.bspEntities[entity] if pair[0]==key then return [true,pair[1]] end if end for
  return [false,""]
end function
/// Apply `mq3.botlib.ai_level_items.epair` while evaluating `intEpair`. Return paths include `textNumbers.atoi(pair[1])`.
/// @param state AI level items state; accesses `bspEntities`.
/// @param entity Value used by `epair` in `if state==void or entity<1 or entity>=len(state.bspEntities) then return [false,""] end if`.
/// @param key Lookup key or field name used by the operation.
function intEpair(state,entity,key) pair=epair(state,entity,key);if not pair[0] then return 0 end if;return textNumbers.atoi(pair[1]) end function
/// Apply `mq3.botlib.ai_level_items.epair` while evaluating `vectorEpair`. Return paths include `[value[0]==3,value[1]]`.
/// @param state AI level items state; accesses `bspEntities`.
/// @param entity Value used by `epair` in `if state==void or entity<1 or entity>=len(state.bspEntities) then return [false,""] end if`.
/// @param key Lookup key or field name used by the operation.
function vectorEpair(state,entity,key) pair=epair(state,entity,key);if not pair[0] then return [false,[0.0,0.0,0.0]] end if;value=textNumbers.vector(pair[1],[0.0,0.0,0.0]);return [value[0]==3,value[1]] end function
/// Find an item definition by exact class name and return its index, or -1 when absent.
/// @param items Array or byte sequence accessed at `index`.
/// @param classname Value used by `findClass` in `for index=0 to len(items)-1 if items[index].classname==classname then return index end if end for`.
function findClass(items,classname) if items==void or items is error then return -1 end if;for index=0 to len(items)-1 if items[index].classname==classname then return index end if end for;return -1 end function
/// Find an item definition by model index and return its table index, or -1 when absent.
/// @param items Array or byte sequence accessed at `index`.
/// @param modelIndex Value used by `findModel` in `for index=0 to len(items)-1 if items[index].modelIndex==modelIndex then return index end if end for`.
function findModel(items,modelIndex) if items==void or items is error then return -1 end if;for index=0 to len(items)-1 if items[index].modelIndex==modelIndex then return index end if end for;return -1 end function
/// Test `a[0]==b[0] and a[1]==b[1] and a[2]==b[2]` as the condition for `equalVector`.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function equalVector(a,b) return a[0]==b[0] and a[1]==b[1] and a[2]==b[2] end function
/// Calculate Euclidean distance between two three-component points for ai level items.
/// @param a Three-component array; components 0, 1 and 2 are used in their stored order.
/// @param b Three-component array; components 0, 1 and 2 are used in their stored order.
function distance(a,b)
  x=n.fsub(a[0],b[0]);y=n.fsub(a[1],b[1]);z=n.fsub(a[2],b[2]);return n.fsqrt(n.fadd(n.fadd(n.fmul(x,x),n.fmul(y,y)),n.fmul(z,z)))
end function
/// Apply `mq3.botlib.ai_level_items.copyVector`, `mq3.botlib.aas_runtime.pointAreaNum` and `mq3.botlib.aas_runtime.bboxAreas` while evaluating `defaultPlace`. Return paths include `[area,candidate]`.
/// @param state AI level items state; accesses `aas`.
/// @param origin World-space position as three coordinates.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param floating Not read by this implementation; retained in the `defaultPlace` signature.
function defaultPlace(state,origin,mins,maxs,floating)
  candidate=copyVector(origin);area=aasRuntime.pointAreaNum(state.aas,candidate)
  // Match the original five vertical and five horizontal fudge passes.
  for up=0 to 4
    if area!=0 then break end if
    for spread=0 to 4
      if area!=0 then break end if
      for xside=-1 to 1
        if area!=0 then break end if
        for yside=-1 to 1
          candidate=[origin[0]+spread*4.0*xside,origin[1]+spread*4.0*yside,origin[2]+up*4.0]
          area=aasRuntime.pointAreaNum(state.aas,candidate);if area!=0 then break end if
        end for
      end for
    end for
  end for
  if area==0 then
    boxmins=[origin[0]+mins[0],origin[1]+mins[1],origin[2]+mins[2]];boxmaxs=[origin[0]+maxs[0],origin[1]+maxs[1],origin[2]+maxs[2]]
    areas=aasRuntime.bboxAreas(state.aas,boxmins,boxmaxs,64)
    for each candidateArea in areas if aasRuntime.areaReachability(state.aas,candidateArea)>0 then area=candidateArea;break end if end for
    candidate=copyVector(origin)
  end if
  return [area,candidate]
end function
/// Use `state.placeFn` to perform `place`. Return paths include `defaultPlace(state,origin,mins,maxs,floating)`.
/// @param state AI level items state; accesses `placeFn` and `callbackContext`.
/// @param origin World-space position as three coordinates.
/// @param mins Minimum coordinates of the axis-aligned bounds.
/// @param maxs Maximum coordinates of the axis-aligned bounds.
/// @param floating Value passed as argument 5 to `state.placeFn`.
function place(state,origin,mins,maxs,floating)
  if state.placeFn!=void then return state.placeFn(state.callbackContext,origin,mins,maxs,floating) end if
  return defaultPlace(state,origin,mins,maxs,floating)
end function
/// Apply single-player, team-game and free-for-all exclusion flags to a level item.
/// @param state AI level items state; accesses `gameType`.
/// @param item Item record; accesses `flags`.
function permitted(state,item)
  if state.gameType==GT_SINGLE_PLAYER then return (item.flags&IFL_NOTSINGLE)==0 end if
  if state.gameType>=GT_TEAM then return (item.flags&IFL_NOTTEAM)==0 end if
  return (item.flags&IFL_NOTFREE)==0
end function
/// Update `state.levelItems`, `state.numLevelItems` and `state.initialized` during `initialize`. Return paths include `state.numLevelItems`.
/// @param state AI level items state; accesses `itemRuntime`, `levelItems`, `numLevelItems`, `initialized` and `aas` and related fields. May update `state.levelItems`, `state.numLevelItems` and `state.initialized` in place.
function initialize(state)
  if state==void or state.itemRuntime==void then return error(7580,"AI level-item runtime missing") end if
  state.levelItems=[];state.numLevelItems=0;state.initialized=false
  items=itemWeights.ensureItems(state.itemRuntime);if items is error then return items end if
  if state.aas==void or not state.aas.initialized then return 0 end if
  for entity=1 to len(state.bspEntities)-1
    classnamePair=epair(state,entity,"classname");if not classnamePair[0] then continue end if
    itemInfo=findClass(items,classnamePair[1]);if itemInfo<0 then continue end if
    originPair=vectorEpair(state,entity,"origin");if not originPair[0] then continue end if
    if len(state.levelItems)>=state.maxLevelItems then break end if
    spawnFlags=intEpair(state,entity,"spawnflags");flags=0
    if intEpair(state,entity,"notfree")!=0 then flags=flags|IFL_NOTFREE end if
    if intEpair(state,entity,"notteam")!=0 then flags=flags|IFL_NOTTEAM end if
    if intEpair(state,entity,"notsingle")!=0 then flags=flags|IFL_NOTSINGLE end if
    if intEpair(state,entity,"notbot")!=0 then flags=flags|IFL_NOTBOT end if
    weight=0.0;if classnamePair[1]=="item_botroam" then flags=flags|IFL_ROAM;weightPair=epair(state,entity,"weight");if weightPair[0] then weight=textNumbers.atof32(weightPair[1]) end if end if
    located=place(state,originPair[1],items[itemInfo].mins,items[itemInfo].maxs,(spawnFlags&1)!=0)
    state.numLevelItems=state.numLevelItems+1
    levelItem=BotLevelItem(state.numLevelItems,itemInfo,flags,weight,copyVector(located[1]),located[0],copyVector(located[1]),0,0.0)
    // AddLevelItemToList inserts at the head.
    state.levelItems=[levelItem]+state.levelItems
  end for
  state.initialized=true;return state.numLevelItems
end function
/// Return an item array with the selected position removed while preserving the order of the remaining entries.
/// @param values Sequence whose length bounds the iteration or lookup in `removeAt`.
/// @param index Index of the entry to access.
function removeAt(values,index)
  if len(values)<=1 then return [] end if
  if index<=0 then return arrays.slice(values,1,len(values)-1) end if
  if index>=len(values)-1 then return arrays.slice(values,0,len(values)-1) end if
  return arrays.slice(values,0,index)+arrays.slice(values,index+1,len(values)-index-1)
end function
/// Apply `mq3.botlib.aas_runtime.getTime` while evaluating `currentTime`. Return paths include `aasRuntime.getTime(state.aas)`.
/// @param state AI level items state; accesses `aas`.
function currentTime(state) if state.aas==void then return 0.0 end if;return aasRuntime.getTime(state.aas) end function
/// Apply `mq3.botlib.aas_runtime.areaInfo` while evaluating `jumpPadArea`. Return paths include `(areaInfo.contents&AREACONTENTS_JUMPPAD)!=0`.
/// @param state AI level items state; accesses `aas`.
/// @param area AAS area number; zero denotes no area.
function jumpPadArea(state,area)
  if area<=0 or state.aas==void or state.aas.map==void then return false end if
  areaInfo=aasRuntime.areaInfo(state.aas,area);if areaInfo is error then return false end if;return (areaInfo.contents&AREACONTENTS_JUMPPAD)!=0
end function
/// Update `state.levelItems` during `update`. Return paths include `len(state.levelItems)`.
/// @param state AI level items state; accesses `initialized`, `itemRuntime`, `levelItems`, `aasEntities` and `maxLevelItems` and related fields. May update `state.levelItems` in place.
function update(state)
  if state==void or not state.initialized then return 0 end if
  items=itemWeights.ensureItems(state.itemRuntime);if items is error then return items end if;now=currentTime(state)
  index=0;while index<len(state.levelItems)
    item=state.levelItems[index];if item.timeout!=0.0 and item.timeout<now then state.levelItems=removeAt(state.levelItems,index) else index=index+1 end if
  end while
  if state.aasEntities==void then return 0 end if
  for entity=1 to len(state.aasEntities.entities)-1
    info=state.aasEntities.entities[entity]
    if info==void or not info.valid or info.type!=ET_ITEM or info.modelindex==0 or not equalVector(info.origin,info.lastVisOrigin) then continue end if
    linked=-1
    for itemIndex=0 to len(state.levelItems)-1 if state.levelItems[itemIndex].entityNum==entity and entity!=0 then linked=itemIndex;break end if end for
    if linked>=0 then
      levelItem=state.levelItems[linked]
      if items[levelItem.itemInfo].modelIndex!=info.modelindex then state.levelItems=removeAt(state.levelItems,linked)
      else if not equalVector(levelItem.origin,info.origin) then located=place(state,info.origin,items[levelItem.itemInfo].mins,items[levelItem.itemInfo].maxs,false);levelItem.origin=copyVector(info.origin);levelItem.goalAreaNum=located[0];levelItem.goalOrigin=copyVector(located[1]) end if
      continue
    end if
    matched=-1
    for itemIndex=0 to len(state.levelItems)-1
      candidate=state.levelItems[itemIndex]
      if candidate.entityNum==0 and permitted(state,candidate) and items[candidate.itemInfo].modelIndex==info.modelindex and distance(candidate.origin,info.origin)<30.0 then matched=itemIndex;break end if
    end for
    if matched>=0 then
      levelItem=state.levelItems[matched];levelItem.entityNum=entity
      if not equalVector(levelItem.origin,info.origin) then located=place(state,info.origin,items[levelItem.itemInfo].mins,items[levelItem.itemInfo].maxs,false);levelItem.origin=copyVector(info.origin);levelItem.goalAreaNum=located[0];levelItem.goalOrigin=copyVector(located[1]) end if
      continue
    end if
    itemInfo=findModel(items,info.modelindex);if itemInfo<0 or len(state.levelItems)>=state.maxLevelItems then continue end if
    located=place(state,info.origin,items[itemInfo].mins,items[itemInfo].maxs,false)
    if jumpPadArea(state,located[0]) then continue end if
    dropped=BotLevelItem(state.numLevelItems+entity,itemInfo,0,0.0,copyVector(info.origin),located[0],copyVector(located[1]),entity,n.fadd(now,30.0))
    state.levelItems=[dropped]+state.levelItems
  end for
  return len(state.levelItems)
end function
/// Update `state.levelItems`, `state.numLevelItems`, `state.initialized` and `state.aasEntities` and related state during `shutdown`.
/// @param state AI level items state; accesses `levelItems`, `numLevelItems`, `initialized`, `aasEntities` and `aas`. May update `state.levelItems`, `state.numLevelItems` and `state.initialized` and additional fields in place.
function shutdown(state) if state!=void then state.levelItems=[];state.numLevelItems=0;state.initialized=false;state.aasEntities=void;state.aas=void end if;return 0 end function
/// Apply `mq3.botlib.ai_item_weights.ensureItems` while evaluating `goalName`. Return paths include `items[levelItem.itemInfo].name`.
/// @param state AI level items state; accesses `itemRuntime` and `levelItems`.
/// @param number Value used by `goalName` in `for each levelItem in state.levelItems if levelItem.number==number then return items[levelItem.itemInfo].name en...`.
function goalName(state,number)
  if state==void or state.itemRuntime==void then return "" end if;items=itemWeights.ensureItems(state.itemRuntime);if items is error then return "" end if
  for each levelItem in state.levelItems if levelItem.number==number then return items[levelItem.itemInfo].name end if end for;return ""
end function
