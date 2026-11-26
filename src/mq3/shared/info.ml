// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// q_shared.c info-string lookup, mutation and validation; strings own their bytes instead
// of aliasing the original two alternating static return buffers.
package mq3.shared.info
import std.string as strings

/// Compute text bytes in shared.info; the normal completion returns `data`.
///
/// Validation failures include `NULL info string`; `Info string contains embedded NUL`.
/// @param text Text used in `bytes(text)` and `(text == void)`.
function textBytes(text)
  if text == void then return error(493,"NULL info string") end if
  data = bytes(text)
  for each part in data
    if part == 0 then return error(493,"Info string contains embedded NUL") end if
  end for
  return data
end function
/// Copy info in shared.info; the normal completion returns `text`.
///
/// Validation failures include `Info copy has no native storage`.
/// @param text Text passed as `text` to `mq3.shared.info.textBytes`.
/// @param capacity Capacity used in `(capacity < 1)` and `(capacity - 1)`.
function copy(text,capacity)
  if capacity < 1 then return error(493,"Info copy has no native storage") end if
  data = textBytes(text)
  if len(data) >= capacity then return decode(slice(data,0,capacity-1)) end if
  return text
end function
/// Compute value in shared.info; the normal completion returns `""`.
///
/// Validation failures include `Info_ValueForKey: oversize infostring`.
/// @param info Text passed as `text` to `mq3.shared.info.textBytes`.
/// @param key Text passed as `text` to `mq3.shared.info.textBytes`.
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
/// Validate info in shared.info; the normal completion returns `((strings.indexOf(info, "\"", 0) < 0) and (strings.indexOf(info, ";", 0) < 0))`.
/// @param info Text passed as `text` to `mq3.shared.info.textBytes`.
function valid(info)
  textBytes(info)
  // Original Info_Validate only excludes these two bytes, not malformed pairs.
  return strings.indexOf(info,"\"",0) < 0 and strings.indexOf(info,";",0) < 0
end function

/// Remove key in shared.info; the normal completion returns `info`.
///
/// Validation failures include `Info_RemoveKey: oversize infostring`.
/// @param info Text passed as `text` to `mq3.shared.info.textBytes`.
/// @param key Text passed as `text` to `mq3.shared.info.textBytes`.
function removeKey(info,key)
  data = textBytes(info)
  if len(data) >= 1024 then return error(493,"Info_RemoveKey: oversize infostring") end if
  textBytes(key)
  if strings.indexOf(key,"\\",0) >= 0 then return info end if
  index = 0
  while index < len(data)
    start = index
    if data[index] == 92 then index = index+1 end if
    keyStart = index
    while index < len(data) and data[index] != 92
      index = index+1
    end while
    // A dangling key without the value delimiter is left untouched.
    if index == len(data) then return info end if
    found = decode(slice(data,keyStart,index-keyStart)); index = index+1
    while index < len(data) and data[index] != 92
      index = index+1
    end while
    // Remove only the first match, case sensitively; preserve malformed suffixes.
    if found == key then return decode(slice(data,0,start))+decode(slice(data,index,len(data)-index)) end if
  end while
  return info
end function

/// Compute info diagnostic in shared.info.
/// @param context Context used in `diagnosticFn(context, message)`.
/// @param diagnosticFn Callback invoked for diagnostic; the call sites below define the callback arguments.
/// @param message Message used in `diagnosticFn(context, message)`.
function infoDiagnostic(context,diagnosticFn,message)
  if diagnosticFn != void then diagnosticFn(context,message) end if
  return void
end function

/// Set value in shared.info; the normal completion returns `(prefix + remaining)`.
///
/// Validation failures include `Info_SetValueForKey: oversize infostring`; `Info value would overflow original Com_sprintf scratch storage`; `Info value would write beyond original 1024-byte storage`.
/// @param info Text passed as `text` to `mq3.shared.info.textBytes`.
/// @param key Text passed as `text` to `mq3.shared.info.textBytes`.
/// @param newValue Text passed as `text` to `mq3.shared.info.textBytes`.
/// @param context Context passed as `context` to `mq3.shared.info.infoDiagnostic`.
/// @param diagnosticFn Diagnostic fn passed as `diagnosticFn` to `mq3.shared.info.infoDiagnostic`.
function setValue(info,key,newValue,context,diagnosticFn)
  // Return the new string. An optional sink receives each original Com_Printf
  // diagnostic as diagnosticFn(context,message); the string API owns no host.
  if len(textBytes(info)) >= 1024 then return error(493,"Info_SetValueForKey: oversize infostring") end if
  textBytes(key); textBytes(newValue)
  if strings.indexOf(key,"\\",0) >= 0 or strings.indexOf(newValue,"\\",0) >= 0 then
    infoDiagnostic(context,diagnosticFn,"Can't use keys or values with a \\\n"); return info
  end if
  if strings.indexOf(key,";",0) >= 0 or strings.indexOf(newValue,";",0) >= 0 then
    infoDiagnostic(context,diagnosticFn,"Can't use keys or values with a semicolon\n"); return info
  end if
  if strings.indexOf(key,"\"",0) >= 0 or strings.indexOf(newValue,"\"",0) >= 0 then
    infoDiagnostic(context,diagnosticFn,"Can't use keys or values with a \"\n"); return info
  end if
  remaining = removeKey(info,key)
  if newValue == "" then return remaining end if
  prefix = "\\"+key+"\\"+newValue; count = len(bytes(prefix))
  if count >= 32000 then return error(493,"Info value would overflow original Com_sprintf scratch storage") end if
  if count >= 1024 then
    infoDiagnostic(context,diagnosticFn,"Com_sprintf: overflow of "+str(count)+" in 1024\n")
    prefix = copy(prefix,1024)
  end if
  count = len(bytes(prefix))+len(bytes(remaining))
  if count > 1024 then
    // The original removes the old key before reporting this failure.
    infoDiagnostic(context,diagnosticFn,"Info string length exceeded\n"); return remaining
  end if
  // The original's > comparison permits an out-of-bounds terminating NUL here.
  if count == 1024 then return error(493,"Info value would write beyond original 1024-byte storage") end if
  return prefix+remaining
end function
