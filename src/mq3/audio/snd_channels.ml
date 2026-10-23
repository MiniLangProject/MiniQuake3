// SPDX-License-Identifier: GPL-2.0-or-later
// Dynamic sound-channel ownership and replacement from Baseq3 S_StartSound.
package mq3.audio.snd_channels

import mq3.audio.snd_local as sndLocal

const MAX_CHANNELS=sndLocal.MAX_CHANNELS
const CHAN_ANNOUNCER=7

struct Channel active entity handle entchannel allocTime end struct
struct State channels freeSlots listener time end struct
struct Start accepted slot replaced reason end struct

function create()
  channels=[];free=[]
  for slot=0 to MAX_CHANNELS-1 channels=channels+[Channel(false,0,0,0,0)] end for
  for index=0 to MAX_CHANNELS-1 free=free+[MAX_CHANNELS-1-index] end for
  return State(channels,free,0,0)
end function

function setListener(state,entity) state.listener=entity;return void end function
function setTime(state,milliseconds) state.time=milliseconds;return void end function
function advance(state,milliseconds) if milliseconds>0 then state.time=state.time+milliseconds end if;return state.time end function

function activeCount(state)
  count=0;for each channel in state.channels if channel.active then count=count+1 end if end for;return count
end function

function release(state,slot)
  if state==void or slot<0 or slot>=MAX_CHANNELS or not state.channels[slot].active then return false end if
  state.channels[slot].active=false;state.freeSlots=[slot]+state.freeSlots;return true
end function

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
