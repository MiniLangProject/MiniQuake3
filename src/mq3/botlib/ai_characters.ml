// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Bot character loading, caching and queries from code/botlib/be_ai_char.c.
package mq3.botlib.ai_characters

import mq3.vm.pc_parser as pc
import mq3.compat.numeric as n
import std.string as strings

const MAX_CHARACTERISTICS=80
const CT_NONE=0
const CT_INTEGER=1
const CT_FLOAT=2
const CT_STRING=3
const DEFAULT_CHARACTER="bots/default_c.c"

const OP_LOAD_CHARACTER=500
const OP_FREE_CHARACTER=501
const OP_CHARACTERISTIC_FLOAT=502
const OP_CHARACTERISTIC_BFLOAT=503
const OP_CHARACTERISTIC_INTEGER=504
const OP_CHARACTERISTIC_BINTEGER=505
const OP_CHARACTERISTIC_STRING=506

struct Characteristic type integer floatValue stringValue end struct
struct Character filename skill values end struct
struct Loader context readFn end struct
struct State maxClients characters context readFn reloadCharacters fileReads end struct
struct Parsed found character end struct

function fail(message) return error(7550,"AI character: "+message) end function
function emptyCharacteristic() return Characteristic(CT_NONE,0,0.0,"") end function
function emptyValues() values=array(MAX_CHARACTERISTICS,void);for index=0 to MAX_CHARACTERISTICS-1 values[index]=emptyCharacteristic() end for;return values end function
function create(maxClients,context,readFn)
  if maxClients<1 then return fail("client capacity must be positive") end if
  return State(maxClients,array(maxClients+1,void),context,readFn,false,0)
end function
function botPath(name)
  value=name;while strings.startsWith(value,"/") value=decode(slice(bytes(value),1,len(bytes(value))-1)) end while
  if strings.startsWith(strings.toLowerAscii(value),"botfiles/") then return value end if;return "botfiles/"+value
end function
function loadText(loader,name)
  if loader==void or loader.readFn==void then return fail("file callback missing") end if
  value=loader.readFn(loader.context,botPath(name));if value is error or value==void then return value end if;return value
end function
function characterAt(state,handle) if state==void or handle<=0 or handle>state.maxClients then return void end if;return state.characters[handle] end function
function freeHandle(state,handle) if characterAt(state,handle)==void then return 0 end if;state.characters[handle]=void;return 0 end function
function freeCharacter(state,handle) if state==void or not state.reloadCharacters then return 0 end if;return freeHandle(state,handle) end function
function shutdown(state) if state!=void then for handle=1 to state.maxClients state.characters[handle]=void end for end if;return 0 end function
function setReloadCharacters(state,value) if state!=void then state.reloadCharacters=value!=0 end if;return 0 end function
function freeSlot(state) for handle=1 to state.maxClients if state.characters[handle]==void then return handle end if end for;return 0 end function
function findCached(state,filename,skill)
  for handle=1 to state.maxClients value=state.characters[handle];difference=0.0;if value!=void then difference=value.skill-skill;if difference<0.0 then difference=0.0-difference end if end if;if value!=void and value.filename==filename and (skill<0.0 or difference<0.01) then return handle end if end for;return 0
end function
function numberToken(token,label) if token==void or token is error or token.type!=pc.TT_NUMBER then return fail("expected number for "+label) end if;return token end function
function skipBlock(registry,source)
  depth=1;while depth>0 token=pc.read(registry,source);if token==void or token is error then return fail("unterminated skill block") end if;if token.text=="{" then depth=depth+1 else if token.text=="}" then depth=depth-1 end if end while;return 0
end function
function parseCharacter(state,filename,wantedSkill)
  loader=Loader(state.context,state.readFn);registry=pc.create(loader,loadText);source=pc.load(registry,filename);state.fileReads=state.fileReads+1
  if source==0 then return Parsed(false,void) end if
  while true
    token=pc.read(registry,source);if token==void then pc.free(registry,source);return Parsed(false,void) end if;if token is error then pc.free(registry,source);return token end if
    if token.text!="skill" then pc.free(registry,source);return fail("unknown definition "+token.text) end if
    skillToken=numberToken(pc.read(registry,source),"skill");if skillToken is error then pc.free(registry,source);return skillToken end if
    brace=pc.read(registry,source);if brace==void or brace is error or brace.text!="{" then pc.free(registry,source);return fail("expected skill block") end if
    if wantedSkill>=0 and skillToken.intValue!=wantedSkill then skipped=skipBlock(registry,source);if skipped is error then pc.free(registry,source);return skipped end if;continue end if
    character=Character(filename,n.f32(skillToken.floatValue),emptyValues())
    while true
      indexToken=pc.read(registry,source);if indexToken==void or indexToken is error then pc.free(registry,source);return fail("unterminated characteristic block") end if
      if indexToken.text=="}" then pc.free(registry,source);return Parsed(true,character) end if
      if indexToken.type!=pc.TT_NUMBER or (indexToken.subtype&pc.TT_INTEGER)==0 then pc.free(registry,source);return fail("characteristic index is not integer") end if
      index=indexToken.intValue;if index<0 or index>=MAX_CHARACTERISTICS then pc.free(registry,source);return fail("characteristic index outside table") end if
      if character.values[index].type!=CT_NONE then pc.free(registry,source);return fail("duplicate characteristic "+str(index)) end if
      value=pc.read(registry,source);if value==void or value is error then pc.free(registry,source);return fail("missing characteristic value") end if
      if value.type==pc.TT_NUMBER then
        if (value.subtype&pc.TT_FLOAT)!=0 then character.values[index]=Characteristic(CT_FLOAT,0,n.f32(value.floatValue),"")
        else character.values[index]=Characteristic(CT_INTEGER,value.intValue,0.0,"") end if
      else if value.type==pc.TT_STRING then character.values[index]=Characteristic(CT_STRING,0,0.0,value.text)
      else pc.free(registry,source);return fail("invalid characteristic value "+value.text) end if
    end while
  end while
end function
function applyDefaults(character,defaults)
  if character==void or defaults==void then return character end if
  for index=0 to MAX_CHARACTERISTICS-1 if character.values[index].type==CT_NONE and defaults.values[index].type!=CT_NONE then
    value=defaults.values[index];character.values[index]=Characteristic(value.type,value.integer,value.floatValue,value.stringValue)
  end if end for;return character
end function
function loadCached(state,filename,skill,reload)
  slot=freeSlot(state);if slot==0 then return 0 end if
  if not reload then handle=findCached(state,filename,skill);if handle!=0 then return handle end if end if
  intSkill=n.trunc32(n.fadd(skill,0.5));parsed=parseCharacter(state,filename,intSkill)
  if not (parsed is error) and parsed.found then state.characters[slot]=parsed.character;return slot end if
  if not reload then handle=findCached(state,DEFAULT_CHARACTER,skill);if handle!=0 then return handle end if end if
  parsed=parseCharacter(state,DEFAULT_CHARACTER,intSkill);if not (parsed is error) and parsed.found then state.characters[slot]=parsed.character;return slot end if
  if not reload then handle=findCached(state,filename,-1.0);if handle!=0 then return handle end if end if
  parsed=parseCharacter(state,filename,-1);if not (parsed is error) and parsed.found then state.characters[slot]=parsed.character;return slot end if
  if not reload then handle=findCached(state,DEFAULT_CHARACTER,-1.0);if handle!=0 then return handle end if end if
  parsed=parseCharacter(state,DEFAULT_CHARACTER,-1);if not (parsed is error) and parsed.found then state.characters[slot]=parsed.character;return slot end if
  return 0
end function
function loadCharacterSkill(state,filename,skill)
  defaultHandle=loadCached(state,DEFAULT_CHARACTER,skill,false);handle=loadCached(state,filename,skill,state.reloadCharacters)
  if defaultHandle!=0 and handle!=0 then applyDefaults(state.characters[handle],state.characters[defaultHandle]) end if;return handle
end function
function interpolate(state,firstHandle,secondHandle,desiredSkill)
  first=characterAt(state,firstHandle);second=characterAt(state,secondHandle);if first==void or second==void then return 0 end if
  slot=freeSlot(state);if slot==0 then return 0 end if
  result=Character(first.filename,n.f32(desiredSkill),emptyValues());state.characters[slot]=result
  scale=n.fdiv(n.fsub(desiredSkill,first.skill),n.fsub(second.skill,first.skill))
  for index=0 to MAX_CHARACTERISTICS-1 left=first.values[index];right=second.values[index]
    if left.type==CT_FLOAT and right.type==CT_FLOAT then result.values[index]=Characteristic(CT_FLOAT,0,n.fadd(left.floatValue,n.fmul(n.fsub(right.floatValue,left.floatValue),scale)),"")
    else if left.type==CT_INTEGER then result.values[index]=Characteristic(CT_INTEGER,left.integer,0.0,"")
    else if left.type==CT_STRING then result.values[index]=Characteristic(CT_STRING,0,0.0,left.stringValue) end if
  end for;return slot
end function
function loadCharacter(state,filename,skill)
  if state==void or state.readFn==void or filename==void or filename=="" then return 0 end if
  skill=n.f32(skill);if skill<1.0 then skill=1.0 else if skill>5.0 then skill=5.0 end if
  if skill==1.0 or skill==4.0 or skill==5.0 then return loadCharacterSkill(state,filename,skill) end if
  cached=findCached(state,filename,skill);if cached!=0 then return cached end if
  first=0;second=0
  if skill<4.0 then first=loadCharacterSkill(state,filename,1.0);if first==0 then return 0 end if;second=loadCharacterSkill(state,filename,4.0)
  else first=loadCharacterSkill(state,filename,4.0);if first==0 then return 0 end if;second=loadCharacterSkill(state,filename,5.0) end if
  if second==0 then return first end if;return interpolate(state,first,second,skill)
end function

function characteristic(state,handle,index)
  character=characterAt(state,handle);if character==void or index<0 or index>=MAX_CHARACTERISTICS then return void end if
  value=character.values[index];if value.type==CT_NONE then return void end if;return value
end function
function characteristicFloat(state,handle,index)
  value=characteristic(state,handle,index);if value==void then return 0.0 end if
  if value.type==CT_INTEGER then return n.f32(value.integer) else if value.type==CT_FLOAT then return value.floatValue end if;return 0.0
end function
function characteristicBFloat(state,handle,index,minimum,maximum)
  if minimum>maximum then return 0.0 end if;value=characteristicFloat(state,handle,index);if value<minimum then return minimum else if value>maximum then return maximum end if;return value
end function
function characteristicInteger(state,handle,index)
  value=characteristic(state,handle,index);if value==void then return 0 end if
  if value.type==CT_INTEGER then return value.integer else if value.type==CT_FLOAT then return n.trunc32(value.floatValue) end if;return 0
end function
function characteristicBInteger(state,handle,index,minimum,maximum)
  if minimum>maximum then return 0 end if;value=characteristicInteger(state,handle,index);if value<minimum then return minimum else if value>maximum then return maximum end if;return value
end function
function characteristicString(state,handle,index)
  value=characteristic(state,handle,index);if value==void or value.type!=CT_STRING then return void end if;return value.stringValue
end function
