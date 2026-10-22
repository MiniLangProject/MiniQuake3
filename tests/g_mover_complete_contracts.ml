import mq3.game.g_mover as mover
import mq3.game.entities as game
import mq3.game.constants as c
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs

function expect(value,message) if not value then print "FAIL "+message; return false end if return true end function
function main(args)
  if len(args) != 1 then return error(490,"Expected empty BSP") end if
  world = cm.loadWorld(fs.readAllBytes(args[0]),true); level = game.create(world); checks = 0
  matrix = mover.G_CreateRotationMatrix([0.0,90.0,0.0]); transposed = mover.G_TransposeMatrix(matrix); rotated = mover.G_RotatePoint([10.0,0.0,0.0],transposed)
  if not expect(qabs(rotated[0]) < 0.001 and qabs(rotated[1]) > 9.999,"rotation facade") then return 1 end if; checks = checks+1
  ent = game.initEntity(level.entities[70]); ent.r.mins = [-1.0,-1.0,-1.0]; ent.r.maxs = [1.0,1.0,1.0]; ent.clipmask = 1
  if not expect(mover.G_TestEntityPosition(level,ent) == void,"open position") then return 1 end if; checks = checks+1
  ent.pos1 = [1.0,2.0,3.0]; ent.pos2 = [11.0,2.0,3.0]; ent.s.pos.trDuration = 100; ent.speed = 100.0
  mover.SetMoverState(level,ent,2,25)
  if not expect(ent.s.pos.trTime == 25 and ent.s.pos.trBase == ent.pos1 and ent.s.pos.trDelta[0] == 100.0,"mover state facade") then return 1 end if; checks = checks+1
  corner = game.initEntity(level.entities[71]); corner.classname = "path_corner"; corner.s.origin = [4.0,5.0,6.0]; corner.inuse = true
  mover.SP_path_corner(level,corner)
  if not expect(not corner.inuse,"invalid path corner lifecycle") then return 1 end if; checks = checks+1
  mine = game.initEntity(level.entities[72]); mine.s.eType = c.ET_MISSILE; mine.s.pos.trBase = [32.0,32.0,32.0]; mine.r.currentOrigin = mine.s.pos.trBase; mine.movedir = [0.0,0.0,1.0]; mine.s.number = 72; mine.clipmask = 1
  if not expect(mover.G_CheckProxMinePosition(level,mine),"open prox mine position") then return 1 end if; checks = checks+1
  pusher = game.initEntity(level.entities[73]); pusher.r.currentOrigin = [0.0,0.0,0.0]
  if not expect(mover.G_TryPushingProxMine(level,mine,pusher,[1.0,0.0,0.0],[0.0,0.0,0.0]) and mine.s.pos.trBase[0] == 33.0,"prox mine push facade") then return 1 end if; checks = checks+1
  print "PASS: "+str(checks)+" complete g_mover contracts"; return 0
end function

function qabs(value) if value < 0 then return n.fneg(value) end if return value end function
