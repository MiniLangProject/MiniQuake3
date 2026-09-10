import mq3.client.playable_player as player

function require(ok,message) if not ok then return error(7541,message) end if;return 1 end function
function entity(classname,origin,angle) return [["classname",classname],["origin",origin],["angle",angle]] end function

function main(args)
  count=0
  entities=[entity("worldspawn","0 0 0",""),entity("info_player_deathmatch","10 20 30","90"),entity("INFO_PLAYER_DEATHMATCH","100 200 300","-45")]
  state=player.fromEntities(entities)
  count=count+require(len(state.spawns)==2 and state.spawnIndex==0,"deathmatch spawns loaded")
  count=count+require(state.position==[10.0,20.0,78.0] and state.yaw==90.0,"eye-height spawn pose")
  count=count+require(state.health==100 and state.armor==0 and state.ammo==50 and state.weapon=="weapon_machinegun","default loadout")
  count=count+require(state.alive and state.deaths==0 and state.respawnAt==0,"initial lifecycle")
  count=count+require(player.armorSave(100,10)==7 and player.armorSave(2,100)==2,"baseq3 armor rounding and cap")
  player.setStats(state,100,50,12,"weapon_railgun")
  hit=player.applyNormalDamage(state,30,100)
  count=count+require(hit.saved==20 and hit.taken==10 and state.health==90 and state.armor==30,"armor absorbs 66 percent")
  direct=player.applyDamage(state,15,200,true)
  count=count+require(direct.saved==0 and direct.taken==15 and state.health==75 and state.armor==30,"armor bypass")
  fatal=player.applyNormalDamage(state,500,300)
  count=count+require(fatal.killed and fatal.taken==75 and state.health==0 and state.armor==0,"lethal damage clamps health")
  count=count+require(not state.alive and state.deaths==1 and state.respawnAt==2000,"death and baseq3 respawn deadline")
  ignored=player.applyNormalDamage(state,10,400)
  count=count+require(ignored.ignored and ignored.taken==0 and state.deaths==1,"dead player ignores damage")
  early=player.pollRespawn(state,1999)
  count=count+require(not early.respawned and not state.alive,"no early respawn")
  spawned=player.pollRespawn(state,2000)
  count=count+require(spawned.respawned and spawned.spawnIndex==1 and state.position==[100.0,200.0,348.0] and state.yaw==-45.0,"respawn cycles spawn")
  count=count+require(state.health==100 and state.armor==0 and state.ammo==50 and state.weapon=="weapon_machinegun","respawn resets loadout")
  count=count+require(state.alive and state.respawnAt==0 and state.invulnerableUntil==3000,"respawn invulnerability")
  protected=player.applyNormalDamage(state,50,2999)
  count=count+require(protected.ignored and state.health==100,"spawn protection blocks damage")
  exposed=player.applyNormalDamage(state,50,3000)
  count=count+require(not exposed.ignored and state.health==50,"protection expires at deadline")
  player.configure(state,0,0);player.applyDamage(state,500,3001,true);again=player.pollRespawn(state,3001)
  count=count+require(again.respawned and again.spawnIndex==0 and state.deaths==2,"zero-delay respawn wraps spawn cycle")
  fallback=player.fromEntities([entity("info_player_start","1 2 3","180")])
  count=count+require(len(fallback.spawns)==1 and fallback.position==[1.0,2.0,51.0],"player-start fallback")
  originFallback=player.fromEntities([entity("worldspawn","0 0 0","")])
  count=count+require(originFallback.position==[0.0,0.0,64.0],"missing-spawn fallback")
  count=count+require(try(player.fromEntities(void)) is error,"missing entities rejected")
  count=count+require(try(player.configure(state,-1,0)) is error,"negative timing rejected")
  count=count+require(try(player.applyNormalDamage(state,-1,0)) is error,"negative damage rejected")
  count=count+require(try(player.pollRespawn(state,-1)) is error,"negative time rejected")
  zero=player.applyNormalDamage(state,0,4000)
  count=count+require(zero.taken==0 and not zero.ignored,"zero damage is a valid no-op")
  print("PASS: "+str(count)+" playable-player contracts");return 0
end function
