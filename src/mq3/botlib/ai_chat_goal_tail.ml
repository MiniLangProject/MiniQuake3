// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Late Botlib chat/avoid-goal calls shared by the retail qagame ABI.
package mq3.botlib.ai_chat_goal_tail

import mq3.botlib.ai_chat_profiles as profiles
import mq3.botlib.ai_goal_state as goals
import mq3.botlib.ai_item_weights as itemWeights
import mq3.botlib.ai_resource_pools as pools

const OP_NUM_INITIAL_CHATS=569
const OP_GET_CHAT_MESSAGE=570
const OP_REMOVE_FROM_AVOID_GOALS=571
const OP_PREDICT_VISIBLE_POSITION=572
const OP_SET_AVOID_GOAL_TIME=573
const AVOID_MINIMUM_TIME=10.0
const AVOID_DEFAULT_TIME=30.0

struct State chatProfiles goalRuntime levelItems end struct
function create(chatProfiles,goalRuntime,levelItems) return State(chatProfiles,goalRuntime,levelItems) end function
function chatState(state,handle) if state==void or state.chatProfiles==void then return void end if;return pools.chatState(state.chatProfiles.pools,handle) end function
function numInitialChats(state,handle,type)
  value=chatState(state,handle);if value==void or value.chat==void then return 0 end if;selected=profiles.typeByName(value.chat,type);if selected==void then return 0 end if;return len(selected.messages)
end function
function removeTildes(value)
  data=bytes(value);output=bytes(len(data),0);readAt=0;writeAt=0
  // BotRemoveTildes increments its index after memmove, so one tilde from each
  // adjacent pair survives. Preserve that released-code behavior.
  while readAt<len(data)
    if data[readAt]==126 then readAt=readAt+1;if readAt<len(data) and data[readAt]==126 then output[writeAt]=126;writeAt=writeAt+1;readAt=readAt+1 end if
    else output[writeAt]=data[readAt];writeAt=writeAt+1;readAt=readAt+1 end if
  end while;return decode(slice(output,0,writeAt))
end function
function getChatMessage(state,handle,size)
  value=chatState(state,handle);if value==void then return void end if;message=removeTildes(value.chatMessage);value.chatMessage=""
  if size<=0 then return "" end if;data=bytes(message);count=len(data);if count>=size then count=size-1 end if;return decode(slice(data,0,count))
end function
function removeFromAvoidGoals(state,handle,number) if state==void then return 0 end if;goals.removeFromAvoidGoals(state.goalRuntime,handle,number);return 0 end function
function respawnTime(state,number)
  if state==void or state.levelItems==void or state.levelItems.itemRuntime==void then return void end if
  config=itemWeights.ensureItems(state.levelItems.itemRuntime);if config is error then return void end if
  for each levelItem in state.levelItems.levelItems
    if levelItem.number==number and levelItem.itemInfo>=0 and levelItem.itemInfo<len(config) then value=config[levelItem.itemInfo].respawnTime;if value==0.0 then value=AVOID_DEFAULT_TIME end if;if value<AVOID_MINIMUM_TIME then value=AVOID_MINIMUM_TIME end if;return value end if
  end for;return void
end function
function setAvoidGoalTime(state,handle,number,avoidTime)
  if state==void then return 0 end if;value=avoidTime
  if value<0.0 then value=respawnTime(state,number);if value==void then return 0 end if end if
  goals.addToAvoidGoals(state.goalRuntime,handle,number,value);return 0
end function
function supportsTrap(op) return op==OP_NUM_INITIAL_CHATS or op==OP_GET_CHAT_MESSAGE or op==OP_REMOVE_FROM_AVOID_GOALS or op==OP_SET_AVOID_GOAL_TIME end function
