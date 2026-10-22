// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_combat as completeCombat
import mq3.compat.numeric as combatNumeric
function hex32(value) digits="0123456789abcdef";textValue="";for i=0 to 7 textValue=textValue+digits[(value>>((7-i)*4))&15] end for;return textValue end function
function line(origin,radius,point,dir)
  intersections=[[0.0,0.0,0.0],[0.0,0.0,0.0]];count=completeCombat.RaySphereIntersections(origin,radius,point,dir,intersections)
  return str(count)+" "+hex32(combatNumeric.floatBits(intersections[0][0]))+" "+hex32(combatNumeric.floatBits(intersections[0][1]))+" "+hex32(combatNumeric.floatBits(intersections[0][2]))+" "+hex32(combatNumeric.floatBits(intersections[1][0]))+" "+hex32(combatNumeric.floatBits(intersections[1][1]))+" "+hex32(combatNumeric.floatBits(intersections[1][2]))
end function
function main(args)
  print(line([0.0,0.0,0.0],42.0,[-100.0,0.0,0.0],[1.0,0.0,0.0]))
  print(line([0.0,0.0,0.0],42.0,[42.0,0.0,0.0],[0.0,1.0,0.0]))
  print(line([0.0,0.0,0.0],42.0,[50.0,50.0,0.0],[1.0,0.0,0.0]))
  print(line([0.0,0.0,0.0],9.5,[1.25,-2.5,3.75],[-4.0,5.0,-6.0]))
  return 0
end function
