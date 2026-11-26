// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Native port of code/game/g_rankings.c.
package mq3.game.rankings

import mq3.compat.numeric as n
import mq3.game.game_internal_headers as internal

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

const QGR_KEY_MATCH_RATING=internal.QGR_KEY_MATCH_RATING
const QGR_KEY_PLAYED_WITH=internal.QGR_KEY_PLAYED_WITH
const QGR_KEY_HOSTNAME=internal.QGR_KEY_HOSTNAME
const QGR_KEY_MAP=internal.QGR_KEY_MAP
const QGR_KEY_MOD=internal.QGR_KEY_MOD
const QGR_KEY_GAMETYPE=internal.QGR_KEY_GAMETYPE
const QGR_KEY_FRAGLIMIT=internal.QGR_KEY_FRAGLIMIT
const QGR_KEY_TIMELIMIT=internal.QGR_KEY_TIMELIMIT
const QGR_KEY_MAXCLIENTS=internal.QGR_KEY_MAXCLIENTS
const QGR_KEY_MAXRATE=internal.QGR_KEY_MAXRATE
const QGR_KEY_MINPING=internal.QGR_KEY_MINPING
const QGR_KEY_MAXPING=internal.QGR_KEY_MAXPING
const QGR_KEY_DEDICATED=internal.QGR_KEY_DEDICATED
const QGR_KEY_VERSION=internal.QGR_KEY_VERSION
const QGR_KEY_FRAG=internal.QGR_KEY_FRAG
const QGR_KEY_SUICIDE=internal.QGR_KEY_SUICIDE
const QGR_KEY_SHOT_FIRED=internal.QGR_KEY_SHOT_FIRED
const QGR_KEY_HIT_GIVEN=internal.QGR_KEY_HIT_GIVEN
const QGR_KEY_HIT_TAKEN=internal.QGR_KEY_HIT_TAKEN
const QGR_KEY_DAMAGE_GIVEN=internal.QGR_KEY_DAMAGE_GIVEN
const QGR_KEY_DAMAGE_TAKEN=internal.QGR_KEY_DAMAGE_TAKEN
const QGR_KEY_SPLASH_GIVEN=internal.QGR_KEY_SPLASH_GIVEN
const QGR_KEY_SPLASH_TAKEN=internal.QGR_KEY_SPLASH_TAKEN
const QGR_KEY_PICKUP_WEAPON=internal.QGR_KEY_PICKUP_WEAPON
const QGR_KEY_TIME=internal.QGR_KEY_TIME
const QGR_KEY_BOXES=internal.QGR_KEY_BOXES
const QGR_KEY_ROUNDS=internal.QGR_KEY_ROUNDS
const QGR_KEY_HEALTH=internal.QGR_KEY_HEALTH
const QGR_KEY_HEALTH_TOTAL=internal.QGR_KEY_HEALTH_TOTAL
const QGR_KEY_ARMOR=internal.QGR_KEY_ARMOR
const QGR_KEY_ARMOR_TOTAL=internal.QGR_KEY_ARMOR_TOTAL
const QGR_KEY_POWERUP=internal.QGR_KEY_POWERUP
const QGR_KEY_MEDKIT=internal.QGR_KEY_MEDKIT
const QGR_KEY_MEDKIT_USE=internal.QGR_KEY_MEDKIT_USE
const QGR_KEY_TELEPORTER=internal.QGR_KEY_TELEPORTER
const QGR_KEY_TELEPORTER_USE=internal.QGR_KEY_TELEPORTER_USE
const QGR_KEY_KAMIKAZE=internal.QGR_KEY_KAMIKAZE
const QGR_KEY_KAMIKAZE_USE=internal.QGR_KEY_KAMIKAZE_USE
const QGR_KEY_PORTAL=internal.QGR_KEY_PORTAL
const QGR_KEY_PORTAL_USE=internal.QGR_KEY_PORTAL_USE
const QGR_KEY_INVULNERABILITY=internal.QGR_KEY_INVULNERABILITY
const QGR_KEY_INVULNERABILITY_USE=internal.QGR_KEY_INVULNERABILITY_USE
const QGR_KEY_HAZARD_DEATH=internal.QGR_KEY_HAZARD_DEATH
const QGR_KEY_TEAMMATE_FRAG=internal.QGR_KEY_TEAMMATE_FRAG
const QGR_KEY_TEAMMATE_HIT_GIVEN=internal.QGR_KEY_TEAMMATE_HIT_GIVEN
const QGR_KEY_TEAMMATE_HIT_TAKEN=internal.QGR_KEY_TEAMMATE_HIT_TAKEN
const QGR_KEY_TEAMMATE_DAMAGE_GIVEN=internal.QGR_KEY_TEAMMATE_DAMAGE_GIVEN
const QGR_KEY_TEAMMATE_DAMAGE_TAKEN=internal.QGR_KEY_TEAMMATE_DAMAGE_TAKEN
const QGR_KEY_TEAMMATE_SPLASH_GIVEN=internal.QGR_KEY_TEAMMATE_SPLASH_GIVEN
const QGR_KEY_TEAMMATE_SPLASH_TAKEN=internal.QGR_KEY_TEAMMATE_SPLASH_TAKEN
const QGR_KEY_TEAM_NAME=internal.QGR_KEY_TEAM_NAME
const QGR_KEY_FLAG_PICKUP=internal.QGR_KEY_FLAG_PICKUP
const QGR_KEY_FLAG_CAPTURE=internal.QGR_KEY_FLAG_CAPTURE

/// `Client` record for rankings, containing `present`, `inuse`, `bot`, `name` and `team` and related fields.
struct Client present inuse bot name team status spectatorState enterTime weaponChangeTime matchRating matchTime end struct
/// `Report` record for rankings, containing `stringValue`, `index1`, `index2`, `key` and `value` and related fields.
struct Report stringValue index1 index2 key value text accum end struct
/// `Action` record for rankings, containing `kind`, `client`, `text` and `value`.
struct Action kind client text value end struct
/// `State` record for rankings, containing `warmupTime`, `time`, `framenum`, `maxclients` and `gametype` and related fields.
struct State warmupTime time framenum maxclients gametype fraglimit timelimit intermissiontime clients reports actions cvars lastFrame lastSelf lastAttacker lastMod initialized active reportIntFn reportStrFn statusFn rankBeginFn rankPollFn rankResetFn end struct

/// Create a `mq3.game.rankings.Client` record, initializing `present` as `true`, `inuse` as `true` and `team` as `TEAM_SPECTATOR`.
function client() return Client(true,true,false,"",TEAM_SPECTATOR,QGR_STATUS_NEW,SPECTATOR_FREE,0,0,0,0) end function
/// Build the `mq3.game.rankings.State` result for `create`.
/// @param maxclients Initial value stored in `mq3.game.rankings.State.maxclients`.
function create(maxclients)
  clients=[];for i=0 to maxclients-1 clients=clients+[client()] end for
  return State(0,0,0,maxclients,0,0,0,0,clients,[],[],[], -1,-1,-1,MOD_UNKNOWN,false,false,void,void,void,void,void,void)
end function
/// Set `state.reports` to `state.reports+[Report(false,index1,index2,key,value,"",accum)]` in `mq3.game.rankings.reportInt`.
/// @param state Rankings state; accesses `reports` and `reportIntFn`. May update `state.reports` in place.
/// @param index1 Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param index2 Initial value stored in `mq3.game.rankings.Report.index2`.
/// @param key Lookup key or field name used by the operation.
/// @param value Initial value stored in `mq3.game.rankings.Report.value`.
/// @param accum Initial value stored in `mq3.game.rankings.Report.accum`.
function reportInt(state,index1,index2,key,value,accum) state.reports=state.reports+[Report(false,index1,index2,key,value,"",accum)];if state.reportIntFn!=void then state.reportIntFn(state,index1,index2,key,value,accum) end if;return void end function
/// Set `state.reports` to `state.reports+[Report(true,index1,index2,key,0,value,false)]` in `mq3.game.rankings.reportStr`.
/// @param state Rankings state; accesses `reports` and `reportStrFn`. May update `state.reports` in place.
/// @param index1 Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param index2 Initial value stored in `mq3.game.rankings.Report.index2`.
/// @param key Lookup key or field name used by the operation.
/// @param value Initial value stored in `mq3.game.rankings.Report.text`.
function reportStr(state,index1,index2,key,value) state.reports=state.reports+[Report(true,index1,index2,key,0,value,false)];if state.reportStrFn!=void then state.reportStrFn(state,index1,index2,key,value) end if;return void end function
/// Set `state.actions` to `state.actions+[Action(kind,client,text,value)]` in `mq3.game.rankings.action`.
/// @param state Rankings state; accesses `actions`. May update `state.actions` in place.
/// @param kind Initial value stored in `mq3.game.rankings.Action.kind`.
/// @param client Initial value stored in `mq3.game.rankings.Action.client`.
/// @param text Text to parse, format or deliver.
/// @param value Initial value stored in `mq3.game.rankings.Action.value`.
function action(state,kind,client,text,value) state.actions=state.actions+[Action(kind,client,text,value)];return void end function
/// Use `state.statusFn` to perform `status`. Return paths include `state.clients[index].status`.
/// @param state Rankings state; accesses `statusFn` and `clients`.
/// @param index Index of the entry to access.
function status(state,index) if state.statusFn!=void then return state.statusFn(state,index) end if;return state.clients[index].status end function
/// Map weapon identifiers to the ranking service's weapon ordinal values.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function ordinal(weapon) if weapon==WP_GAUNTLET then return 1 else if weapon==WP_MACHINEGUN then return 2 else if weapon==WP_SHOTGUN then return 3 else if weapon==WP_GRENADE_LAUNCHER then return 4 else if weapon==WP_ROCKET_LAUNCHER then return 5 else if weapon==WP_PLASMAGUN then return 6 else if weapon==WP_RAILGUN then return 7 else if weapon==WP_LIGHTNING then return 8 else if weapon==WP_BFG then return 9 else if weapon==WP_GRAPPLING_HOOK then return 10 else if weapon==WP_NAILGUN then return 12 else if weapon==WP_PROX_LAUNCHER then return 13 else if weapon==WP_CHAINGUN then return 14 end if;return 0 end function
/// Return `base+ordinal(weapon)*100` for `specific`.
/// @param base Operand used to evaluate the returned expression `base+ordinal(weapon)*100`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function specific(base,weapon) return base+ordinal(weapon)*100 end function
/// Apply `mq3.game.rankings.ordinal` while evaluating `damageSpecific`. Return paths include `base+value*100`.
/// @param base Operand used to evaluate the returned expression `base+value*100`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function damageSpecific(base,weapon) value=ordinal(weapon);if value==0 then value=11 end if;return base+value*100 end function
/// Map a means-of-death code to the weapon responsible for the ranking event.
/// @param mod Means-of-death code used for damage attribution.
function weaponForMod(mod) if mod==MOD_GAUNTLET then return WP_GAUNTLET else if mod==MOD_MACHINEGUN then return WP_MACHINEGUN else if mod==MOD_SHOTGUN then return WP_SHOTGUN else if mod==MOD_GRENADE or mod==MOD_GRENADE_SPLASH then return WP_GRENADE_LAUNCHER else if mod==MOD_ROCKET or mod==MOD_ROCKET_SPLASH then return WP_ROCKET_LAUNCHER else if mod==MOD_PLASMA or mod==MOD_PLASMA_SPLASH then return WP_PLASMAGUN else if mod==MOD_RAILGUN then return WP_RAILGUN else if mod==MOD_LIGHTNING then return WP_LIGHTNING else if mod==MOD_BFG or mod==MOD_BFG_SPLASH then return WP_BFG else if mod==MOD_GRAPPLE then return WP_GRAPPLING_HOOK end if;return 0 end function
/// Test `mod==MOD_GRENADE_SPLASH or mod==MOD_ROCKET_SPLASH or mod==MOD_PLASMA_SPLASH or mod==MOD_BFG_SPLASH` as the condition for `splashMod`.
/// @param mod Means-of-death code used for damage attribution.
function splashMod(mod) return mod==MOD_GRENADE_SPLASH or mod==MOD_ROCKET_SPLASH or mod==MOD_PLASMA_SPLASH or mod==MOD_BFG_SPLASH end function
/// Test `mod==MOD_WATER or mod==MOD_SLIME or mod==MOD_LAVA or mod==MOD_CRUSH or mod==MOD_TELEFRAG or mod==MOD_FALLING or mod==MOD_SUICIDE or mod==MOD_TRIGGE...` as the condition for `hazardMod`.
/// @param mod Means-of-death code used for damage attribution.
function hazardMod(mod) return mod==MOD_WATER or mod==MOD_SLIME or mod==MOD_LAVA or mod==MOD_CRUSH or mod==MOD_TELEFRAG or mod==MOD_FALLING or mod==MOD_SUICIDE or mod==MOD_TRIGGER_HURT end function
/// Test `a>=0 and b>=0 and a<state.maxclients and b<state.maxclients and state.clients[a].team==state.clients[b].team` as the condition for `sameTeam`.
/// @param state Rankings state; accesses `maxclients` and `clients`.
/// @param a Operand used to evaluate the returned expression `a>=0 and b>=0 and a<state.maxclients and b<state.maxclients and state.clients[a].team==state.clients[b].team`.
/// @param b Operand used to evaluate the returned expression `a>=0 and b>=0 and a<state.maxclients and b<state.maxclients and state.clients[a].team==state.clients[b].team`.
function sameTeam(state,a,b) return a>=0 and b>=0 and a<state.maxclients and b<state.maxclients and state.clients[a].team==state.clients[b].team end function

// G_RankRunFrame
/// @param state Rankings state; accesses `initialized`, `rankBeginFn`, `rankPollFn`, `active` and `maxclients` and related fields. May update `state.initialized`, `state.timelimit` and `state.cvars` and additional fields in place.
function G_RankRunFrame(state)
  if not state.initialized then if state.rankBeginFn!=void then state.rankBeginFn(state,"Quake III Arena") end if;state.initialized=true end if;if state.rankPollFn!=void then state.rankPollFn(state) end if
  if state.active then for i=0 to state.maxclients-1 c=state.clients[i];if not c.inuse or not c.present then continue end if;if c.bot then action(state,"console",i,"kick "+c.name+"\n",0);continue end if;old=c.status;fresh=status(state,i);if old!=fresh then action(state,"server",i,"rank_status "+str(fresh)+"\n",fresh);c.status=fresh end if;if fresh==QGR_STATUS_NEW or fresh==QGR_STATUS_SPECTATOR then if c.team!=TEAM_SPECTATOR then c.team=TEAM_SPECTATOR;c.spectatorState=SPECTATOR_FREE;action(state,"spawn",i,"",0);action(state,"server",i,"rank_status "+str(fresh)+"\n",fresh);action(state,"server",i,"rank_menu\n",0) end if else if fresh==QGR_STATUS_NO_USER or fresh==QGR_STATUS_BAD_PASSWORD or fresh==QGR_STATUS_TIMEOUT or fresh==QGR_STATUS_NO_MEMBERSHIP or fresh==QGR_STATUS_INVALIDUSER or fresh==QGR_STATUS_ERROR then if state.rankResetFn!=void then state.rankResetFn(state,i) end if else if fresh==QGR_STATUS_ACTIVE then if c.team==TEAM_SPECTATOR and state.gametype<GT_TEAM then c.team=0;action(state,"set-team",i,"free",0) end if;if old!=QGR_STATUS_ACTIVE then for j=0 to state.maxclients-1 other=state.clients[j];if not other.inuse or not other.present or other.bot then continue end if;if i!=j and status(state,j)==QGR_STATUS_ACTIVE then reportInt(state,i,j,QGR_KEY_PLAYED_WITH,1,true) end if;action(state,"scoreboard",j,"",0) end for end if end if end for;if (state.fraglimit==0 or state.fraglimit>100) and (state.timelimit==0 or state.timelimit>1000) then state.timelimit=1000;state.cvars=state.cvars+[["timelimit","1000"]] end if end if
  if state.intermissiontime==0 then for i=0 to state.maxclients-1 if state.clients[i].present then state.clients[i].matchTime=n.trunc32((state.time-state.clients[i].enterTime)/1000.0) end if end for end if;return void
end function
// G_RankFireWeapon
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function G_RankFireWeapon(state,self,weapon) if state.warmupTime!=0 or weapon==WP_GAUNTLET then return void end if;reportInt(state,self,-1,QGR_KEY_SHOT_FIRED,1,true);if ordinal(weapon)!=0 then reportInt(state,self,-1,specific(1111020002,weapon),1,true) end if;return void end function

// G_RankDamage
/// @param state Rankings state; accesses `warmupTime`, `framenum`, `lastFrame`, `lastSelf` and `lastAttacker` and related fields. May update `state.lastFrame`, `state.lastSelf` and `state.lastAttacker` and additional fields in place.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param attacker Entity credited with the attack.
/// @param damage Damage amount before the current operation applies its rules.
/// @param mod Means-of-death code used for damage attribution.
function G_RankDamage(state,self,attacker,damage,mod)
  if state.warmupTime!=0 then return void end if;newHit=state.framenum!=state.lastFrame or self!=state.lastSelf or attacker!=state.lastAttacker or mod!=state.lastMod;state.lastFrame=state.framenum;state.lastSelf=self;state.lastAttacker=attacker;state.lastMod=mod
  weapon=weaponForMod(mod);if attacker!=ENTITYNUM_WORLD and attacker!=self and mod==MOD_GAUNTLET and attacker>=0 and attacker<state.maxclients and state.clients[attacker].present then reportInt(state,attacker,-1,specific(1111020002,WP_GAUNTLET),1,true) end if;if hazardMod(mod) then return void end if;splash=0;if splashMod(mod) then splash=damage end if
  if newHit then reportInt(state,self,-1,QGR_KEY_HIT_TAKEN,1,true);reportInt(state,self,-1,damageSpecific(1111020004,weapon),1,true) end if;reportInt(state,self,-1,QGR_KEY_DAMAGE_TAKEN,damage,true);reportInt(state,self,-1,damageSpecific(1111020006,weapon),damage,true);if splash!=0 then reportInt(state,self,-1,QGR_KEY_SPLASH_TAKEN,splash,true);reportInt(state,self,-1,damageSpecific(1111020008,weapon),splash,true) end if
  validAttacker=attacker>=0 and attacker<state.maxclients and state.clients[attacker].present;if attacker!=ENTITYNUM_WORLD and attacker!=self and validAttacker then if newHit then reportInt(state,attacker,-1,QGR_KEY_HIT_GIVEN,1,true);reportInt(state,attacker,-1,damageSpecific(1111020003,weapon),1,true) end if;reportInt(state,attacker,-1,QGR_KEY_DAMAGE_GIVEN,damage,true);reportInt(state,attacker,-1,damageSpecific(1111020005,weapon),damage,true);if splash!=0 then reportInt(state,attacker,-1,QGR_KEY_SPLASH_GIVEN,splash,true);reportInt(state,attacker,-1,damageSpecific(1111020007,weapon),splash,true) end if end if
  if attacker!=self and validAttacker and sameTeam(state,self,attacker) then if newHit then reportInt(state,self,-1,QGR_KEY_TEAMMATE_HIT_TAKEN,1,true);reportInt(state,attacker,-1,QGR_KEY_TEAMMATE_HIT_GIVEN,1,true) end if;reportInt(state,self,-1,QGR_KEY_TEAMMATE_DAMAGE_TAKEN,damage,true);reportInt(state,attacker,-1,QGR_KEY_TEAMMATE_DAMAGE_GIVEN,damage,true);if splash!=0 then reportInt(state,self,-1,QGR_KEY_TEAMMATE_SPLASH_TAKEN,splash,true);reportInt(state,attacker,-1,QGR_KEY_TEAMMATE_SPLASH_GIVEN,splash,true) end if end if;return void
end function

/// Map environmental death causes to the corresponding ranking hazard key.
/// @param mod Means-of-death code used for damage attribution.
function hazardKey(mod) if mod==MOD_WATER then return 1111080100 else if mod==MOD_SLIME then return 1111080200 else if mod==MOD_LAVA then return 1111080300 else if mod==MOD_CRUSH then return 1111080400 else if mod==MOD_TELEFRAG then return 1111080500 else if mod==MOD_FALLING then return 1111080600 else if mod==MOD_SUICIDE then return 1111080700 else if mod==MOD_TRIGGER_HURT then return 1111080800 end if;return 1111080900 end function
// G_RankPlayerDie
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param attacker Entity credited with the attack.
/// @param mod Means-of-death code used for damage attribution.
function G_RankPlayerDie(state,self,attacker,mod)
  if state.warmupTime!=0 then return void end if;weapon=weaponForMod(mod);if attacker==ENTITYNUM_WORLD then reportInt(state,self,-1,QGR_KEY_HAZARD_DEATH,1,true);reportInt(state,self,-1,hazardKey(mod),1,true) else if attacker==self then reportInt(state,self,-1,QGR_KEY_SUICIDE,1,true);reportInt(state,self,-1,damageSpecific(1111020001,weapon),1,true) else reportInt(state,attacker,self,QGR_KEY_FRAG,1,true);reportInt(state,attacker,self,damageSpecific(1211020000,weapon),1,true) end if;return void
end function
// G_RankWeaponTime
/// @param state Rankings state; accesses `warmupTime`, `time` and `clients`. May update `state.clients[self].weaponChangeTime` in place.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function G_RankWeaponTime(state,self,weapon) if state.warmupTime!=0 then return void end if;elapsed=n.trunc32((state.time-state.clients[self].weaponChangeTime)/1000.0);state.clients[self].weaponChangeTime=state.time;if elapsed<=0 then return void end if;reportInt(state,self,-1,QGR_KEY_TIME,elapsed,true);if ordinal(weapon)!=0 then reportInt(state,self,-1,specific(1111020010,weapon),elapsed,true) end if;return void end function
// G_RankPickupWeapon
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function G_RankPickupWeapon(state,self,weapon) if state.warmupTime!=0 then return void end if;reportInt(state,self,-1,QGR_KEY_PICKUP_WEAPON,1,true);if ordinal(weapon)!=0 then reportInt(state,self,-1,specific(1111020009,weapon),1,true) end if;return void end function
/// Map ammunition-bearing weapon identifiers to the ranking service's ammunition ordinal values.
/// @param weapon Weapon identifier used by the action or inventory lookup.
function ammoOrdinal(weapon) if weapon==WP_MACHINEGUN then return 1 else if weapon==WP_SHOTGUN then return 2 else if weapon==WP_GRENADE_LAUNCHER then return 3 else if weapon==WP_ROCKET_LAUNCHER then return 4 else if weapon==WP_PLASMAGUN then return 5 else if weapon==WP_RAILGUN then return 6 else if weapon==WP_LIGHTNING then return 7 else if weapon==WP_BFG then return 8 else if weapon==WP_NAILGUN then return 9 else if weapon==WP_PROX_LAUNCHER then return 10 else if weapon==WP_CHAINGUN then return 11 end if;return 0 end function
// G_RankPickupAmmo
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param weapon Weapon identifier used by the action or inventory lookup.
/// @param quantity Initial value stored in `mq3.game.rankings.Report.value`.
function G_RankPickupAmmo(state,self,weapon,quantity) if state.warmupTime!=0 then return void end if;reportInt(state,self,-1,QGR_KEY_BOXES,1,true);reportInt(state,self,-1,QGR_KEY_ROUNDS,quantity,true);ord=ammoOrdinal(weapon);if ord!=0 then reportInt(state,self,-1,1111030000+ord*100,1,true);reportInt(state,self,-1,1111030001+ord*100,quantity,true) end if;return void end function
// G_RankPickupHealth
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param quantity Initial value stored in `mq3.game.rankings.Report.value`.
function G_RankPickupHealth(state,self,quantity) if state.warmupTime!=0 then return void end if;reportInt(state,self,-1,QGR_KEY_HEALTH,1,true);reportInt(state,self,-1,QGR_KEY_HEALTH_TOTAL,quantity,true);key=0;if quantity==5 then key=1111040100 else if quantity==25 then key=1111040200 else if quantity==50 then key=1111040300 else if quantity==100 then key=1111040400 end if;if key!=0 then reportInt(state,self,-1,key,1,true) end if;return void end function
// G_RankPickupArmor
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param quantity Initial value stored in `mq3.game.rankings.Report.value`.
function G_RankPickupArmor(state,self,quantity) if state.warmupTime!=0 then return void end if;reportInt(state,self,-1,QGR_KEY_ARMOR,1,true);reportInt(state,self,-1,QGR_KEY_ARMOR_TOTAL,quantity,true);key=0;if quantity==5 then key=1111050100 else if quantity==50 then key=1111050200 else if quantity==100 then key=1111050300 end if;if key!=0 then reportInt(state,self,-1,key,1,true) end if;return void end function
// G_RankPickupPowerup
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param powerup Value used by `G_RankPickupPowerup` in `if powerup==PW_REDFLAG or powerup==PW_BLUEFLAG then reportInt(state,self,-1,QGR_KEY_FLAG_PICKUP,1,true)`.
function G_RankPickupPowerup(state,self,powerup) if state.warmupTime!=0 then return void end if;if powerup==PW_REDFLAG or powerup==PW_BLUEFLAG then reportInt(state,self,-1,QGR_KEY_FLAG_PICKUP,1,true);return void end if;reportInt(state,self,-1,QGR_KEY_POWERUP,1,true);key=0;if powerup>=PW_QUAD and powerup<=PW_FLIGHT then key=1111060000+powerup*100 else if powerup==PW_SCOUT then key=1111160800 else if powerup==PW_GUARD then key=1111160801 else if powerup==PW_DOUBLER then key=1111160802 else if powerup==PW_AMMOREGEN then key=1111160803 end if;if key!=0 then reportInt(state,self,-1,key,1,true) end if;return void end function
/// Choose the ranking key for pickup or use of the selected holdable item.
/// @param holdable Value used by `holdableKey` in `if holdable==HI_MEDKIT then if use then return QGR_KEY_MEDKIT_USE end if`.
/// @param use Value used by `holdableKey` in `if holdable==HI_MEDKIT then if use then return QGR_KEY_MEDKIT_USE end if`.
function holdableKey(holdable,use) if holdable==HI_MEDKIT then if use then return QGR_KEY_MEDKIT_USE end if;return QGR_KEY_MEDKIT else if holdable==HI_TELEPORTER then if use then return QGR_KEY_TELEPORTER_USE end if;return QGR_KEY_TELEPORTER else if holdable==HI_KAMIKAZE then if use then return QGR_KEY_KAMIKAZE_USE end if;return QGR_KEY_KAMIKAZE else if holdable==HI_PORTAL then if use then return QGR_KEY_PORTAL_USE end if;return QGR_KEY_PORTAL else if holdable==HI_INVULNERABILITY then if use then return QGR_KEY_INVULNERABILITY_USE end if;return QGR_KEY_INVULNERABILITY end if;return 0 end function
// G_RankPickupHoldable
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param holdable Value used by `holdableKey` in `if holdable==HI_MEDKIT then if use then return QGR_KEY_MEDKIT_USE end if`.
function G_RankPickupHoldable(state,self,holdable) if state.warmupTime==0 then key=holdableKey(holdable,false);if key!=0 then reportInt(state,self,-1,key,1,true) end if end if;return void end function
// G_RankUseHoldable
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param holdable Value used by `holdableKey` in `if holdable==HI_MEDKIT then if use then return QGR_KEY_MEDKIT_USE end if`.
function G_RankUseHoldable(state,self,holdable) if state.warmupTime==0 then key=holdableKey(holdable,true);if key!=0 then reportInt(state,self,-1,key,1,true) end if end if;return void end function
// G_RankReward
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param award Value used by `G_RankReward` in `if state.warmupTime==0 then if award==EF_AWARD_IMPRESSIVE then reportInt(state,self,-1,1111090000,1,true) else i...`.
function G_RankReward(state,self,award) if state.warmupTime==0 then if award==EF_AWARD_IMPRESSIVE then reportInt(state,self,-1,1111090000,1,true) else if award==EF_AWARD_EXCELLENT then reportInt(state,self,-1,1111090100,1,true) end if end if;return void end function
// G_RankCapture
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
function G_RankCapture(state,self) if state.warmupTime==0 then reportInt(state,self,-1,QGR_KEY_FLAG_CAPTURE,1,true) end if;return void end function
// G_RankUserTeamName
/// @param state Rankings state; accesses `warmupTime`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
/// @param teamName Initial value stored in `mq3.game.rankings.Report.text`.
function G_RankUserTeamName(state,self,teamName) if state.warmupTime==0 then reportStr(state,self,-1,QGR_KEY_TEAM_NAME,teamName) end if;return void end function
// G_RankClientDisconnect
/// @param state Rankings state; accesses `warmupTime`, `time` and `clients`.
/// @param self Initial value stored in `mq3.game.rankings.Report.index1`.
function G_RankClientDisconnect(state,self) if state.warmupTime!=0 then return void end if;elapsed=n.trunc32((state.time-state.clients[self].enterTime)/1000.0);rating=0;if elapsed>=60 then rating=state.clients[self].matchRating/elapsed end if;reportInt(state,self,-1,QGR_KEY_MATCH_RATING,rating,false);return void end function
// G_RankGameOver
/// @param state Rankings state; accesses `warmupTime`, `maxclients`, `gametype`, `fraglimit` and `timelimit`.
function G_RankGameOver(state)
  if state.warmupTime!=0 then return void end if;for i=0 to state.maxclients-1 if status(state,i)==QGR_STATUS_ACTIVE then G_RankClientDisconnect(state,i) end if end for
  reportStr(state,-1,-1,QGR_KEY_HOSTNAME,cvarValue(state,"sv_hostname"));reportStr(state,-1,-1,QGR_KEY_MAP,cvarValue(state,"mapname"));reportStr(state,-1,-1,QGR_KEY_MOD,cvarValue(state,"fs_game"));reportInt(state,-1,-1,QGR_KEY_GAMETYPE,state.gametype,false);reportInt(state,-1,-1,QGR_KEY_FRAGLIMIT,state.fraglimit,false);reportInt(state,-1,-1,QGR_KEY_TIMELIMIT,state.timelimit,false);reportInt(state,-1,-1,QGR_KEY_MAXCLIENTS,state.maxclients,false);reportInt(state,-1,-1,QGR_KEY_MAXRATE,toNumber(cvarValue(state,"sv_maxRate")),false);reportInt(state,-1,-1,QGR_KEY_MINPING,toNumber(cvarValue(state,"sv_minPing")),false);reportInt(state,-1,-1,QGR_KEY_MAXPING,toNumber(cvarValue(state,"sv_maxPing")),false);reportInt(state,-1,-1,QGR_KEY_DEDICATED,toNumber(cvarValue(state,"dedicated")),false);reportStr(state,-1,-1,QGR_KEY_VERSION,cvarValue(state,"version"));return void
end function
/// Look up a ranking cvar by exact name, returning an empty string when it is absent.
/// @param state Rankings state; accesses `cvars`.
/// @param name Lookup text matched against `pair[0]`.
function cvarValue(state,name) for each pair in state.cvars if pair[0]==name then return pair[1] end if end for;return "" end function
