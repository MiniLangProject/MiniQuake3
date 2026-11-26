// SPDX-License-Identifier: GPL-2.0-or-later
// Thin WinMM boundary. WAV/PK3 policy stays in MiniLang.
package mq3.platform.playable_audio

/// Enables the native pool of PCM playback voices.
/// @returns 1 after enabling the voice pool.
extern function initNative() from "playable_audio.dll" symbol "playable_audio_init" returns i32
/// Copies and plays a PCM clip once through a native WinMM voice.
/// @param samples Read-only interleaved PCM bytes copied into a native playback voice.
/// @param byteCount Size of the associated native input buffer in bytes.
/// @param sampleRate PCM sample rate in frames per second.
/// @param channels Number of interleaved PCM channels.
/// @param bitsPerSample Number of bits in each PCM channel sample.
/// @returns 1 when playback starts; 0 for invalid input or an output/allocation failure.
extern function playNative(samples as ptr,byteCount as i32,sampleRate as i32,channels as i32,bitsPerSample as i32) from "playable_audio.dll" symbol "playable_audio_play_pcm" returns i32
/// Copies a PCM clip into a native voice and enables continuous loop playback.
/// @param samples Read-only interleaved PCM bytes copied into a native playback voice.
/// @param byteCount Size of the associated native input buffer in bytes.
/// @param sampleRate PCM sample rate in frames per second.
/// @param channels Number of interleaved PCM channels.
/// @param bitsPerSample Number of bits in each PCM channel sample.
/// @returns 1 when loop playback starts; 0 for invalid input or an output/allocation failure.
extern function playLoopNative(samples as ptr,byteCount as i32,sampleRate as i32,channels as i32,bitsPerSample as i32) from "playable_audio.dll" symbol "playable_audio_play_pcm_loop" returns i32
/// Stops every native preview voice and frees its copied PCM samples.
extern function stopNative() from "playable_audio.dll" symbol "playable_audio_stop" returns void
/// Closes all preview voices and disables the native PCM playback pool.
extern function shutdownNative() from "playable_audio.dll" symbol "playable_audio_shutdown" returns void

/// Returns `void` from `mq3.platform.playable_audio.init`; earlier branches return `error(7491,"preview audio initialization failed")`.
function init()
  if initNative()==0 then return error(7491,"preview audio initialization failed") end if
  return void
end function
/// Starts one-shot playback of a validated PCM sound and converts native rejection to a MiniLang error.
/// @param sound Record providing `sound.samples`, `sound.sampleRate`, `sound.channels`, `sound.bitsPerSample`.
function play(sound)
  if sound==void or sound.samples==void or len(sound.samples)<1 then return error(7492,"invalid preview sound") end if
  if playNative(nativeBytesPtr(sound.samples),len(sound.samples),sound.sampleRate,sound.channels,sound.bitsPerSample)==0 then return error(7492,"preview PCM playback failed") end if
  return void
end function
/// Starts continuous playback of a validated PCM sound and converts native rejection to a MiniLang error.
/// @param sound Record providing `sound.samples`, `sound.sampleRate`, `sound.channels`, `sound.bitsPerSample`.
function playLoop(sound)
  if sound==void or sound.samples==void or len(sound.samples)<1 then return error(7492,"invalid preview loop sound") end if
  if playLoopNative(nativeBytesPtr(sound.samples),len(sound.samples),sound.sampleRate,sound.channels,sound.bitsPerSample)==0 then return error(7492,"preview loop PCM playback failed") end if
  return void
end function
/// Returns `void` from `mq3.platform.playable_audio.stop`.
function stop() stopNative();return void end function
/// Returns `void` from `mq3.platform.playable_audio.shutdown`.
function shutdown() shutdownNative();return void end function
