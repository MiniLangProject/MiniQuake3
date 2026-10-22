import mq3.game.bg_pmove_runtime as bg
import mq3.game.pmove as pm
import mq3.game.playerstate as state
import mq3.game.movement as movement
import mq3.game.constants as c
import mq3.collision.brush as brush

struct TraceContext
  solid
end struct

function testTrace(p,start,finish)
  trace = brush.emptyTrace()
  trace.allsolid = p.context.solid
  if trace.allsolid then trace.startsolid = true; trace.fraction = 0.0 end if
  return movement.Collision(trace,finish,1023)
end function
function noContents(p,point) return 0 end function
function expect(value,message) if not value then print "FAIL " + message; return false end if return true end function

function main(args)
  checks = 0
  context = TraceContext(false)
  p = pm.create(state.create(),testTrace,noContents,context)
  p.ps.speed = 320; p.ps.gravity = 800; p.ps.weapon = c.WP_MACHINEGUN
  p.ps.stats[c.STAT_HEALTH] = 100; p.ps.stats[c.STAT_WEAPONS] = 1 << c.WP_MACHINEGUN
  p.ps.ammo[c.WP_MACHINEGUN] = 100

  clipped = bg.PM_ClipVelocity([100.0,0.0,-100.0],[0.0,0.0,1.0],1.001)
  if not expect(clipped[0] == 100.0 and clipped[2] > 0.09 and clipped[2] < 0.11,"clip velocity facade") then return 1 end if; checks = checks+1
  bg.PM_AddTouchEnt(p,7); bg.PM_AddTouchEnt(p,7); bg.PM_AddTouchEnt(p,1022)
  if not expect(len(p.k.touches) == 1 and p.k.touches[0] == 7,"touch deduplication") then return 1 end if; checks = checks+1
  bg.PM_AddEvent(p,23)
  if not expect(p.ps.eventSequence == 1 and p.ps.events[0] == 23,"event ring") then return 1 end if; checks = checks+1

  p.cmd.forwardmove = 127; p.cmd.rightmove = -127; p.cmd.upmove = 20
  p.ps.velocity = [10.0,20.0,30.0]
  bg.PM_InvulnerabilityMove(p)
  if not expect(p.cmd.forwardmove == 0 and p.cmd.rightmove == 0 and p.cmd.upmove == 0 and p.ps.velocity == [0.0,0.0,0.0],"invulnerability move") then return 1 end if; checks = checks+1
  if not expect(not bg.PM_CheckStuck(p),"open stuck probe") then return 1 end if; checks = checks+1
  context.solid = true
  if not expect(bg.PM_CheckStuck(p),"solid stuck probe") then return 1 end if; checks = checks+1
  context.solid = false

  p.ps.powerups[c.PW_INVULNERABILITY] = 1
  p.missionpack = true
  p.ps.pm_flags = p.ps.pm_flags | 16384
  p.ps.velocity = [90.0,-40.0,60.0]
  p.cmd = pm.Command(16,[0,0,0],0,c.WP_MACHINEGUN,100,50,20)
  bg.PmoveSingle(p)
  if not expect(p.ps.velocity == [0.0,0.0,0.0],"productive invulnerability dispatch") then return 1 end if; checks = checks+1
  if not expect(p.cmd.forwardmove == 0 and p.cmd.rightmove == 0 and p.cmd.upmove == 0,"productive input suppression") then return 1 end if; checks = checks+1
  if not expect(p.k.mins == [-42.0,-42.0,-42.0] and p.k.maxs == [42.0,42.0,42.0],"invulnerability bounds") then return 1 end if; checks = checks+1

  p.ps.powerups[c.PW_INVULNERABILITY] = 0
  p.ps.commandTime = 16; p.cmd.serverTime = 82; p.cmd.forwardmove = 0; p.cmd.rightmove = 0; p.cmd.upmove = 0
  bg.Pmove(p)
  if not expect(p.ps.commandTime == 82,"Pmove facade") then return 1 end if; checks = checks+1
  if not expect(bg.sqrt(81.0) == 9.0,"sqrt dependency") then return 1 end if; checks = checks+1
  print "PASS: " + str(checks) + " complete bg_pmove contracts"
  return 0
end function
