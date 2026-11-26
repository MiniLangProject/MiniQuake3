// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Registry semantics adapted from code/qcommon/cvar.c.
package mq3.qcommon.cvar
import mq3.compat.numeric as n
import mq3.compat.textnumbers as textnumbers
import mq3.shared.q_shared_runtime as shared
import std.string as strings

/// Convert a C-string floating-point numeric prefix for qcommon.cvar.
/// @param text Null-terminated narrow numeric text accepted by the C runtime.
/// @returns The converted double; zero when no number is recognized.
extern function atof(text as cstr) from "ucrtbase.dll" returns double
/// Convert a C-string signed decimal integer prefix for qcommon.cvar.
/// @param text Null-terminated narrow numeric text accepted by the C runtime.
/// @returns The converted signed integer; zero when no number is recognized.
extern function atoi(text as cstr) from "ucrtbase.dll" returns i32

/// Configuration-variable flag requesting persistence in the user configuration file.
const ARCHIVE = 1
/// Configuration-variable flag including the value in client user information.
const USERINFO = 2
/// Configuration-variable flag including the value in server information.
const SERVERINFO = 4
/// Configuration-variable flag including the value in replicated system information.
const SYSTEMINFO = 8
/// Configuration-variable flag restricting changes to startup initialization.
const INIT = 16
/// Configuration-variable flag deferring a changed value until the relevant restart.
const LATCH = 32
/// Configuration-variable flag preventing ordinary user modification.
const ROM = 64
/// Configuration-variable flag marking a variable created by the user.
const USER_CREATED = 128
/// Configuration-variable flag marking a non-persistent temporary value.
const TEMP = 256
/// Configuration-variable flag restricting changes while cheats are disabled.
const CHEAT = 512
/// Configuration-variable flag preserving the variable across registry restart.
const NORESTART = 1024
/// Maximum number of registered configuration variables.
const MAX_CVARS = 1024
/// Number of hash buckets used for file-name lookup.
const FILE_HASH_SIZE = 256
/// Maximum text length accepted for a configuration-variable value.
const MAX_CVAR_VALUE_STRING = 256

/// Cvar record for qcommon.cvar, containing `name`, `string`, `resetString`, `latchedString`, `flags`, `modified`, and 4 further fields.
struct Cvar
  /// Canonical configuration-variable name used for registry lookup.
  name
  /// Current text value of the configuration variable.
  string
  /// Default text restored when configuration variables are reset.
  resetString
  /// Pending text value to apply when a latched configuration change takes effect.
  latchedString
  /// Combined configuration-variable policy flags, such as archive, latch, and cheat.
  flags
  /// Set each time the cvar is changed.
  modified
  /// Incremented each time the cvar is changed.
  modificationCount
  /// Cached floating-point conversion of the current string value.
  value
  /// Integer representation of the configured or parsed value.
  integer
  /// Stable registry index used by VM-visible variable handles.
  index
end struct

/// Registry record for qcommon.cvar, containing `variables`, `modifiedFlags`, `numIndexes`, `indexes`.
struct Registry
  /// Registered configuration-variable records.
  variables
  /// Bit mask of configuration-variable categories modified since the last clear.
  modifiedFlags
  /// Number of index elements describing this surface.
  numIndexes
  /// Stable index table used to resolve VM-visible variable handles.
  indexes
end struct

/// VmCvar record for qcommon.cvar, containing `handle`, `modificationCount`, `value`, `integer`, `string`, `copyGeneration`.
struct VmCvar
  /// Registry handle identifying the corresponding engine configuration variable.
  handle
  /// Number of modification recorded by this state.
  modificationCount
  /// Floating-point interpretation of the variable's current text.
  value
  /// Integer representation of the configured or parsed value.
  integer
  /// Current text copied into the VM-visible configuration-variable record.
  string
  /// Generation marker used to detect whether VM-facing data needs to be refreshed.
  copyGeneration
end struct
/// Create `mq3.qcommon.cvar.VmCvar` with handle=0; modificationCount=0; value=0.0; integer=0; string=""; copyGeneration=0.
function createVm()
  return VmCvar(0,0,0.0,0,"",0)
end function
/// Update vm in qcommon.cvar.
///
/// Validation failures include `Cvar_Update NULL snapshot`; `Cvar_Update handle out of range`; `Cvar_Update exceeds native string storage`.
/// Direct state writes: `snapshot.modificationCount`, `snapshot.string`, `snapshot.value`, `snapshot.integer`, `snapshot.copyGeneration`.
/// @param registry Record exposing `numIndexes`, `indexes`.
/// @param snapshot Record exposing `handle`, `modificationCount`, `copyGeneration`. Updated in place: `modificationCount`, `string`, `value`, `integer`, `copyGeneration`.
function updateVm(registry,snapshot)
  if snapshot == void then return error(3302,"Cvar_Update NULL snapshot") end if
  if snapshot.handle < 0 or snapshot.handle >= registry.numIndexes then return error(3302,"Cvar_Update handle out of range") end if
  variable = registry.indexes[snapshot.handle]
  if variable.modificationCount == snapshot.modificationCount or variable.string == void then return void end if
  // The original advances the counter even when the following size check drops.
  // The old buffer/value and copy generation survive that failed update.
  snapshot.modificationCount = variable.modificationCount
  data = bytes(variable.string)
  if len(data) > 255 then return error(3302,"Cvar_Update exceeds native string storage") end if
  for each part in data
    if part == 0 then return error(3302,"Cvar_Update embedded NUL") end if
  end for
  snapshot.string = variable.string
  snapshot.value = variable.value; snapshot.integer = variable.integer
  // Registration can force the same visible value/counter to be copied again.
  // Byte-buffer consumers must distinguish that full copy from a no-op update.
  snapshot.copyGeneration = snapshot.copyGeneration+1; return void
end function
/// Register vm in qcommon.cvar; the normal completion returns `updateVm(registry, snapshot)`.
///
/// Direct state writes: `snapshot.handle`, `snapshot.modificationCount`.
/// @param registry Registry passed as `registry` to `mq3.qcommon.cvar.get`.
/// @param snapshot Updated in place: `handle`, `modificationCount`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.get`.
/// @param defaultValue Value passed as `value` to `mq3.qcommon.cvar.get`.
/// @param flags Flags passed as `flags` to `mq3.qcommon.cvar.get`.
function registerVm(registry,snapshot,name,defaultValue,flags)
  variable = get(registry,name,defaultValue,flags)
  if snapshot == void then return void end if
  snapshot.handle = variable.index; snapshot.modificationCount = -1
  return updateVm(registry,snapshot)
end function

// generateHashValue: the original uses the ASCII-lowercased byte multiplied by
// its one-based position plus 118, then masks into 256 buckets.
/// @param name Name used in `bytes(name)` and `(name == void)`.
function generateHashValue(name)
  if name==void then return 0 end if
  data=bytes(name);hash=0;if len(data)==0 then return 0 end if
  for index=0 to len(data)-1
    letter=data[index];if letter>=65 and letter<=90 then letter=letter+32 end if
    hash=n.add32(hash,n.mul32(letter,index+119))
  end for
  return hash&(FILE_HASH_SIZE-1)
end function

// Cvar_ValidateString
/// @param name Name used in `(name == void)` and `strings.indexOf(name, ";", 0)`.
function validName(name)
  if name==void then return false end if
  return strings.indexOf(name, "\\", 0) < 0 and strings.indexOf(name, "\"", 0) < 0 and strings.indexOf(name, ";", 0) < 0
end function

/// Find cvar in qcommon.cvar.
/// @param registry Record exposing `variables`.
/// @param name Name used in `stringEqualsIgnoreCaseAscii(variable.name, name)`.
function find(registry, name)
  for each variable in registry.variables
    if stringEqualsIgnoreCaseAscii(variable.name, name) then return variable end if
  end for
  return void
end function

// Cvar_VariableValue / Cvar_VariableIntegerValue / Cvar_VariableString.
/// @param registry Registry passed as `registry` to `mq3.qcommon.cvar.find`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.find`.
function variableValue(registry,name) variable=find(registry,name);if variable==void then return 0.0 end if;return variable.value end function
/// Compute variable integer value in qcommon.cvar; the normal completion returns `variable.integer`.
/// @param registry Registry passed as `registry` to `mq3.qcommon.cvar.find`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.find`.
function variableIntegerValue(registry,name) variable=find(registry,name);if variable==void then return 0 end if;return variable.integer end function
/// Compute variable string in qcommon.cvar; the normal completion returns `variable.string`.
/// @param registry Registry passed as `registry` to `mq3.qcommon.cvar.find`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.find`.
function variableString(registry,name) variable=find(registry,name);if variable==void then return "" end if;return variable.string end function
/// Compute bounded string in qcommon.cvar; the normal completion returns `decode(slice(data, 0, count))`.
///
/// Validation failures include `Cvar_VariableStringBuffer invalid size`.
/// @param value Value used in `bytes(value)`.
/// @param capacity Capacity used in `(capacity < 1)` and `(capacity - 1)`.
function boundedString(value,capacity)
  if capacity<1 then return error(3302,"Cvar_VariableStringBuffer invalid size") end if
  data=bytes(value);count=len(data);if count>=capacity then count=capacity-1 end if
  return decode(slice(data,0,count))
end function
/// Return `mq3.qcommon.cvar.boundedString(variableString(registry, name), capacity)` from `qcommon.cvar.variableStringBuffer`.
/// @param registry Registry passed as `registry` to `mq3.qcommon.cvar.variableString`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.variableString`.
/// @param capacity Capacity passed as `capacity` to `mq3.qcommon.cvar.boundedString`.
function variableStringBuffer(registry,name,capacity) return boundedString(variableString(registry,name),capacity) end function

// Cvar_CommandCompletion preserves the linked-list order (newest first).
/// @param registry Record exposing `variables`.
/// @param callback Callback invoked for callback; the call sites below define the callback arguments.
function commandCompletion(registry,callback)
  for each variable in registry.variables callback(variable.name) end for
  return void
end function

/// Get cvar in qcommon.cvar; the normal completion returns `variable`.
///
/// Validation failures include `Cvar_Get NULL parameter`; `MAX_CVARS`.
/// Direct state writes: `registry.modifiedFlags`, `registry.numIndexes`, `registry.indexes`, `registry.variables`.
/// @param registry Record exposing `modifiedFlags`, `numIndexes`, `indexes`, `variables`. Updated in place: `modifiedFlags`, `numIndexes`, `indexes`, `variables`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.validName`.
/// @param value Initial `string` field stored in the returned or constructed `mq3.qcommon.cvar.Cvar` record.
/// @param flags Initial `flags` field stored in the returned or constructed `mq3.qcommon.cvar.Cvar` record.
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
  if registry.numIndexes >= MAX_CVARS then return error(3302, "MAX_CVARS") end if
  variable = Cvar(name, value, value, void, flags, true, 1, n.f32(atof(value)), atoi(value), registry.numIndexes)
  registry.numIndexes = registry.numIndexes + 1
  registry.indexes = registry.indexes+[variable]
  registry.variables = [variable] + registry.variables
  return variable
end function

/// Set 2 in qcommon.cvar; the normal completion returns `variable`.
///
/// Direct state writes: `registry.modifiedFlags`.
/// @param registry Record exposing `modifiedFlags`. Updated in place: `modifiedFlags`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.validName`.
/// @param value Value passed as `value` to `mq3.qcommon.cvar.get`.
/// @param force Force operand used by `set2`; its reads are shown in the implementation.
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

// Public Cvar_Set/Cvar_SetLatched/Cvar_SetValue/Cvar_Reset entry points.
/// @param registry Registry passed as `registry` to `mq3.qcommon.cvar.set2`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.set2`.
/// @param value Value passed as `value` to `mq3.qcommon.cvar.set2`.
function set(registry,name,value) set2(registry,name,value,true);return void end function
/// Set latched in qcommon.cvar.
/// @param registry Registry passed as `registry` to `mq3.qcommon.cvar.set2`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.set2`.
/// @param value Value passed as `value` to `mq3.qcommon.cvar.set2`.
function setLatched(registry,name,value) set2(registry,name,value,false);return void end function
/// Set value in qcommon.cvar; the normal completion returns `set(registry, name, text)`.
/// @param registry Registry passed as `registry` to `mq3.qcommon.cvar.set`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.set`.
/// @param value Floating-point value to narrow to binary32.
function setValue(registry,name,value)
  value=n.f32(value);integer=n.trunc32(value);text=""
  if value==integer then text=str(integer) else text=textnumbers.fixed6(value) end if
  return set(registry,name,text)
end function
/// Reset cvar in qcommon.cvar.
/// @param registry Registry passed as `registry` to `mq3.qcommon.cvar.set2`.
/// @param name Name passed as `name` to `mq3.qcommon.cvar.set2`.
function reset(registry,name) set2(registry,name,void,false);return void end function

/// Create cvar in qcommon.cvar; the normal completion returns `registry`.
function create()
  registry = Registry([], 0, 0, [])
  get(registry, "sv_cheats", "1", ROM | SYSTEMINFO)
  return registry
end function

/// Set cheat state in qcommon.cvar.
/// @param registry Record exposing `variables`.
function setCheatState(registry)
  for each variable in registry.variables
    if (variable.flags & CHEAT) != 0 then
      variable.latchedString = void
      if variable.resetString != variable.string then set2(registry, variable.name, variable.resetString, true) end if
    end if
  end for
end function

// Cvar_InfoString and Cvar_InfoString_Big deliberately differ in insertion
// order because the unchanged q_shared helpers prepend small pairs and append
// big pairs.
/// @param registry Record exposing `variables`.
/// @param bit Bit used in `(variable.flags & bit)` and `((variable.flags & bit) != 0)`.
function infoString(registry,bit)
  text=""
  for each variable in registry.variables if (variable.flags&bit)!=0 then text=shared.info_SetValueForKey(text,variable.name,variable.string) end if end for
  return text
end function
/// Compute info string big in qcommon.cvar; the normal completion returns `text`.
/// @param registry Record exposing `variables`.
/// @param bit Bit used in `(variable.flags & bit)` and `((variable.flags & bit) != 0)`.
function infoStringBig(registry,bit)
  text=""
  for each variable in registry.variables if (variable.flags&bit)!=0 then text=shared.info_SetValueForKey_Big(text,variable.name,variable.string) end if end for
  return text
end function
/// Return `mq3.qcommon.cvar.boundedString(infoString(registry, bit), capacity)` from `qcommon.cvar.infoStringBuffer`.
/// @param registry Registry passed as `registry` to `mq3.qcommon.cvar.infoString`.
/// @param bit Bit passed as `bit` to `mq3.qcommon.cvar.infoString`.
/// @param capacity Capacity passed as `capacity` to `mq3.qcommon.cvar.boundedString`.
function infoStringBuffer(registry,bit,capacity) return boundedString(infoString(registry,bit),capacity) end function

// Cvar_Restart_f resets registered variables while preserving the stable
// numeric handle table used by vmCvar_t. User-created entries disappear from
// the linked-list view. The 1.32b source uses sizeof(var), where var is a
// pointer, so its x86 memset clears only the leading name pointer. Preserve
// that shipped behavior while avoiding access through the list.
/// @param registry Record exposing `variables`. Updated in place: `variables`.
function restart(registry)
  if registry==void then return error(3302,"Cvar_Restart NULL registry") end if
  survivors=[]
  for each variable in registry.variables
    if (variable.flags & (ROM | INIT | NORESTART)) != 0 then
      survivors=survivors+[variable]
    else if (variable.flags & USER_CREATED) != 0 then
      variable.name=void
    else
      // Cvar_Set is forced. Its early equal-string return deliberately leaves
      // a pending latch intact, matching the slightly surprising C behavior.
      set2(registry,variable.name,variable.resetString,true)
      survivors=survivors+[variable]
    end if
  end for
  registry.variables=survivors
  return void
end function

// Cvar_WriteVariables.  Registry.variables is kept in the original linked-list
// order (newest first), so this text is also byte ordered like q3config.cfg.
// The native routine formats each line through a 1024-byte stack buffer.
/// @param name Name used in `("seta " + name)` and `(("seta " + name) + " \"")`.
/// @param value Value used in `((("seta " + name) + " \"") + value)` and `(((("seta " + name) + " \"") + value) + "\"\n")`.
function configLine(name,value)
  text="seta "+name+" \""+value+"\"\n"
  data=bytes(text);if len(data)>1023 then return decode(slice(data,0,1023)) end if
  return text
end function

/// Write variables in qcommon.cvar; the normal completion returns `output`.
/// @param registry Record exposing `variables`.
function writeVariables(registry)
  output=""
  for each variable in registry.variables
    if not stringEqualsIgnoreCaseAscii(variable.name,"cl_cdkey") and (variable.flags & ARCHIVE)!=0 then
      value=variable.string;if variable.latchedString is not void then value=variable.latchedString end if
      output=output+configLine(variable.name,value)
    end if
  end for
  return output
end function
