// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// g_spawn.c, baseq3. Unported class/item callbacks are explicit boundaries.
package mq3.game.spawn
import mq3.game.entities as game
import mq3.game.combat as combat
import mq3.game.spawn_tables as tables
import mq3.game.spawn_functions as functions
import mq3.game.spawn_values as values
import mq3.game.movement as movement
import mq3.game.items as gameItems
import mq3.game.memory as memory
import mq3.shared.parser as parser
import mq3.qcommon.cvar as cv
import mq3.compat.textnumbers as textnum
import mq3.compat.numeric as n
import std.string as strings
struct State
  level
  parser
  vars
  chars
  spawning
  gametype
  motd
  restarted
  doWarmup
  warmupTime
  gravity
  configstrings
  cvars
  unportedFn
  effectFn
  context
end struct
function create(level,text)
  state = State(level,parser.create(text),[],0,false,0,"",0,0,0,800.0,array(1024,""),cv.create(),void,void,void)
  level.spawner = state
  level.damageFn = combat.damage
  return state
end function
function getString(state,key,fallback)
  // Original still searches old spawnVars when level.spawning is false.
  return values.getString(state,key,fallback)
end function
function getInt(state,key,fallback)
  result = getString(state,key,fallback); return [result[0],textnum.atoi(result[1])]
end function
function getFloat(state,key,fallback)
  result = getString(state,key,fallback); return [result[0],n.f32(textnum.atof(result[1]))]
end function
function getVector(state,key,fallback,initial)
  result = getString(state,key,fallback); values = textnum.vector(result[1],initial)
  return [result[0],values[1]]
end function
function newString(value)
  data = bytes(value); result = bytes(len(data),0); i = 0; written = 0
  while i < len(data) and data[i] != 0
    ch = data[i]; i = i+1
    if ch == 92 then
      // A trailing backslash makes G_NewString omit its NUL terminator in C.
      if i >= len(data) or data[i] == 0 then return error(485,"Unterminated G_NewString escape") end if
      if data[i] == 110 then result[written] = 10 else result[written] = 92 end if
      i = i+1
    else
      result[written] = ch
    end if
    written = written+1
  end while
  return decode(slice(result,0,written))
end function
function parseField(key,value,ent)
  return parseLevelField(void,key,value,ent)
end function
function parseLevelField(level,key,value,ent)
  field = void
  for each row in tables.fields()
    if strings.equalsIgnoreCaseAscii(key,row[0]) then field = row; break end if
  end for
  if field == void or field[2] == "F_IGNORE" then return void end if
  converted = void
  switch field[2]
    case "F_LSTRING"
      if level == void then converted = newString(value) else converted = memory.newString(level,value) end if
    end case
    case "F_INT"
      converted = textnum.atoi(value)
    end case
    case "F_FLOAT","F_ANGLEHACK"
      converted = n.f32(textnum.atof(value))
    end case
    case "F_VECTOR"
      scanned = textnum.vector(value,[0.0,0.0,0.0])
      // Original copies uninitialized stack values after a partial sscanf.
      if scanned[0] != 3 then return error(485,"Incomplete spawn vector") end if
      converted = scanned[1]
    end case
  end switch
  switch field[0]
    case "classname"
      ent.classname = converted
    end case
    case "origin"
      ent.s.origin = converted
    end case
    case "model"
      ent.model = converted
    end case
    case "model2"
      ent.model2 = converted
    end case
    case "spawnflags"
      ent.spawnflags = converted
    end case
    case "speed"
      ent.speed = converted
    end case
    case "target"
      ent.target = converted
    end case
    case "targetname"
      ent.targetname = converted
    end case
    case "message"
      ent.message = converted
    end case
    case "team"
      ent.team = converted
    end case
    case "wait"
      ent.wait = converted
    end case
    case "random"
      ent.random = converted
    end case
    case "count"
      ent.count = converted
    end case
    case "health"
      ent.health = converted
    end case
    case "dmg"
      ent.damage = converted
    end case
    case "angles"
      ent.s.angles = converted
    end case
    case "angle"
      ent.s.angles = [0.0,converted,0.0]
    end case
    case "targetShaderName"
      ent.targetShaderName = converted
    end case
    case "targetShaderNewName"
      ent.targetShaderNewName = converted
    end case
  end switch
  return void
end function
function token(state)
  value = parser.parseExt(state.parser,true)
  return [state.parser.offset >= 0 or value != "",value]
end function
function addToken(state,value)
  next = state.chars+len(bytes(value))+1
  if next > 4096 then return error(485,"G_AddSpawnVarToken: MAX_SPAWN_CHARS") end if
  state.chars = next
  return value
end function
function parseVars(state)
  state.vars = []; state.chars = 0; opening = token(state)
  if not opening[0] then return false end if
  if len(opening[1]) == 0 or opening[1][0] != "{" then return error(485,"G_ParseSpawnVars: expected opening brace") end if
  while true
    key = token(state)
    if not key[0] then return error(485,"G_ParseSpawnVars: EOF without closing brace") end if
    if len(key[1]) > 0 and key[1][0] == "}" then break end if
    value = token(state)
    if not value[0] then return error(485,"G_ParseSpawnVars: EOF without closing brace") end if
    if len(value[1]) > 0 and value[1][0] == "}" then return error(485,"G_ParseSpawnVars: closing brace without data") end if
    if len(state.vars) == 64 then return error(485,"G_ParseSpawnVars: MAX_SPAWN_VARS") end if
    storedKey = addToken(state,key[1]); storedValue = addToken(state,value[1])
    state.vars = state.vars+[[storedKey,storedValue]]
  end while
  return true
end function
function effect(state,kind,index,key,value)
  if state.effectFn != void then state.effectFn(state,kind,index,key,value) end if
  return void
end function
function setConfig(state,index,value)
  return values.setConfig(state,index,value)
end function
function setCvar(state,key,value)
  cv.set2(state.cvars,key,value,true); effect(state,2,0,key,value)
  return void
end function
function worldspawn(state)
  if not strings.equalsIgnoreCaseAscii(getString(state,"classname","")[1],"worldspawn") then return error(485,"First entity is not worldspawn") end if
  setConfig(state,20,"baseq3-1"); setConfig(state,21,str(state.level.startTime))
  setConfig(state,2,getString(state,"music","")[1]); setConfig(state,3,getString(state,"message","")[1]); setConfig(state,4,state.motd)
  setCvar(state,"g_gravity",getString(state,"gravity","800")[1]); setCvar(state,"g_enableDust",getString(state,"enableDust","0")[1]); setCvar(state,"g_enableBreath",getString(state,"enableBreath","0")[1])
  state.level.entities[1022].s.number = 1022; state.level.entities[1022].classname = "worldspawn"
  setConfig(state,5,"")
  if state.restarted != 0 then setCvar(state,"g_restarted","0"); state.warmupTime = 0
  else if state.doWarmup != 0 then state.warmupTime = -1; setConfig(state,5,"-1"); effect(state,3,0,"","Warmup:\n") end if
  return void
end function
function callSpawn(state,ent)
  if ent.classname == void then return false end if
  items = tables.items(); index = 1
  while index < len(items)
    if items[index] == ent.classname then
      gameItems.spawnItem(state.level,ent,index); return true
    end if
    index = index+1
  end while
  classes = tables.classes(); index = 0
  for each name in classes
    if name == ent.classname then
      if not functions.dispatch(state.level,ent) then
        if state.unportedFn == void then return error(486,"Spawn class not yet ported: "+name) end if
        state.unportedFn(state,ent,2,index)
      end if
      return true
    end if
    index = index+1
  end for
  return false
end function
function fromVars(state)
  ent = game.spawn(state.level)
  for each pair in state.vars
    parseLevelField(state.level,pair[0],pair[1],ent)
  end for
  if state.gametype == 2 and getInt(state,"notsingle","0")[1] != 0 then game.free(state.level,ent); return void end if
  key = "notfree"
  if state.gametype >= 3 then key = "notteam" end if
  if getInt(state,key,"0")[1] != 0 or getInt(state,"notq3a","0")[1] != 0 then game.free(state.level,ent); return void end if
  types = getString(state,"gametype",void)
  if types[0] and state.gametype >= 0 and state.gametype < 8 then
    names = ["ffa","tournament","single","team","ctf","oneflag","obelisk","harvester","teamtournament"]
    if strings.indexOf(types[1],names[state.gametype],0) < 0 then game.free(state.level,ent); return void end if
  end if
  ent.s.pos.trBase = movement.copy(ent.s.origin); ent.r.currentOrigin = movement.copy(ent.s.origin)
  if not callSpawn(state,ent) then game.free(state.level,ent) end if
  return void
end function
function load(state)
  state.spawning = true; state.vars = []
  if not parseVars(state) then return error(485,"SpawnEntities: no entities") end if
  worldspawn(state)
  while parseVars(state)
    fromVars(state)
  end while
  state.spawning = false
  return state
end function
