// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.server.world as sv
import mq3.collision.world as cm
import mq3.game.pmove as pm
import mq3.game.playerstate as ps
import mq3.game.jumppad as pad
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
  words = []
  for each value in values
    words = words+[n.floatBits(value)]
  end for
  return words
end function
function metadata(ent)
  actual = [boolean(ent.linked),ent.linkcount,ent.solid]+floatWords(ent.absmin+ent.absmax)+[len(ent.clusters)]
  for i = 0 to 15
    value = 0
    if i < len(ent.clusters) then value = ent.clusters[i] end if
    actual = actual+[value]
  end for
  return actual+[ent.lastCluster,ent.areanum,ent.areanum2,ent.sector]
end function
function traceWords(hit)
  tr = hit.trace
  return floatWords([tr.fraction]+tr.normal+[tr.distance])+[tr.surfaceFlags,tr.contents,boolean(tr.startsolid),boolean(tr.allsolid)]+floatWords(hit.endpos)+[tr.planeMetadata,hit.entityNum]
end function
function pmoveWords(p)
  s = p.ps
  actual = ps.words(s)+[p.cmd.serverTime,p.cmd.angles[0],p.cmd.angles[1],p.cmd.angles[2],p.cmd.buttons,p.cmd.weapon|((p.cmd.forwardmove&255)<<8)|((p.cmd.rightmove&255)<<16)|((p.cmd.upmove&255)<<24)]
  actual = actual+floatWords(p.k.mins+p.k.maxs)+[p.watertype,p.k.waterlevel,n.floatBits(p.xyspeed),len(p.k.touches)]
  for j = 0 to 31
    value = 0
    if j < len(p.k.touches) then value = p.k.touches[j] end if
    actual = actual+[value]
  end for
  return actual+[p.k.mask]
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),args[3] == "0")
  inputs = fs.readAllBytes(args[1]); expected = fs.readAllBytes(args[2])
  scene = void; state = ps.create(); off = 0; outputOff = 0; record = 0
  while off < len(inputs)
    op = n.readI32(inputs,off); off = off+4; actual = []
    switch op
      case 0
        scene = sv.create(world); state = ps.create(); actual = [len(scene.sectors)]
        for each node in scene.sectors
          actual = actual+[node.axis,n.floatBits(node.distance),node.children[0],node.children[1]]
        end for
      end case
      case 1
        number = n.readI32(inputs,off); ent = sv.getEntity(scene,number)
        ent.bmodel = n.readI32(inputs,off+4) != 0; ent.modelindex = n.readI32(inputs,off+8)
        ent.svFlags = n.readI32(inputs,off+12); ent.contents = n.readI32(inputs,off+16); ent.ownerNum = n.readI32(inputs,off+20)
        ent.mins = vector(inputs,off+24); ent.maxs = vector(inputs,off+36)
        ent.currentOrigin = vector(inputs,off+48); ent.currentAngles = vector(inputs,off+60)
        ent.origin = vector(inputs,off+72); ent.angles = vector(inputs,off+84)
        sv.linkEntity(scene,number); actual = metadata(ent); off = off+96
      end case
      case 2
        number = n.readI32(inputs,off); off = off+4
        sv.unlinkEntity(scene,number); actual = metadata(sv.getEntity(scene,number))
      end case
      case 3
        found = sv.areaEntities(scene,vector(inputs,off),vector(inputs,off+12),n.readI32(inputs,off+24))
        actual = [len(found)]+found; off = off+28
      end case
      case 4,5
        start = vector(inputs,off); finish = vector(inputs,off+12); mins = vector(inputs,off+24); maxs = vector(inputs,off+36)
        number = n.readI32(inputs,off+48); mask = n.readI32(inputs,off+52); capsule = n.readI32(inputs,off+56) != 0
        result = void
        if op == 4 then result = sv.trace(scene,start,finish,mins,maxs,number,mask,capsule)
        else result = sv.clipToEntity(scene,start,finish,mins,maxs,number,mask,capsule) end if
        actual = traceWords(result); off = off+60
      end case
      case 6
        actual = [sv.pointContents(scene,vector(inputs,off),n.readI32(inputs,off+12))]; off = off+16
      end case
      case 7
        if n.readI32(inputs,off+492) == 0 then state = ps.load(inputs,off) end if
        p = pm.create(state,sv.pmoveTrace,sv.pmoveContents,scene)
        p.k.mins = [0.0,0.0,0.0]; p.k.maxs = [0.0,0.0,0.0]
        p.cmd = pm.Command(n.readI32(inputs,off+468),[n.readI32(inputs,off+472),n.readI32(inputs,off+476),n.readI32(inputs,off+480)],n.readI32(inputs,off+484),inputs[off+488],n.i8(inputs[off+489]),n.i8(inputs[off+490]),n.i8(inputs[off+491]))
        p.fixed = n.readI32(inputs,off+496) != 0; p.fixedMsec = n.readI32(inputs,off+500)
        p.gauntletHit = n.readI32(inputs,off+504) != 0; p.noFootsteps = n.readI32(inputs,off+508) != 0
        if n.readI32(inputs,off+512) != 0 then pm.single(p) else pm.move(p) end if
        actual = pmoveWords(p); off = off+520
      end case
      case 8
        pad.touch(state,n.readI32(inputs,off),vector(inputs,off+4)); actual = ps.words(state); off = off+16
      end case
      case default
        print "FAIL unknown server operation "+str(op); return 2
      end case
    end switch
    for field = 0 to len(actual)-1
      wanted = n.readU32(expected,outputOff+field*4)
      if n.u32(actual[field]) != wanted then
        print "FAIL server record "+str(record)+" op "+str(op)+" field "+str(field)+" got "+str(n.u32(actual[field]))+" wanted "+str(wanted)
        return 1
      end if
    end for
    outputOff = outputOff+len(actual)*4; record = record+1
  end while
  if outputOff != len(expected) then return 2 end if
  for each number in [-1,1024]
    caught = try(sv.getEntity(scene,number))
    if caught is not error then return 1 end if
  end for
  for each capacity in [-1,1025]
    caught = try(sv.areaEntities(scene,[0,0,0],[1,1,1],capacity))
    if caught is not error then return 1 end if
  end for
  ent = sv.getEntity(scene,900); ent.mins = [1,0,0]; ent.maxs = [0,1,1]
  caught = try(sv.linkEntity(scene,900))
  if caught is not error then return 1 end if
  ent.mins = [0,0,0]; ent.number = 901
  caught = try(sv.linkEntity(scene,900))
  if caught is not error then return 1 end if
  print "PASS: "+str(record)+" server operations / "+str(n.quotient(outputOff,4))+" exact words and 6 rejected invalid contracts"
  return 0
end function
