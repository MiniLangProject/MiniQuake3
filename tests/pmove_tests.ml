// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.collision.world as cm
import mq3.game.movement as kernel
import mq3.game.pmove as pm
import mq3.game.playerstate as ps
import mq3.game.constants as c
import mq3.game.replay as replay
import mq3.shared.math as q
import mq3.compat.numeric as n
import std.fs as fs

function worldTrace(p,start,finish)
  hit = cm.trace(p.context,start,finish,p.k.mins,p.k.maxs,0,p.k.mask,false,p.context.patchesReady)
  entity = 1023
  if hit.trace.fraction < 1 then entity = 1022 end if
  return kernel.Collision(hit.trace,hit.endpos,entity)
end function
function worldContents(p,point)
  return cm.pointContents(p.context,point,0)
end function
function mathTest(path)
  data = fs.readAllBytes(path)
  if n.readI32(data,0) != ps.BYTE_SIZE or n.readI32(data,4) != 24 or n.readI32(data,8) != 36 then return 2 end if
  for i = 0 to 35
    if c.itemTag(i) != n.readI32(data,12+i*4) then print "FAIL item tag " + str(i); return 1 end if
  end for
  for i = 0 to 65535
    angles = [n.f32(i*(360.0/65536)),n.f32(((i*73)&65535)*(360.0/65536)),n.f32(((i*1297)&65535)*(360.0/65536))]
    axes = q.AngleVectors(angles)
    snap = [n.f32((i-32768)*0.5),n.f32((i-32768)*0.25),n.f32((i-32768)*0.75)]
    q.SnapVector(snap)
    actual = axes[0]+axes[1]+axes[2]+snap
    for field = 0 to 11
      wanted = n.readU32(data,156+i*48+field*4)
      if n.floatBits(actual[field]) != wanted then
        print "FAIL pmove math " + str(i) + " field " + str(field) + " got " + str(n.floatBits(actual[field])) + " wanted " + str(wanted)
        return 1
      end if
    end for
  end for
  off = 156+65536*48
  probes = n.readI32(data,off)
  for i = 0 to probes-1
    v = n.bitsFloat(n.readU32(data,off+4+i*8)); vector = [v,v,v]
    q.SnapVector(vector)
    if n.floatBits(vector[0]) != n.readU32(data,off+8+i*8) then print "FAIL SnapVector boundary " + str(i); return 1 end if
  end for
  print "PASS: 65536 AngleVectors/SnapVector cases, 26 snap boundaries and all 36 baseq3 item tags"
  return 0
end function
function main(args)
  if args[0] == "--math" then return mathTest(args[1]) end if
  if args[0] == "--contracts" then
    for interval = -1 to 0
      p = pm.create(ps.create(),void,void,void); p.fixed = true; p.fixedMsec = interval
      caught = try(pm.move(p))
      if caught is not error then return 1 end if
    end for
    p = pm.create(ps.create(),void,void,void); p.fixed = true; p.fixedMsec = 201
    caught = try(pm.move(p))
    if caught is not error then return 1 end if
    p.fixed = false; p.ps.weapon = 16
    caught = try(pm.move(p))
    if caught is not error then return 1 end if
    caught = try(ps.load(bytes(467,0),0))
    if caught is not error then return 1 end if
    caught = try(c.itemTag(36))
    if caught is not error then return 1 end if
    for each text in ["1\t2","1\t0\t0\t0\t128\t0\t0\t0\t2","1\t0\t0\t0\t0\t0\t0\t0\t256","-1\t0\t0\t0\t0\t0\t0\t0\t2","1\t0\t0\t0\t1.5\t0\t0\t0\t2","abc\t0\t0\t0\t0\t0\t0\t0\t2"]
      caught = try(replay.commands(text))
      if caught is not error then return 1 end if
    end for
    p = pm.create(ps.create(),void,void,void); p.ps.commandTime = 1000; p.ps.pmove_framecount = 63
    p.cmd.serverTime = 999; pm.move(p)
    if p.ps.commandTime != 1000 or p.ps.pmove_framecount != 63 then return 1 end if
    p.cmd.serverTime = 1000; pm.move(p)
    if p.ps.commandTime != 1000 or p.ps.pmove_framecount != 0 then return 1 end if
    print "PASS: 12 Pmove/input rejection cases and 2 command-time boundaries"
    return 0
  end if
  world = cm.loadWorld(fs.readAllBytes(args[0]),args[3] == "0")
  inputs = fs.readAllBytes(args[1]); expected = fs.readAllBytes(args[2])
  count = n.quotient(len(inputs),520)
  if len(inputs) != count*520 or len(expected) != count*664 then return 2 end if
  state = ps.create()
  index = 0
  while index < count
    off = index*520
    if n.readI32(inputs,off+492) == 0 then state = ps.load(inputs,off) end if
    p = pm.create(state,worldTrace,worldContents,world)
    // The C harness zeroes pmove_t for each outer call, including untouched bounds.
    p.k.mins = [0.0,0.0,0.0]; p.k.maxs = [0.0,0.0,0.0]
    p.cmd = pm.Command(n.readI32(inputs,off+468),[n.readI32(inputs,off+472),n.readI32(inputs,off+476),n.readI32(inputs,off+480)],n.readI32(inputs,off+484),inputs[off+488],n.i8(inputs[off+489]),n.i8(inputs[off+490]),n.i8(inputs[off+491]))
    p.fixed = n.readI32(inputs,off+496) != 0; p.fixedMsec = n.readI32(inputs,off+500)
    p.gauntletHit = n.readI32(inputs,off+504) != 0; p.noFootsteps = n.readI32(inputs,off+508) != 0
    if n.readI32(inputs,off+512) != 0 then pm.single(p) else pm.move(p) end if
    actual = ps.words(state)+[p.cmd.serverTime,p.cmd.angles[0],p.cmd.angles[1],p.cmd.angles[2],p.cmd.buttons,p.cmd.weapon|((p.cmd.forwardmove&255)<<8)|((p.cmd.rightmove&255)<<16)|((p.cmd.upmove&255)<<24)]
    for each value in p.k.mins+p.k.maxs
      actual = actual+[n.floatBits(value)]
    end for
    actual = actual+[p.watertype,p.k.waterlevel,n.floatBits(p.xyspeed),len(p.k.touches)]
    for j = 0 to 31
      entity = 0
      if j < len(p.k.touches) then entity = p.k.touches[j] end if
      actual = actual+[entity]
    end for
    actual = actual+[p.k.mask]
    for field = 0 to 165
      wanted = n.readU32(expected,index*664+field*4)
      if n.u32(actual[field]) != wanted then
        print "FAIL Pmove command " + str(index) + " field " + str(field) + " got " + str(n.u32(actual[field])) + " wanted " + str(wanted)
        return 1
      end if
    end for
    index = index+1
  end while
  print "PASS: " + str(count) + " original Pmove commands, full playerState and command/output fields"
  return 0
end function
