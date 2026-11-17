// SPDX-License-Identifier: GPL-2.0-or-later
// Intrusive slot-index LRU. Stable slots preserve the routing cache's arrays
// and wire representation; hits and eviction never scan the entry array.
package mq3.botlib.cache_lru
import std.ds.hashmap as maps
struct State positions keys previous next oldest newest count capacity end struct
function create(capacity)
  if capacity<1 then return error(7791,"LRU capacity must be positive") end if
  return State(maps.HashMap.withCapacity(capacity),array(capacity,void),array(capacity,-1),array(capacity,-1),-1,-1,0,capacity)
end function
function append(state,slot)
  state.previous[slot]=state.newest;state.next[slot]=-1
  if state.newest>=0 then state.next[state.newest]=slot else state.oldest=slot end if
  state.newest=slot;return slot
end function
function touchSlot(state,slot)
  if slot==state.newest then return slot end if
  before=state.previous[slot];after=state.next[slot]
  if before>=0 then state.next[before]=after else state.oldest=after end if
  if after>=0 then state.previous[after]=before end if
  return append(state,slot)
end function
function touch(state,key)
  slot=state.positions.getOr(key,-1);if slot<0 then return -1 end if
  return touchSlot(state,slot)
end function
function reserve(state,key)
  existing=state.positions.getOr(key,-1)
  if existing>=0 then return touchSlot(state,existing) end if
  slot=-1
  if state.count<state.capacity then
    slot=state.count;state.count=state.count+1;append(state,slot)
  else
    slot=state.oldest;state.positions.remove(state.keys[slot]);touchSlot(state,slot)
  end if
  state.keys[slot]=key;state.positions.set(key,slot);return slot
end function
function clear(state)
  if state.count>0 then for slot=0 to state.count-1 state.keys[slot]=void;state.previous[slot]=-1;state.next[slot]=-1 end for end if
  state.positions.clear();state.oldest=-1;state.newest=-1;state.count=0;return void
end function
