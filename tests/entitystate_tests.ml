// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.entitystate as es
import mq3.game.playerstate as ps
import mq3.game.snapshot as snapshot
import mq3.game.teleport as teleport
import mq3.game.entities as entities
import mq3.server.world as sv
import mq3.compat.numeric as n
import std.fs as fs
function vector(data,off)
  return [n.bitsFloat(n.readU32(data,off)),n.bitsFloat(n.readU32(data,off+4)),n.bitsFloat(n.readU32(data,off+8))]
end function
function main(args)
  inputs = fs.readAllBytes(args[0]); expected = fs.readAllBytes(args[1]); count = n.quotient(len(inputs),712)
  if len(inputs) != count*712 or len(expected) != count*712 then return 2 end if
  for index = 0 to count-1
    off = index*712; p = ps.load(inputs,off); s = es.load(inputs,off+468)
    raw = es.words(s)
    for field = 0 to 51
      if raw[field] != n.readU32(inputs,off+468+field*4) then print "FAIL entity codec"; return 1 end if
    end for
    snap = n.readI32(inputs,off+676) != 0; extra = n.readI32(inputs,off+680) != 0; time = n.readI32(inputs,off+684)
    snapshot.convert(p,s,snap,extra,time); actual = ps.words(p)+es.words(s)
    e = entities.blank(0,sv.entity(0)); e.client = entities.createClient(p,0,[n.readI32(inputs,off+700),n.readI32(inputs,off+704),n.readI32(inputs,off+708)])
    teleport.setClientViewAngle(e,vector(inputs,off+688)); actual = actual+p.delta_angles
    for each value in p.viewangles+e.s.angles
      actual = actual+[n.floatBits(value)]
    end for
    for field = 0 to 177
      wanted = n.readU32(expected,off+field*4)
      if n.u32(actual[field]) != wanted then
        print "FAIL entity state case "+str(index)+" field "+str(field)+" got "+str(n.u32(actual[field]))+" wanted "+str(wanted); return 1
      end if
    end for
  end for
  caught = try(es.load(bytes(207,0),0))
  if caught is not error then return 1 end if
  caught = try(es.load(bytes(208,0),-1))
  if caught is not error then return 1 end if
  print "PASS: "+str(count)+" entity-state/view-angle cases, complete 208-byte codec and two rejection contracts"
  return 0
end function
