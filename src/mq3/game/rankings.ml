// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native port of code/game/g_rankings.c.
package mq3.game.rankings

import mq3.compat.numeric as n

const QGR_STATUS_NEW=0
const QGR_STATUS_SPECTATOR=1
const QGR_STATUS_ACTIVE=2
const QGR_STATUS_PENDING=4
const QGR_STATUS_NO_USER=6
const QGR_STATUS_BAD_PASSWORD=7
const QGR_STATUS_NO_MEMBERSHIP=9
const QGR_STATUS_TIMEOUT=10
const QGR_STATUS_INVALIDUSER=11
const QGR_STATUS_ERROR=12
const TEAM_SPECTATOR=3
const SPECTATOR_FREE=1
const SVF_BOT=8
const ENTITYNUM_WORLD=1022
const GT_TEAM=3

const WP_GAUNTLET=1
const WP_MACHINEGUN=2
const WP_SHOTGUN=3
const WP_GRENADE_LAUNCHER=4
const WP_ROCKET_LAUNCHER=5
const WP_LIGHTNING=6
const WP_RAILGUN=7
const WP_PLASMAGUN=8
const WP_BFG=9
const WP_GRAPPLING_HOOK=10
const WP_NAILGUN=11
const WP_PROX_LAUNCHER=12
const WP_CHAINGUN=13
const PW_QUAD=1
const PW_BATTLESUIT=2
const PW_HASTE=3
const PW_INVIS=4
const PW_REGEN=5
const PW_FLIGHT=6
const PW_REDFLAG=7
const PW_BLUEFLAG=8
const PW_SCOUT=10
const PW_GUARD=11
const PW_DOUBLER=12
const PW_AMMOREGEN=13
const HI_TELEPORTER=1
const HI_MEDKIT=2
const HI_KAMIKAZE=3
const HI_PORTAL=4
const HI_INVULNERABILITY=5
const EF_AWARD_EXCELLENT=8
const EF_AWARD_IMPRESSIVE=32768

const MOD_UNKNOWN=0
const MOD_SHOTGUN=1
const MOD_GAUNTLET=2
const MOD_MACHINEGUN=3
const MOD_GRENADE=4
const MOD_GRENADE_SPLASH=5
const MOD_ROCKET=6
const MOD_ROCKET_SPLASH=7
const MOD_PLASMA=8
const MOD_PLASMA_SPLASH=9
const MOD_RAILGUN=10
const MOD_LIGHTNING=11
const MOD_BFG=12
const MOD_BFG_SPLASH=13
const MOD_WATER=14
const MOD_SLIME=15
const MOD_LAVA=16
const MOD_CRUSH=17
const MOD_TELEFRAG=18
const MOD_FALLING=19
const MOD_SUICIDE=20
const MOD_TRIGGER_HURT=22
const MOD_GRAPPLE=28

const QGR_KEY_MATCH_RATING=1112000001
const QGR_KEY_PLAYED_WITH=1210000002
const QGR_KEY_HOSTNAME=1000010000
const QGR_KEY_MAP=1000010001
const QGR_KEY_MOD=1000010002
const QGR_KEY_GAMETYPE=1010010003
const QGR_KEY_FRAGLIMIT=1010010004
const QGR_KEY_TIMELIMIT=1010010005
const QGR_KEY_MAXCLIENTS=1010010006
const QGR_KEY_MAXRATE=1010010007
const QGR_KEY_MINPING=1010010008
const QGR_KEY_MAXPING=1010010009
const QGR_KEY_DEDICATED=1010010010
const QGR_KEY_VERSION=1000010011
const QGR_KEY_FRAG=1211020000
const QGR_KEY_SUICIDE=1111020001
const QGR_KEY_SHOT_FIRED=1111020002
const QGR_KEY_HIT_GIVEN=1111020003
const QGR_KEY_HIT_TAKEN=1111020004
const QGR_KEY_DAMAGE_GIVEN=1111020005
const QGR_KEY_DAMAGE_TAKEN=1111020006
const QGR_KEY_SPLASH_GIVEN=1111020007
const QGR_KEY_SPLASH_TAKEN=1111020008
const QGR_KEY_PICKUP_WEAPON=1111020009
const QGR_KEY_TIME=1111020010
const QGR_KEY_BOXES=1111030000
const QGR_KEY_ROUNDS=1111030001
const QGR_KEY_HEALTH=1111040000
const QGR_KEY_HEALTH_TOTAL=1111040001
const QGR_KEY_ARMOR=1111050000
const QGR_KEY_ARMOR_TOTAL=1111050001
const QGR_KEY_POWERUP=1111060000
const QGR_KEY_MEDKIT=1111070000
const QGR_KEY_MEDKIT_USE=1111070001
const QGR_KEY_TELEPORTER=1111070100
const QGR_KEY_TELEPORTER_USE=1111070101
const QGR_KEY_KAMIKAZE=1111070200
const QGR_KEY_KAMIKAZE_USE=1111070201
const QGR_KEY_PORTAL=1111070300
const QGR_KEY_PORTAL_USE=1111070301
const QGR_KEY_INVULNERABILITY=1111070400
const QGR_KEY_INVULNERABILITY_USE=1111070401
const QGR_KEY_HAZARD_DEATH=1111080000
const QGR_KEY_TEAMMATE_FRAG=1211100000
const QGR_KEY_TEAMMATE_HIT_GIVEN=1111100001
const QGR_KEY_TEAMMATE_HIT_TAKEN=1111100002
const QGR_KEY_TEAMMATE_DAMAGE_GIVEN=1111100003
const QGR_KEY_TEAMMATE_DAMAGE_TAKEN=1111100004
const QGR_KEY_TEAMMATE_SPLASH_GIVEN=1111100005
const QGR_KEY_TEAMMATE_SPLASH_TAKEN=1111100006
const QGR_KEY_TEAM_NAME=1100100007
const QGR_KEY_FLAG_PICKUP=1111110000
const QGR_KEY_FLAG_CAPTURE=1111110001

struct Client present inuse bot name team status spectatorState enterTime weaponChangeTime matchRating matchTime end struct
struct Report stringValue index1 index2 key value text accum end struct
struct Action kind client text value end struct
struct State warmupTime time framenum maxclients gametype fraglimit timelimit intermissiontime clients reports actions cvars lastFrame lastSelf lastAttacker lastMod initialized active reportIntFn reportStrFn statusFn rankBeginFn rankPollFn rankResetFn end struct

function client() return Client(true,true,false,"",TEAM_SPECTATOR,QGR_STATUS_NEW,SPECTATOR_FREE,0,0,0,0) end function
function create(maxclients)
  clients=[];for i=0 to maxclients-1 clients=clients+[client()] end for
  return State(0,0,0,maxclients,0,0,0,0,clients,[],[],[], -1,-1,-1,MOD_UNKNOWN,false,false,void,void,void,void,void,void)
end function
function reportInt(state,index1,index2,key,value,accum) state.reports=state.reports+[Report(false,index1,index2,key,value,"",accum)];if state.reportIntFn!=void then state.reportIntFn(state,index1,index2,key,value,accum) end if;return void end function
function reportStr(state,index1,index2,key,value) state.reports=state.reports+[Report(true,index1,index2,key,0,value,false)];if state.reportStrFn!=void then state.reportStrFn(state,index1,index2,key,value) end if;return void end function
function action(state,kind,client,text,value) state.actions=state.actions+[Action(kind,client,text,value)];return void end function
function status(state,index) if state.statusFn!=void then return state.statusFn(state,index) end if;return state.clients[index].status end function
function ordinal(weapon) if weapon==WP_GAUNTLET then return 1 else if weapon==WP_MACHINEGUN then return 2 else if weapon==WP_SHOTGUN then return 3 else if weapon==WP_GRENADE_LAUNCHER then return 4 else if weapon==WP_ROCKET_LAUNCHER then return 5 else if weapon==WP_PLASMAGUN then return 6 else if weapon==WP_RAILGUN then return 7 else if weapon==WP_LIGHTNING then return 8 else if weapon==WP_BFG then return 9 else if weapon==WP_GRAPPLING_HOOK then return 10 else if weapon==WP_NAILGUN then return 12 else if weapon==WP_PROX_LAUNCHER then return 13 else if weapon==WP_CHAINGUN then return 14 end if;return 0 end function
function specific(base,weapon) return base+ordinal(weapon)*100 end function
function damageSpecific(base,weapon) value=ordinal(weapon);if value==0 then value=11 end if;return base+value*100 end function
function weaponForMod(mod) if mod==MOD_GAUNTLET then return WP_GAUNTLET else if mod==MOD_MACHINEGUN then return WP_MACHINEGUN else if mod==MOD_SHOTGUN then return WP_SHOTGUN else if mod==MOD_GRENADE or mod==MOD_GRENADE_SPLASH then return WP_GRENADE_LAUNCHER else if mod==MOD_ROCKET or mod==MOD_ROCKET_SPLASH then return WP_ROCKET_LAUNCHER else if mod==MOD_PLASMA or mod==MOD_PLASMA_SPLASH then return WP_PLASMAGUN else if mod==MOD_RAILGUN then return WP_RAILGUN else if mod==MOD_LIGHTNING then return WP_LIGHTNING else if mod==MOD_BFG or mod==MOD_BFG_SPLASH then return WP_BFG else if mod==MOD_GRAPPLE then return WP_GRAPPLING_HOOK end if;return 0 end function
function splashMod(mod) return mod==MOD_GRENADE_SPLASH or mod==MOD_ROCKET_SPLASH or mod==MOD_PLASMA_SPLASH or mod==MOD_BFG_SPLASH end function
function hazardMod(mod) return mod==MOD_WATER or mod==MOD_SLIME or mod==MOD_LAVA or mod==MOD_CRUSH or mod==MOD_TELEFRAG or mod==MOD_FALLING or mod==MOD_SUICIDE or mod==MOD_TRIGGER_HURT end function
function sameTeam(state,a,b) return a>=0 and b>=0 and a<state.maxclients and b<state.maxclients and state.clients[a].team==state.clients[b].team end function

// G_RankRunFrame
function G_RankRunFrame(state)
  if not state.initialized then if state.rankBeginFn!=void then state.rankBeginFn(state,"Quake III Arena") end if;state.initialized=true end if;if state.rankPollFn!=void then state.rankPollFn(state) end if
  if state.active then for i=0 to state.maxclients-1 c=state.clients[i];if not c.inuse or not c.present then continue end if;if c.bot then action(state,"console",i,"kick "+c.name+"\n",0);continue end if;old=c.status;fresh=status(state,i);if old!=fresh then action(state,"server",i,"rank_status "+str(fresh)+"\n",fresh);c.status=fresh end if;if fresh==QGR_STATUS_NEW or fresh==QGR_STATUS_SPECTATOR then if c.team!=TEAM_SPECTATOR then c.team=TEAM_SPECTATOR;c.spectatorState=SPECTATOR_FREE;action(state,"spawn",i,"",0);action(state,"server",i,"rank_status "+str(fresh)+"\n",fresh);action(state,"server",i,"rank_menu\n",0) end if else if fresh==QGR_STATUS_NO_USER or fresh==QGR_STATUS_BAD_PASSWORD or fresh==QGR_STATUS_TIMEOUT or fresh==QGR_STATUS_NO_MEMBERSHIP or fresh==QGR_STATUS_INVALIDUSER or fresh==QGR_STATUS_ERROR then if state.rankResetFn!=void then state.rankResetFn(state,i) end if else if fresh==QGR_STATUS_ACTIVE then if c.team==TEAM_SPECTATOR and state.gametype<GT_TEAM then c.team=0;action(state,"set-team",i,"free",0) end if;if old!=QGR_STATUS_ACTIVE then for j=0 to state.maxclients-1 other=state.clients[j];if not other.inuse or not other.present or other.bot then continue end if;if i!=j and status(state,j)==QGR_STATUS_ACTIVE then reportInt(state,i,j,QGR_KEY_PLAYED_WITH,1,true) end if;action(state,"scoreboard",j,"",0) end for end if end if end for;if (state.fraglimit==0 or state.fraglimit>100) and (state.timelimit==0 or state.timelimit>1000) then state.timelimit=1000;state.cvars=state.cvars+[["timelimit","1000"]] end if end if
  if state.intermissiontime==0 then for i=0 to state.maxclients-1 if state.clients[i].present then state.clients[i].matchTime=n.trunc32((state.time-state.clients[i].enterTime)/1000.0) end if end for end if;return void
end function
// G_RankFireWeapon
function G_RankFireWeapon(state,self,weapon) if state.warmupTime!=0 or weapon==WP_GAUNTLET then return void end if;reportInt(state,self,-1,QGR_KEY_SHOT_FIRED,1,true);if ordinal(weapon)!=0 then reportInt(state,self,-1,specific(1111020002,weapon),1,true) end if;return void end function

// G_RankDamage
function G_RankDamage(state,self,attacker,damage,mod)
  if state.warmupTime!=0 then return void end if;newHit=state.framenum!=state.lastFrame or self!=state.lastSelf or attacker!=state.lastAttacker or mod!=state.lastMod;state.lastFrame=state.framenum;state.lastSelf=self;state.lastAttacker=attacker;state.lastMod=mod
  weapon=weaponForMod(mod);if attacker!=ENTITYNUM_WORLD and attacker!=self and mod==MOD_GAUNTLET and attacker>=0 and attacker<state.maxclients and state.clients[attacker].present then reportInt(state,attacker,-1,specific(1111020002,WP_GAUNTLET),1,true) end if;if hazardMod(mod) then return void end if;splash=0;if splashMod(mod) then splash=damage end if
  if newHit then reportInt(state,self,-1,QGR_KEY_HIT_TAKEN,1,true);reportInt(state,self,-1,damageSpecific(1111020004,weapon),1,true) end if;reportInt(state,self,-1,QGR_KEY_DAMAGE_TAKEN,damage,true);reportInt(state,self,-1,damageSpecific(1111020006,weapon),damage,true);if splash!=0 then reportInt(state,self,-1,QGR_KEY_SPLASH_TAKEN,splash,true);reportInt(state,self,-1,damageSpecific(1111020008,weapon),splash,true) end if
  validAttacker=attacker>=0 and attacker<state.maxclients and state.clients[attacker].present;if attacker!=ENTITYNUM_WORLD and attacker!=self and validAttacker then if newHit then reportInt(state,attacker,-1,QGR_KEY_HIT_GIVEN,1,true);reportInt(state,attacker,-1,damageSpecific(1111020003,weapon),1,true) end if;reportInt(state,attacker,-1,QGR_KEY_DAMAGE_GIVEN,damage,true);reportInt(state,attacker,-1,damageSpecific(1111020005,weapon),damage,true);if splash!=0 then reportInt(state,attacker,-1,QGR_KEY_SPLASH_GIVEN,splash,true);reportInt(state,attacker,-1,damageSpecific(1111020007,weapon),splash,true) end if end if
  if attacker!=self and validAttacker and sameTeam(state,self,attacker) then if newHit then reportInt(state,self,-1,QGR_KEY_TEAMMATE_HIT_TAKEN,1,true);reportInt(state,attacker,-1,QGR_KEY_TEAMMATE_HIT_GIVEN,1,true) end if;reportInt(state,self,-1,QGR_KEY_TEAMMATE_DAMAGE_TAKEN,damage,true);reportInt(state,attacker,-1,QGR_KEY_TEAMMATE_DAMAGE_GIVEN,damage,true);if splash!=0 then reportInt(state,self,-1,QGR_KEY_TEAMMATE_SPLASH_TAKEN,splash,true);reportInt(state,attacker,-1,QGR_KEY_TEAMMATE_SPLASH_GIVEN,splash,true) end if end if;return void
end function

function hazardKey(mod) if mod==MOD_WATER then return 1111080100 else if mod==MOD_SLIME then return 1111080200 else if mod==MOD_LAVA then return 1111080300 else if mod==MOD_CRUSH then return 1111080400 else if mod==MOD_TELEFRAG then return 1111080500 else if mod==MOD_FALLING then return 1111080600 else if mod==MOD_SUICIDE then return 1111080700 else if mod==MOD_TRIGGER_HURT then return 1111080800 end if;return 1111080900 end function
// G_RankPlayerDie
function G_RankPlayerDie(state,self,attacker,mod)
  if state.warmupTime!=0 then return void end if;weapon=weaponForMod(mod);if attacker==ENTITYNUM_WORLD then reportInt(state,self,-1,QGR_KEY_HAZARD_DEATH,1,true);reportInt(state,self,-1,hazardKey(mod),1,true) else if attacker==self then reportInt(state,self,-1,QGR_KEY_SUICIDE,1,true);reportInt(state,self,-1,damageSpecific(1111020001,weapon),1,true) else reportInt(state,attacker,self,QGR_KEY_FRAG,1,true);reportInt(state,attacker,self,damageSpecific(1211020000,weapon),1,true) end if;return void
end function
// G_RankWeaponTime
function G_RankWeaponTime(state,self,weapon) if state.warmupTime!=0 then return void end if;elapsed=n.trunc32((state.time-state.clients[self].weaponChangeTime)/1000.0);state.clients[self].weaponChangeTime=state.time;if elapsed<=0 then return void end if;reportInt(state,self,-1,QGR_KEY_TIME,elapsed,true);if ordinal(weapon)!=0 then reportInt(state,self,-1,specific(1111020010,weapon),elapsed,true) end if;return void end function
// G_RankPickupWeapon
function G_RankPickupWeapon(state,self,weapon) if state.warmupTime!=0 then return void end if;reportInt(state,self,-1,QGR_KEY_PICKUP_WEAPON,1,true);if ordinal(weapon)!=0 then reportInt(state,self,-1,specific(1111020009,weapon),1,true) end if;return void end function
function ammoOrdinal(weapon) if weapon==WP_MACHINEGUN then return 1 else if weapon==WP_SHOTGUN then return 2 else if weapon==WP_GRENADE_LAUNCHER then return 3 else if weapon==WP_ROCKET_LAUNCHER then return 4 else if weapon==WP_PLASMAGUN then return 5 else if weapon==WP_RAILGUN then return 6 else if weapon==WP_LIGHTNING then return 7 else if weapon==WP_BFG then return 8 else if weapon==WP_NAILGUN then return 9 else if weapon==WP_PROX_LAUNCHER then return 10 else if weapon==WP_CHAINGUN then return 11 end if;return 0 end function
// G_RankPickupAmmo
function G_RankPickupAmmo(state,self,weapon,quantity) if state.warmupTime!=0 then return void end if;reportInt(state,self,-1,QGR_KEY_BOXES,1,true);reportInt(state,self,-1,QGR_KEY_ROUNDS,quantity,true);ord=ammoOrdinal(weapon);if ord!=0 then reportInt(state,self,-1,1111030000+ord*100,1,true);reportInt(state,self,-1,1111030001+ord*100,quantity,true) end if;return void end function
// G_RankPickupHealth
function G_RankPickupHealth(state,self,quantity) if state.warmupTime!=0 then return void end if;reportInt(state,self,-1,QGR_KEY_HEALTH,1,true);reportInt(state,self,-1,QGR_KEY_HEALTH_TOTAL,quantity,true);key=0;if quantity==5 then key=1111040100 else if quantity==25 then key=1111040200 else if quantity==50 then key=1111040300 else if quantity==100 then key=1111040400 end if;if key!=0 then reportInt(state,self,-1,key,1,true) end if;return void end function
// G_RankPickupArmor
function G_RankPickupArmor(state,self,quantity) if state.warmupTime!=0 then return void end if;reportInt(state,self,-1,QGR_KEY_ARMOR,1,true);reportInt(state,self,-1,QGR_KEY_ARMOR_TOTAL,quantity,true);key=0;if quantity==5 then key=1111050100 else if quantity==50 then key=1111050200 else if quantity==100 then key=1111050300 end if;if key!=0 then reportInt(state,self,-1,key,1,true) end if;return void end function
// G_RankPickupPowerup
function G_RankPickupPowerup(state,self,powerup) if state.warmupTime!=0 then return void end if;if powerup==PW_REDFLAG or powerup==PW_BLUEFLAG then reportInt(state,self,-1,QGR_KEY_FLAG_PICKUP,1,true);return void end if;reportInt(state,self,-1,QGR_KEY_POWERUP,1,true);key=0;if powerup>=PW_QUAD and powerup<=PW_FLIGHT then key=1111060000+powerup*100 else if powerup==PW_SCOUT then key=1111160800 else if powerup==PW_GUARD then key=1111160801 else if powerup==PW_DOUBLER then key=1111160802 else if powerup==PW_AMMOREGEN then key=1111160803 end if;if key!=0 then reportInt(state,self,-1,key,1,true) end if;return void end function
function holdableKey(holdable,use) if holdable==HI_MEDKIT then if use then return QGR_KEY_MEDKIT_USE end if;return QGR_KEY_MEDKIT else if holdable==HI_TELEPORTER then if use then return QGR_KEY_TELEPORTER_USE end if;return QGR_KEY_TELEPORTER else if holdable==HI_KAMIKAZE then if use then return QGR_KEY_KAMIKAZE_USE end if;return QGR_KEY_KAMIKAZE else if holdable==HI_PORTAL then if use then return QGR_KEY_PORTAL_USE end if;return QGR_KEY_PORTAL else if holdable==HI_INVULNERABILITY then if use then return QGR_KEY_INVULNERABILITY_USE end if;return QGR_KEY_INVULNERABILITY end if;return 0 end function
// G_RankPickupHoldable
function G_RankPickupHoldable(state,self,holdable) if state.warmupTime==0 then key=holdableKey(holdable,false);if key!=0 then reportInt(state,self,-1,key,1,true) end if end if;return void end function
// G_RankUseHoldable
function G_RankUseHoldable(state,self,holdable) if state.warmupTime==0 then key=holdableKey(holdable,true);if key!=0 then reportInt(state,self,-1,key,1,true) end if end if;return void end function
// G_RankReward
function G_RankReward(state,self,award) if state.warmupTime==0 then if award==EF_AWARD_IMPRESSIVE then reportInt(state,self,-1,1111090000,1,true) else if award==EF_AWARD_EXCELLENT then reportInt(state,self,-1,1111090100,1,true) end if end if;return void end function
// G_RankCapture
function G_RankCapture(state,self) if state.warmupTime==0 then reportInt(state,self,-1,QGR_KEY_FLAG_CAPTURE,1,true) end if;return void end function
// G_RankUserTeamName
function G_RankUserTeamName(state,self,teamName) if state.warmupTime==0 then reportStr(state,self,-1,QGR_KEY_TEAM_NAME,teamName) end if;return void end function
// G_RankClientDisconnect
function G_RankClientDisconnect(state,self) if state.warmupTime!=0 then return void end if;elapsed=n.trunc32((state.time-state.clients[self].enterTime)/1000.0);rating=0;if elapsed>=60 then rating=state.clients[self].matchRating/elapsed end if;reportInt(state,self,-1,QGR_KEY_MATCH_RATING,rating,false);return void end function
// G_RankGameOver
function G_RankGameOver(state)
  if state.warmupTime!=0 then return void end if;for i=0 to state.maxclients-1 if status(state,i)==QGR_STATUS_ACTIVE then G_RankClientDisconnect(state,i) end if end for
  reportStr(state,-1,-1,QGR_KEY_HOSTNAME,cvarValue(state,"sv_hostname"));reportStr(state,-1,-1,QGR_KEY_MAP,cvarValue(state,"mapname"));reportStr(state,-1,-1,QGR_KEY_MOD,cvarValue(state,"fs_game"));reportInt(state,-1,-1,QGR_KEY_GAMETYPE,state.gametype,false);reportInt(state,-1,-1,QGR_KEY_FRAGLIMIT,state.fraglimit,false);reportInt(state,-1,-1,QGR_KEY_TIMELIMIT,state.timelimit,false);reportInt(state,-1,-1,QGR_KEY_MAXCLIENTS,state.maxclients,false);reportInt(state,-1,-1,QGR_KEY_MAXRATE,toNumber(cvarValue(state,"sv_maxRate")),false);reportInt(state,-1,-1,QGR_KEY_MINPING,toNumber(cvarValue(state,"sv_minPing")),false);reportInt(state,-1,-1,QGR_KEY_MAXPING,toNumber(cvarValue(state,"sv_maxPing")),false);reportInt(state,-1,-1,QGR_KEY_DEDICATED,toNumber(cvarValue(state,"dedicated")),false);reportStr(state,-1,-1,QGR_KEY_VERSION,cvarValue(state,"version"));return void
end function
function cvarValue(state,name) for each pair in state.cvars if pair[0]==name then return pair[1] end if end for;return "" end function
