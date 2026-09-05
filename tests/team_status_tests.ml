// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.team_status as teamStatus
import mq3.game.cvar_maintenance as maintenance
import mq3.game.frame as frame
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.collision.world as cm
import mq3.collision.visibility as vis
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
function readFloat(reader)
  value = n.bitsFloat(n.readI32(reader.data,reader.offset)); reader.offset = reader.offset+4; return value
end function
function readPosition(reader)
  return [readFloat(reader),readFloat(reader),readFloat(reader)]
end function
function readString(reader)
  size = readInt(reader); text = decode(slice(reader.data,reader.offset,size)); reader.offset = reader.offset+size; return text
end function
function word(check,value)
  if check.offset+4 > len(check.expected) then return error(499,"Unexpected team-status output") end if
  wanted = n.readU32(check.expected,check.offset)
  if n.u32(value) != wanted then return error(499,"Team-status mismatch at byte "+str(check.offset)+" got "+str(n.u32(value))+" wanted "+str(wanted)) end if
  check.offset = check.offset+4; check.words = check.words+1; return void
end function
function words(check,values)
  for each value in values
    word(check,value)
  end for
  return void
end function
function string(check,value)
  data = bytes(value); word(check,len(data))
  for each part in data
    if check.offset >= len(check.expected) or check.expected[check.offset] != part then return error(499,"Team-status string mismatch at byte "+str(check.offset)) end if
    check.offset = check.offset+1
  end for
  return void
end function
function locationWords(level)
  for slot = 0 to 63
    word(level.context,level.clients[slot].teamStateLocation)
  end for
  return void
end function
function recordOverlay(level,slot,text)
  words(level.context,[171,slot,level.lastTeamLocationTime]); locationWords(level); string(level.context,text)
  level.context.effects = level.context.effects+1; return void
end function
function recordMaintenance(level,key,value)
  words(level.context,[172,level.lastTeamLocationTime,level.cvarMaintenance.passwordModificationCount]); string(level.context,key); string(level.context,value)
  level.context.effects = level.context.effects+1; return void
end function
function recordTeamStage(level,kind,arg)
  words(level.context,[110,kind,arg]); level.context.effects = level.context.effects+1; return void
end function
function recordTeamEntity(level,kind,ent)
  return recordTeamStage(level,13,ent.slot)
end function
function recordTeamEndFrame(level,ent)
  return recordTeamStage(level,14,ent.slot)
end function
function teamLevel(world,check)
  level = game.create(world); spawn.create(level,""); level.context = check
  level.serverCommandFn = recordOverlay; level.cvarSetFn = recordMaintenance; level.frameStageFn = recordTeamStage
  level.runEntityFn = recordTeamEntity; level.clientEndFrameFn = recordTeamEndFrame
  for slot = 0 to 63
    game.bindClient(level,level.entities[slot],level.clients[slot])
  end for
  return level
end function
function configure(world,reader,check)
  level = teamLevel(world,check)
  level.maxclientsCvar = readInt(reader); level.maxclients = readInt(reader); level.lastTeamLocationTime = readInt(reader); level.time = readInt(reader)
  count = readInt(reader)
  for slot = 0 to 63
    ent = level.entities[slot]; client = level.clients[slot]
    ent.inuse = readInt(reader) != 0; client.connected = readInt(reader); client.team = readInt(reader); client.teamInfo = readInt(reader) != 0
    client.teamStateLocation = readInt(reader); client.ps.stats[c.STAT_HEALTH] = readInt(reader); client.ps.stats[c.STAT_ARMOR] = readInt(reader)
    client.ps.weapon = readInt(reader); ent.s.powerups = readInt(reader); ent.r.currentOrigin = readPosition(reader)
  end for
  for slot = 0 to 63
    level.sortedClients[slot] = readInt(reader)
  end for
  tail = void; index = 0
  while index < count
    location = level.entities[64+index]; location.health = readInt(reader); location.r.currentOrigin = readPosition(reader)
    location.inuse = true; location.classname = "target_location"
    if tail == void then level.locationHead = location else tail.nextTrain = location end if
    tail = location; index = index+1
  end while
  level.num_entities = 64+count; return level
end function
function teamSnapshot(level)
  words(level.context,[170,level.time,level.previousTime,level.framenum,level.lastTeamLocationTime]); return locationWords(level)
end function
function requireTeam(condition,label)
  if not condition then return error(499,"Failed team-status contract: "+label) end if
  return void
end function
function ignoreCvar(level,key,value)
  return void
end function
function contracts(world)
  level = game.create(world); level.time = 1000; level.maxclientsCvar = 65
  teamStatus.check(level); requireTeam(level.lastTeamLocationTime == 0,"exact interval returns before client access")
  level.time = 1001; requireTeam(try(teamStatus.check(level)) is error,"Cvar client limit")
  level.maxclientsCvar = 1; level.time = 2002; requireTeam(try(teamStatus.check(level)) is error,"missing client bindings")
  game.bindClient(level,level.entities[0],level.clients[0]); level.clients[0].teamInfo = true
  requireTeam(try(teamStatus.sendInfo(level,level.entities[0])) is error,"server-command delivery")
  level.sortedClients[0] = 64; requireTeam(try(teamStatus.sendInfo(level,level.entities[0])) is error,"sorted slot outside storage")
  location = level.entities[64]; level.locationHead = location; location.r.currentOrigin[1] = n.bitsFloat(0x7fc00000)
  requireTeam(try(teamStatus.getLocation(level,level.entities[0])) is error,"non-finite PVS coordinate")
  location.r.currentOrigin[1] = 0.0; location.nextTrain = location
  requireTeam(try(teamStatus.getLocation(level,level.entities[0])) is error,"cyclic location chain")
  requireTeam(try(maintenance.check(level)) is error,"Cvar delivery")
  level.cvarSetFn = ignoreCvar; level.cvarMaintenance.password = decode(bytes([97,0,98]))
  requireTeam(try(maintenance.check(level)) is error,"password NUL")
  level.cvarMaintenance.password = decode(bytes(256,97)); requireTeam(try(maintenance.check(level)) is error,"password storage")
  other = game.create(world); level.cvarMaintenance.password = "protected"; maintenance.check(level)
  requireTeam(other.cvarMaintenance.lastPasswordModificationCount == -1,"independent game modules")
  level.cvarMaintenance = void; requireTeam(try(maintenance.check(level)) is error,"missing module state")
  print "PASS: 12 team-status/Cvar runtime contracts"; return 0
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true)
  if len(args)>3 and args[3]=="--contracts" then return contracts(world) end if
  reader = Reader(fs.readAllBytes(args[1]),0); check = Check(fs.readAllBytes(args[2]),0,0,0)
  level = configure(world,reader,check); count = readInt(reader)
  for index = 1 to count
    kind = readInt(reader)
    switch kind
      case 1
        level.time = readInt(reader); teamStatus.check(level)
      end case
      case 2
        slot = readInt(reader); teamStatus.sendInfo(level,level.entities[slot])
      end case
      case 3
        slot = readInt(reader); location = teamStatus.getLocation(level,level.entities[slot]); selected = -1
        if location != void then selected = location.slot end if
        words(check,[173,selected])
      end case
      case 4
        level.cvarMaintenance.passwordModificationCount = readInt(reader); level.cvarMaintenance.password = readString(reader); maintenance.check(level)
      end case
      case 5
        area1 = readInt(reader); area2 = readInt(reader); opened = readInt(reader) != 0
        vis.adjustAreaPortalState(world.visibility,area1,area2,opened)
      end case
      case 6
        frame.run(level,readInt(reader))
      end case
      case 7
        state = level.cvarMaintenance; maxclients = level.maxclientsCvar
        level = teamLevel(world,check); level.cvarMaintenance = state; level.maxclientsCvar = maxclients; level.time = 1000; level.startTime = 1000
      end case
      case 8
        slot = readInt(reader); level.entities[slot].r.currentOrigin = readPosition(reader)
      end case
      case default
        return error(499,"Invalid team-status test action")
      end case
    end switch
    teamSnapshot(level)
  end for
  if reader.offset != len(reader.data) or check.offset != len(check.expected) then return error(499,"Incomplete team-status stream") end if
  print "PASS: "+str(count)+" team-status/Cvar actions / "+str(check.words)+" exact words / "+str(check.effects)+" ordered effects"; return 0
end function
