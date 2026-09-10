// SPDX-License-Identifier: GPL-2.0-or-later
// Thin WinMM boundary. WAV/PK3 policy stays in MiniLang.
package mq3.platform.playable_audio

extern function initNative() from "playable_audio.dll" symbol "playable_audio_init" returns i32
extern function playNative(samples as ptr,byteCount as i32,sampleRate as i32,channels as i32,bitsPerSample as i32) from "playable_audio.dll" symbol "playable_audio_play_pcm" returns i32
extern function playLoopNative(samples as ptr,byteCount as i32,sampleRate as i32,channels as i32,bitsPerSample as i32) from "playable_audio.dll" symbol "playable_audio_play_pcm_loop" returns i32
extern function stopNative() from "playable_audio.dll" symbol "playable_audio_stop" returns void
extern function shutdownNative() from "playable_audio.dll" symbol "playable_audio_shutdown" returns void

function init()
  if initNative()==0 then return error(7491,"preview audio initialization failed") end if
  return void
end function
function play(sound)
  if sound==void or sound.samples==void or len(sound.samples)<1 then return error(7492,"invalid preview sound") end if
  if playNative(nativeBytesPtr(sound.samples),len(sound.samples),sound.sampleRate,sound.channels,sound.bitsPerSample)==0 then return error(7492,"preview PCM playback failed") end if
  return void
end function
function playLoop(sound)
  if sound==void or sound.samples==void or len(sound.samples)<1 then return error(7492,"invalid preview loop sound") end if
  if playLoopNative(nativeBytesPtr(sound.samples),len(sound.samples),sound.sampleRate,sound.channels,sound.bitsPerSample)==0 then return error(7492,"preview loop PCM playback failed") end if
  return void
end function
function stop() stopNative();return void end function
function shutdown() shutdownNative();return void end function
