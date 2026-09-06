// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// G_LogPrintf with a payload already formatted by its original game caller.
package mq3.game.logging
import mq3.compat.numeric as n

function logDivide(value,divisor)
  if value < 0 then return 0-n.quotient(0-value,divisor) end if
  return n.quotient(value,divisor)
end function
function write(level,payload)
  if payload is void then return error(486,"Game log requires a formatted payload") end if
  data = bytes(payload)
  // The original unbounded vsprintf writes at offset 7 in string[1024].
  // Embedded NUL is allowed, but bytes after it still consume formatter space.
  if len(data) > 1016 then return error(486,"Game log payload exceeds native format storage") end if
  seconds = logDivide(n.i32(level.time),1000); minutes = logDivide(seconds,60)
  seconds = seconds-minutes*60; tens = logDivide(seconds,10); seconds = seconds-tens*10
  minuteText = str(minutes)
  while len(minuteText) < 3
    minuteText = " "+minuteText
  end while
  prefix = bytes(minuteText+":"+str(tens)+str(seconds)+" ")
  // Native always inserts at byte 7, including longer negative/large stamps.
  prefix = slice(prefix,0,7); length = 0
  while length < len(data) and data[length] != 0
    length = length+1
  end while
  visible = slice(data,0,length)
  if n.i32(level.dedicated) != 0 then
    if level.gamePrintFn == void then return error(486,"Dedicated game log requires console delivery") end if
    level.gamePrintFn(level,decode(visible))
  end if
  // A console callback can change the live handle; the timestamp stays local.
  if n.i32(level.logFile) == 0 then return void end if
  if level.logWriteFn == void then return error(486,"Game log requires file delivery") end if
  level.logWriteFn(level,prefix+visible,n.i32(level.logFile)); return void
end function
