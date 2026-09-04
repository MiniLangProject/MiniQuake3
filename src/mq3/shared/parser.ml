// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// COM_ParseExt from code/game/q_shared.c. Byte-based C string semantics.
package mq3.shared.parser

struct Parser
  data
  offset
  line
end struct

function create(text)
  if typeof(text) == "string" then text = bytes(text) end if
  return Parser(text, 0, 0)
end function

function at(state, offset)
  if offset < 0 or offset >= len(state.data) then return 0 end if
  return state.data[offset]
end function

function parseExt(state, allowLineBreaks)
  if state.offset < 0 then return "" end if
  pos = state.offset
  newlines = false
  ch = 0
  while true
    while at(state, pos) <= 32
      ch = at(state, pos)
      if ch == 0 then state.offset = -1; return "" end if
      if ch == 10 then state.line = state.line + 1; newlines = true end if
      pos = pos + 1
    end while
    if newlines and not allowLineBreaks then state.offset = pos; return "" end if
    ch = at(state, pos)
    if ch == 47 and at(state, pos + 1) == 47 then
      pos = pos + 2
      while at(state, pos) != 0 and at(state, pos) != 10
        pos = pos + 1
      end while
    else if ch == 47 and at(state, pos + 1) == 42 then
      pos = pos + 2
      while at(state, pos) != 0 and (at(state, pos) != 42 or at(state, pos + 1) != 47)
        pos = pos + 1
      end while
      if at(state, pos) != 0 then pos = pos + 2 end if
    else
      break
    end if
  end while
  token = bytes(1024, 0)
  length = 0
  if ch == 34 then
    pos = pos + 1
    while true
      ch = at(state, pos)
      pos = pos + 1
      if ch == 34 or ch == 0 then state.offset = pos; return decode(slice(token, 0, length)) end if
      if length >= 1023 then return error(3301, "quoted token exceeds safe C buffer capacity") end if
      token[length] = ch
      length = length + 1
    end while
  end if
  while true
    if length < 1024 then token[length] = ch; length = length + 1 end if
    pos = pos + 1
    ch = at(state, pos)
    // The original counts this newline again in SkipWhitespace on the next call.
    if ch == 10 then state.line = state.line + 1 end if
    if ch <= 32 then break end if
  end while
  if length == 1024 then length = 0 end if
  state.offset = pos
  return decode(slice(token, 0, length))
end function
