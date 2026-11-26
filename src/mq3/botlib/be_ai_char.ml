// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete symbol facade for code/botlib/be_ai_char.c.
package mq3.botlib.be_ai_char

import mq3.botlib.ai_characters as impl

/// Forward `BotCharacterFromHandle` to `mq3.botlib.ai_characters.characterAt` and return the delegated result.
/// @param state AI characters state; accesses `maxClients` and `characters`.
/// @param handle Handle identifying the allocated bot character.
function BotCharacterFromHandle(state,handle) return impl.characterAt(state,handle) end function
/// Serialize the loaded character filename, skill and typed characteristics into readable bot-character text.
/// @param character Character record; accesses `filename`, `skill` and `values`.
function BotDumpCharacter(character)
  if character==void then return "" end if
  output=character.filename+"\nskill "+str(character.skill)+"\n{\n"
  for index=0 to 80-1
    value=character.values[index]
    if value.type==1 then output=output+" "+str(index)+" "+str(value.integer)+"\n"
    else if value.type==2 then output=output+" "+str(index)+" "+str(value.floatValue)+"\n"
    else if value.type==3 then output=output+" "+str(index)+" "+value.stringValue+"\n" end if
  end for
  return output+"}\n"
end function
/// Set `character.values[index].stringValue` to `""` in `mq3.botlib.be_ai_char.BotFreeCharacterStrings`.
/// @param character Character record; accesses `values`. May update `character.values[index].stringValue` in place.
function BotFreeCharacterStrings(character)
  if character==void then return 0 end if
  for index=0 to 80-1 if character.values[index].type==3 then character.values[index].stringValue="" end if end for
  return 0
end function
/// Forward `BotFreeCharacter2` to `mq3.botlib.ai_characters.freeHandle` and return the delegated result.
/// @param state AI characters state; accesses `characters`. May update `state.characters[handle]` in place.
/// @param handle Handle identifying the allocated bot character.
function BotFreeCharacter2(state,handle) return impl.freeHandle(state,handle) end function
/// Forward `BotFreeCharacter` to `mq3.botlib.ai_characters.freeCharacter` and return the delegated result.
/// @param state AI characters state; accesses `reloadCharacters`.
/// @param handle Handle identifying the allocated bot character.
function BotFreeCharacter(state,handle) return impl.freeCharacter(state,handle) end function
/// Forward `BotDefaultCharacteristics` to `mq3.botlib.ai_characters.applyDefaults` and return the delegated result.
/// @param character Character record; accesses `values`. May update `character.values[index]` in place.
/// @param defaults Defaults record; accesses `values`.
function BotDefaultCharacteristics(character,defaults) return impl.applyDefaults(character,defaults) end function
/// Apply `mq3.botlib.ai_characters.parseCharacter` while evaluating `BotLoadCharacterFromFile`. Return paths include `parsed.character`.
/// @param state AI characters state; accesses `context`, `readFn` and `fileReads`. May update `state.fileReads` in place.
/// @param filename Filename supplied to the configured loader or file service.
/// @param skill Bot skill value used to select or interpolate characteristics.
function BotLoadCharacterFromFile(state,filename,skill)
  parsed=impl.parseCharacter(state,filename,skill);if parsed is error or not parsed.found then return void end if;return parsed.character
end function
/// Forward `BotFindCachedCharacter` to `mq3.botlib.ai_characters.findCached` and return the delegated result.
/// @param state AI characters state; accesses `maxClients` and `characters`.
/// @param filename Filename supplied to the configured loader or file service.
/// @param skill Bot skill value used to select or interpolate characteristics.
function BotFindCachedCharacter(state,filename,skill) return impl.findCached(state,filename,skill) end function
/// Forward `BotLoadCachedCharacter` to `mq3.botlib.ai_characters.loadCached` and return the delegated result.
/// @param state AI characters state; accesses `characters`. May update `state.characters[slot]` in place.
/// @param filename Filename supplied to the configured loader or file service.
/// @param skill Bot skill value used to select or interpolate characteristics.
/// @param reload Value used by `loadCached` in `if not reload then handle=findCached(state,filename,skill)`.
function BotLoadCachedCharacter(state,filename,skill,reload) return impl.loadCached(state,filename,skill,reload) end function
/// Forward `BotLoadCharacterSkill` to `mq3.botlib.ai_characters.loadCharacterSkill` and return the delegated result.
/// @param state AI characters state; accesses `reloadCharacters` and `characters`.
/// @param filename Filename supplied to the configured loader or file service.
/// @param skill Bot skill value used to select or interpolate characteristics.
function BotLoadCharacterSkill(state,filename,skill) return impl.loadCharacterSkill(state,filename,skill) end function
/// Forward `BotInterpolateCharacters` to `mq3.botlib.ai_characters.interpolate` and return the delegated result.
/// @param state AI characters state; accesses `characters`. May update `state.characters[slot]` in place.
/// @param handle1 Handle identifying the allocated bot character.
/// @param handle2 Handle identifying the allocated bot character.
/// @param desiredSkill Value passed as argument 1 to `mq3.compat.numeric.f32`.
function BotInterpolateCharacters(state,handle1,handle2,desiredSkill) return impl.interpolate(state,handle1,handle2,desiredSkill) end function
/// Forward `BotLoadCharacter` to `mq3.botlib.ai_characters.loadCharacter` and return the delegated result.
/// @param state AI characters state; accesses `readFn`.
/// @param filename Filename supplied to the configured loader or file service.
/// @param skill Bot skill value used to select or interpolate characteristics.
function BotLoadCharacter(state,filename,skill) return impl.loadCharacter(state,filename,skill) end function
/// Apply `mq3.botlib.ai_characters.characterAt` while evaluating `CheckCharacteristicIndex`. Return paths include `value.values[index].type!=0`.
/// @param state AI characters state; accesses `maxClients` and `characters`.
/// @param character Handle identifying the allocated bot character.
/// @param index Index of the entry to access.
function CheckCharacteristicIndex(state,character,index)
  value=impl.characterAt(state,character);if value==void or index<0 or index>=80 then return false end if;return value.values[index].type!=0
end function
/// Forward `Characteristic_Float` to `mq3.botlib.ai_characters.characteristicFloat` and return the delegated result.
/// @param state AI characters state; accesses `maxClients` and `characters`.
/// @param character Handle identifying the allocated bot character.
/// @param index Index of the entry to access.
function Characteristic_Float(state,character,index) return impl.characteristicFloat(state,character,index) end function
/// Forward `Characteristic_BFloat` to `mq3.botlib.ai_characters.characteristicBFloat` and return the delegated result.
/// @param state AI characters state; accesses `maxClients` and `characters`.
/// @param character Handle identifying the allocated bot character.
/// @param index Index of the entry to access.
/// @param minimum Operand used to evaluate the returned expression `minimum`.
/// @param maximum Upper bound applied by the operation.
function Characteristic_BFloat(state,character,index,minimum,maximum) return impl.characteristicBFloat(state,character,index,minimum,maximum) end function
/// Forward `Characteristic_Integer` to `mq3.botlib.ai_characters.characteristicInteger` and return the delegated result.
/// @param state AI characters state; accesses `maxClients` and `characters`.
/// @param character Handle identifying the allocated bot character.
/// @param index Index of the entry to access.
function Characteristic_Integer(state,character,index) return impl.characteristicInteger(state,character,index) end function
/// Forward `Characteristic_BInteger` to `mq3.botlib.ai_characters.characteristicBInteger` and return the delegated result.
/// @param state AI characters state; accesses `maxClients` and `characters`.
/// @param character Handle identifying the allocated bot character.
/// @param index Index of the entry to access.
/// @param minimum Operand used to evaluate the returned expression `minimum`.
/// @param maximum Upper bound applied by the operation.
function Characteristic_BInteger(state,character,index,minimum,maximum) return impl.characteristicBInteger(state,character,index,minimum,maximum) end function
/// Forward `Characteristic_String` to `mq3.botlib.ai_characters.characteristicString` and return the delegated result.
/// @param state AI characters state; accesses `maxClients` and `characters`.
/// @param character Handle identifying the allocated bot character.
/// @param index Index of the entry to access.
function Characteristic_String(state,character,index) return impl.characteristicString(state,character,index) end function
/// Forward `BotShutdownCharacters` to `mq3.botlib.ai_characters.shutdown` and return the delegated result.
/// @param state AI characters state; accesses `maxClients` and `characters`. May update `state.characters[handle]` in place.
function BotShutdownCharacters(state) return impl.shutdown(state) end function


