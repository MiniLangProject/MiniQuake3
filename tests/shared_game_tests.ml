// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.trajectory as tr
import mq3.game.jumppad as pad
import mq3.game.playerstate as ps
import mq3.shared.math as q
import mq3.compat.numeric as n
import std.fs as fs
function vector(data,off)
  return [n.bitsFloat(n.readU32(data,off)),n.bitsFloat(n.readU32(data,off+4)),n.bitsFloat(n.readU32(data,off+8))]
end function
function main(args)
  inputs = fs.readAllBytes(args[0]); expected = fs.readAllBytes(args[1]); count = n.quotient(len(inputs),528)
  if len(inputs) != count*528 or len(expected) != count*516 then return 2 end if
  for index = 0 to count-1
    off = index*528
    trajectory = tr.Trajectory(n.readI32(inputs,off),n.readI32(inputs,off+4),n.readI32(inputs,off+8),vector(inputs,off+12),vector(inputs,off+24))
    time = n.readI32(inputs,off+36); state = ps.load(inputs,off+40)
    number = n.readI32(inputs,off+508); impulse = vector(inputs,off+512); angle = n.bitsFloat(n.readU32(inputs,off+524))
    actual = []
    for each value in tr.evaluate(trajectory,time)+tr.evaluateDelta(trajectory,time)
      actual = actual+[n.floatBits(value)]
    end for
    touches = 0
    if tr.playerTouchesItem(state,trajectory,time) then touches = 1 end if
    actual = actual+[touches]
    for each value in q.vectoangles(impulse)+[q.AngleNormalize360(angle),q.AngleNormalize180(angle)]
      actual = actual+[n.floatBits(value)]
    end for
    pad.touch(state,number,impulse); actual = actual+ps.words(state)
    for field = 0 to 128
      wanted = n.readU32(expected,index*516+field*4)
      if n.u32(actual[field]) != wanted then
        print "FAIL shared game case "+str(index)+" field "+str(field)+" got "+str(n.u32(actual[field]))+" wanted "+str(wanted)
        return 1
      end if
    end for
  end for
  for each kind in [-1,6,4]
    trajectory = tr.Trajectory(kind,0,0,[0,0,0],[1,1,1])
    caught = try(tr.evaluate(trajectory,0))
    if caught is not error then return 1 end if
    caught = try(tr.evaluateDelta(trajectory,0))
    if caught is not error then return 1 end if
  end for
  print "PASS: "+str(count)+" trajectory/item/jumppad/angle cases, "+str(count*129)+" exact words and 6 rejection cases"
  return 0
end function
