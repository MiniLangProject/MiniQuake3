// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// COM_ParseExt from code/game/q_shared.c. Byte-based C string semantics.
package mq3.shared.parser

/// Parser record for shared.parser, containing `data`, `offset`, `line`.
struct Parser
  data
  offset
  line
end struct

/// Create parser in shared.parser; the normal completion returns `Parser(text, 0, 0)`.
/// @param text Initial `data` field stored in the returned or constructed `mq3.shared.parser.Parser` record.
function create(text)
  if typeof(text) == "string" then text = bytes(text) end if
  return Parser(text, 0, 0)
end function

/// Compute at in shared.parser; the normal completion returns `state.data[offset]`.
/// @param state Record exposing `data`.
/// @param offset Zero-based index into `state.data`.
function at(state, offset)
  if offset < 0 or offset >= len(state.data) then return 0 end if
  return state.data[offset]
end function

/// Parse ext in shared.parser; the normal completion returns `decode(slice(token, 0, length))`.
///
/// Validation failures include `quoted token exceeds safe C buffer capacity`.
/// Direct state writes: `state.offset`, `state.line`.
/// @param state Record exposing `offset`, `line`. Updated in place: `offset`, `line`.
/// @param allowLineBreaks Allow line breaks used in `(newlines and not allowLineBreaks)`.
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
