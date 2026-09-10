// SPDX-License-Identifier: GPL-2.0-or-later
// Native queued-output boundary for MiniLang-mixed stereo ambient PCM.
package mq3.platform.playable_ambient

extern function initNative(rate as i32) from "playable_ambient.dll" symbol "playable_ambient_init" returns i32
extern function canSubmitNative() from "playable_ambient.dll" symbol "playable_ambient_can_submit" returns i32
extern function submitNative(samples as ptr,count as i32) from "playable_ambient.dll" symbol "playable_ambient_submit" returns i32
extern function stopNative() from "playable_ambient.dll" symbol "playable_ambient_stop" returns void
extern function shutdownNative() from "playable_ambient.dll" symbol "playable_ambient_shutdown" returns void

function init(rate) if initNative(rate)==0 then return error(7630,"ambient output initialization failed") end if;return void end function
function canSubmit() return canSubmitNative()!=0 end function
function submit(samples)
  if samples==void or len(samples)<4 or (len(samples)&3)!=0 then return error(7631,"invalid stereo ambient chunk") end if
  result=submitNative(nativeBytesPtr(samples),len(samples));if result==2 then return false end if
  if result!=1 then return error(7631,"ambient output submission failed") end if;return true
end function
function stop() stopNative();return void end function
function shutdown() shutdownNative();return void end function
