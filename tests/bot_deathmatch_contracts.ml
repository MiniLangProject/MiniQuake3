// SPDX-License-Identifier: GPL-2.0-or-later
import mq3.game.bot_deathmatch as dm
import mq3.game.bot_lifecycle as life
import mq3.game.playerstate as ps
import mq3.game.bot_combat_ai as combat
function req(value,label) if not value then return error(499,"ai_dmq3 contract: "+label) end if;return 1 end function
function bot(client) b=life.createBot(client);b.curPs=ps.create();b.inventory=array(204,0);b.teamGoal=dm.goal();return b end function
function setup()
  s=dm.create();s.maxclients=3;s.gametype=dm.GT_CTF;s.configs[0]="\\n\\^1Mr [Q3]Ranger\\t\\1\\model\\sarge/default";s.configs[1]="\\n\\Sarge\\t\\1\\model\\sarge/red";s.configs[2]="\\n\\Crash\\t\\2\\model\\crash/blue";return s
end function
function contracts()
  n=0;s=setup();b=bot(0);n=n+req(dm.botTeam(s,b)==dm.TEAM_RED and dm.botOppositeTeam(s,b)==dm.TEAM_BLUE,"teams");n=n+req(dm.botSameTeam(s,b,1) and not dm.botSameTeam(s,b,2),"same team")
  b.inventory[45]=1;n=n+req(dm.botCTFCarryingFlag(s,b)==1,"red flag inventory");b.inventory[45]=0;s.gametype=dm.GT_1FCTF;b.inventory[dm.INVENTORY_NEUTRALFLAG]=1;n=n+req(dm.bot1FCTFCarryingFlag(s,b),"neutral flag");s.gametype=dm.GT_HARVESTER;b.inventory[dm.INVENTORY_REDCUBE]=2;n=n+req(dm.botHarvesterCarryingCubes(s,b),"harvester cubes")
  e=combat.EntityInfo(2,1<<7,0);n=n+req(dm.entityCarriesFlag(e),"entity flag");e.powerups=e.powerups|(1<<4);n=n+req(not dm.entityIsInvisible(e),"flag stays visible");e.powerups=1<<4;n=n+req(dm.entityIsInvisible(e),"invisibility");e.flags=0x100|0x1000;n=n+req(dm.entityIsShooting(e) and dm.entityIsChatting(e),"entity flags")
  n=n+req(dm.clientName(s,0)=="Mr [Q3]Ranger" and dm.clientSkin(s,1)=="sarge/red","client fields");n=n+req(dm.clientFromName(s,"Sarge")==1 and dm.clientOnSameTeamFromName(s,b,"Sarge")==1,"client lookup");n=n+req(dm.easyClientName(s,0)=="ranger","easy client name");n=n+req(dm.stristr("OneRocketTwo","ROCKET")==3 and dm.stristr("One","x")==-1,"stristr")
  s.gametype=dm.GT_CTF;n=n+req(dm.teamPlayIsOn(s),"teamplay");n=n+req(dm.botEnemyFlag(s,b)==s.blueFlag and dm.botTeamFlag(s,b)==s.redFlag,"flag goal selection")
  b.ordered=true;b.decisionmaker=2;b.ltgtype=4;b.teammate=1;b.teamGoal.areanum=99;dm.botRememberLastOrderedTask(s,b);b.ltgtype=0;n=n+req(dm.botSetLastOrderedTask(s,b,true) and b.ltgtype==4 and b.teamGoal.areanum==99,"ordered task restore")
  n=n+req(len(s.actions)==1 and not s.actions[0].dispatched,"team status suppressed")
  s.actions=[];dm.botTeamGoals(s,b,false,false);n=n+req(s.actions[0].kind=="strategy" and s.actions[0].text=="ctf","CTF strategy dispatch")
  s.gametype=dm.GT_HARVESTER;s.actions=[];dm.botTeamGoals(s,b,true,false);n=n+req(s.actions[0].text=="harvester" and s.actions[0].value==1,"harvester retreat")
  s.pointAreaFn=pointFn;n=n+req(dm.botPointAreaNum(s,[1.0,2.0,3.0])==77,"point area")
  dm.botInitWaypoints(s);w=dm.botCreateWayPoint(s,"Alpha",[1.0,2.0,3.0],7);n=n+req(dm.botFindWayPoint(s,s.waypoints,"alpha")==w,"waypoint case-insensitive");dm.botFreeWaypoints(s,s.waypoints);n=n+req(len(s.waypoints)==0,"waypoint free")
  b.inventory[dm.INVENTORY_HEALTH]=30;b.inventory[dm.INVENTORY_TELEPORTER]=1;s.gametype=0;s.actions=[];n=n+req(dm.botBattleUseItems(s,b,false) and s.actions[0].text=="teleporter","low-health teleporter")
  b.inventory[dm.INVENTORY_HEALTH]=50;b.inventory[dm.INVENTORY_MEDKIT]=1;s.actions=[];n=n+req(dm.botBattleUseItems(s,b,false) and s.actions[0].text=="medkit","medkit")
  ent=dm.entity(10);ent.valid=true;ent.modelindex=3;ent.eType=4;ent.origin=[10.0,20.0,30.0];ent.mins=[-1.0,-2.0,-3.0];ent.maxs=[1.0,2.0,3.0];s.entities[10]=ent;box=dm.botModelMinsMaxs(s,3,4,0);n=n+req(box[0]==10 and box[1]==[9.0,18.0,27.0] and box[2]==[11.0,22.0,33.0],"model bounds")
  g=dm.goal();g.origin=[10.0,20.0,30.0];n=n+req(dm.botSetEntityNumForGoalWithModel(s,g,4,"*3")==10 and g.entitynum==10,"goal model entity")
  ent.classname="nearby_other";s.entities[10]=ent;g.entitynum=0;n=n+req(dm.botSetEntityNumForGoal(s,g,"team_redobelisk")==10,"goal classname original inequality")
  s.mapname="q3tourney6";b.tfl=0x7fffffff;s.actions=[];n=n+req(dm.botMapScripts(s,b,false) and len(s.actions)==1,"map script")
  grenade=dm.entity(7);grenade.eType=dm.ET_MISSILE;grenade.weapon=dm.WP_GRENADE_LAUNCHER;grenade.origin=[4.0,5.0,6.0];s.actions=[];n=n+req(dm.botCheckForGrenades(s,b,grenade,false) and s.actions[0].value==160,"grenade avoidance")
  body=dm.entity(8);body.flags=dm.EF_KAMIKAZE|dm.EF_DEAD;n=n+req(dm.botCheckForKamikazeBody(s,b,body) and s.kamikazeBodies[b.client]==8,"kamikaze body")
  s.snapshotEntities=[grenade,body];s.actions=[];n=n+req(dm.botCheckSnapshot(s,b,false)==2,"snapshot scan")
  s.redAltGoals=[dm.goal()];s.blueAltGoals=[dm.goal(),dm.goal()];n=n+req(dm.botSetupAlternativeRouteGoals(s)==3,"alternate route setup")
  bsp=dm.entity(2);bsp.classname="info_camp";bsp.origin=[1.0,2.0,3.0];s.bspEntities=[bsp];s.pointAreaFn=pointFn;g=dm.goal();n=n+req(dm.botGoalForBSPEntity(s,"info_camp",g) and g.areanum==77,"BSP entity goal")
  s.mapname="q3dm1";n=n+req(dm.botSetupDeathmatchAI(s,true) and s.setup,"deathmatch setup");dm.botShutdownDeathmatchAI(s);n=n+req(not s.setup and len(s.redAltGoals)==0,"deathmatch shutdown")
  n=n+req(dm.inFieldOfVision([0.0,0.0,0.0],90.0,[0.0,40.0,0.0]),"FOV inside");n=n+req(not dm.inFieldOfVision([0.0,0.0,0.0],90.0,[0.0,60.0,0.0]),"FOV outside")
  return n
end function
function pointFn(state,origin) return 77 end function
function main(args) n=contracts();print("PASS: "+str(n)+" ai_dmq3 adapter contracts");return 0 end function
