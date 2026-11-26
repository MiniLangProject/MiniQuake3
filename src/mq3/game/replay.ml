// SPDX-License-Identifier: GPL-2.0-or-later
// Headless movement replay against static world collision.
package mq3.game.replay
import mq3.game.pmove as pm
import mq3.game.playerstate as states
import mq3.game.movement as kernel
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.string as strings

/// Build the `mq3.game.movement.Collision` result for `worldTrace`. Return paths include `kernel.Collision(hit.trace,hit.endpos,entity)`.
/// @param p Player movement context; accesses `context` and `k`.
/// @param start Array or byte sequence accessed at `axis`.
/// @param finish Array or byte sequence accessed at `axis`.
function worldTrace(p,start,finish)
  hit = cm.boxTrace(p.context,start,finish,p.k.mins,p.k.maxs,0,p.k.mask,false)
  entity = 1023
  if hit.trace.fraction < 1 then entity = 1022 end if
  return kernel.Collision(hit.trace,hit.endpos,entity)
end function
/// Forward `worldContents` to `mq3.collision.world.pointContents` and return the delegated result.
/// @param p Player movement context; accesses `context`.
/// @param point Three-component point used by the geometric query.
function worldContents(p,point)
  return cm.pointContents(p.context,point,0)
end function
/// Apply `mq3.game.playerstate.create`, `mq3.game.movement.copy` and `mq3.game.pmove.create` while evaluating `create`. Return paths include `pm.create(s,worldTrace,worldContents,world)`.
/// @param world Context forwarded to the configured host callbacks.
/// @param origin World-space position as three coordinates.
function create(world,origin)
  s = states.create()
  s.origin = kernel.copy(origin); s.gravity = 800; s.speed = 320; s.viewheight = 26
  s.groundEntityNum = 1023; s.weapon = 2
  s.stats[0] = 100; s.stats[2] = 2046; s.stats[6] = 100
  for index = 0 to 15
    s.ammo[index] = 100
  end for
  s.ammo[1] = -1
  return pm.create(s,worldTrace,worldContents,world)
end function
/// Parse movement replay rows as nine tab-separated signed 32-bit integers, skipping empty lines and comments.
/// @param text Text to parse, format or deliver.
function commands(text)
  result = []; lineNumber = 0
  for each line in strings.split(text,"\n")
    lineNumber = lineNumber+1; line = strings.trim(line)
    if len(line) == 0 or strings.startsWith(line,"#") then continue end if
    fields = strings.split(line,"\t")
    if len(fields) != 9 then return error(474,"Movement input line "+str(lineNumber)+" requires 9 tab-separated integers") end if
    numbers = []
    for each field in fields
      value = toNumber(strings.trim(field))
      if typeof(value) != "int" or value < -2147483648 or value > 2147483647 then return error(474,"Invalid movement integer on line "+str(lineNumber)) end if
      numbers = numbers+[value]
    end for
    if numbers[0] < 0 or numbers[0] > 2147482000 or numbers[8] < 0 or numbers[8] > 255 then return error(474,"Invalid movement time/weapon") end if
    for axis = 4 to 6
      if numbers[axis] < -128 or numbers[axis] > 127 then return error(474,"Movement axes must fit a signed byte") end if
    end for
    result = result+[pm.Command(numbers[0],[numbers[1],numbers[2],numbers[3]],numbers[7],numbers[8],numbers[4],numbers[5],numbers[6])]
  end for
  return result
end function
/// Serialize the selected player and movement-kernel fields as one tab-separated replay result row.
/// @param p Player movement context; accesses `ps` and `k`.
function row(p)
  s = p.ps
  values = [s.commandTime]+s.origin+s.velocity+[s.groundEntityNum,s.pm_flags,p.k.waterlevel,s.weapon,s.weaponTime,s.eventSequence,s.events[0],s.events[1]]
  text = ""
  for each value in values
    if len(text) != 0 then text = text+"\t" end if
    text = text+str(value)
  end for
  return text
end function
/// Apply `mq3.game.replay.commands`, `mq3.game.replay.create` and `mq3.game.pmove.move` while evaluating `run`.
/// @param world Context forwarded to the configured host callbacks.
/// @param origin World-space position as three coordinates.
/// @param text Text to parse, format or deliver.
function run(world,origin,text)
  inputs = commands(text); p = create(world,origin)
  print "time\tx\ty\tz\tvx\tvy\tvz\tground\tflags\twater\tweapon\tweaponTime\teventSequence\tevent0\tevent1"
  for each command in inputs
    p.cmd = command; pm.move(p)
    print row(p)
  end for
  return 0
end function
