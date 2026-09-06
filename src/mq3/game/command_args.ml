// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Cmd_ArgvBuffer/trap_Argv and Baseq3 g_cmds.c ConcatArgs over owned argv.
package mq3.game.command_args
import mq3.shared.info as infoStrings

function argument(argv,index,capacity)
  if capacity < 1 then return error(498,"Command argument has no native storage") end if
  if index < 0 or index >= len(argv) then return "" end if
  return infoStrings.copy(argv[index],capacity)
end function
function concat(argv,start)
  result = ""; length = 0; index = start
  while index < len(argv)
    part = argument(argv,index,1024); size = len(bytes(part))
    // Native checks before copying the token, then adds its separating space.
    // A rejected later token can consequently leave a trailing space behind.
    if length+size >= 1023 then break end if
    result = result+part; length = length+size
    if index != len(argv)-1 then result = result+" "; length = length+1 end if
    index = index+1
  end while
  return result
end function
