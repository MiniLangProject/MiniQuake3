import mq3.game.bg_pmove_runtime as bg
import mq3.game.pmove as pm
import mq3.game.playerstate as state
import mq3.compat.numeric as n

function noTrace(p,start,finish) return void end function
function noContents(p,point) return 0 end function
function hex32(value) digits="0123456789abcdef";text="";for i=0 to 7 text=text+digits[(value>>((7-i)*4))&15] end for;return text end function

function main(args)
  p = pm.create(state.create(),noTrace,noContents,void)
  p.cmd.forwardmove = 127; p.cmd.rightmove = -80; p.cmd.upmove = 20
  p.ps.velocity = [120.5,-31.25,480.0]
  bg.PM_InvulnerabilityMove(p)
  print "invulnerability=" + str(p.cmd.forwardmove) + "," + str(p.cmd.rightmove) + "," + str(p.cmd.upmove) + ";" + hex32(n.floatBits(p.ps.velocity[0])) + "," + hex32(n.floatBits(p.ps.velocity[1])) + "," + hex32(n.floatBits(p.ps.velocity[2]))
  return 0
end function
