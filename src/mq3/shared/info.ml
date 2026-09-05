// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// q_shared.c info-string lookup and validation; strings own their bytes instead
// of aliasing the original two alternating static return buffers.
package mq3.shared.info
import std.string as strings

function textBytes(text)
  if text == void then return error(493,"NULL info string") end if
  data = bytes(text)
  for each part in data
    if part == 0 then return error(493,"Info string contains embedded NUL") end if
  end for
  return data
end function
function copy(text,capacity)
  if capacity < 1 then return error(493,"Info copy has no native storage") end if
  data = textBytes(text)
  if len(data) >= capacity then return decode(slice(data,0,capacity-1)) end if
  return text
end function
function value(info,key)
  if info == void or key == void then return "" end if
  if len(textBytes(info)) >= 8192 then return error(493,"Info_ValueForKey: oversize infostring") end if
  textBytes(key); fields = strings.split(info,"\\"); index = 0
  if len(fields) > 0 and fields[0] == "" then index = 1 end if
  while index+1 < len(fields)
    if strings.equalsIgnoreCaseAscii(fields[index],key) then return fields[index+1] end if
    index = index+2
  end while
  return ""
end function
function valid(info)
  textBytes(info)
  // Original Info_Validate only excludes these two bytes, not malformed pairs.
  return strings.indexOf(info,"\"",0) < 0 and strings.indexOf(info,";",0) < 0
end function
