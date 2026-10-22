// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_active as gactive
import mq3.game.entities as game
import mq3.collision.world as cm
import std.fs as fs

function row(name,live,hasClient,lo,hi,world)
  level=game.create(world);level.maxclients=2
  first=game.initEntity(level.entities[0]);game.bindClient(level,first,level.clients[0]);first.health=100
  first.r.absmin=[-42.0,-42.0,-42.0];first.r.absmax=[42.0,42.0,42.0]
  second=game.initEntity(level.entities[1]);if hasClient then game.bindClient(level,second,level.clients[1]) end if
  if live then second.health=100 else second.health=0 end if
  second.r.absmin=[lo,lo,lo];second.r.absmax=[hi,hi,hi]
  value=0;if gactive.StuckInOtherClient(level,first) then value=1 end if;print(name+":"+str(value))
end function
function main(args)
  world=cm.loadWorld(fs.readAllBytes(args[0]),true)
  level=game.create(world);level.maxclients=1;first=game.initEntity(level.entities[0]);game.bindClient(level,first,level.clients[0]);first.health=100
  first.r.absmin=[-42.0,-42.0,-42.0];first.r.absmax=[42.0,42.0,42.0]
  value=0;if gactive.StuckInOtherClient(level,first) then value=1 end if;print("empty:"+str(value))
  row("apart",true,true,43.0,80.0,world);row("dead",false,true,-5.0,5.0,world)
  row("nonclient",true,false,-5.0,5.0,world);row("overlap",true,true,-5.0,5.0,world)
  return 0
end function
