// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_weapon as weapon
import mq3.game.weapon_state as weaponState
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.collision.world as cm
import mq3.compat.numeric as n
import std.fs as fs
function main(args)
  world=cm.loadWorld(fs.readAllBytes(args[0]),true);level=game.create(world);spawn.create(level,"");level.num_entities=64;level.maxclients=1;level.time=1000;level.randSeed=1
  ent=game.initEntity(level.entities[0]);game.bindClient(level,ent,level.clients[0]);ent.client.team=1;state=weaponState.get(level);state.muzzle=[10.0,20.0,30.0];state.forward=[1.0,0.0,0.0];state.right=[0.0,-1.0,0.0];state.up=[0.0,0.0,1.0];state.quadFactor=1.5
  nail=weapon.Weapon_Nailgun_Fire(level,ent);print("nail|"+str(level.num_entities-64)+"|"+str(nail.damage)+"|"+str(nail.s.weapon)+"|"+str(nail.nextthink))
  state.forward=[1.0,0.0,0.0];prox=weapon.weapon_proxlauncher_fire(level,ent);print("prox|"+str(n.trunc32(prox.s.pos.trDelta[0]))+"|"+str(n.trunc32(prox.s.pos.trDelta[1]))+"|"+str(n.trunc32(prox.s.pos.trDelta[2]))+"|"+str(prox.s.pos.trTime)+"|"+str(prox.splashDamage))
  count=100;while count<=2000
    shock=n.trunc32(n.fdiv(n.fmul(n.i32(count),1320.0),2000.0));boom=0;if count>=250 then boom=n.trunc32(n.fdiv(n.fmul(n.i32(count-250),720.0),1750.0)) end if;print("radius|"+str(count)+"|"+str(shock)+"|"+str(boom))
    count=count+100
  end while
  return 0
end function
