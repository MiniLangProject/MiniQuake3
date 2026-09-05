// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.entities as game
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.game.pmove as pm
import mq3.game.snapshot as convert
import mq3.game.teleport as teleport
import mq3.game.triggers as triggers
import mq3.server.world as sv
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs
function vector(data,off)
  return [n.bitsFloat(n.readU32(data,off)),n.bitsFloat(n.readU32(data,off+4)),n.bitsFloat(n.readU32(data,off+8))]
end function
function boolean(value)
  if value then return 1 end if
  return 0
end function
function floatWords(values)
  result = []
  for each value in values
    result = result+[n.floatBits(value)]
  end for
  return result
end function
function observe(level,kind,ent)
  row = [3,level.num_entities,0,0,0,0,0,0,0,0,0,0]
  if kind != 3 then
    flags = 0; seq = 0
    if ent.client != void then flags = ent.client.ps.eFlags; seq = ent.client.ps.eventSequence end if
    row = [kind,ent.slot,ent.s.eType,ent.s.clientNum,ent.s.solid,boolean(ent.r.linked)]+floatWords(ent.r.currentOrigin)+[flags,seq,level.time]
  end if
  level.context = level.context+[row]
  return void
end function
function damage(level,hit,inflictor,attacker,dir,point,amount,flags,mod)
  level.context = level.context+[[4,hit.slot,inflictor.slot,attacker.slot,amount,flags,mod,boolean(dir == void),boolean(point == void),boolean(hit.r.linked),boolean(attacker.r.linked),level.time]]
  return void
end function
function recordTouch(level,self,other,hit)
  tr = hit.trace
  level.context = level.context+[[5,self.slot,other.slot,n.floatBits(tr.fraction),boolean(tr.allsolid),boolean(tr.startsolid),tr.contents,hit.entityNum]+floatWords(hit.endpos)+[level.time]]
  return void
end function
function doorTouch(level,self,other,hit)
  return recordTouch(level,self,other,hit)
end function
function setTouch(ent,kind)
  ent.touch = void
  if kind == 1 then ent.touch = triggers.pushTouch end if
  if kind == 2 then ent.touch = triggers.teleporterTouch end if
  if kind == 3 then ent.touch = recordTouch end if
  if kind == 4 then ent.touch = doorTouch end if
  return void
end function
function snapshot(ent)
  pwords = array(117,0); client = [0,0,0,0]
  if ent.client != void then pwords = ps.words(ent.client.ps); client = [ent.client.team]+ent.client.cmdAngles end if
  r = ent.r
  result = [ent.slot]+es.words(ent.s)+[boolean(ent.client != void)]+pwords+client
  result = result+[boolean(ent.inuse),ent.freetime,boolean(ent.neverFree),ent.eventTime,boolean(ent.freeAfterEvent),ent.spawnflags]
  result = result+floatWords(r.mins+r.maxs+r.currentOrigin+r.currentAngles+r.absmin+r.absmax)
  result = result+[r.contents,boolean(r.bmodel),r.svFlags,r.ownerNum,boolean(r.linked),r.linkcount,len(r.clusters)]
  for i = 0 to 15
    value = 0
    if i < len(r.clusters) then value = r.clusters[i] end if
    result = result+[value]
  end for
  return result+[r.lastCluster,r.areanum,r.areanum2,r.sector]
end function
function extras(level)
  result = [len(level.context)]
  for each row in level.context
    result = result+row
  end for
  events = []; i = 64
  while i < level.num_entities
    ent = level.entities[i]; i = i+1
    if ent.inuse and ent.classname == "tempEntity" then events = events+[ent] end if
  end while
  result = result+[len(events)]
  for each ent in events
    result = result+snapshot(ent)
  end for
  return result
end function
function text32(data,off)
  length = 0
  while length < 32 and data[off+length] != 0
    length = length+1
  end while
  if length == 0 then return void end if
  return decode(slice(data,off,length))
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),args[3] == "0"); level = void
  inputs = fs.readAllBytes(args[1]); expected = fs.readAllBytes(args[2]); off = 0; outputOff = 0; index = 0
  while off < len(inputs)
    op = n.readI32(inputs,off); off = off+4; actual = []
    if level != void then level.context = [] end if
    switch op
      case 0
        level = game.create(world); level.randSeed = n.readI32(inputs,off); level.time = n.readI32(inputs,off+4); level.startTime = level.time
        level.context = []; level.observeFn = observe; level.damageFn = damage; level.doorTouch = doorTouch; off = off+8; actual = [64]
      end case
      case 1
        number = n.readI32(inputs,off); ent = level.entities[number]; game.initEntity(ent); ent.s = es.load(inputs,off+44)
        ent.client = void
        if n.readI32(inputs,off+4) != 0 then ent.client = game.Client(ps.load(inputs,off+252),n.readI32(inputs,off+8),[n.readI32(inputs,off+768),n.readI32(inputs,off+772),n.readI32(inputs,off+776)]) end if
        setTouch(ent,n.readI32(inputs,off+12)); ent.r.bmodel = n.readI32(inputs,off+16) != 0
        ent.r.contents = n.readI32(inputs,off+20); ent.r.svFlags = n.readI32(inputs,off+24); ent.r.ownerNum = n.readI32(inputs,off+28)
        ent.neverFree = n.readI32(inputs,off+36) != 0; ent.spawnflags = n.readI32(inputs,off+40)
        ent.r.mins = vector(inputs,off+720); ent.r.maxs = vector(inputs,off+732); ent.r.currentOrigin = vector(inputs,off+744); ent.r.currentAngles = vector(inputs,off+756)
        ent.target = text32(inputs,off+780); ent.targetname = text32(inputs,off+812)
        if number >= level.num_entities then level.num_entities = number+1 end if
        if n.readI32(inputs,off+32) != 0 then game.link(level,ent) end if
        actual = snapshot(ent); off = off+844
      end case
      case 2
        ent = level.entities[n.readI32(inputs,off)]; teleport.player(level,ent,vector(inputs,off+4),vector(inputs,off+16)); actual = snapshot(ent); off = off+28
      end case
      case 3
        ent = level.entities[n.readI32(inputs,off)]; off = off+4; triggers.touch(level,ent); actual = snapshot(ent)
      end case
      case 4
        ent = level.entities[n.readI32(inputs,off)]
        command = pm.Command(n.readI32(inputs,off+4),[n.readI32(inputs,off+8),n.readI32(inputs,off+12),n.readI32(inputs,off+16)],n.readI32(inputs,off+20),inputs[off+24],n.i8(inputs[off+25]),n.i8(inputs[off+26]),n.i8(inputs[off+27]))
        ent.client.cmdAngles = command.angles; p = pm.create(ent.client.ps,sv.pmoveTrace,sv.pmoveContents,level.scene); p.cmd = command
        p.k.mins = [0.0,0.0,0.0]; p.k.maxs = [0.0,0.0,0.0]; p.fixed = n.readI32(inputs,off+28) != 0; p.fixedMsec = n.readI32(inputs,off+32); pm.move(p)
        ent.r.mins = p.k.mins; ent.r.maxs = p.k.maxs; ent.r.currentOrigin = [p.ps.origin[0],p.ps.origin[1],p.ps.origin[2]]
        convert.fromPlayer(p.ps,ent.s,true); game.link(level,ent); triggers.touch(level,ent); actual = snapshot(ent); off = off+36
      end case
      case 5,6
        ent = level.entities[n.readI32(inputs,off)]; off = off+4
        if op == 5 then game.unlink(level,ent) else game.free(level,ent) end if
        actual = snapshot(ent)
      end case
      case 7
        level.time = n.readI32(inputs,off); off = off+4; actual = [level.time]
      end case
      case 8
        ent = game.spawn(level); actual = snapshot(ent)+[level.num_entities,boolean(game.entitiesFree(level))]
      end case
      case 9
        ent = game.tempEntity(level,vector(inputs,off),n.readI32(inputs,off+12)); off = off+16; actual = snapshot(ent)
      end case
      case 10
        ent = game.pickTarget(level,text32(inputs,off)); off = off+32; number = -1
        if ent != void then number = ent.slot end if
        actual = [number]
      end case
      case 11
        actual = [game.random(level)]
      end case
      case 12
        number = n.readI32(inputs,off+24); game.syncSpatial(level.entities[number])
        actual = [boolean(sv.entityContact(level.scene,vector(inputs,off),vector(inputs,off+12),number,n.readI32(inputs,off+28) != 0))]; off = off+32
      end case
      case default
        return 2
      end case
    end switch
    actual = actual+extras(level); wantedCount = n.readI32(expected,outputOff); outputOff = outputOff+4
    if len(actual) != wantedCount then print "FAIL transition size "+str(index)+" got "+str(len(actual))+" wanted "+str(wantedCount); return 1 end if
    for field = 0 to wantedCount-1
      wanted = n.readU32(expected,outputOff+field*4)
      if n.u32(actual[field]) != wanted then
        print "FAIL transition "+str(index)+" op "+str(op)+" field "+str(field)+" got "+str(n.u32(actual[field]))+" wanted "+str(wanted); return 1
      end if
    end for
    outputOff = outputOff+wantedCount*4; index = index+1
  end while
  if outputOff != len(expected) then return 2 end if
  testLevel = void
  for recent = 0 to 1
    testLevel = game.create(world); testLevel.num_entities = 1022; testLevel.time = 5000
    for slot = 0 to 1021
      testLevel.entities[slot].inuse = true
    end for
    if recent != 0 then testLevel.entities[64].inuse = false; testLevel.entities[64].freetime = 4999 end if
    caught = try(game.spawn(testLevel))
    if caught is not error then print "FAIL exhausted spawn"; return 1 end if
    testLevel.entities[64].inuse = false; testLevel.entities[64].freetime = 4000
    found = game.spawn(testLevel)
    if found.slot != 64 then return 1 end if
  end for
  caught = try(teleport.player(testLevel,testLevel.entities[100],[0,0,0],[0,0,0]))
  if caught is not error then return 1 end if
  print "PASS: "+str(index)+" original game transitions / "+str(n.quotient(outputOff,4))+" exact words including callback order; 5 allocator/client contracts"
  return 0
end function
