// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_items as gItems
import mq3.game.items as itemKernel
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.playerstate as ps
import mq3.game.constants as c
import mq3.qcommon.cvar as cv
import mq3.collision.world as cm
import std.fs as fs
function req(ok,label) if not ok then return error(499,"g_items contract: "+label) end if;return 1 end function
function quiet(level,text) return void end function
function info(level,slot) return "\\handicap\\75" end function
function setup(world)
  level=game.create(world);state=spawn.create(level,"");state.missionpack=true;state.gametype=7;level.maxclients=1;level.num_entities=64;level.time=1000;level.previousTime=900;level.gamePrintFn=quiet;level.gameLogFn=quiet;level.userinfoFn=info
  player=game.initEntity(level.entities[0]);game.bindClient(level,player,game.createClient(ps.create(),c.TEAM_RED,[0,0,0]));player.client.connected=2;player.client.ps.persistant[c.PERS_TEAM]=c.TEAM_RED;player.client.ps.stats[c.STAT_HEALTH]=100;player.client.ps.stats[c.STAT_MAX_HEALTH]=100;player.health=100
  return level
end function
function main(args)
  world=cm.loadWorld(fs.readAllBytes(args[0]),true);level=setup(world);state=level.spawner;player=level.entities[0];count=0
  gItems.ClearRegisteredItems(level);count=count+req(level.itemRegistered[8]==1 and level.itemRegistered[10]==1 and level.itemRegistered[47]==1 and level.itemRegistered[48]==1,"missionpack registration defaults")
  gItems.RegisterItem(level,51);gItems.SaveRegisteredItems(level);count=count+req(len(state.configstrings[27])==52 and bytes(state.configstrings[27])[51]==49,"complete CS_ITEMS")
  cv.set2(state.cvars,"disable_item_scout","1",true);count=count+req(gItems.G_ItemDisabled(level,42)==1,"disabled cvar");cv.set2(state.cvars,"disable_item_scout","0",true)
  ent=game.spawn(level);ent.classname="item_guard";count=count+req(spawn.callSpawn(state,ent) and ent.item==43 and ent.think==itemKernel.finishSpawning and ent.s.generic1==0,"productive missionpack spawn dispatch")
  // Persistent pickups use retail userinfo handicap and preserve the entity pointer.
  ent.s.modelindex=43;ent.item=43;gItems.Pickup_PersistantPowerup(level,ent,player)
  count=count+req(player.client.ps.stats[7]==43 and player.client.persistantPowerup==ent and player.health==150 and player.client.ps.stats[c.STAT_ARMOR]==150 and player.client.maxHealth==150,"guard pickup")
  scout=game.spawn(level);scout.item=42;scout.s.modelindex=42;scout.s.generic1=2;player.client.ps.stats[7]=0;player.client.persistantPowerup=void;player.client.ps.stats[c.STAT_ARMOR]=99
  count=count+req(itemKernel.canGrab(0,scout,player.client.ps),"persistent team eligibility");gItems.Pickup_PersistantPowerup(level,scout,player);count=count+req(player.client.maxHealth==75 and player.client.ps.stats[c.STAT_ARMOR]==0,"scout pickup")
  regen=game.spawn(level);regen.item=45;regen.s.modelindex=45;player.client.ps.stats[7]=0;player.client.ammoTimes[3]=99;gItems.Pickup_PersistantPowerup(level,regen,player);count=count+req(player.client.ammoTimes[3]==0,"ammo regen timers")
  kami=game.spawn(level);kami.item=36;kami.s.modelindex=36;player.client.ps.eFlags=0;gItems.Pickup_Holdable(level,kami,player);count=count+req((player.client.ps.eFlags&0x200)!=0 and player.client.ps.stats[c.STAT_HOLDABLE_ITEM]==36,"kamikaze holdable")
  state.gametype=5;flag=gItems.LaunchItem(level,46,[0.0,0.0,64.0],[0.0,0.0,0.0]);count=count+req(flag.item==46 and flag.think==itemKernel.droppedFlagThink and flag.nextthink==31000,"one-flag dropped lifecycle")
  stationary=game.spawn(level);stationary.item=39;stationary.s.eType=c.ET_ITEM;stationary.s.pos.trType=c.TR_STATIONARY;gItems.G_RunItem(level,stationary);count=count+req(stationary.inuse,"frame item facade")
  state.gametype=5;gItems.G_CheckTeamItems(level);count=count+req(true,"missionpack map checks")
  print("PASS: "+str(count)+" g_items complete contracts");return 0
end function




