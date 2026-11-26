// SPDX-License-Identifier: GPL-2.0-or-later
// Intrusive slot-index LRU. Stable slots preserve the routing cache's arrays
// and wire representation; hits and eviction never scan the entry array.
package mq3.botlib.cache_lru
import std.ds.hashmap as maps
/// `State` record for cache lru, containing `positions`, `keys`, `previous`, `next` and `oldest` and related fields.
struct State positions keys previous next oldest newest count capacity end struct
/// Build the `mq3.botlib.cache_lru.State` result for `create`.
/// @param capacity Maximum number of entries to allocate or retain.
function create(capacity)
  if capacity<1 then return error(7791,"LRU capacity must be positive") end if
  return State(maps.HashMap.withCapacity(capacity),array(capacity,void),array(capacity,-1),array(capacity,-1),-1,-1,0,capacity)
end function
/// Update `state.previous[slot]`, `state.next[slot]`, `state.next[state.newest]` and `state.oldest` and related state during `append`. Return paths include `slot`.
/// @param state Cache lru state; accesses `previous`, `newest`, `next` and `oldest`. May update `state.previous[slot]`, `state.next[slot]` and `state.next[state.newest]` and additional fields in place.
/// @param slot Slot in the owning table or pool.
function append(state,slot)
  state.previous[slot]=state.newest;state.next[slot]=-1
  if state.newest>=0 then state.next[state.newest]=slot else state.oldest=slot end if
  state.newest=slot;return slot
end function
/// Update `state.next[before]`, `state.oldest` and `state.previous[after]` during `touchSlot`. Return paths include `append(state,slot)`.
/// @param state Cache lru state; accesses `newest`, `previous`, `next` and `oldest`. May update `state.next[before]`, `state.oldest` and `state.previous[after]` in place.
/// @param slot Slot in the owning table or pool.
function touchSlot(state,slot)
  if slot==state.newest then return slot end if
  before=state.previous[slot];after=state.next[slot]
  if before>=0 then state.next[before]=after else state.oldest=after end if
  if after>=0 then state.previous[after]=before end if
  return append(state,slot)
end function
/// Use `state.positions.getOr` to perform `touch`. Return paths include `touchSlot(state,slot)`.
/// @param state Cache lru state; accesses `positions`.
/// @param key Lookup key or field name used by the operation.
function touch(state,key)
  slot=state.positions.getOr(key,-1);if slot<0 then return -1 end if
  return touchSlot(state,slot)
end function
/// Set `state.count` to `state.count+1` and `state.keys[slot]` to `key` in `mq3.botlib.cache_lru.reserve`. Return paths include `slot`.
/// @param state Cache lru state; accesses `positions`, `count`, `capacity`, `oldest` and `keys`. May update `state.count` and `state.keys[slot]` in place.
/// @param key Lookup key or field name used by the operation.
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
/// Reset the routing cache LRU bookkeeping and release all recorded slots.
/// @param state Cache lru state; accesses `count`, `keys`, `previous`, `next` and `positions` and related fields. May update `state.keys[slot]`, `state.previous[slot]` and `state.next[slot]` and additional fields in place.
function clear(state)
  if state.count>0 then for slot=0 to state.count-1 state.keys[slot]=void;state.previous[slot]=-1;state.next[slot]=-1 end for end if
  state.positions.clear();state.oldest=-1;state.newest=-1;state.count=0;return void
end function
