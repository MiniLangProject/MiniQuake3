// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.collision.world as cm
import mq3.game.movement as pm
import mq3.compat.numeric as n
import std.fs as fs
function real(data,off)
  return n.bitsFloat(n.readU32(data,off))
end function
function vector(data,off)
  return [real(data,off),real(data,off+4),real(data,off+8)]
end function
function worldTrace(state,start,finish)
  hit = cm.trace(state.context,start,finish,state.mins,state.maxs,0,state.mask,false,state.context.patchesReady)
  entity = 1023
  if hit.trace.fraction < 1 then entity = 1022 end if
  return pm.Collision(hit.trace,hit.endpos,entity)
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),args[3] == "0")
  inputs = fs.readAllBytes(args[1]); expected = fs.readAllBytes(args[2])
  count = n.quotient(len(inputs),128)
  if len(inputs) != count*128 or len(expected) != count*188 then return 2 end if
  state = pm.create(worldTrace,world)
  index = 0
  while index < count
    off = index*128
    if n.readI32(inputs,off+124) == 0 then
      state = pm.create(worldTrace,world)
      state.origin = vector(inputs,off+52);state.velocity = vector(inputs,off+64)
    end if
    state.touches = [];state.impactSpeed = 0.0
    mode = n.readI32(inputs,off);useGravity = n.readI32(inputs,off+4)!=0
    state.gravity = n.readI32(inputs,off+8);state.pmTime = n.readI32(inputs,off+12)
    state.walking = n.readI32(inputs,off+16)!=0;state.groundPlane = n.readI32(inputs,off+20)!=0
    state.groundFlags = n.readI32(inputs,off+24);state.waterlevel = n.readI32(inputs,off+28)
    state.pmFlags = n.readI32(inputs,off+32);state.flight = n.readI32(inputs,off+36)!=0
    state.pmType = n.readI32(inputs,off+40);state.speed = n.readI32(inputs,off+44)
    state.frametime = real(inputs,off+48);state.groundNormal = vector(inputs,off+76)
    wishdir = vector(inputs,off+88);wishspeed = real(inputs,off+100);accel = real(inputs,off+104)
    forward = n.readI32(inputs,off+112);right = n.readI32(inputs,off+116);up = n.readI32(inputs,off+120)
    value = 0.0;clipped = 0
    switch mode
      case 0
        state.velocity = pm.clipVelocity(state.velocity,state.groundNormal,real(inputs,off+108))
      end case
      case 1
        pm.accelerate(state,wishdir,wishspeed,accel)
      end case
      case 2
        pm.friction(state)
      end case
      case 3
        value = pm.cmdScale(state,forward,right,up)
      end case
      case 4
        if pm.slideMove(state,useGravity) then clipped = 1 end if
      end case
      case 5
        pm.stepSlideMove(state,useGravity)
      end case
      case 6
        for j = 0 to 49
          pm.addTouchEnt(state,100+((forward+j*(right+128))%40))
          pm.addTouchEnt(state,1022)
        end for
      end case
      case 7
        j = 0
        while j < up+128
          pm.addEvent(state,6+(j%4));j = j+1
        end while
      end case
      case 8
        pm.friction(state);pm.accelerate(state,wishdir,wishspeed,accel);pm.stepSlideMove(state,useGravity)
      end case
      case default
        return 3
      end case
    end switch
    actual = [n.floatBits(state.origin[0]),n.floatBits(state.origin[1]),n.floatBits(state.origin[2]),n.floatBits(state.velocity[0]),n.floatBits(state.velocity[1]),n.floatBits(state.velocity[2]),n.floatBits(state.impactSpeed),n.floatBits(value),clipped,len(state.touches)]
    for j = 0 to 31
      entity = 0
      if j < len(state.touches) then entity = state.touches[j] end if
      actual = actual+[entity]
    end for
    actual = actual+[state.eventSequence,state.events[0],state.events[1],state.eventParms[0],state.eventParms[1]]
    for field = 0 to 46
      wanted = n.readU32(expected,index*188+field*4)
      if n.u32(actual[field]) != wanted then
        print "FAIL movement case " + str(index) + " mode " + str(mode) + " field " + str(field) + " got " + str(actual[field]) + " wanted " + str(wanted)
        return 1
      end if
    end for
    index = index+1
  end while
  print "PASS: " + str(count) + " original shared movement operations, including chained frames"
  return 0
end function
