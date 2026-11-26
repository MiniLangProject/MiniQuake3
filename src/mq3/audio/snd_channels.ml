// SPDX-License-Identifier: GPL-2.0-or-later
// Dynamic sound-channel ownership and replacement from Baseq3 S_StartSound.
package mq3.audio.snd_channels

import mq3.audio.snd_local as sndLocal

const MAX_CHANNELS=sndLocal.MAX_CHANNELS
const CHAN_ANNOUNCER=7

/// Channel record for audio.snd_channels, containing `active`, `entity`, `handle`, `entchannel`, `allocTime`.
struct Channel active entity handle entchannel allocTime end struct
/// State record for audio.snd_channels, containing `channels`, `freeSlots`, `listener`, `time`.
struct State channels freeSlots listener time end struct
/// Start record for audio.snd_channels, containing `accepted`, `slot`, `replaced`, `reason`.
struct Start accepted slot replaced reason end struct

/// Create snd channels in audio.snd_channels; the normal completion returns `State(channels, free, 0, 0)`.
function create()
  channels=[];free=[]
  for slot=0 to MAX_CHANNELS-1 channels=channels+[Channel(false,0,0,0,0)] end for
  for index=0 to MAX_CHANNELS-1 free=free+[MAX_CHANNELS-1-index] end for
  return State(channels,free,0,0)
end function

/// Set listener in audio.snd_channels; updates `state.listener`.
///
/// Direct state writes: `state.listener`.
/// @param state Updated in place: `listener`.
/// @param entity Entity operand used by `setListener`; its reads are shown in the implementation.
function setListener(state,entity) state.listener=entity;return void end function
/// Set time in audio.snd_channels; updates `state.time`.
///
/// Direct state writes: `state.time`.
/// @param state Updated in place: `time`.
/// @param milliseconds Milliseconds operand used by `setTime`; its reads are shown in the implementation.
function setTime(state,milliseconds) state.time=milliseconds;return void end function
/// Advance snd channels in audio.snd_channels; the normal completion returns `state.time`.
///
/// Direct state writes: `state.time`.
/// @param state Record exposing `time`. Updated in place: `time`.
/// @param milliseconds Milliseconds used in `(milliseconds > 0)` and `(state.time + milliseconds)`.
function advance(state,milliseconds) if milliseconds>0 then state.time=state.time+milliseconds end if;return state.time end function

/// Count mixer-channel records whose active flag is set.
/// @param state Channel pool containing the active flags to count.
function activeCount(state)
  count=0;for each channel in state.channels if channel.active then count=count+1 end if end for;return count
end function

/// Release snd channels in audio.snd_channels; the normal completion returns `true`.
///
/// Direct state writes: `state.freeSlots`.
/// @param state Record exposing `channels`, `freeSlots`. Updated in place: `freeSlots`.
/// @param slot Zero-based index into `state.channels`.
function release(state,slot)
  if state==void or slot<0 or slot>=MAX_CHANNELS or not state.channels[slot].active then return false end if
  state.channels[slot].active=false;state.freeSlots=[slot]+state.freeSlots;return true
end function

/// Start snd channels in audio.snd_channels; the normal completion returns `Start(true, chosen, true, "replace")`.
///
/// Direct state writes: `state.freeSlots`.
/// @param state Record exposing `channels`, `time`, `listener`, `freeSlots`. Updated in place: `freeSlots`.
/// @param entity Entity used in `(channel.entity == entity)` and `(entity == state.listener)`.
/// @param handle Handle used in `(handle <= 0)` and `(channel.handle == handle)`.
/// @param entchannel Entchannel used in `(channel.entchannel != CHAN_ANNOUNCER)`.
function start(state,entity,handle,entchannel)
  if state==void or handle<=0 then return Start(false,-1,false,"invalid") end if
  inplay=0
  // Preserve Baseq3's actual `ch[i]` scan while `ch` is also incremented by
  // the loop: the live array positions examined are 0,2,4,... . Positions
  // beyond the 96-channel array read zeroed adjacent storage in the original.
  for index=0 to MAX_CHANNELS-1
    slot=index*2;channel=void
    if slot<MAX_CHANNELS then channel=state.channels[slot] else channel=void end if
    if channel!=void and channel.active and channel.entity==entity and channel.handle==handle then
      if state.time-channel.allocTime<50 then return Start(false,-1,false,"duplicate") end if
      inplay=inplay+1
    end if
  end for
  allowed=4;if entity==state.listener then allowed=8 end if
  if inplay>allowed then return Start(false,-1,false,"limit") end if
  if len(state.freeSlots)>0 then
    slot=state.freeSlots[0];remaining=[];if len(state.freeSlots)>1 then for index=1 to len(state.freeSlots)-1 remaining=remaining+[state.freeSlots[index]] end for end if;state.freeSlots=remaining
    channel=state.channels[slot];channel.active=true;channel.entity=entity;channel.handle=handle;channel.entchannel=entchannel;channel.allocTime=state.time
    return Start(true,slot,false,"free")
  end if
  oldest=state.time;chosen=-1
  for slot=0 to MAX_CHANNELS-1
    channel=state.channels[slot]
    if channel.active and channel.entity!=state.listener and channel.entity==entity and channel.allocTime<oldest and channel.entchannel!=CHAN_ANNOUNCER then oldest=channel.allocTime;chosen=slot end if
  end for
  if chosen<0 then
    for slot=0 to MAX_CHANNELS-1
      channel=state.channels[slot]
      if channel.active and channel.entity!=state.listener and channel.allocTime<oldest and channel.entchannel!=CHAN_ANNOUNCER then oldest=channel.allocTime;chosen=slot end if
    end for
  end if
  if chosen<0 then return Start(false,-1,false,"full") end if
  channel=state.channels[chosen];channel.active=true;channel.entity=entity;channel.handle=handle;channel.entchannel=entchannel;channel.allocTime=state.time
  return Start(true,chosen,true,"replace")
end function
