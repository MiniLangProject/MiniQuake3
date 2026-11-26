// SPDX-License-Identifier: GPL-2.0-or-later
// Frame API joining retail target_speaker assets, MiniLang mixing and WinMM.
package mq3.client.playable_spatial_ambient

import mq3.audio.spatial_mixer as mixer
import mq3.platform.playable_ambient as output

const OUTPUT_RATE=22050
const CHUNK_FRAMES=1024

/// Stores playable spatial ambient runtime wiring and state, including `mix`, `submitted`, `dropped`, `started`.
struct Runtime mix submitted dropped started end struct

/// Calls `mq3.audio.spatial_mixer.create`, `mq3.audio.spatial_mixer.addSharedLoop`, `mq3.client.playable_spatial_ambient.Runtime` from playable spatial ambient `create`. The final path returns `Runtime(state,0,0,false)`.
/// @param catalog Asset catalog used to resolve names to loaded resources. Record read through `catalog.speakers`.
function create(catalog)
  if catalog==void then return error(7635,"ambient catalog is required") end if
  state=mixer.create(OUTPUT_RATE,CHUNK_FRAMES);id=1
  for each speaker in catalog.speakers
    if speaker.sound!=void then
      added=mixer.addSharedLoop(state,id,speaker.noise,speaker.origin,speaker.sound,1.0,speaker.globalSound);if added is error then return added end if;id=id+1
    end if
  end for
  return Runtime(state,0,0,false)
end function

/// Updates `runtime.started` during playable spatial ambient `start`.
/// @param runtime Mutable playable spatial ambient record/storage; this routine assigns `runtime.started`.
function start(runtime)
  if runtime==void then return error(7635,"ambient runtime is required") end if
  ready=output.init(runtime.mix.outputRate);if ready is error then return ready end if
  runtime.started=true;return len(runtime.mix.sources)
end function

/// Updates `runtime.dropped`, `runtime.submitted` during playable spatial ambient `pump`.
/// @param runtime Mutable playable spatial ambient record/storage; this routine assigns `runtime.dropped`, `runtime.submitted`.
/// @param listenerOrigin Value used by `chunk=mixer.render(runtime.mix,listenerOrigin,listenerRight)`.
/// @param listenerRight Value used by `chunk=mixer.render(runtime.mix,listenerOrigin,listenerRight)`.
function pump(runtime,listenerOrigin,listenerRight)
  if runtime==void or not runtime.started then return error(7635,"ambient runtime is not started") end if
  if not output.canSubmit() then runtime.dropped=runtime.dropped+1;return false end if
  chunk=mixer.render(runtime.mix,listenerOrigin,listenerRight);if chunk is error then return chunk end if
  accepted=output.submit(chunk.samples);if accepted then runtime.submitted=runtime.submitted+1 else runtime.dropped=runtime.dropped+1 end if
  return accepted
end function

/// Updates `runtime.started` during playable spatial ambient `stop`.
/// @param runtime Mutable playable spatial ambient record/storage; this routine assigns `runtime.started`.
function stop(runtime)
  if runtime!=void and runtime.started then output.stop();runtime.started=false end if;return void
end function

/// Updates `runtime.started` during playable spatial ambient `shutdown`.
/// @param runtime Mutable playable spatial ambient record/storage; this routine assigns `runtime.started`.
function shutdown(runtime)
  output.shutdown();if runtime!=void then runtime.started=false end if;return void
end function
