// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// g_mem.c arena and g_spawn.c G_NewString. Module-owned byte storage.
package mq3.game.memory

const POOLSIZE = 262144
struct State
  pool
  allocPoint
  debugAlloc
end struct
struct Block
  state
  offset
  size
end struct
function get(level)
  if level.memoryState == void then level.memoryState = State(bytes(POOLSIZE,0),0,0) end if
  return level.memoryState
end function
function init(level)
  get(level).allocPoint = 0; return void
end function
function debugValue(level,state)
  if level.gameCvars != void then
    for each row in level.gameCvars.rows
      if row.vmName == "g_debugAlloc" then return row.vm.integer end if
    end for
    return error(475,"Game memory requires the g_debugAlloc VM Cvar")
  end if
  return state.debugAlloc
end function
function memoryPrint(level,text)
  if level.gamePrintFn == void then return error(475,"Game memory requires a G_Printf sink") end if
  level.gamePrintFn(level,text); return void
end function
function allocate(level,size)
  state = get(level)
  // Negative sizes and signed-overflow inputs can move the native arena outside
  // its object. Accept the original's defined, nonnegative allocation domain.
  if typeof(size) != "int" or size < 0 or size > 2147483616 then return error(475,"Invalid game allocation size") end if
  if state.allocPoint < 0 or state.allocPoint > POOLSIZE or (state.allocPoint & 31) != 0 then return error(475,"Invalid game arena position") end if
  if state.allocPoint+size > 2147483647 then return error(475,"Game allocation would overflow signed arithmetic") end if
  rounded = (size+31) & 0xffffffe0
  if debugValue(level,state) != 0 then
    memoryPrint(level,"G_Alloc of "+str(size)+" bytes ("+str(POOLSIZE-state.allocPoint-rounded)+" left)\n")
  end if
  if state.allocPoint+size > POOLSIZE then return error(475,"G_Alloc: failed on allocation of "+str(size)+" bytes\n") end if
  block = Block(state,state.allocPoint,size); state.allocPoint = state.allocPoint+rounded
  return block
end function
function status(level)
  state = get(level); memoryPrint(level,"Game memory status: "+str(state.allocPoint)+" out of "+str(POOLSIZE)+" bytes allocated\n")
  return void
end function
function readByte(block,index)
  if typeof(index) != "int" or index < 0 or index >= block.size then return error(475,"Game block read outside allocation") end if
  return block.state.pool[block.offset+index]
end function
function writeByte(block,index,value)
  if typeof(index) != "int" or index < 0 or index >= block.size then return error(475,"Game block write outside allocation") end if
  if typeof(value) != "int" or value < 0 or value > 255 then return error(475,"Invalid game arena byte") end if
  block.state.pool[block.offset+index] = value; return void
end function
function newStringBlock(level,value)
  if typeof(value) != "string" then return error(475,"G_NewString requires a string") end if
  data = bytes(value); length = 0
  while length < len(data) and data[length] != 0
    length = length+1
  end while
  block = allocate(level,length+1); i = 0; written = 0
  while i <= length
    ch = 0
    if i < length then ch = data[i] end if
    if ch == 92 and i < length then
      i = i+1; escaped = 0
      if i < length then escaped = data[i] end if
      ch = 92
      if escaped == 110 then ch = 10 end if
    end if
    block.state.pool[block.offset+written] = ch; written = written+1; i = i+1
  end while
  // A terminal backslash consumes the native NUL without copying a terminator.
  if block.state.pool[block.offset+written-1] != 0 then return error(475,"Unterminated G_NewString escape") end if
  return block
end function
function blockString(block)
  length = 0
  while length < block.size
    if block.state.pool[block.offset+length] == 0 then return decode(slice(block.state.pool,block.offset,length)) end if
    length = length+1
  end while
  return error(475,"Unterminated game arena string")
end function
function newString(level,value)
  return blockString(newStringBlock(level,value))
end function
