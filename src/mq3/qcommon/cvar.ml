// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Registry semantics adapted from code/qcommon/cvar.c.
package mq3.qcommon.cvar
import mq3.compat.numeric as n
import std.string as strings

extern function atof(text as cstr) from "ucrtbase.dll" returns double
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32

const ARCHIVE = 1
const USERINFO = 2
const SERVERINFO = 4
const SYSTEMINFO = 8
const INIT = 16
const LATCH = 32
const ROM = 64
const USER_CREATED = 128
const TEMP = 256
const CHEAT = 512
const NORESTART = 1024

struct Cvar
  name
  string
  resetString
  latchedString
  flags
  modified
  modificationCount
  value
  integer
  index
end struct

struct Registry
  variables
  modifiedFlags
  numIndexes
  indexes
end struct

struct VmCvar
  handle
  modificationCount
  value
  integer
  string
end struct
function createVm()
  return VmCvar(0,0,0.0,0,"")
end function
function updateVm(registry,snapshot)
  if snapshot == void then return error(3302,"Cvar_Update NULL snapshot") end if
  if snapshot.handle < 0 or snapshot.handle >= registry.numIndexes then return error(3302,"Cvar_Update handle out of range") end if
  variable = registry.indexes[snapshot.handle]
  if variable.modificationCount == snapshot.modificationCount or variable.string == void then return void end if
  data = bytes(variable.string)
  if len(data) > 255 then return error(3302,"Cvar_Update exceeds native string storage") end if
  for each part in data
    if part == 0 then return error(3302,"Cvar_Update embedded NUL") end if
  end for
  snapshot.modificationCount = variable.modificationCount; snapshot.string = variable.string
  snapshot.value = variable.value; snapshot.integer = variable.integer; return void
end function
function registerVm(registry,snapshot,name,defaultValue,flags)
  variable = get(registry,name,defaultValue,flags)
  if snapshot == void then return void end if
  snapshot.handle = variable.index; snapshot.modificationCount = -1
  return updateVm(registry,snapshot)
end function

function validName(name)
  return strings.indexOf(name, "\\", 0) < 0 and strings.indexOf(name, "\"", 0) < 0 and strings.indexOf(name, ";", 0) < 0
end function

function find(registry, name)
  for each variable in registry.variables
    if stringEqualsIgnoreCaseAscii(variable.name, name) then return variable end if
  end for
  return void
end function

function get(registry, name, value, flags)
  if name is void or value is void then return error(3302, "Cvar_Get NULL parameter") end if
  if not validName(name) then name = "BADNAME" end if
  variable = find(registry, name)
  if variable is not void then
    if (variable.flags & USER_CREATED) != 0 and (flags & USER_CREATED) == 0 and len(value) > 0 then
      variable.flags = variable.flags & ~USER_CREATED
      variable.resetString = value
      registry.modifiedFlags = registry.modifiedFlags | flags
    end if
    variable.flags = variable.flags | flags
    if len(variable.resetString) == 0 then variable.resetString = value end if
    if variable.latchedString is not void then
      pending = variable.latchedString
      variable.latchedString = void
      set2(registry, name, pending, true)
    end if
    return variable
  end if
  if registry.numIndexes >= 1024 then return error(3302, "MAX_CVARS") end if
  variable = Cvar(name, value, value, void, flags, true, 1, n.f32(atof(value)), atoi(value), registry.numIndexes)
  registry.numIndexes = registry.numIndexes + 1
  registry.indexes = registry.indexes+[variable]
  registry.variables = [variable] + registry.variables
  return variable
end function

function set2(registry, name, value, force)
  if not validName(name) then name = "BADNAME" end if
  variable = find(registry, name)
  if variable is void then
    if value is void then return void end if
    flags = 0
    if not force then flags = USER_CREATED end if
    return get(registry, name, value, flags)
  end if
  if value is void then value = variable.resetString end if
  if value == variable.string then return variable end if
  registry.modifiedFlags = registry.modifiedFlags | variable.flags
  if not force then
    if (variable.flags & (ROM | INIT)) != 0 then return variable end if
    if (variable.flags & LATCH) != 0 then
      if variable.latchedString is not void then
        if value == variable.latchedString then return variable end if
      end if
      variable.latchedString = value
      variable.modified = true
      variable.modificationCount = n.add32(variable.modificationCount,1)
      return variable
    end if
    cheats = find(registry, "sv_cheats")
    if (variable.flags & CHEAT) != 0 and cheats is not void and cheats.integer == 0 then return variable end if
  else
    variable.latchedString = void
  end if
  variable.modified = true
  variable.modificationCount = n.add32(variable.modificationCount,1)
  variable.string = value
  variable.value = n.f32(atof(value))
  variable.integer = atoi(value)
  return variable
end function

function create()
  registry = Registry([], 0, 0, [])
  get(registry, "sv_cheats", "1", ROM | SYSTEMINFO)
  return registry
end function

function setCheatState(registry)
  for each variable in registry.variables
    if (variable.flags & CHEAT) != 0 then
      variable.latchedString = void
      if variable.resetString != variable.string then set2(registry, variable.name, variable.resetString, true) end if
    end if
  end for
end function
