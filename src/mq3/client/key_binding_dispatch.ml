// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// CL_KeyEvent / CL_AddKeyUpCommands binding expansion.
package mq3.client.key_binding_dispatch

import std.string as bindingStrings

struct Command text action button down key time end struct

function emit(segment,key,time,down)
  if len(segment)>0 and segment[0]=="+" then
    action=bindingStrings.trim(decode(slice(bytes(segment),1,len(bytes(segment))-1)));prefix="+";if not down then prefix="-" end if
    return Command(prefix+action+" "+str(key)+" "+str(time)+"\n",action,true,down,key,time)
  end if
  return Command(segment+"\n",segment,false,down,key,time)
end function

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
