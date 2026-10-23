// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete symbol facade for code/botlib/be_ai_char.c.
package mq3.botlib.be_ai_char

import mq3.botlib.ai_characters as impl

function BotCharacterFromHandle(state,handle) return impl.characterAt(state,handle) end function
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
function BotFreeCharacterStrings(character)
  if character==void then return 0 end if
  for index=0 to 80-1 if character.values[index].type==3 then character.values[index].stringValue="" end if end for
  return 0
end function
function BotFreeCharacter2(state,handle) return impl.freeHandle(state,handle) end function
function BotFreeCharacter(state,handle) return impl.freeCharacter(state,handle) end function
function BotDefaultCharacteristics(character,defaults) return impl.applyDefaults(character,defaults) end function
function BotLoadCharacterFromFile(state,filename,skill)
  parsed=impl.parseCharacter(state,filename,skill);if parsed is error or not parsed.found then return void end if;return parsed.character
end function
function BotFindCachedCharacter(state,filename,skill) return impl.findCached(state,filename,skill) end function
function BotLoadCachedCharacter(state,filename,skill,reload) return impl.loadCached(state,filename,skill,reload) end function
function BotLoadCharacterSkill(state,filename,skill) return impl.loadCharacterSkill(state,filename,skill) end function
function BotInterpolateCharacters(state,handle1,handle2,desiredSkill) return impl.interpolate(state,handle1,handle2,desiredSkill) end function
function BotLoadCharacter(state,filename,skill) return impl.loadCharacter(state,filename,skill) end function
function CheckCharacteristicIndex(state,character,index)
  value=impl.characterAt(state,character);if value==void or index<0 or index>=80 then return false end if;return value.values[index].type!=0
end function
function Characteristic_Float(state,character,index) return impl.characteristicFloat(state,character,index) end function
function Characteristic_BFloat(state,character,index,minimum,maximum) return impl.characteristicBFloat(state,character,index,minimum,maximum) end function
function Characteristic_Integer(state,character,index) return impl.characteristicInteger(state,character,index) end function
function Characteristic_BInteger(state,character,index,minimum,maximum) return impl.characteristicBInteger(state,character,index,minimum,maximum) end function
function Characteristic_String(state,character,index) return impl.characteristicString(state,character,index) end function
function BotShutdownCharacters(state) return impl.shutdown(state) end function


