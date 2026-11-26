// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_KeyEvent / CL_AddKeyUpCommands binding expansion.
package mq3.client.key_binding_dispatch

import std.string as bindingStrings

/// Stores key binding dispatch command data, including `text`, `action`, `button`, `down`, `key`, `time`.
struct Command text action button down key time end struct

/// Calls `std.string.trim`, `decode`, `slice` and additional helpers from key binding dispatch `emit`. The final path returns `Command(segment+"\n",segment,false,down,key,time)`.
/// @param segment Sequence read at `segment[0]`.
/// @param key Key or control identifier used to select the corresponding key binding dispatch entry.
/// @param time Value used by `return Command(prefix+action+" "+str(key)+" "+str(time)+"\n",action,true,down,key,time)`.
/// @param down Whether this event presses the key/button; false represents its release.
function emit(segment,key,time,down)
  if len(segment)>0 and segment[0]=="+" then
    action=bindingStrings.trim(decode(slice(bytes(segment),1,len(bytes(segment))-1)));prefix="+";if not down then prefix="-" end if
    return Command(prefix+action+" "+str(key)+" "+str(time)+"\n",action,true,down,key,time)
  end if
  return Command(segment+"\n",segment,false,down,key,time)
end function

/// Calls `decode` from key binding dispatch `segments`. The final path returns `result`.
/// @param binding Command text associated with an input key.
function segments(binding)
  raw=bytes(binding);result=[];current=[];index=0
  while index<=len(raw)
    value=0;if index<len(raw) then value=raw[index] end if
    if index==len(raw) or value==59 then
      result=result+[decode(bytes(current))];current=[];index=index+1
      while index<len(raw) and (raw[index]<=32 or raw[index]==59) index=index+1 end while
    else current=current+[value];index=index+1 end if
  end while
  return result
end function

/// Calls `mq3.client.key_binding_dispatch.emit`, `mq3.client.key_binding_dispatch.segments` from key binding dispatch `commands`. The final path returns `result`.
/// @param binding Command text associated with an input key.
/// @param key Key or control identifier used to select the corresponding key binding dispatch entry.
/// @param down Whether this event presses the key/button; false represents its release.
/// @param time Value used by `if key<0 or key>=256 or typeof(time)!="int" or time<0 then return error(7732,"key binding dispatch: invalid event") end if`.
function commands(binding,key,down,time)
  if binding==void or binding=="" then return [] end if
  if key<0 or key>=256 or typeof(time)!="int" or time<0 then return error(7732,"key binding dispatch: invalid event") end if
  if down and binding[0]!="+" then return [emit(binding,key,time,true)] end if
  result=[];keyevent=false
  for each segment in segments(binding)
    if len(segment)>0 and segment[0]=="+" then result=result+[emit(segment,key,time,down)];keyevent=true
    else if down or keyevent then result=result+[emit(segment,key,time,down)] end if
  end for
  return result
end function
