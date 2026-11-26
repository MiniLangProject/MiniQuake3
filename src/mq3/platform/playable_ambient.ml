// SPDX-License-Identifier: GPL-2.0-or-later
// Native queued-output boundary for MiniLang-mixed stereo ambient PCM.
package mq3.platform.playable_ambient

/// Opens the queued stereo PCM output used by the spatial ambient mixer.
/// @param rate Stereo output sample rate in frames per second; accepted range 4000..192000.
/// @returns 1 if the output is ready; 0 on initialization failure.
extern function initNative(rate as i32) from "playable_ambient.dll" symbol "playable_ambient_init" returns i32
/// Checks whether a queued PCM buffer is available for another ambient chunk.
/// @returns 1 when a buffer is available; 0 while unavailable or uninitialized.
extern function canSubmitNative() from "playable_ambient.dll" symbol "playable_ambient_can_submit" returns i32
/// Copies a stereo PCM chunk into the native ambient queue.
/// @param samples Read-only interleaved signed 16-bit stereo PCM samples.
/// @param count PCM byte count; positive, divisible by four, and at most 16384.
/// @returns 1 when queued, 2 when all queue buffers are busy, or 0 on failure.
extern function submitNative(samples as ptr,count as i32) from "playable_ambient.dll" symbol "playable_ambient_submit" returns i32
/// Stops ambient playback, releases all queued PCM buffers, and closes the WinMM output handle.
extern function stopNative() from "playable_ambient.dll" symbol "playable_ambient_stop" returns void
/// Stops the ambient stream and releases its WinMM output resources.
extern function shutdownNative() from "playable_ambient.dll" symbol "playable_ambient_shutdown" returns void

/// Returns `void` from `mq3.platform.playable_ambient.init`; earlier branches return `error(7630,"ambient output initialization failed")`.
/// @param rate Value forwarded as `rate` to `mq3.platform.playable_ambient.initNative`.
function init(rate) if initNative(rate)==0 then return error(7630,"ambient output initialization failed") end if;return void end function
/// Computes `canSubmitNative()!=0` for `mq3.platform.playable_ambient.canSubmit`.
function canSubmit() return canSubmitNative()!=0 end function
/// Submits a four-byte-aligned stereo PCM chunk; returns false for a full queue and an error for native failure.
/// @param samples Input tested by `samples==void or len(samples)<4 or (len(samples)&3)!=0`.
function submit(samples)
  if samples==void or len(samples)<4 or (len(samples)&3)!=0 then return error(7631,"invalid stereo ambient chunk") end if
  result=submitNative(nativeBytesPtr(samples),len(samples));if result==2 then return false end if
  if result!=1 then return error(7631,"ambient output submission failed") end if;return true
end function
/// Returns `void` from `mq3.platform.playable_ambient.stop`.
function stop() stopNative();return void end function
/// Returns `void` from `mq3.platform.playable_ambient.shutdown`.
function shutdown() shutdownNative();return void end function
