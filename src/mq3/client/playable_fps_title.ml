// SPDX-License-Identifier: GPL-2.0-or-later
// Stable, low-frequency FPS text for the playable window title.
package mq3.client.playable_fps_title
import mq3.compat.numeric as numeric

const UPDATE_INTERVAL_MILLISECONDS=500

struct State mapName sampleStart frameCount smoothedFps initialized lastTime currentTitle end struct

function fail(message) return error(7590,"preview FPS title: "+message) end function

function title(mapName,fps)
  value="--"
  if fps>=0 then value=str(fps) end if
  return "MiniQuake3 | "+value+" FPS | "+mapName
end function

function create(mapName,now)
  if typeof(mapName)!="string" or len(bytes(mapName))<1 or len(bytes(mapName))>64 then return fail("map name must contain 1 to 64 UTF-8 bytes") end if
  if now<0 then return fail("time must be non-negative") end if
  return State(mapName,now,0,0,false,now,title(mapName,-1))
end function

// Call exactly once after each presented frame. A string return value means the
// native title should be changed; void deliberately avoids per-frame Win32 work.
function frame(state,now)
  if state==void or now<state.lastTime then return fail("time must be monotonic") end if
  state.lastTime=now;state.frameCount=state.frameCount+1
  elapsed=now-state.sampleStart
  if elapsed<UPDATE_INTERVAL_MILLISECONDS then return void end if
  measured=numeric.quotient(state.frameCount*1000+numeric.quotient(elapsed,2),elapsed)
  if measured<0 then measured=0 end if
  if not state.initialized then
    state.smoothedFps=measured;state.initialized=true
  else
    // 25% of the newest sample keeps short stalls from making the caption flash.
    state.smoothedFps=numeric.quotient(state.smoothedFps*3+measured+2,4)
  end if
  state.sampleStart=now;state.frameCount=0
  nextTitle=title(state.mapName,state.smoothedFps)
  if nextTitle==state.currentTitle then return void end if
  state.currentTitle=nextTitle
  return nextTitle
end function

function initialTitle(state)
  if state==void then return fail("state is required") end if
  return state.currentTitle
end function
