// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.cvars as gameCvars
import mq3.game.cvar_maintenance as maintenance
import mq3.qcommon.cvar as cv
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.frame as frame
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs
struct Reader
  data
  offset
end struct
struct Check
  expected
  offset
  words
  effects
end struct
function readInt(reader)
  value = n.readI32(reader.data,reader.offset); reader.offset = reader.offset+4; return value
end function
function readText(reader)
  size = readInt(reader); text = decode(slice(reader.data,reader.offset,size)); reader.offset = reader.offset+size; return text
end function
function word(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected game-Cvar output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"Game-Cvar mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
  check.offset = check.offset+4; check.words = check.words+1; return void
end function
function words(check,values)
  for each value in values
    word(check,value)
  end for
  return void
end function
function boolWord(check,value)
  if value then return word(check,1) end if
  return word(check,0)
end function
function textWord(check,value)
  if value == void then return word(check,-1) end if
  data = bytes(value); word(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"Game-Cvar text mismatch at byte "+str(check.offset)) end if
    check.offset = check.offset+1
  end for
  return void
end function
function recordCvarEffect(state,kind,index,key,value)
  check = state.level.context; words(check,[180,kind,index])
  if kind == 1 then word(check,state.rows[index].flags) end if
  if kind != 2 and kind != 6 then textWord(check,key); textWord(check,value) end if
  check.effects = check.effects+1; return void
end function
function recordCvarServer(level,slot,text)
  check = level.context; words(check,[181,slot]); textWord(check,text)
  for each row in level.gameCvars.rows
    word(check,row.modificationCount); count = -1
    if row.vm != void then count = row.vm.modificationCount end if
    word(check,count)
  end for
  check.effects = check.effects+1; return void
end function
function recordCvarListing(level,kind,slot)
  if kind != 6 then return error(499,"Unexpected non-listing frame callback") end if
  return recordCvarEffect(level.gameCvars,6,slot,"","")
end function
function cvarLevel(world,check)
  level = game.create(world); spawn.create(level,""); level.context = check
  level.serverCommandFn = recordCvarServer; level.frameStageFn = recordCvarListing
  for slot = 0 to 63
    game.bindClient(level,level.entities[slot],level.clients[slot])
  end for
  return level
end function
function vmWords(check,snapshot)
  boolWord(check,snapshot != void)
  if snapshot == void then return void end if
  words(check,[snapshot.handle,snapshot.modificationCount,n.floatBits(snapshot.value),snapshot.integer]); textWord(check,snapshot.string)
  return void
end function
function engineWords(check,registry,name)
  variable = cv.find(registry,name); boolWord(check,variable != void)
  if variable == void then return void end if
  words(check,[variable.index,variable.flags]); boolWord(check,variable.modified)
  words(check,[variable.modificationCount,n.floatBits(variable.value),variable.integer])
  textWord(check,variable.string); textWord(check,variable.resetString); textWord(check,variable.latchedString); return void
end function
function cvarSnapshot(level,probe,probeName)
  check = level.context; state = level.gameCvars
  word(check,190); boolWord(check,state.registered)
  words(check,[level.time,level.previousTime,level.framenum,level.lastTeamLocationTime,level.warmupModificationCount,state.registry.numIndexes,state.registry.modifiedFlags])
  for each row in state.rows
    word(check,row.modificationCount); vmWords(check,row.vm); engineWords(check,state.registry,row.name)
  end for
  vmWords(check,probe); textWord(check,probeName)
  if probeName != "" then engineWords(check,state.registry,probeName) end if
  if state.registered then
    words(check,[level.spawner.gametype,level.spawner.restarted,level.maxclientsCvar,level.dmflags,level.fraglimit,level.timelimit,level.capturelimit])
    boolWord(check,level.synchronousClients); words(check,[level.friendlyFire,level.warmup,level.warmupCvarModificationCount,level.spawner.doWarmup,level.cvarMaintenance.passwordModificationCount])
    words(check,[n.floatBits(level.playerSpeed),n.floatBits(level.gravity),n.floatBits(level.spawner.gravity),n.floatBits(level.knockback),level.weaponRespawn,level.weaponTeamRespawn,level.forceRespawn,level.inactivity,level.blood,level.listEntity])
    boolWord(check,level.smoothClients); boolWord(check,level.pmoveFixed); word(check,level.pmoveMsec)
    textWord(check,level.spawner.motd); textWord(check,level.cvarMaintenance.password)
  end if
  return void
end function
function requireCvar(condition,label)
  if not condition then return error(499,"Failed game-Cvar contract: "+label) end if
  return void
end function
function cvarContracts(world)
  registry = cv.create(); snapshot = cv.createVm()
  requireCvar(try(cv.updateVm(registry,void)) is error,"NULL VM snapshot")
  snapshot.handle = -1; requireCvar(try(cv.updateVm(registry,snapshot)) is error,"negative handle")
  snapshot.handle = registry.numIndexes; requireCvar(try(cv.updateVm(registry,snapshot)) is error,"handle at upper bound")
  cv.registerVm(registry,snapshot,"probe","valid",0); cv.set2(registry,"probe",decode(bytes(256,97)),true)
  requireCvar(try(cv.updateVm(registry,snapshot)) is error,"VM string storage")
  requireCvar(snapshot.modificationCount == 1 and snapshot.string == "valid","caught update preserves valid snapshot")
  cv.set2(registry,"probe",decode(bytes([97,0,98])),true)
  requireCvar(try(cv.updateVm(registry,snapshot)) is error,"embedded NUL")
  level = game.create(world)
  requireCvar(try(gameCvars.update(level)) is error,"missing module state")
  requireCvar(try(gameCvars.attach(level,"build date")) is error,"missing spawn state")
  spawn.create(level,""); state = gameCvars.attach(level,"build date")
  requireCvar(try(gameCvars.update(level)) is error,"registration required")
  gameCvars.register(level); cv.set2(state.registry,"g_speed","321",true)
  requireCvar(try(gameCvars.update(level)) is error,"server-command delivery")
  other = game.create(world); spawn.create(other,""); otherState = gameCvars.attach(other,"build date")
  state.rows[0].vm.integer = 77
  requireCvar(otherState.rows[0].vm.integer == 0 and otherState.registry.numIndexes == 1,"independent module snapshots and registries")
  lastRegistry = cv.create()
  for index = 1 to 1023
    cv.get(lastRegistry,"slot"+str(index),str(index),0)
  end for
  cv.registerVm(lastRegistry,snapshot,"slot1023","",0)
  requireCvar(snapshot.handle == 1023 and snapshot.integer == 1023,"last valid engine handle")
  requireCvar(try(cv.registerVm(lastRegistry,snapshot,"one too many","0",0)) is error,"registry capacity")
  print "PASS: 13 game-Cvar runtime contracts"; return 0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args)>3 and args[3]=="--contracts" then return cvarContracts(world) end if
  reader = Reader(fs.readAllBytes(args[1]),0); check = Check(fs.readAllBytes(args[2]),0,0,0)
  level = cvarLevel(world,check); state = gameCvars.attach(level,readText(reader)); state.effectFn = recordCvarEffect
  probe = cv.createVm(); probeName = ""; count = readInt(reader)
  for action = 1 to count
    kind = readInt(reader)
    switch kind
      case 1
        gameCvars.register(level)
      end case
      case 2
        gameCvars.update(level)
      end case
      case 3
        name = readText(reader); value = readText(reader); force = readInt(reader) != 0
        cv.set2(state.registry,name,value,force)
      end case
      case 4
        maintenance.check(level)
      end case
      case 5
        frame.run(level,readInt(reader))
      end case
      case 6
        level = cvarLevel(world,check); gameCvars.rebind(level,state)
      end case
      case 7
        name = readText(reader); cv.find(state.registry,name).modificationCount = readInt(reader)
      end case
      case 8
        name = readText(reader); value = readText(reader); flags = readInt(reader); cv.get(state.registry,name,value,flags)
      end case
      case 10
        name = readText(reader); value = readText(reader); flags = readInt(reader); probeName = name
        cv.registerVm(state.registry,probe,name,value,flags)
      end case
      case 11
        cv.updateVm(state.registry,probe)
      end case
      case 12
        probe.handle = readInt(reader); cv.updateVm(state.registry,probe)
      end case
      case 13
        name = readText(reader); value = readText(reader); flags = readInt(reader); cv.registerVm(state.registry,void,name,value,flags)
      end case
      case 14
        name = readText(reader); cv.find(state.registry,name).string = void; cv.updateVm(state.registry,probe)
      end case
      case default
        return error(499,"Invalid game-Cvar test action")
      end case
    end switch
    cvarSnapshot(level,probe,probeName)
  end for
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete game-Cvar stream") end if
  print "PASS: "+str(count)+" game-Cvar actions / "+str(check.words)+" exact words / "+str(check.effects)+" ordered effects"; return 0
end function
