// SPDX-License-Identifier: GPL-2.0-or-later
// Real original map-initialization state and ordered host calls.
import mq3.game.initialization as initialization
import mq3.game.items as initializationItems
import mq3.game.entities as initializationEntities
import mq3.game.spawn as initializationSpawn
import mq3.game.spawn_values as initializationValues
import mq3.collision.world as initializationWorld
import mq3.compat.numeric as n
import std.fs as fs

struct InitializationReader
  data
  offset
end struct
struct InitializationCheck
  expected
  offset
  words
  events
  normalizations
end struct
function initializationReadInt(reader)
  result = n.readI32(reader.data,reader.offset); reader.offset = reader.offset+4; return result
end function
function initializationReadText(reader)
  size = initializationReadInt(reader)
  if size == -1 then return void end if
  result = decode(slice(reader.data,reader.offset,size)); reader.offset = reader.offset+size; return result
end function
function initializationWord(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected initialization output") end if
  expected = n.readU32(check.expected,check.offset)
  if expected != n.u32(value) then return error(499,"Initialization mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" expected "+str(expected)) end if
  check.offset = check.offset+4; check.words = check.words+1; return void
end function
function initializationWords(check,values)
  for each value in values
    initializationWord(check,value)
  end for
  return void
end function
function initializationText(check,text)
  if text == void then return initializationWord(check,-1) end if
  data = bytes(text); initializationWord(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"Initialization text mismatch at byte "+str(check.offset)) end if
    check.offset = check.offset+1
  end for
  return void
end function
function initializationPointerWord(check,ent)
  if ent == void then return initializationWord(check,-1) end if
  return initializationWord(check,ent.slot)
end function
function initializationBool(check,value)
  if value then return initializationWord(check,1) end if
  return initializationWord(check,0)
end function
function initializationSnapshot(level)
  check = level.context
  initializationWords(check,[700,level.num_entities,level.spawner.gametype,n.floatBits(level.lastFlagCapture),level.lastCaptureTeam,
    level.redFlagStatus,level.blueFlagStatus,level.neutralFlagStatus,level.redTakenTime,level.blueTakenTime,level.redObeliskAttackedTime,level.blueObeliskAttackedTime])
  initializationWords(check,level.teamScores); initializationWords(check,level.itemRegistered)
  initializationText(check,level.spawner.configstrings[23]); initializationText(check,level.spawner.configstrings[27])
  index = 0
  while index < level.num_entities
    ent = level.entities[index]; index = index+1
    initializationBool(check,ent.inuse); initializationWord(check,ent.flags)
    initializationPointerWord(check,ent.teammaster); initializationPointerWord(check,ent.teamchain)
    initializationWords(check,[ent.health,ent.count,ent.s.number])
    initializationText(check,ent.team); initializationText(check,ent.targetname); initializationText(check,ent.classname)
  end while
  return void
end function
function initializationPrint(level,text)
  initializationSnapshot(level); initializationWord(level.context,710); initializationText(level.context,text)
  level.context.events = level.context.events+1; return void
end function
function initializationConfig(state,kind,index,key,text)
  if kind != 1 then return error(499,"Unexpected initialization host callback") end if
  level = state.level; check = level.context; normalized = 0
  if index == 23 and state.gametype == 4 and level.redFlagStatus == 0 and level.blueFlagStatus == -1 then
    if text != "0" then return error(499,"Transient flag initialization must publish its defined red prefix") end if
    normalized = 1; check.normalizations = check.normalizations+1
  end if
  initializationSnapshot(level); initializationWords(check,[711,index,normalized]); initializationText(check,text)
  check.events = check.events+1; return void
end function
function initializationPointer(level,slot)
  if slot == -1 then return void end if
  return level.entities[slot]
end function
function initializationTeamField(level,field,value)
  switch field
    case 0
      level.lastFlagCapture = n.bitsFloat(n.u32(value))
    end case
    case 1
      level.lastCaptureTeam = value
    end case
    case 2
      level.redFlagStatus = value
    end case
    case 3
      level.blueFlagStatus = value
    end case
    case 4
      level.neutralFlagStatus = value
    end case
    case 5
      level.redTakenTime = value
    end case
    case 6
      level.blueTakenTime = value
    end case
    case 7
      level.redObeliskAttackedTime = value
    end case
    case 8
      level.blueObeliskAttackedTime = value
    end case
  end switch
  return void
end function
function initializationEntityField(level,ent,field,value)
  switch field
    case 0
      ent.inuse = value != 0
    end case
    case 1
      ent.flags = value
    end case
    case 2
      ent.teammaster = initializationPointer(level,value)
    end case
    case 3
      ent.teamchain = initializationPointer(level,value)
    end case
    case 4
      ent.health = value
    end case
    case 5
      ent.count = value
    end case
    case 6
      ent.s.number = value
    end case
  end switch
  return void
end function
function initializationEntityText(ent,field,text)
  if field == 0 then ent.team = text else if field == 1 then ent.targetname = text else ent.classname = text end if
  return void
end function
function initializationAction(level,kind,a,b,c,text)
  switch kind
    case 1
      initialization.findTeams(level)
    end case
    case 2
      initializationItems.clearRegistered(level)
    end case
    case 3
      item = a; if a == -1 then item = void end if; initializationItems.register(level,item)
    end case
    case 4
      initializationItems.saveRegistered(level)
    end case
    case 5
      initializationItems.initTeamGame(level)
    end case
    case 6
      initializationItems.checkTeamItems(level)
    end case
    case 7
      level.itemRegistered[a] = b
    end case
    case 8
      initializationTeamField(level,a,b)
    end case
    case 9
      level.spawner.gametype = a
    end case
    case 10
      initializationEntityField(level,level.entities[a],b,c)
    end case
    case 11
      initializationEntityText(level.entities[a],b,text)
    end case
    case 12
      initializationItems.setFlagStatus(level,a,b)
    end case
    case 13
      level.spawner.configstrings[a] = text
    end case
  end switch
  return void
end function
function initializationRequire(condition,text)
  if not condition then return error(499,"Initialization contract: "+text) end if
  return void
end function
function initializationQuietPrint(level,text)
  return void
end function
function initializationInterruptedConfig(state,kind,index,key,text)
  return error(499,"Interrupted config delivery")
end function
function initializationContracts(world)
  count = 0; level = initializationEntities.create(world)
  level.num_entities = 1025
  initializationRequire(try(initialization.findTeams(level)) is error,"entity upper storage bound"); count = count+1
  level.num_entities = -1
  initializationRequire(try(initialization.findTeams(level)) is error,"negative entity range"); count = count+1
  level.num_entities = 3; first = level.entities[1]; second = level.entities[2]
  first.inuse = true; first.team = "team"; second.inuse = true; second.team = "team"
  initializationRequire(try(initialization.findTeams(level)) is error and first.teamchain == second and second.teammaster == first,"missing print after grouping mutations"); count = count+1
  first.team = decode(bytes([97,0,98])); level.gamePrintFn = initializationQuietPrint
  initializationRequire(try(initialization.findTeams(level)) is error,"embedded NUL team"); count = count+1
  initializationRequire(try(initializationItems.register(level,void)) is error,"NULL item pointer"); count = count+1
  initializationRequire(try(initializationItems.register(level,-1)) is error,"negative descriptor index"); count = count+1
  initializationRequire(try(initializationItems.register(level,37)) is error,"descriptor outside modeled array"); count = count+1
  initializationItems.register(level,0); initializationItems.register(level,36)
  initializationRequire(level.itemRegistered[0] == 1 and level.itemRegistered[36] == 1,"dummy and sentinel descriptors"); count = count+1
  registered = level.itemRegistered; initializationItems.clearRegistered(level)
  initializationRequire(level.itemRegistered == registered and registered[0] == 0 and registered[8] == 1 and registered[10] == 1 and registered[36] == 0,"clear preserves registration storage"); count = count+1
  level.lastCaptureTeam = 99; level.redObeliskAttackedTime = 77
  initializationRequire(try(initializationItems.initTeamGame(level)) is error and level.lastCaptureTeam == 0 and level.redObeliskAttackedTime == 0,"missing spawn state after team reset"); count = count+1
  state = initializationSpawn.create(level,""); state.configstrings[27] = "before"; level.gamePrintFn = void
  initializationRequire(try(initializationItems.saveRegistered(level)) is error and state.configstrings[27] == "before","missing print before items config"); count = count+1
  level.gamePrintFn = initializationQuietPrint; state.gametype = 4; state.effectFn = initializationInterruptedConfig
  initializationRequire(try(initializationItems.initTeamGame(level)) is error and level.redFlagStatus == 0 and level.blueFlagStatus == -1 and state.configstrings[23] == "0","interrupted first CTF publication"); count = count+1
  state.gametype = 3
  initializationRequire(initializationItems.initTeamGame(level) == void and level.blueFlagStatus == 0 and state.configstrings[23] == "0","non-CTF reset leaves config untouched"); count = count+1
  print "PASS: "+str(count)+" initialization runtime contracts"; return 0
end function
function main(args)
  world = initializationWorld.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args)>3 and args[3]=="--contracts" then return initializationContracts(world) end if
  reader = InitializationReader(fs.readAllBytes(args[1]),0); check = InitializationCheck(fs.readAllBytes(args[2]),0,0,0,0)
  level = initializationEntities.create(world); state = initializationSpawn.create(level,"")
  level.num_entities = initializationReadInt(reader); state.gametype = initializationReadInt(reader)
  for field = 0 to 8
    initializationTeamField(level,field,initializationReadInt(reader))
  end for
  for index = 0 to 3
    level.teamScores[index] = initializationReadInt(reader)
  end for
  for index = 0 to 255
    level.itemRegistered[index] = initializationReadInt(reader)
  end for
  state.configstrings[23] = initializationReadText(reader); state.configstrings[27] = initializationReadText(reader)
  index = 0
  while index < level.num_entities
    ent = level.entities[index]; index = index+1
    for field = 0 to 6
      initializationEntityField(level,ent,field,initializationReadInt(reader))
    end for
    for field = 0 to 2
      initializationEntityText(ent,field,initializationReadText(reader))
    end for
  end while
  level.context = check; level.gamePrintFn = initializationPrint; state.effectFn = initializationConfig
  count = initializationReadInt(reader); action = 0; dropped = false
  while action < count
    kind = initializationReadInt(reader); a = initializationReadInt(reader); b = initializationReadInt(reader); c = initializationReadInt(reader); text = initializationReadText(reader)
    action = action+1; outcome = try(initializationAction(level,kind,a,b,c,text)); initializationSnapshot(level)
    if outcome is error then initializationWord(check,799); dropped = true; break end if
  end while
  if not dropped then initializationWords(check,[730,check.normalizations]) end if
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete initialization stream") end if
  print "PASS: "+str(action)+" initialization actions / "+str(check.words)+" exact words / "+str(check.events)+" ordered effects / "+str(check.normalizations)+" transient normalizations"; return 0
end function
