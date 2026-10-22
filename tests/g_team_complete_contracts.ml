// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.g_team as team
import mq3.game.team_missionpack as mission
import mq3.game.entities as game
import mq3.game.spawn as spawn
import mq3.game.constants as c
import mq3.collision.world as cm
import std.fs as fs

struct Context messages end struct
function require(ok,label)
  if not ok then return error(499,"g_team contract: "+label) end if
  return 1
end function
function contractMessage(level,slot,text)
  level.context.messages = level.context.messages+[[slot,text]]; return void
end function
function quiet(level,text) return void end function
function setup(world,gametype)
  level = game.create(world); state = spawn.create(level,""); state.gametype = gametype
  level.context = Context([]); level.teamMessageFn = contractMessage; level.gamePrintFn = quiet
  level.maxclients = 1; level.maxclientsCvar = 1; level.num_entities = 64; level.time = 25000
  player = game.initEntity(level.entities[0]); game.bindClient(level,player,level.clients[0])
  player.client.connected = 2; player.client.team = c.TEAM_RED; player.client.netname = "Ranger"
  player.client.ps.stats[c.STAT_MAX_HEALTH] = 100; player.client.ps.stats[c.STAT_HEALTH] = 100; player.health = 100
  return level
end function
function contracts(world)
  count = 0
  count = count+require(team.OtherTeam(c.TEAM_RED)==c.TEAM_BLUE and team.OtherTeam(c.TEAM_BLUE)==c.TEAM_RED and team.OtherTeam(c.TEAM_FREE)==c.TEAM_FREE,"other team")
  count = count+require(team.TeamName(c.TEAM_RED)=="RED" and team.TeamName(c.TEAM_BLUE)=="BLUE" and team.TeamName(c.TEAM_SPECTATOR)=="SPECTATOR" and team.TeamName(c.TEAM_FREE)=="FREE","team names")
  count = count+require(team.OtherTeamName(c.TEAM_RED)=="BLUE" and team.TeamColorString(c.TEAM_RED)=="^1" and team.TeamColorString(c.TEAM_BLUE)=="^4" and team.TeamColorString(c.TEAM_SPECTATOR)=="^3","labels")
  level = setup(world,4); team.PrintMsg(level,void,"a\"b"); count = count+require(level.context.messages[0][0]==-1 and level.context.messages[0][1]=="a'b","PrintMsg quote sanitizing")
  team.Team_InitGame(level); count = count+require(level.redFlagStatus==0 and level.blueFlagStatus==0 and level.spawner.configstrings[23]=="00","CTF initialization")
  one = setup(world,5); team.Team_InitGame(one); count = count+require(one.neutralFlagStatus==0 and one.spawner.configstrings[23]=="0","One Flag initialization")
  overload = setup(world,6); marker = game.spawn(overload); marker.classname = "team_redobelisk"; marker.s.origin = [64.0,32.0,16.0]; marker.spawnflags = 1
  team.SP_team_redobelisk(overload,marker); obelisk = overload.entities[65]
  count = count+require(marker.s.eType==c.ET_TEAM and marker.s.modelindex==c.TEAM_RED and marker.s.modelindex2==255,"red marker")
  count = count+require(obelisk.inuse and obelisk.takedamage and obelisk.health==250 and obelisk.activator==marker and obelisk.spawnflags==c.TEAM_RED,"Overload spawn")
  count = count+require(obelisk.die==mission.ObeliskDie and obelisk.pain==mission.ObeliskPain and obelisk.think==mission.ObeliskRegen and overload.obeliskAttackFn==mission.CheckObeliskAttack,"Overload callbacks")
  count = count+require(team.CheckObeliskAttack(overload,obelisk,overload.entities[0]),"friendly obelisk protection")
  overload.entities[0].client.team = c.TEAM_BLUE; before = overload.num_entities
  count = count+require(not team.CheckObeliskAttack(overload,obelisk,overload.entities[0]) and overload.redObeliskAttackedTime==overload.time and overload.num_entities==before+1,"enemy warning")
  before = overload.num_entities; team.CheckObeliskAttack(overload,obelisk,overload.entities[0]); count = count+require(overload.num_entities==before,"warning cooldown")
  obelisk.health = 240; marker.s.frame = 2; team.ObeliskRegen(overload,obelisk)
  count = count+require(obelisk.health==241 and marker.s.modelindex2==245 and marker.s.frame==0 and obelisk.nextthink==26000,"regeneration")
  obelisk.health = 200; marker.s.frame = 0; team.ObeliskPain(overload,obelisk,overload.entities[0],19)
  count = count+require(marker.s.modelindex2==204 and marker.s.frame==1,"pain health display")
  obelisk.takedamage = false; marker.s.frame = 2; team.ObeliskRespawn(overload,obelisk)
  count = count+require(obelisk.takedamage and obelisk.health==250 and marker.s.frame==0 and obelisk.nextthink==26000,"respawn")
  harvester = setup(world,7); blue = game.spawn(harvester); blue.classname = "team_blueobelisk"; blue.s.origin = [0.0,0.0,24.0]; blue.spawnflags = 1
  team.SP_team_blueobelisk(harvester,blue); trigger = harvester.entities[65]
  count = count+require(trigger.r.contents==0x40000000 and trigger.touch==mission.ObeliskTouch and trigger.spawnflags==c.TEAM_BLUE,"Harvester trigger")
  player = harvester.entities[0]; player.client.team = c.TEAM_RED; player.client.ps.generic1 = 3; team.ObeliskTouch(harvester,trigger,player,void)
  count = count+require(player.client.ps.generic1==0 and player.client.ps.persistant[c.PERS_CAPTURES]==3 and harvester.teamScores[c.TEAM_RED]==3,"skull capture")
  neutral = game.spawn(harvester); neutral.classname = "team_neutralobelisk"; neutral.s.origin = [8.0,8.0,8.0]; neutral.spawnflags = 1
  team.SP_team_neutralobelisk(harvester,neutral); count = count+require(harvester.neutralObelisk!=void and neutral.s.modelindex==c.TEAM_FREE,"neutral generator")
  bad = setup(world,0); removed = game.spawn(bad); team.SP_team_redobelisk(bad,removed); count = count+require(not removed.inuse,"non-team removal")
  return count
end function
function main(args)
  world = cm.loadWorld(fs.readAllBytes(args[0]),true); count = contracts(world)
  print("PASS: "+str(count)+" g_team complete contracts"); return 0
end function
