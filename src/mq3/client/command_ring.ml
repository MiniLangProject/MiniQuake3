// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Shared CL_CreateNewCommands / CL_GetUserCmd command-ring policy.
package mq3.client.command_ring

import mq3.compat.numeric as n

const CA_PRIMED=7
const CMD_BACKUP=64
const CMD_MASK=63

/// Stores command ring advance result record, including `created`, `frameMsec`, `oldFrameTime`, `commandNumber`, `slot`.
struct AdvanceResult created frameMsec oldFrameTime commandNumber slot end struct

/// Creates an array from `CMD_BACKUP, void` for command ring `create`.
function create() return array(CMD_BACKUP,void) end function

/// Calls `mq3.client.command_ring.AdvanceResult`, `mq3.compat.numeric.i32` from command ring `advance`. The final path returns `AdvanceResult(true,msec,frameTime,number,number&CMD_MASK)`.
/// @param connectionState Value used by `if connectionState<CA_PRIMED then return AdvanceResult(false,0,oldFrameTime,commandNumber,-1) end if`.
/// @param frameTime Value used by `msec=n.i32(frameTime-oldFrameTime)`.
/// @param oldFrameTime Value used by `if connectionState<CA_PRIMED then return AdvanceResult(false,0,oldFrameTime,commandNumber,-1) end if`.
/// @param commandNumber Value used by `if connectionState<CA_PRIMED then return AdvanceResult(false,0,oldFrameTime,commandNumber,-1) end if`.
function advance(connectionState,frameTime,oldFrameTime,commandNumber)
  if connectionState<CA_PRIMED then return AdvanceResult(false,0,oldFrameTime,commandNumber,-1) end if
  msec=n.i32(frameTime-oldFrameTime);if msec>200 then msec=200 end if
  number=n.i32(commandNumber+1)
  return AdvanceResult(true,msec,frameTime,number,number&CMD_MASK)
end function

/// Updates `commands[commandNumber&CMD_MASK]` during command ring `store`.
/// @param commands Mutable sequence; this routine writes `commands[commandNumber&CMD_MASK]`.
/// @param commandNumber Value used by `commands[commandNumber&CMD_MASK]=command`.
/// @param command Value used by `commands[commandNumber&CMD_MASK]=command`.
function store(commands,commandNumber,command)
  if commands==void or len(commands)!=CMD_BACKUP then return error(7730,"client command ring: invalid storage") end if
  commands[commandNumber&CMD_MASK]=command;return command
end function

// A future command is a protocol/engine error in Baseq3. A command that has
// already wrapped out of the 64-entry ring is an ordinary cache miss.
/// @param commands Sequence read at `commands[commandNumber&CMD_MASK]`.
/// @param currentNumber Value used by `if commandNumber>currentNumber then return error(7730,"client command ring: future command") end if`.
/// @param commandNumber Value used by `if commandNumber>currentNumber then return error(7730,"client command ring: future command") end if`.
function get(commands,currentNumber,commandNumber)
  if commands==void or len(commands)!=CMD_BACKUP then return error(7730,"client command ring: invalid storage") end if
  if commandNumber>currentNumber then return error(7730,"client command ring: future command") end if
  if commandNumber<=n.i32(currentNumber-CMD_BACKUP) then return void end if
  return commands[commandNumber&CMD_MASK]
end function

/// Updates `commands[index]` during command ring `clear`.
/// @param commands Mutable sequence; this routine writes `commands[index]`.
function clear(commands)
  if commands==void or len(commands)!=CMD_BACKUP then return error(7730,"client command ring: invalid storage") end if
  for index=0 to CMD_BACKUP-1 commands[index]=void end for;return void
end function
