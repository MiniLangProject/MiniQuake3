// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Generated source data, baseq3 without MISSIONPACK.
package mq3.game.constants
/// Player movement-mode identifier selecting normal behavior.
const PM_NORMAL = 0
/// Player movement-mode identifier selecting noclip behavior.
const PM_NOCLIP = 1
/// Player movement-mode identifier selecting spectator behavior.
const PM_SPECTATOR = 2
/// Player movement-mode identifier selecting dead behavior.
const PM_DEAD = 3
/// Player movement-mode identifier selecting freeze behavior.
const PM_FREEZE = 4
/// Player movement-mode identifier selecting intermission behavior.
const PM_INTERMISSION = 5
/// Player movement-mode identifier selecting spintermission behavior.
const PM_SPINTERMISSION = 6
/// Weapon-state-machine identifier selecting the ready stage.
const WEAPON_READY = 0
/// Weapon-state-machine identifier selecting the raising stage.
const WEAPON_RAISING = 1
/// Weapon-state-machine identifier selecting the dropping stage.
const WEAPON_DROPPING = 2
/// Weapon-state-machine identifier selecting the firing stage.
const WEAPON_FIRING = 3
/// Player-state statistics index storing health.
const STAT_HEALTH = 0
/// Player-state statistics index storing holdable item.
const STAT_HOLDABLE_ITEM = 1
/// Player-state statistics index storing weapons.
const STAT_WEAPONS = 2
/// Player-state statistics index storing armor.
const STAT_ARMOR = 3
/// Player-state statistics index storing dead yaw.
const STAT_DEAD_YAW = 4
/// Player-state statistics index storing clients ready.
const STAT_CLIENTS_READY = 5
/// Player-state statistics index storing max health.
const STAT_MAX_HEALTH = 6
/// Persistent player-state statistics index storing score.
const PERS_SCORE = 0
/// Persistent player-state statistics index storing hits.
const PERS_HITS = 1
/// Persistent player-state statistics index storing rank.
const PERS_RANK = 2
/// Persistent player-state statistics index storing team.
const PERS_TEAM = 3
/// Persistent player-state statistics index storing spawn count.
const PERS_SPAWN_COUNT = 4
/// Persistent player-state statistics index storing playerevents.
const PERS_PLAYEREVENTS = 5
/// Persistent player-state statistics index storing attacker.
const PERS_ATTACKER = 6
/// Persistent player-state statistics index storing attackee armor.
const PERS_ATTACKEE_ARMOR = 7
/// Persistent player-state statistics index storing killed.
const PERS_KILLED = 8
/// Persistent player-state statistics index storing impressive count.
const PERS_IMPRESSIVE_COUNT = 9
/// Persistent player-state statistics index storing excellent count.
const PERS_EXCELLENT_COUNT = 10
/// Persistent player-state statistics index storing defend count.
const PERS_DEFEND_COUNT = 11
/// Persistent player-state statistics index storing assist count.
const PERS_ASSIST_COUNT = 12
/// Persistent player-state statistics index storing gauntlet frag count.
const PERS_GAUNTLET_FRAG_COUNT = 13
/// Persistent player-state statistics index storing captures.
const PERS_CAPTURES = 14
/// Powerup-table index identifying none.
const PW_NONE = 0
/// Powerup-table index identifying quad.
const PW_QUAD = 1
/// Powerup-table index identifying battlesuit.
const PW_BATTLESUIT = 2
/// Powerup-table index identifying haste.
const PW_HASTE = 3
/// Powerup-table index identifying invis.
const PW_INVIS = 4
/// Powerup-table index identifying regen.
const PW_REGEN = 5
/// Powerup-table index identifying flight.
const PW_FLIGHT = 6
/// Powerup-table index identifying redflag.
const PW_REDFLAG = 7
/// Powerup-table index identifying blueflag.
const PW_BLUEFLAG = 8
/// Powerup-table index identifying neutralflag.
const PW_NEUTRALFLAG = 9
/// Powerup-table index identifying scout.
const PW_SCOUT = 10
/// Powerup-table index identifying guard.
const PW_GUARD = 11
/// Powerup-table index identifying doubler.
const PW_DOUBLER = 12
/// Powerup-table index identifying ammoregen.
const PW_AMMOREGEN = 13
/// Powerup-table index identifying invulnerability.
const PW_INVULNERABILITY = 14
/// Count/sentinel after the last powerup identifier, used to size powerup tables.
const PW_NUM_POWERUPS = 15
/// Holdable-item identifier selecting none.
const HI_NONE = 0
/// Holdable-item identifier selecting teleporter.
const HI_TELEPORTER = 1
/// Holdable-item identifier selecting medkit.
const HI_MEDKIT = 2
/// Holdable-item identifier selecting kamikaze.
const HI_KAMIKAZE = 3
/// Holdable-item identifier selecting portal.
const HI_PORTAL = 4
/// Holdable-item identifier selecting invulnerability.
const HI_INVULNERABILITY = 5
/// Count/sentinel after the last holdable-item identifier.
const HI_NUM_HOLDABLE = 6
/// Weapon identifier selecting none.
const WP_NONE = 0
/// Weapon identifier selecting gauntlet.
const WP_GAUNTLET = 1
/// Weapon identifier selecting machine gun.
const WP_MACHINEGUN = 2
/// Weapon identifier selecting shotgun.
const WP_SHOTGUN = 3
/// Weapon identifier selecting grenade launcher.
const WP_GRENADE_LAUNCHER = 4
/// Weapon identifier selecting rocket launcher.
const WP_ROCKET_LAUNCHER = 5
/// Weapon identifier selecting lightning gun.
const WP_LIGHTNING = 6
/// Weapon identifier selecting railgun.
const WP_RAILGUN = 7
/// Weapon identifier selecting plasma gun.
const WP_PLASMAGUN = 8
/// Weapon identifier selecting BFG.
const WP_BFG = 9
/// Weapon identifier selecting grappling hook.
const WP_GRAPPLING_HOOK = 10
/// Count/sentinel after the last weapon identifier, used to size weapon tables.
const WP_NUM_WEAPONS = 11
/// Network/predictable event identifier reporting none.
const EV_NONE = 0
/// Network/predictable event identifier reporting footstep.
const EV_FOOTSTEP = 1
/// Network/predictable event identifier reporting footstep metal.
const EV_FOOTSTEP_METAL = 2
/// Network/predictable event identifier reporting footsplash.
const EV_FOOTSPLASH = 3
/// Network/predictable event identifier reporting footwade.
const EV_FOOTWADE = 4
/// Network/predictable event identifier reporting swim.
const EV_SWIM = 5
/// Network/predictable event identifier reporting step 4.
const EV_STEP_4 = 6
/// Network/predictable event identifier reporting step 8.
const EV_STEP_8 = 7
/// Network/predictable event identifier reporting step 12.
const EV_STEP_12 = 8
/// Network/predictable event identifier reporting step 16.
const EV_STEP_16 = 9
/// Network/predictable event identifier reporting fall short.
const EV_FALL_SHORT = 10
/// Network/predictable event identifier reporting fall medium.
const EV_FALL_MEDIUM = 11
/// Network/predictable event identifier reporting fall far.
const EV_FALL_FAR = 12
/// Network/predictable event identifier reporting jump pad.
const EV_JUMP_PAD = 13
/// Network/predictable event identifier reporting jump.
const EV_JUMP = 14
/// Network/predictable event identifier reporting water touch.
const EV_WATER_TOUCH = 15
/// Network/predictable event identifier reporting water leave.
const EV_WATER_LEAVE = 16
/// Network/predictable event identifier reporting water under.
const EV_WATER_UNDER = 17
/// Network/predictable event identifier reporting water clear.
const EV_WATER_CLEAR = 18
/// Network/predictable event identifier reporting item pickup.
const EV_ITEM_PICKUP = 19
/// Network/predictable event identifier reporting global item pickup.
const EV_GLOBAL_ITEM_PICKUP = 20
/// Network/predictable event identifier reporting noammo.
const EV_NOAMMO = 21
/// Network/predictable event identifier reporting change weapon.
const EV_CHANGE_WEAPON = 22
/// Network/predictable event identifier reporting fire weapon.
const EV_FIRE_WEAPON = 23
/// Network/predictable event identifier reporting use item0.
const EV_USE_ITEM0 = 24
/// Network/predictable event identifier reporting use item1.
const EV_USE_ITEM1 = 25
/// Network/predictable event identifier reporting use item2.
const EV_USE_ITEM2 = 26
/// Network/predictable event identifier reporting use item3.
const EV_USE_ITEM3 = 27
/// Network/predictable event identifier reporting use item4.
const EV_USE_ITEM4 = 28
/// Network/predictable event identifier reporting use item5.
const EV_USE_ITEM5 = 29
/// Network/predictable event identifier reporting use item6.
const EV_USE_ITEM6 = 30
/// Network/predictable event identifier reporting use item7.
const EV_USE_ITEM7 = 31
/// Network/predictable event identifier reporting use item8.
const EV_USE_ITEM8 = 32
/// Network/predictable event identifier reporting use item9.
const EV_USE_ITEM9 = 33
/// Network/predictable event identifier reporting use item10.
const EV_USE_ITEM10 = 34
/// Network/predictable event identifier reporting use item11.
const EV_USE_ITEM11 = 35
/// Network/predictable event identifier reporting use item12.
const EV_USE_ITEM12 = 36
/// Network/predictable event identifier reporting use item13.
const EV_USE_ITEM13 = 37
/// Network/predictable event identifier reporting use item14.
const EV_USE_ITEM14 = 38
/// Network/predictable event identifier reporting use item15.
const EV_USE_ITEM15 = 39
/// Network/predictable event identifier reporting item respawn.
const EV_ITEM_RESPAWN = 40
/// Network/predictable event identifier reporting item pop.
const EV_ITEM_POP = 41
/// Network/predictable event identifier reporting player teleport in.
const EV_PLAYER_TELEPORT_IN = 42
/// Network/predictable event identifier reporting player teleport out.
const EV_PLAYER_TELEPORT_OUT = 43
/// Network/predictable event identifier reporting grenade bounce.
const EV_GRENADE_BOUNCE = 44
/// Network/predictable event identifier reporting general sound.
const EV_GENERAL_SOUND = 45
/// Network/predictable event identifier reporting global sound.
const EV_GLOBAL_SOUND = 46
/// Network/predictable event identifier reporting global team sound.
const EV_GLOBAL_TEAM_SOUND = 47
/// Network/predictable event identifier reporting bullet hit flesh.
const EV_BULLET_HIT_FLESH = 48
/// Network/predictable event identifier reporting bullet hit wall.
const EV_BULLET_HIT_WALL = 49
/// Network/predictable event identifier reporting missile hit.
const EV_MISSILE_HIT = 50
/// Network/predictable event identifier reporting missile miss.
const EV_MISSILE_MISS = 51
/// Network/predictable event identifier reporting missile miss metal.
const EV_MISSILE_MISS_METAL = 52
/// Network/predictable event identifier reporting railtrail.
const EV_RAILTRAIL = 53
/// Network/predictable event identifier reporting shotgun.
const EV_SHOTGUN = 54
/// Network/predictable event identifier reporting bullet.
const EV_BULLET = 55
/// Network/predictable event identifier reporting pain.
const EV_PAIN = 56
/// Network/predictable event identifier reporting death1.
const EV_DEATH1 = 57
/// Network/predictable event identifier reporting death2.
const EV_DEATH2 = 58
/// Network/predictable event identifier reporting death3.
const EV_DEATH3 = 59
/// Network/predictable event identifier reporting obituary.
const EV_OBITUARY = 60
/// Network/predictable event identifier reporting powerup quad.
const EV_POWERUP_QUAD = 61
/// Network/predictable event identifier reporting powerup battlesuit.
const EV_POWERUP_BATTLESUIT = 62
/// Network/predictable event identifier reporting powerup regen.
const EV_POWERUP_REGEN = 63
/// Network/predictable event identifier reporting gib player.
const EV_GIB_PLAYER = 64
/// Network/predictable event identifier reporting scoreplum.
const EV_SCOREPLUM = 65
/// Network/predictable event identifier reporting proximity mine stick.
const EV_PROXIMITY_MINE_STICK = 66
/// Network/predictable event identifier reporting proximity mine trigger.
const EV_PROXIMITY_MINE_TRIGGER = 67
/// Network/predictable event identifier reporting kamikaze.
const EV_KAMIKAZE = 68
/// Network/predictable event identifier reporting obeliskexplode.
const EV_OBELISKEXPLODE = 69
/// Network/predictable event identifier reporting obeliskpain.
const EV_OBELISKPAIN = 70
/// Network/predictable event identifier reporting invul impact.
const EV_INVUL_IMPACT = 71
/// Network/predictable event identifier reporting juiced.
const EV_JUICED = 72
/// Network/predictable event identifier reporting lightningbolt.
const EV_LIGHTNINGBOLT = 73
/// Network/predictable event identifier reporting debug line.
const EV_DEBUG_LINE = 74
/// Network/predictable event identifier reporting stoploopingsound.
const EV_STOPLOOPINGSOUND = 75
/// Network/predictable event identifier reporting taunt.
const EV_TAUNT = 76
/// Network/predictable event identifier reporting taunt yes.
const EV_TAUNT_YES = 77
/// Network/predictable event identifier reporting taunt no.
const EV_TAUNT_NO = 78
/// Network/predictable event identifier reporting taunt followme.
const EV_TAUNT_FOLLOWME = 79
/// Network/predictable event identifier reporting taunt capture the flag.
const EV_TAUNT_GETFLAG = 80
/// Network/predictable event identifier reporting taunt guardbase.
const EV_TAUNT_GUARDBASE = 81
/// Network/predictable event identifier reporting taunt patrol.
const EV_TAUNT_PATROL = 82
/// Player team-state identifier representing red capture.
const GTS_RED_CAPTURE = 0
/// Player team-state identifier representing blue capture.
const GTS_BLUE_CAPTURE = 1
/// Player team-state identifier representing red return.
const GTS_RED_RETURN = 2
/// Player team-state identifier representing blue return.
const GTS_BLUE_RETURN = 3
/// Player team-state identifier representing red taken.
const GTS_RED_TAKEN = 4
/// Player team-state identifier representing blue taken.
const GTS_BLUE_TAKEN = 5
/// Player team-state identifier representing redobelisk attacked.
const GTS_REDOBELISK_ATTACKED = 6
/// Player team-state identifier representing blueobelisk attacked.
const GTS_BLUEOBELISK_ATTACKED = 7
/// Player team-state identifier representing redteam scored.
const GTS_REDTEAM_SCORED = 8
/// Player team-state identifier representing blueteam scored.
const GTS_BLUETEAM_SCORED = 9
/// Player team-state identifier representing redteam took lead.
const GTS_REDTEAM_TOOK_LEAD = 10
/// Player team-state identifier representing blueteam took lead.
const GTS_BLUETEAM_TOOK_LEAD = 11
/// Player team-state identifier representing teams are tied.
const GTS_TEAMS_ARE_TIED = 12
/// Player team-state identifier representing kamikaze.
const GTS_KAMIKAZE = 13
/// Full-body animation identifier selecting death1.
const BOTH_DEATH1 = 0
/// Full-body animation identifier selecting dead1.
const BOTH_DEAD1 = 1
/// Full-body animation identifier selecting death2.
const BOTH_DEATH2 = 2
/// Full-body animation identifier selecting dead2.
const BOTH_DEAD2 = 3
/// Full-body animation identifier selecting death3.
const BOTH_DEATH3 = 4
/// Full-body animation identifier selecting dead3.
const BOTH_DEAD3 = 5
/// Upper-body animation identifier selecting gesture.
const TORSO_GESTURE = 6
/// Upper-body animation identifier selecting attack.
const TORSO_ATTACK = 7
/// Upper-body animation identifier selecting attack2.
const TORSO_ATTACK2 = 8
/// Upper-body animation identifier selecting drop.
const TORSO_DROP = 9
/// Upper-body animation identifier selecting raise.
const TORSO_RAISE = 10
/// Upper-body animation identifier selecting stand.
const TORSO_STAND = 11
/// Upper-body animation identifier selecting stand2.
const TORSO_STAND2 = 12
/// Lower-body animation identifier selecting walkcr.
const LEGS_WALKCR = 13
/// Lower-body animation identifier selecting walk.
const LEGS_WALK = 14
/// Lower-body animation identifier selecting run.
const LEGS_RUN = 15
/// Lower-body animation identifier selecting back.
const LEGS_BACK = 16
/// Lower-body animation identifier selecting swim.
const LEGS_SWIM = 17
/// Lower-body animation identifier selecting jump.
const LEGS_JUMP = 18
/// Lower-body animation identifier selecting land.
const LEGS_LAND = 19
/// Lower-body animation identifier selecting jumpb.
const LEGS_JUMPB = 20
/// Lower-body animation identifier selecting landb.
const LEGS_LANDB = 21
/// Lower-body animation identifier selecting idle.
const LEGS_IDLE = 22
/// Lower-body animation identifier selecting idlecr.
const LEGS_IDLECR = 23
/// Lower-body animation identifier selecting turn.
const LEGS_TURN = 24
/// Upper-body animation identifier selecting capture the flag.
const TORSO_GETFLAG = 25
/// Upper-body animation identifier selecting guardbase.
const TORSO_GUARDBASE = 26
/// Upper-body animation identifier selecting patrol.
const TORSO_PATROL = 27
/// Upper-body animation identifier selecting followme.
const TORSO_FOLLOWME = 28
/// Upper-body animation identifier selecting affirmative.
const TORSO_AFFIRMATIVE = 29
/// Upper-body animation identifier selecting negative.
const TORSO_NEGATIVE = 30
/// Upper bound on animations represented by mq3.game.constants.
const MAX_ANIMATIONS = 31
/// Lower-body animation identifier selecting backcr.
const LEGS_BACKCR = 32
/// Lower-body animation identifier selecting backwalk.
const LEGS_BACKWALK = 33
/// Capture-the-flag status identifier representing run.
const FLAG_RUN = 34
/// Capture-the-flag status identifier representing stand.
const FLAG_STAND = 35
/// Capture-the-flag status identifier representing stand2 run.
const FLAG_STAND2RUN = 36
/// Upper bound on totalanimations represented by mq3.game.constants.
const MAX_TOTALANIMATIONS = 37
/// Team identifier selecting the free team/category.
const TEAM_FREE = 0
/// Team identifier selecting the red team/category.
const TEAM_RED = 1
/// Team identifier selecting the blue team/category.
const TEAM_BLUE = 2
/// Team identifier selecting the spectator team/category.
const TEAM_SPECTATOR = 3
/// Number of team identifiers, including free players and spectators.
const TEAM_NUM_TEAMS = 4
/// Cause-of-death identifier attributing damage or a kill to unknown.
const MOD_UNKNOWN = 0
/// Cause-of-death identifier attributing damage or a kill to shotgun.
const MOD_SHOTGUN = 1
/// Cause-of-death identifier attributing damage or a kill to gauntlet.
const MOD_GAUNTLET = 2
/// Cause-of-death identifier attributing damage or a kill to machine gun.
const MOD_MACHINEGUN = 3
/// Cause-of-death identifier attributing damage or a kill to grenade.
const MOD_GRENADE = 4
/// Cause-of-death identifier attributing damage or a kill to grenade splash.
const MOD_GRENADE_SPLASH = 5
/// Cause-of-death identifier attributing damage or a kill to rocket.
const MOD_ROCKET = 6
/// Cause-of-death identifier attributing damage or a kill to rocket splash.
const MOD_ROCKET_SPLASH = 7
/// Cause-of-death identifier attributing damage or a kill to plasma.
const MOD_PLASMA = 8
/// Cause-of-death identifier attributing damage or a kill to plasma splash.
const MOD_PLASMA_SPLASH = 9
/// Cause-of-death identifier attributing damage or a kill to railgun.
const MOD_RAILGUN = 10
/// Cause-of-death identifier attributing damage or a kill to lightning gun.
const MOD_LIGHTNING = 11
/// Cause-of-death identifier attributing damage or a kill to BFG.
const MOD_BFG = 12
/// Cause-of-death identifier attributing damage or a kill to BFG splash.
const MOD_BFG_SPLASH = 13
/// Cause-of-death identifier attributing damage or a kill to water.
const MOD_WATER = 14
/// Cause-of-death identifier attributing damage or a kill to slime.
const MOD_SLIME = 15
/// Cause-of-death identifier attributing damage or a kill to lava.
const MOD_LAVA = 16
/// Cause-of-death identifier attributing damage or a kill to crush.
const MOD_CRUSH = 17
/// Cause-of-death identifier attributing damage or a kill to telefrag.
const MOD_TELEFRAG = 18
/// Cause-of-death identifier attributing damage or a kill to falling.
const MOD_FALLING = 19
/// Cause-of-death identifier attributing damage or a kill to suicide.
const MOD_SUICIDE = 20
/// Cause-of-death identifier attributing damage or a kill to target laser.
const MOD_TARGET_LASER = 21
/// Cause-of-death identifier attributing damage or a kill to trigger hurt.
const MOD_TRIGGER_HURT = 22
/// Cause-of-death identifier attributing damage or a kill to grapple.
const MOD_GRAPPLE = 23
/// Pickup item-category identifier for bad.
const IT_BAD = 0
/// Pickup item-category identifier for weapon.
const IT_WEAPON = 1
/// Pickup item-category identifier for ammo.
const IT_AMMO = 2
/// Pickup item-category identifier for armor.
const IT_ARMOR = 3
/// Pickup item-category identifier for health.
const IT_HEALTH = 4
/// Pickup item-category identifier for powerup.
const IT_POWERUP = 5
/// Pickup item-category identifier for holdable.
const IT_HOLDABLE = 6
/// Pickup item-category identifier for persistant powerup.
const IT_PERSISTANT_POWERUP = 7
/// Pickup item-category identifier for team.
const IT_TEAM = 8
/// Network entity-type identifier representing general.
const ET_GENERAL = 0
/// Network entity-type identifier representing player.
const ET_PLAYER = 1
/// Network entity-type identifier representing item.
const ET_ITEM = 2
/// Network entity-type identifier representing missile.
const ET_MISSILE = 3
/// Network entity-type identifier representing mover.
const ET_MOVER = 4
/// Network entity-type identifier representing beam.
const ET_BEAM = 5
/// Network entity-type identifier representing portal.
const ET_PORTAL = 6
/// Network entity-type identifier representing speaker.
const ET_SPEAKER = 7
/// Network entity-type identifier representing push trigger.
const ET_PUSH_TRIGGER = 8
/// Network entity-type identifier representing teleport trigger.
const ET_TELEPORT_TRIGGER = 9
/// Network entity-type identifier representing invisible.
const ET_INVISIBLE = 10
/// Network entity-type identifier representing grapple.
const ET_GRAPPLE = 11
/// Network entity-type identifier representing team.
const ET_TEAM = 12
/// Entity-type range base encoding temporary event-only entities.
const ET_EVENTS = 13
/// Trajectory-mode identifier selecting stationary evaluation.
const TR_STATIONARY = 0
/// Trajectory-mode identifier selecting interpolate evaluation.
const TR_INTERPOLATE = 1
/// Trajectory-mode identifier selecting linear evaluation.
const TR_LINEAR = 2
/// Trajectory-mode identifier selecting linear stop evaluation.
const TR_LINEAR_STOP = 3
/// Trajectory-mode identifier selecting sine evaluation.
const TR_SINE = 4
/// Trajectory-mode identifier selecting gravity evaluation.
const TR_GRAVITY = 5

/// Read the baseq3 item category from the pinned item table, rejecting an invalid item index.
/// @param index Index of the entry to access.
function itemType(index)
  types = [0,3,3,3,4,4,4,4,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,6,6,5,5,5,5,5,5,8,8]
  if index < 0 or index >= len(types) then return error(471,"Invalid baseq3 item index") end if
  return types[index]
end function

/// Read the baseq3 pickup quantity from the pinned item table, rejecting an invalid item index.
/// @param index Index of the entry to access.
function itemQuantity(index)
  quantities = [0,5,50,100,5,25,50,100,0,10,40,10,10,100,10,50,20,0,10,50,5,30,60,5,10,15,60,60,30,30,30,30,30,60,0,0]
  if index < 0 or index >= len(quantities) then return error(471,"Invalid baseq3 item index") end if
  return quantities[index]
end function

/// Read the baseq3 weapon, powerup or holdable tag from the pinned item table, rejecting an invalid item index.
/// @param index Index of the entry to access.
function itemTag(index)
  tags = [0,0,0,0,0,0,0,0,1,3,2,4,5,6,7,8,9,10,3,2,4,8,6,5,7,9,1,2,1,2,3,4,5,6,7,8]
  if index < 0 or index >= len(tags) then return error(471,"Invalid baseq3 item index") end if
  return tags[index]
end function

/// Read the Team Arena item category from the pinned item table, rejecting an invalid item index.
/// @param index Index of the entry to access.
function missionpackItemType(index)
  types = [0,3,3,3,4,4,4,4,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,6,6,5,5,5,5,5,5,8,8,6,6,6,2,2,2,7,7,7,7,8,8,8,1,1,1]
  if index < 0 or index >= len(types) then return error(471,"Invalid Team Arena item index") end if
  return types[index]
end function
/// Read the Team Arena pickup quantity from the pinned item table, rejecting an invalid item index.
/// @param index Index of the entry to access.
function missionpackItemQuantity(index)
  quantities = [0,5,50,100,5,25,50,100,0,10,40,10,10,100,10,50,20,0,10,50,5,30,60,5,10,15,60,60,30,30,30,30,30,60,0,0,60,60,60,20,10,100,30,30,30,30,0,0,0,10,5,80]
  if index < 0 or index >= len(quantities) then return error(471,"Invalid Team Arena item index") end if
  return quantities[index]
end function
/// Read the Team Arena weapon, powerup or holdable tag from the pinned item table, rejecting an invalid item index.
/// @param index Index of the entry to access.
function missionpackItemTag(index)
  tags = [0,0,0,0,0,0,0,0,1,3,2,4,5,6,7,8,9,10,3,2,4,8,6,5,7,9,1,2,1,2,3,4,5,6,7,8,3,4,5,11,12,13,10,11,12,13,9,0,0,11,12,13]
  if index < 0 or index >= len(tags) then return error(471,"Invalid Team Arena item index") end if
  return tags[index]
end function
