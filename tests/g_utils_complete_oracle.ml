// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_utils as utils
import mq3.game.entities as game
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs
function showMove(angles)
  movedir = [9.0,9.0,9.0]; utils.G_SetMovedir(angles,movedir)
  print("move|"+str(n.floatBits(movedir[0]))+"|"+str(n.floatBits(movedir[1]))+"|"+str(n.floatBits(movedir[2]))+"|"+str(n.floatBits(angles[1])))
end function
function main(args)
  for each vector in [[0.0,0.0,0.0],[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,-1.0,0.0],[-2.0,3.0,7.0]]
    print("yaw|"+str(n.floatBits(utils.vectoyaw(vector))))
  end for
  showMove([0.0,-1.0,0.0]); showMove([10.0,20.0,30.0])
  world = cm.loadWorld(fs.readAllBytes(args[0]),true); level = game.create(world)
  print("vtos|"+utils.vtos(level,[-2.0,3.0,7.0])); vector = utils.tv(1.25,-2.5,3.75)
  print("tv|"+str(n.floatBits(vector[0]))+"|"+str(n.floatBits(vector[1]))+"|"+str(n.floatBits(vector[2])))
  utils.AddRemap(level,"textures/a","textures/b",1.25); utils.AddRemap(level,"TEXTURES/A","textures/c",2.5); utils.AddRemap(level,"x","y",0.0)
  print("shader|"+utils.BuildShaderStateConfig(level)); return 0
end function
