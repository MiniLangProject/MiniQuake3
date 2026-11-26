// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Canonical contracts from bg_lib.h, bg_local.h and g_rankings.h.
package mq3.game.game_internal_headers

/// Number of bits in one byte in the original game ABI.
const CHAR_BIT=8
/// Minimum signed 8-bit character value in the original game ABI.
const SCHAR_MIN=-128
/// Maximum signed 8-bit character value in the original game ABI.
const SCHAR_MAX=127
/// Maximum unsigned 8-bit character value in the original game ABI.
const UCHAR_MAX=255
/// Minimum signed 16-bit short value in the original game ABI.
const SHRT_MIN=-32768
/// Maximum signed 16-bit short value in the original game ABI.
const SHRT_MAX=32767
/// Maximum unsigned 16-bit short value in the original game ABI.
const USHRT_MAX=65535
/// Minimum signed 32-bit integer value in the original game ABI.
const INT_MIN=-2147483648
/// Maximum signed 32-bit integer value in the original game ABI.
const INT_MAX=2147483647
/// All-one 32-bit mask representing the original unsigned integer maximum.
const UINT_MAX=-1
/// Minimum signed 32-bit integer value in the original game ABI.
const LONG_MIN=-2147483648
/// Maximum signed 32-bit integer value in the original game ABI.
const LONG_MAX=2147483647
/// All-one 32-bit mask representing the original unsigned integer maximum.
const ULONG_MAX=-1

/// Minimum upward collision-normal component that can be treated as walkable ground.
const MIN_WALK_NORMAL=0.7
/// Maximum vertical stair step attempted by player movement, in world units.
const STEPSIZE=18
/// Initial upward velocity assigned when a normal player jump starts.
const JUMP_VELOCITY=270
/// Movement lockout duration in milliseconds after a qualifying landing.
const TIMER_LAND=130
/// Gesture animation duration in milliseconds.
const TIMER_GESTURE=2294
/// Small collision-plane overbounce factor that prevents motion from sticking to a surface.
const OVERCLIP=1.001

/// Ranking-report key for the match rating.
const QGR_KEY_MATCH_RATING=1112000001
/// Ranking-report key for the pairing of participating players.
const QGR_KEY_PLAYED_WITH=1210000002
/// Ranking-report key for the server host name.
const QGR_KEY_HOSTNAME=1000010000
/// Ranking-report key for the played map.
const QGR_KEY_MAP=1000010001
/// Ranking-report key for the game modification.
const QGR_KEY_MOD=1000010002
/// Ranking-report key for the selected game mode.
const QGR_KEY_GAMETYPE=1010010003
/// Ranking-report key used to identify frag limit statistics.
const QGR_KEY_FRAGLIMIT=1010010004
/// Ranking-report key used to identify time limit statistics.
const QGR_KEY_TIMELIMIT=1010010005
/// Ranking-report key used to identify client limit statistics.
const QGR_KEY_MAXCLIENTS=1010010006
/// Ranking-report key used to identify maximum network rate statistics.
const QGR_KEY_MAXRATE=1010010007
/// Ranking-report key used to identify minimum ping statistics.
const QGR_KEY_MINPING=1010010008
/// Ranking-report key used to identify maximum ping statistics.
const QGR_KEY_MAXPING=1010010009
/// Ranking-report key used to identify dedicated statistics.
const QGR_KEY_DEDICATED=1010010010
/// Ranking-report key used to identify version statistics.
const QGR_KEY_VERSION=1000010011
/// Ranking-report key for kills scored.
const QGR_KEY_FRAG=1211020000
/// Ranking-report key for self-inflicted deaths.
const QGR_KEY_SUICIDE=1111020001
/// Ranking-report key for shots fired.
const QGR_KEY_SHOT_FIRED=1111020002
/// Ranking-report key for hits delivered.
const QGR_KEY_HIT_GIVEN=1111020003
/// Ranking-report key for hits received.
const QGR_KEY_HIT_TAKEN=1111020004
/// Ranking-report key for damage dealt.
const QGR_KEY_DAMAGE_GIVEN=1111020005
/// Ranking-report key for damage received.
const QGR_KEY_DAMAGE_TAKEN=1111020006
/// Ranking-report key for splash damage dealt.
const QGR_KEY_SPLASH_GIVEN=1111020007
/// Ranking-report key for splash damage received.
const QGR_KEY_SPLASH_TAKEN=1111020008
/// Ranking-report key for weapon pickups.
const QGR_KEY_PICKUP_WEAPON=1111020009
/// Ranking-report key for time spent using the tracked item or weapon.
const QGR_KEY_TIME=1111020010
/// Ranking-report key for kills scored associated with gauntlet.
const QGR_KEY_FRAG_GAUNTLET=1211020100
/// Ranking-report key for self-inflicted deaths associated with gauntlet.
const QGR_KEY_SUICIDE_GAUNTLET=1111020101
/// Ranking-report key for shots fired associated with gauntlet.
const QGR_KEY_SHOT_FIRED_GAUNTLET=1111020102
/// Ranking-report key for hits delivered associated with gauntlet.
const QGR_KEY_HIT_GIVEN_GAUNTLET=1111020103
/// Ranking-report key for hits received associated with gauntlet.
const QGR_KEY_HIT_TAKEN_GAUNTLET=1111020104
/// Ranking-report key for damage dealt associated with gauntlet.
const QGR_KEY_DAMAGE_GIVEN_GAUNTLET=1111020105
/// Ranking-report key for damage received associated with gauntlet.
const QGR_KEY_DAMAGE_TAKEN_GAUNTLET=1111020106
/// Ranking-report key for splash damage dealt associated with gauntlet.
const QGR_KEY_SPLASH_GIVEN_GAUNTLET=1111020107
/// Ranking-report key for splash damage received associated with gauntlet.
const QGR_KEY_SPLASH_TAKEN_GAUNTLET=1111020108
/// Ranking-report key for pickups associated with gauntlet.
const QGR_KEY_PICKUP_GAUNTLET=1111020109
/// Ranking-report key for time spent using the tracked item or weapon associated with gauntlet.
const QGR_KEY_TIME_GAUNTLET=1111020110
/// Ranking-report key for kills scored associated with machine gun.
const QGR_KEY_FRAG_MACHINEGUN=1211020200
/// Ranking-report key for self-inflicted deaths associated with machine gun.
const QGR_KEY_SUICIDE_MACHINEGUN=1111020201
/// Ranking-report key for shots fired associated with machine gun.
const QGR_KEY_SHOT_FIRED_MACHINEGUN=1111020202
/// Ranking-report key for hits delivered associated with machine gun.
const QGR_KEY_HIT_GIVEN_MACHINEGUN=1111020203
/// Ranking-report key for hits received associated with machine gun.
const QGR_KEY_HIT_TAKEN_MACHINEGUN=1111020204
/// Ranking-report key for damage dealt associated with machine gun.
const QGR_KEY_DAMAGE_GIVEN_MACHINEGUN=1111020205
/// Ranking-report key for damage received associated with machine gun.
const QGR_KEY_DAMAGE_TAKEN_MACHINEGUN=1111020206
/// Ranking-report key for splash damage dealt associated with machine gun.
const QGR_KEY_SPLASH_GIVEN_MACHINEGUN=1111020207
/// Ranking-report key for splash damage received associated with machine gun.
const QGR_KEY_SPLASH_TAKEN_MACHINEGUN=1111020208
/// Ranking-report key for pickups associated with machine gun.
const QGR_KEY_PICKUP_MACHINEGUN=1111020209
/// Ranking-report key for time spent using the tracked item or weapon associated with machine gun.
const QGR_KEY_TIME_MACHINEGUN=1111020210
/// Ranking-report key for kills scored associated with shotgun.
const QGR_KEY_FRAG_SHOTGUN=1211020300
/// Ranking-report key for self-inflicted deaths associated with shotgun.
const QGR_KEY_SUICIDE_SHOTGUN=1111020301
/// Ranking-report key for shots fired associated with shotgun.
const QGR_KEY_SHOT_FIRED_SHOTGUN=1111020302
/// Ranking-report key for hits delivered associated with shotgun.
const QGR_KEY_HIT_GIVEN_SHOTGUN=1111020303
/// Ranking-report key for hits received associated with shotgun.
const QGR_KEY_HIT_TAKEN_SHOTGUN=1111020304
/// Ranking-report key for damage dealt associated with shotgun.
const QGR_KEY_DAMAGE_GIVEN_SHOTGUN=1111020305
/// Ranking-report key for damage received associated with shotgun.
const QGR_KEY_DAMAGE_TAKEN_SHOTGUN=1111020306
/// Ranking-report key for splash damage dealt associated with shotgun.
const QGR_KEY_SPLASH_GIVEN_SHOTGUN=1111020307
/// Ranking-report key for splash damage received associated with shotgun.
const QGR_KEY_SPLASH_TAKEN_SHOTGUN=1111020308
/// Ranking-report key for pickups associated with shotgun.
const QGR_KEY_PICKUP_SHOTGUN=1111020309
/// Ranking-report key for time spent using the tracked item or weapon associated with shotgun.
const QGR_KEY_TIME_SHOTGUN=1111020310
/// Ranking-report key for kills scored associated with grenade.
const QGR_KEY_FRAG_GRENADE=1211020400
/// Ranking-report key for self-inflicted deaths associated with grenade.
const QGR_KEY_SUICIDE_GRENADE=1111020401
/// Ranking-report key for shots fired associated with grenade.
const QGR_KEY_SHOT_FIRED_GRENADE=1111020402
/// Ranking-report key for hits delivered associated with grenade.
const QGR_KEY_HIT_GIVEN_GRENADE=1111020403
/// Ranking-report key for hits received associated with grenade.
const QGR_KEY_HIT_TAKEN_GRENADE=1111020404
/// Ranking-report key for damage dealt associated with grenade.
const QGR_KEY_DAMAGE_GIVEN_GRENADE=1111020405
/// Ranking-report key for damage received associated with grenade.
const QGR_KEY_DAMAGE_TAKEN_GRENADE=1111020406
/// Ranking-report key for splash damage dealt associated with grenade.
const QGR_KEY_SPLASH_GIVEN_GRENADE=1111020407
/// Ranking-report key for splash damage received associated with grenade.
const QGR_KEY_SPLASH_TAKEN_GRENADE=1111020408
/// Ranking-report key for pickups associated with grenade.
const QGR_KEY_PICKUP_GRENADE=1111020409
/// Ranking-report key for time spent using the tracked item or weapon associated with grenade.
const QGR_KEY_TIME_GRENADE=1111020410
/// Ranking-report key for kills scored associated with rocket.
const QGR_KEY_FRAG_ROCKET=1211020500
/// Ranking-report key for self-inflicted deaths associated with rocket.
const QGR_KEY_SUICIDE_ROCKET=1111020501
/// Ranking-report key for shots fired associated with rocket.
const QGR_KEY_SHOT_FIRED_ROCKET=1111020502
/// Ranking-report key for hits delivered associated with rocket.
const QGR_KEY_HIT_GIVEN_ROCKET=1111020503
/// Ranking-report key for hits received associated with rocket.
const QGR_KEY_HIT_TAKEN_ROCKET=1111020504
/// Ranking-report key for damage dealt associated with rocket.
const QGR_KEY_DAMAGE_GIVEN_ROCKET=1111020505
/// Ranking-report key for damage received associated with rocket.
const QGR_KEY_DAMAGE_TAKEN_ROCKET=1111020506
/// Ranking-report key for splash damage dealt associated with rocket.
const QGR_KEY_SPLASH_GIVEN_ROCKET=1111020507
/// Ranking-report key for splash damage received associated with rocket.
const QGR_KEY_SPLASH_TAKEN_ROCKET=1111020508
/// Ranking-report key for pickups associated with rocket.
const QGR_KEY_PICKUP_ROCKET=1111020509
/// Ranking-report key for time spent using the tracked item or weapon associated with rocket.
const QGR_KEY_TIME_ROCKET=1111020510
/// Ranking-report key for kills scored associated with plasma.
const QGR_KEY_FRAG_PLASMA=1211020600
/// Ranking-report key for self-inflicted deaths associated with plasma.
const QGR_KEY_SUICIDE_PLASMA=1111020601
/// Ranking-report key for shots fired associated with plasma.
const QGR_KEY_SHOT_FIRED_PLASMA=1111020602
/// Ranking-report key for hits delivered associated with plasma.
const QGR_KEY_HIT_GIVEN_PLASMA=1111020603
/// Ranking-report key for hits received associated with plasma.
const QGR_KEY_HIT_TAKEN_PLASMA=1111020604
/// Ranking-report key for damage dealt associated with plasma.
const QGR_KEY_DAMAGE_GIVEN_PLASMA=1111020605
/// Ranking-report key for damage received associated with plasma.
const QGR_KEY_DAMAGE_TAKEN_PLASMA=1111020606
/// Ranking-report key for splash damage dealt associated with plasma.
const QGR_KEY_SPLASH_GIVEN_PLASMA=1111020607
/// Ranking-report key for splash damage received associated with plasma.
const QGR_KEY_SPLASH_TAKEN_PLASMA=1111020608
/// Ranking-report key for pickups associated with plasma.
const QGR_KEY_PICKUP_PLASMA=1111020609
/// Ranking-report key for time spent using the tracked item or weapon associated with plasma.
const QGR_KEY_TIME_PLASMA=1111020610
/// Ranking-report key for kills scored associated with railgun.
const QGR_KEY_FRAG_RAILGUN=1211020700
/// Ranking-report key for self-inflicted deaths associated with railgun.
const QGR_KEY_SUICIDE_RAILGUN=1111020701
/// Ranking-report key for shots fired associated with railgun.
const QGR_KEY_SHOT_FIRED_RAILGUN=1111020702
/// Ranking-report key for hits delivered associated with railgun.
const QGR_KEY_HIT_GIVEN_RAILGUN=1111020703
/// Ranking-report key for hits received associated with railgun.
const QGR_KEY_HIT_TAKEN_RAILGUN=1111020704
/// Ranking-report key for damage dealt associated with railgun.
const QGR_KEY_DAMAGE_GIVEN_RAILGUN=1111020705
/// Ranking-report key for damage received associated with railgun.
const QGR_KEY_DAMAGE_TAKEN_RAILGUN=1111020706
/// Ranking-report key for splash damage dealt associated with railgun.
const QGR_KEY_SPLASH_GIVEN_RAILGUN=1111020707
/// Ranking-report key for splash damage received associated with railgun.
const QGR_KEY_SPLASH_TAKEN_RAILGUN=1111020708
/// Ranking-report key for pickups associated with railgun.
const QGR_KEY_PICKUP_RAILGUN=1111020709
/// Ranking-report key for time spent using the tracked item or weapon associated with railgun.
const QGR_KEY_TIME_RAILGUN=1111020710
/// Ranking-report key for kills scored associated with lightning gun.
const QGR_KEY_FRAG_LIGHTNING=1211020800
/// Ranking-report key for self-inflicted deaths associated with lightning gun.
const QGR_KEY_SUICIDE_LIGHTNING=1111020801
/// Ranking-report key for shots fired associated with lightning gun.
const QGR_KEY_SHOT_FIRED_LIGHTNING=1111020802
/// Ranking-report key for hits delivered associated with lightning gun.
const QGR_KEY_HIT_GIVEN_LIGHTNING=1111020803
/// Ranking-report key for hits received associated with lightning gun.
const QGR_KEY_HIT_TAKEN_LIGHTNING=1111020804
/// Ranking-report key for damage dealt associated with lightning gun.
const QGR_KEY_DAMAGE_GIVEN_LIGHTNING=1111020805
/// Ranking-report key for damage received associated with lightning gun.
const QGR_KEY_DAMAGE_TAKEN_LIGHTNING=1111020806
/// Ranking-report key for splash damage dealt associated with lightning gun.
const QGR_KEY_SPLASH_GIVEN_LIGHTNING=1111020807
/// Ranking-report key for splash damage received associated with lightning gun.
const QGR_KEY_SPLASH_TAKEN_LIGHTNING=1111020808
/// Ranking-report key for pickups associated with lightning gun.
const QGR_KEY_PICKUP_LIGHTNING=1111020809
/// Ranking-report key for time spent using the tracked item or weapon associated with lightning gun.
const QGR_KEY_TIME_LIGHTNING=1111020810
/// Ranking-report key for kills scored associated with BFG.
const QGR_KEY_FRAG_BFG=1211020900
/// Ranking-report key for self-inflicted deaths associated with BFG.
const QGR_KEY_SUICIDE_BFG=1111020901
/// Ranking-report key for shots fired associated with BFG.
const QGR_KEY_SHOT_FIRED_BFG=1111020902
/// Ranking-report key for hits delivered associated with BFG.
const QGR_KEY_HIT_GIVEN_BFG=1111020903
/// Ranking-report key for hits received associated with BFG.
const QGR_KEY_HIT_TAKEN_BFG=1111020904
/// Ranking-report key for damage dealt associated with BFG.
const QGR_KEY_DAMAGE_GIVEN_BFG=1111020905
/// Ranking-report key for damage received associated with BFG.
const QGR_KEY_DAMAGE_TAKEN_BFG=1111020906
/// Ranking-report key for splash damage dealt associated with BFG.
const QGR_KEY_SPLASH_GIVEN_BFG=1111020907
/// Ranking-report key for splash damage received associated with BFG.
const QGR_KEY_SPLASH_TAKEN_BFG=1111020908
/// Ranking-report key for pickups associated with BFG.
const QGR_KEY_PICKUP_BFG=1111020909
/// Ranking-report key for time spent using the tracked item or weapon associated with BFG.
const QGR_KEY_TIME_BFG=1111020910
/// Ranking-report key for kills scored associated with grapple.
const QGR_KEY_FRAG_GRAPPLE=1211021000
/// Ranking-report key for self-inflicted deaths associated with grapple.
const QGR_KEY_SUICIDE_GRAPPLE=1111021001
/// Ranking-report key for shots fired associated with grapple.
const QGR_KEY_SHOT_FIRED_GRAPPLE=1111021002
/// Ranking-report key for hits delivered associated with grapple.
const QGR_KEY_HIT_GIVEN_GRAPPLE=1111021003
/// Ranking-report key for hits received associated with grapple.
const QGR_KEY_HIT_TAKEN_GRAPPLE=1111021004
/// Ranking-report key for damage dealt associated with grapple.
const QGR_KEY_DAMAGE_GIVEN_GRAPPLE=1111021005
/// Ranking-report key for damage received associated with grapple.
const QGR_KEY_DAMAGE_TAKEN_GRAPPLE=1111021006
/// Ranking-report key for splash damage dealt associated with grapple.
const QGR_KEY_SPLASH_GIVEN_GRAPPLE=1111021007
/// Ranking-report key for splash damage received associated with grapple.
const QGR_KEY_SPLASH_TAKEN_GRAPPLE=1111021008
/// Ranking-report key for pickups associated with grapple.
const QGR_KEY_PICKUP_GRAPPLE=1111021009
/// Ranking-report key for time spent using the tracked item or weapon associated with grapple.
const QGR_KEY_TIME_GRAPPLE=1111021010
/// Ranking-report key for kills scored associated with unknown.
const QGR_KEY_FRAG_UNKNOWN=1211021100
/// Ranking-report key for self-inflicted deaths associated with unknown.
const QGR_KEY_SUICIDE_UNKNOWN=1111021101
/// Ranking-report key for shots fired associated with unknown.
const QGR_KEY_SHOT_FIRED_UNKNOWN=1111021102
/// Ranking-report key for hits delivered associated with unknown.
const QGR_KEY_HIT_GIVEN_UNKNOWN=1111021103
/// Ranking-report key for hits received associated with unknown.
const QGR_KEY_HIT_TAKEN_UNKNOWN=1111021104
/// Ranking-report key for damage dealt associated with unknown.
const QGR_KEY_DAMAGE_GIVEN_UNKNOWN=1111021105
/// Ranking-report key for damage received associated with unknown.
const QGR_KEY_DAMAGE_TAKEN_UNKNOWN=1111021106
/// Ranking-report key for splash damage dealt associated with unknown.
const QGR_KEY_SPLASH_GIVEN_UNKNOWN=1111021107
/// Ranking-report key for splash damage received associated with unknown.
const QGR_KEY_SPLASH_TAKEN_UNKNOWN=1111021108
/// Ranking-report key for pickups associated with unknown.
const QGR_KEY_PICKUP_UNKNOWN=1111021109
/// Ranking-report key for time spent using the tracked item or weapon associated with unknown.
const QGR_KEY_TIME_UNKNOWN=1111021110
/// Ranking-report key for kills scored associated with nailgin.
const QGR_KEY_FRAG_NAILGIN=1211021200
/// Ranking-report key for self-inflicted deaths associated with nailgin.
const QGR_KEY_SUICIDE_NAILGIN=1111021201
/// Ranking-report key for shots fired associated with nailgin.
const QGR_KEY_SHOT_FIRED_NAILGIN=1111021202
/// Ranking-report key for hits delivered associated with nailgin.
const QGR_KEY_HIT_GIVEN_NAILGIN=1111021203
/// Ranking-report key for hits received associated with nailgin.
const QGR_KEY_HIT_TAKEN_NAILGIN=1111021204
/// Ranking-report key for damage dealt associated with nailgin.
const QGR_KEY_DAMAGE_GIVEN_NAILGIN=1111021205
/// Ranking-report key for damage received associated with nailgin.
const QGR_KEY_DAMAGE_TAKEN_NAILGIN=1111021206
/// Ranking-report key for splash damage dealt associated with nailgin.
const QGR_KEY_SPLASH_GIVEN_NAILGIN=1111021207
/// Ranking-report key for splash damage received associated with nailgin.
const QGR_KEY_SPLASH_TAKEN_NAILGIN=1111021208
/// Ranking-report key for pickups associated with nailgin.
const QGR_KEY_PICKUP_NAILGIN=1111021209
/// Ranking-report key for time spent using the tracked item or weapon associated with nailgin.
const QGR_KEY_TIME_NAILGIN=1111021210
/// Ranking-report key for kills scored associated with prox launcher.
const QGR_KEY_FRAG_PROX_LAUNCHER=1211021300
/// Ranking-report key for self-inflicted deaths associated with prox launcher.
const QGR_KEY_SUICIDE_PROX_LAUNCHER=1111021301
/// Ranking-report key for shots fired associated with prox launcher.
const QGR_KEY_SHOT_FIRED_PROX_LAUNCHER=1111021302
/// Ranking-report key for hits delivered associated with prox launcher.
const QGR_KEY_HIT_GIVEN_PROX_LAUNCHER=1111021303
/// Ranking-report key for hits received associated with prox launcher.
const QGR_KEY_HIT_TAKEN_PROX_LAUNCHER=1111021304
/// Ranking-report key for damage dealt associated with prox launcher.
const QGR_KEY_DAMAGE_GIVEN_PROX_LAUNCHER=1111021305
/// Ranking-report key for damage received associated with prox launcher.
const QGR_KEY_DAMAGE_TAKEN_PROX_LAUNCHER=1111021306
/// Ranking-report key for splash damage dealt associated with prox launcher.
const QGR_KEY_SPLASH_GIVEN_PROX_LAUNCHER=1111021307
/// Ranking-report key for splash damage received associated with prox launcher.
const QGR_KEY_SPLASH_TAKEN_PROX_LAUNCHER=1111021308
/// Ranking-report key for pickups associated with prox launcher.
const QGR_KEY_PICKUP_PROX_LAUNCHER=1111021309
/// Ranking-report key for time spent using the tracked item or weapon associated with prox launcher.
const QGR_KEY_TIME_PROX_LAUNCHER=1111021310
/// Ranking-report key for kills scored associated with chaingun.
const QGR_KEY_FRAG_CHAINGUN=1211021400
/// Ranking-report key for self-inflicted deaths associated with chaingun.
const QGR_KEY_SUICIDE_CHAINGUN=1111021401
/// Ranking-report key for shots fired associated with chaingun.
const QGR_KEY_SHOT_FIRED_CHAINGUN=1111021402
/// Ranking-report key for hits delivered associated with chaingun.
const QGR_KEY_HIT_GIVEN_CHAINGUN=1111021403
/// Ranking-report key for hits received associated with chaingun.
const QGR_KEY_HIT_TAKEN_CHAINGUN=1111021404
/// Ranking-report key for damage dealt associated with chaingun.
const QGR_KEY_DAMAGE_GIVEN_CHAINGUN=1111021405
/// Ranking-report key for damage received associated with chaingun.
const QGR_KEY_DAMAGE_TAKEN_CHAINGUN=1111021406
/// Ranking-report key for splash damage dealt associated with chaingun.
const QGR_KEY_SPLASH_GIVEN_CHAINGUN=1111021407
/// Ranking-report key for splash damage received associated with chaingun.
const QGR_KEY_SPLASH_TAKEN_CHAINGUN=1111021408
/// Ranking-report key for pickups associated with chaingun.
const QGR_KEY_PICKUP_CHAINGUN=1111021409
/// Ranking-report key for time spent using the tracked item or weapon associated with chaingun.
const QGR_KEY_TIME_CHAINGUN=1111021410
/// Ranking-report key used to identify boxes statistics.
const QGR_KEY_BOXES=1111030000
/// Ranking-report key used to identify rounds statistics.
const QGR_KEY_ROUNDS=1111030001
/// Ranking-report key used to identify boxes bullets statistics.
const QGR_KEY_BOXES_BULLETS=1111030100
/// Ranking-report key used to identify rounds bullets statistics.
const QGR_KEY_ROUNDS_BULLETS=1111030101
/// Ranking-report key used to identify boxes shells statistics.
const QGR_KEY_BOXES_SHELLS=1111030200
/// Ranking-report key used to identify rounds shells statistics.
const QGR_KEY_ROUNDS_SHELLS=1111030201
/// Ranking-report key used to identify boxes grenades statistics.
const QGR_KEY_BOXES_GRENADES=1111030300
/// Ranking-report key used to identify rounds grenades statistics.
const QGR_KEY_ROUNDS_GRENADES=1111030301
/// Ranking-report key used to identify boxes rockets statistics.
const QGR_KEY_BOXES_ROCKETS=1111030400
/// Ranking-report key used to identify rounds rockets statistics.
const QGR_KEY_ROUNDS_ROCKETS=1111030401
/// Ranking-report key used to identify boxes cells statistics.
const QGR_KEY_BOXES_CELLS=1111030500
/// Ranking-report key used to identify rounds cells statistics.
const QGR_KEY_ROUNDS_CELLS=1111030501
/// Ranking-report key used to identify boxes slugs statistics.
const QGR_KEY_BOXES_SLUGS=1111030600
/// Ranking-report key used to identify rounds slugs statistics.
const QGR_KEY_ROUNDS_SLUGS=1111030601
/// Ranking-report key used to identify boxes lg ammo statistics.
const QGR_KEY_BOXES_LG_AMMO=1111030700
/// Ranking-report key used to identify rounds lg ammo statistics.
const QGR_KEY_ROUNDS_LG_AMMO=1111030701
/// Ranking-report key used to identify boxes BFG ammo statistics.
const QGR_KEY_BOXES_BFG_AMMO=1111030800
/// Ranking-report key used to identify rounds BFG ammo statistics.
const QGR_KEY_ROUNDS_BFG_AMMO=1111030801
/// Ranking-report key used to identify boxes nailgun ammo statistics.
const QGR_KEY_BOXES_NAILGUN_AMMO=1111030900
/// Ranking-report key used to identify rounds nailgun ammo statistics.
const QGR_KEY_ROUNDS_NAILGUN_AMMO=1111030901
/// Ranking-report key used to identify boxes prox launcher ammo statistics.
const QGR_KEY_BOXES_PROX_LAUNCHER_AMMO=1111031000
/// Ranking-report key used to identify rounds prox launcher ammo statistics.
const QGR_KEY_ROUNDS_PROX_LAUNCHER_AMMO=1111031001
/// Ranking-report key used to identify boxes chaingun ammo statistics.
const QGR_KEY_BOXES_CHAINGUN_AMMO=1111031100
/// Ranking-report key used to identify rounds chaingun ammo statistics.
const QGR_KEY_ROUNDS_CHAINGUN_AMMO=1111031101
/// Ranking-report key used to identify health statistics.
const QGR_KEY_HEALTH=1111040000
/// Ranking-report key used to identify health total statistics.
const QGR_KEY_HEALTH_TOTAL=1111040001
/// Ranking-report key used to identify health 5 statistics.
const QGR_KEY_HEALTH_5=1111040100
/// Ranking-report key used to identify health 25 statistics.
const QGR_KEY_HEALTH_25=1111040200
/// Ranking-report key used to identify health 50 statistics.
const QGR_KEY_HEALTH_50=1111040300
/// Ranking-report key used to identify health mega statistics.
const QGR_KEY_HEALTH_MEGA=1111040400
/// Ranking-report key used to identify armor statistics.
const QGR_KEY_ARMOR=1111050000
/// Ranking-report key used to identify armor total statistics.
const QGR_KEY_ARMOR_TOTAL=1111050001
/// Ranking-report key used to identify armor shard statistics.
const QGR_KEY_ARMOR_SHARD=1111050100
/// Ranking-report key used to identify armor yellow statistics.
const QGR_KEY_ARMOR_YELLOW=1111050200
/// Ranking-report key used to identify armor red statistics.
const QGR_KEY_ARMOR_RED=1111050300
/// Ranking-report key used to identify powerup statistics.
const QGR_KEY_POWERUP=1111060000
/// Ranking-report key used to identify quad statistics.
const QGR_KEY_QUAD=1111060100
/// Ranking-report key used to identify suit statistics.
const QGR_KEY_SUIT=1111060200
/// Ranking-report key used to identify haste statistics.
const QGR_KEY_HASTE=1111060300
/// Ranking-report key used to identify invis statistics.
const QGR_KEY_INVIS=1111060400
/// Ranking-report key used to identify regen statistics.
const QGR_KEY_REGEN=1111060500
/// Ranking-report key used to identify flight statistics.
const QGR_KEY_FLIGHT=1111060600
/// Ranking-report key used to identify scout statistics.
const QGR_KEY_SCOUT=1111160800
/// Ranking-report key used to identify guard statistics.
const QGR_KEY_GUARD=1111160801
/// Ranking-report key used to identify doubler statistics.
const QGR_KEY_DOUBLER=1111160802
/// Ranking-report key used to identify ammoregen statistics.
const QGR_KEY_AMMOREGEN=1111160803
/// Ranking-report key used to identify medkit statistics.
const QGR_KEY_MEDKIT=1111070000
/// Ranking-report key used to identify medkit use statistics.
const QGR_KEY_MEDKIT_USE=1111070001
/// Ranking-report key used to identify teleporter statistics.
const QGR_KEY_TELEPORTER=1111070100
/// Ranking-report key used to identify teleporter use statistics.
const QGR_KEY_TELEPORTER_USE=1111070101
/// Ranking-report key used to identify kamikaze statistics.
const QGR_KEY_KAMIKAZE=1111070200
/// Ranking-report key used to identify kamikaze use statistics.
const QGR_KEY_KAMIKAZE_USE=1111070201
/// Ranking-report key used to identify portal statistics.
const QGR_KEY_PORTAL=1111070300
/// Ranking-report key used to identify portal use statistics.
const QGR_KEY_PORTAL_USE=1111070301
/// Ranking-report key used to identify invulnerability statistics.
const QGR_KEY_INVULNERABILITY=1111070400
/// Ranking-report key used to identify invulnerability use statistics.
const QGR_KEY_INVULNERABILITY_USE=1111070401
/// Ranking-report key used to identify hazard death statistics.
const QGR_KEY_HAZARD_DEATH=1111080000
/// Ranking-report key used to identify water statistics.
const QGR_KEY_WATER=1111080100
/// Ranking-report key used to identify slime statistics.
const QGR_KEY_SLIME=1111080200
/// Ranking-report key used to identify lava statistics.
const QGR_KEY_LAVA=1111080300
/// Ranking-report key used to identify crush statistics.
const QGR_KEY_CRUSH=1111080400
/// Ranking-report key used to identify telefrag statistics.
const QGR_KEY_TELEFRAG=1111080500
/// Ranking-report key used to identify falling statistics.
const QGR_KEY_FALLING=1111080600
/// Ranking-report key for self-inflicted deaths associated with cmd.
const QGR_KEY_SUICIDE_CMD=1111080700
/// Ranking-report key used to identify trigger hurt statistics.
const QGR_KEY_TRIGGER_HURT=1111080800
/// Ranking-report key used to identify hazard misc statistics.
const QGR_KEY_HAZARD_MISC=1111080900
/// Ranking-report key used to identify impressive statistics.
const QGR_KEY_IMPRESSIVE=1111090000
/// Ranking-report key used to identify excellent statistics.
const QGR_KEY_EXCELLENT=1111090100
/// Ranking-report key used to identify teammate frag statistics.
const QGR_KEY_TEAMMATE_FRAG=1211100000
/// Ranking-report key used to identify teammate hit given statistics.
const QGR_KEY_TEAMMATE_HIT_GIVEN=1111100001
/// Ranking-report key used to identify teammate hit taken statistics.
const QGR_KEY_TEAMMATE_HIT_TAKEN=1111100002
/// Ranking-report key used to identify teammate damage given statistics.
const QGR_KEY_TEAMMATE_DAMAGE_GIVEN=1111100003
/// Ranking-report key used to identify teammate damage taken statistics.
const QGR_KEY_TEAMMATE_DAMAGE_TAKEN=1111100004
/// Ranking-report key used to identify teammate splash given statistics.
const QGR_KEY_TEAMMATE_SPLASH_GIVEN=1111100005
/// Ranking-report key used to identify teammate splash taken statistics.
const QGR_KEY_TEAMMATE_SPLASH_TAKEN=1111100006
/// Ranking-report key used to identify team name statistics.
const QGR_KEY_TEAM_NAME=1100100007
/// Ranking-report key used to identify flag pickup statistics.
const QGR_KEY_FLAG_PICKUP=1111110000
/// Ranking-report key used to identify flag capture statistics.
const QGR_KEY_FLAG_CAPTURE=1111110001

/// Return the ordered bg lib macro names table for game internal headers: 17 entries beginning with `"_INTSIZEOF"` and `"va_start"`.
function bgLibMacroNames() return ["_INTSIZEOF","va_start","va_arg","va_end","CHAR_BIT","SCHAR_MIN","SCHAR_MAX","UCHAR_MAX","SHRT_MIN","SHRT_MAX","USHRT_MAX","INT_MIN","INT_MAX","UINT_MAX","LONG_MIN","LONG_MAX","ULONG_MAX"] end function
/// Return a new array `["size_t","va_list","cmp_t"]` for `bgLibTypeNames`.
function bgLibTypeNames() return ["size_t","va_list","cmp_t"] end function
/// Return the ordered bg lib function names table for game internal headers: 31 entries beginning with `"qsort"` and `"srand"`.
function bgLibFunctionNames() return ["qsort","srand","rand","strlen","strcat","strcpy","strcmp","strchr","strstr","strncpy","tolower","toupper","atof","_atof","atoi","_atoi","vsprintf","sscanf","memmove","memset","memcpy","ceil","floor","sqrt","sin","cos","atan2","tan","abs","fabs","acos"] end function
/// Return a new array `["MIN_WALK_NORMAL","STEPSIZE","JUMP_VELOCITY","TIMER_LAND","TIMER_GESTURE","OVERCLIP"]` for `bgLocalConstantNames`.
function bgLocalConstantNames() return ["MIN_WALK_NORMAL","STEPSIZE","JUMP_VELOCITY","TIMER_LAND","TIMER_GESTURE","OVERCLIP"] end function
/// Return a new array `[MIN_WALK_NORMAL,STEPSIZE,JUMP_VELOCITY,TIMER_LAND,TIMER_GESTURE,OVERCLIP]` for `bgLocalConstantValues`.
function bgLocalConstantValues() return [MIN_WALK_NORMAL,STEPSIZE,JUMP_VELOCITY,TIMER_LAND,TIMER_GESTURE,OVERCLIP] end function
/// Return the ordered pml field names table for game internal headers: 12 entries beginning with `"forward"` and `"right"`.
function pmlFieldNames() return ["forward","right","up","frametime","msec","walking","groundPlane","groundTrace","impactSpeed","previous_origin","previous_velocity","previous_waterlevel"] end function
/// Return a new array `["PM_ClipVelocity","PM_AddTouchEnt","PM_AddEvent","PM_SlideMove","PM_StepSlideMove"]` for `bgLocalFunctionNames`.
function bgLocalFunctionNames() return ["PM_ClipVelocity","PM_AddTouchEnt","PM_AddEvent","PM_SlideMove","PM_StepSlideMove"] end function
/// Return the ordered bg local global names table for game internal headers: 14 entries beginning with `"pm"` and `"pml"`.
function bgLocalGlobalNames() return ["pm","pml","pm_stopspeed","pm_duckScale","pm_swimScale","pm_wadeScale","pm_accelerate","pm_airaccelerate","pm_wateraccelerate","pm_flyaccelerate","pm_friction","pm_waterfriction","pm_flightfriction","c_pmove"] end function
/// Return the ordered ranking key names table for game internal headers: 257 entries beginning with `"QGR_KEY_MATCH_RATING"` and `"QGR_KEY_PLAYED_WITH"`.
function rankingKeyNames() return ["QGR_KEY_MATCH_RATING","QGR_KEY_PLAYED_WITH","QGR_KEY_HOSTNAME","QGR_KEY_MAP","QGR_KEY_MOD","QGR_KEY_GAMETYPE","QGR_KEY_FRAGLIMIT","QGR_KEY_TIMELIMIT","QGR_KEY_MAXCLIENTS","QGR_KEY_MAXRATE","QGR_KEY_MINPING","QGR_KEY_MAXPING","QGR_KEY_DEDICATED","QGR_KEY_VERSION","QGR_KEY_FRAG","QGR_KEY_SUICIDE","QGR_KEY_SHOT_FIRED","QGR_KEY_HIT_GIVEN","QGR_KEY_HIT_TAKEN","QGR_KEY_DAMAGE_GIVEN","QGR_KEY_DAMAGE_TAKEN","QGR_KEY_SPLASH_GIVEN","QGR_KEY_SPLASH_TAKEN","QGR_KEY_PICKUP_WEAPON","QGR_KEY_TIME","QGR_KEY_FRAG_GAUNTLET","QGR_KEY_SUICIDE_GAUNTLET","QGR_KEY_SHOT_FIRED_GAUNTLET","QGR_KEY_HIT_GIVEN_GAUNTLET","QGR_KEY_HIT_TAKEN_GAUNTLET","QGR_KEY_DAMAGE_GIVEN_GAUNTLET","QGR_KEY_DAMAGE_TAKEN_GAUNTLET","QGR_KEY_SPLASH_GIVEN_GAUNTLET","QGR_KEY_SPLASH_TAKEN_GAUNTLET","QGR_KEY_PICKUP_GAUNTLET","QGR_KEY_TIME_GAUNTLET","QGR_KEY_FRAG_MACHINEGUN","QGR_KEY_SUICIDE_MACHINEGUN","QGR_KEY_SHOT_FIRED_MACHINEGUN","QGR_KEY_HIT_GIVEN_MACHINEGUN","QGR_KEY_HIT_TAKEN_MACHINEGUN","QGR_KEY_DAMAGE_GIVEN_MACHINEGUN","QGR_KEY_DAMAGE_TAKEN_MACHINEGUN","QGR_KEY_SPLASH_GIVEN_MACHINEGUN","QGR_KEY_SPLASH_TAKEN_MACHINEGUN","QGR_KEY_PICKUP_MACHINEGUN","QGR_KEY_TIME_MACHINEGUN","QGR_KEY_FRAG_SHOTGUN","QGR_KEY_SUICIDE_SHOTGUN","QGR_KEY_SHOT_FIRED_SHOTGUN","QGR_KEY_HIT_GIVEN_SHOTGUN","QGR_KEY_HIT_TAKEN_SHOTGUN","QGR_KEY_DAMAGE_GIVEN_SHOTGUN","QGR_KEY_DAMAGE_TAKEN_SHOTGUN","QGR_KEY_SPLASH_GIVEN_SHOTGUN","QGR_KEY_SPLASH_TAKEN_SHOTGUN","QGR_KEY_PICKUP_SHOTGUN","QGR_KEY_TIME_SHOTGUN","QGR_KEY_FRAG_GRENADE","QGR_KEY_SUICIDE_GRENADE","QGR_KEY_SHOT_FIRED_GRENADE","QGR_KEY_HIT_GIVEN_GRENADE","QGR_KEY_HIT_TAKEN_GRENADE","QGR_KEY_DAMAGE_GIVEN_GRENADE","QGR_KEY_DAMAGE_TAKEN_GRENADE","QGR_KEY_SPLASH_GIVEN_GRENADE","QGR_KEY_SPLASH_TAKEN_GRENADE","QGR_KEY_PICKUP_GRENADE","QGR_KEY_TIME_GRENADE","QGR_KEY_FRAG_ROCKET","QGR_KEY_SUICIDE_ROCKET","QGR_KEY_SHOT_FIRED_ROCKET","QGR_KEY_HIT_GIVEN_ROCKET","QGR_KEY_HIT_TAKEN_ROCKET","QGR_KEY_DAMAGE_GIVEN_ROCKET","QGR_KEY_DAMAGE_TAKEN_ROCKET","QGR_KEY_SPLASH_GIVEN_ROCKET","QGR_KEY_SPLASH_TAKEN_ROCKET","QGR_KEY_PICKUP_ROCKET","QGR_KEY_TIME_ROCKET","QGR_KEY_FRAG_PLASMA","QGR_KEY_SUICIDE_PLASMA","QGR_KEY_SHOT_FIRED_PLASMA","QGR_KEY_HIT_GIVEN_PLASMA","QGR_KEY_HIT_TAKEN_PLASMA","QGR_KEY_DAMAGE_GIVEN_PLASMA","QGR_KEY_DAMAGE_TAKEN_PLASMA","QGR_KEY_SPLASH_GIVEN_PLASMA","QGR_KEY_SPLASH_TAKEN_PLASMA","QGR_KEY_PICKUP_PLASMA","QGR_KEY_TIME_PLASMA","QGR_KEY_FRAG_RAILGUN","QGR_KEY_SUICIDE_RAILGUN","QGR_KEY_SHOT_FIRED_RAILGUN","QGR_KEY_HIT_GIVEN_RAILGUN","QGR_KEY_HIT_TAKEN_RAILGUN","QGR_KEY_DAMAGE_GIVEN_RAILGUN","QGR_KEY_DAMAGE_TAKEN_RAILGUN","QGR_KEY_SPLASH_GIVEN_RAILGUN","QGR_KEY_SPLASH_TAKEN_RAILGUN","QGR_KEY_PICKUP_RAILGUN","QGR_KEY_TIME_RAILGUN","QGR_KEY_FRAG_LIGHTNING","QGR_KEY_SUICIDE_LIGHTNING","QGR_KEY_SHOT_FIRED_LIGHTNING","QGR_KEY_HIT_GIVEN_LIGHTNING","QGR_KEY_HIT_TAKEN_LIGHTNING","QGR_KEY_DAMAGE_GIVEN_LIGHTNING","QGR_KEY_DAMAGE_TAKEN_LIGHTNING","QGR_KEY_SPLASH_GIVEN_LIGHTNING","QGR_KEY_SPLASH_TAKEN_LIGHTNING","QGR_KEY_PICKUP_LIGHTNING","QGR_KEY_TIME_LIGHTNING","QGR_KEY_FRAG_BFG","QGR_KEY_SUICIDE_BFG","QGR_KEY_SHOT_FIRED_BFG","QGR_KEY_HIT_GIVEN_BFG","QGR_KEY_HIT_TAKEN_BFG","QGR_KEY_DAMAGE_GIVEN_BFG","QGR_KEY_DAMAGE_TAKEN_BFG","QGR_KEY_SPLASH_GIVEN_BFG","QGR_KEY_SPLASH_TAKEN_BFG","QGR_KEY_PICKUP_BFG","QGR_KEY_TIME_BFG","QGR_KEY_FRAG_GRAPPLE","QGR_KEY_SUICIDE_GRAPPLE","QGR_KEY_SHOT_FIRED_GRAPPLE","QGR_KEY_HIT_GIVEN_GRAPPLE","QGR_KEY_HIT_TAKEN_GRAPPLE","QGR_KEY_DAMAGE_GIVEN_GRAPPLE","QGR_KEY_DAMAGE_TAKEN_GRAPPLE","QGR_KEY_SPLASH_GIVEN_GRAPPLE","QGR_KEY_SPLASH_TAKEN_GRAPPLE","QGR_KEY_PICKUP_GRAPPLE","QGR_KEY_TIME_GRAPPLE","QGR_KEY_FRAG_UNKNOWN","QGR_KEY_SUICIDE_UNKNOWN","QGR_KEY_SHOT_FIRED_UNKNOWN","QGR_KEY_HIT_GIVEN_UNKNOWN","QGR_KEY_HIT_TAKEN_UNKNOWN","QGR_KEY_DAMAGE_GIVEN_UNKNOWN","QGR_KEY_DAMAGE_TAKEN_UNKNOWN","QGR_KEY_SPLASH_GIVEN_UNKNOWN","QGR_KEY_SPLASH_TAKEN_UNKNOWN","QGR_KEY_PICKUP_UNKNOWN","QGR_KEY_TIME_UNKNOWN","QGR_KEY_FRAG_NAILGIN","QGR_KEY_SUICIDE_NAILGIN","QGR_KEY_SHOT_FIRED_NAILGIN","QGR_KEY_HIT_GIVEN_NAILGIN","QGR_KEY_HIT_TAKEN_NAILGIN","QGR_KEY_DAMAGE_GIVEN_NAILGIN","QGR_KEY_DAMAGE_TAKEN_NAILGIN","QGR_KEY_SPLASH_GIVEN_NAILGIN","QGR_KEY_SPLASH_TAKEN_NAILGIN","QGR_KEY_PICKUP_NAILGIN","QGR_KEY_TIME_NAILGIN","QGR_KEY_FRAG_PROX_LAUNCHER","QGR_KEY_SUICIDE_PROX_LAUNCHER","QGR_KEY_SHOT_FIRED_PROX_LAUNCHER","QGR_KEY_HIT_GIVEN_PROX_LAUNCHER","QGR_KEY_HIT_TAKEN_PROX_LAUNCHER","QGR_KEY_DAMAGE_GIVEN_PROX_LAUNCHER","QGR_KEY_DAMAGE_TAKEN_PROX_LAUNCHER","QGR_KEY_SPLASH_GIVEN_PROX_LAUNCHER","QGR_KEY_SPLASH_TAKEN_PROX_LAUNCHER","QGR_KEY_PICKUP_PROX_LAUNCHER","QGR_KEY_TIME_PROX_LAUNCHER","QGR_KEY_FRAG_CHAINGUN","QGR_KEY_SUICIDE_CHAINGUN","QGR_KEY_SHOT_FIRED_CHAINGUN","QGR_KEY_HIT_GIVEN_CHAINGUN","QGR_KEY_HIT_TAKEN_CHAINGUN","QGR_KEY_DAMAGE_GIVEN_CHAINGUN","QGR_KEY_DAMAGE_TAKEN_CHAINGUN","QGR_KEY_SPLASH_GIVEN_CHAINGUN","QGR_KEY_SPLASH_TAKEN_CHAINGUN","QGR_KEY_PICKUP_CHAINGUN","QGR_KEY_TIME_CHAINGUN","QGR_KEY_BOXES","QGR_KEY_ROUNDS","QGR_KEY_BOXES_BULLETS","QGR_KEY_ROUNDS_BULLETS","QGR_KEY_BOXES_SHELLS","QGR_KEY_ROUNDS_SHELLS","QGR_KEY_BOXES_GRENADES","QGR_KEY_ROUNDS_GRENADES","QGR_KEY_BOXES_ROCKETS","QGR_KEY_ROUNDS_ROCKETS","QGR_KEY_BOXES_CELLS","QGR_KEY_ROUNDS_CELLS","QGR_KEY_BOXES_SLUGS","QGR_KEY_ROUNDS_SLUGS","QGR_KEY_BOXES_LG_AMMO","QGR_KEY_ROUNDS_LG_AMMO","QGR_KEY_BOXES_BFG_AMMO","QGR_KEY_ROUNDS_BFG_AMMO","QGR_KEY_BOXES_NAILGUN_AMMO","QGR_KEY_ROUNDS_NAILGUN_AMMO","QGR_KEY_BOXES_PROX_LAUNCHER_AMMO","QGR_KEY_ROUNDS_PROX_LAUNCHER_AMMO","QGR_KEY_BOXES_CHAINGUN_AMMO","QGR_KEY_ROUNDS_CHAINGUN_AMMO","QGR_KEY_HEALTH","QGR_KEY_HEALTH_TOTAL","QGR_KEY_HEALTH_5","QGR_KEY_HEALTH_25","QGR_KEY_HEALTH_50","QGR_KEY_HEALTH_MEGA","QGR_KEY_ARMOR","QGR_KEY_ARMOR_TOTAL","QGR_KEY_ARMOR_SHARD","QGR_KEY_ARMOR_YELLOW","QGR_KEY_ARMOR_RED","QGR_KEY_POWERUP","QGR_KEY_QUAD","QGR_KEY_SUIT","QGR_KEY_HASTE","QGR_KEY_INVIS","QGR_KEY_REGEN","QGR_KEY_FLIGHT","QGR_KEY_SCOUT","QGR_KEY_GUARD","QGR_KEY_DOUBLER","QGR_KEY_AMMOREGEN","QGR_KEY_MEDKIT","QGR_KEY_MEDKIT_USE","QGR_KEY_TELEPORTER","QGR_KEY_TELEPORTER_USE","QGR_KEY_KAMIKAZE","QGR_KEY_KAMIKAZE_USE","QGR_KEY_PORTAL","QGR_KEY_PORTAL_USE","QGR_KEY_INVULNERABILITY","QGR_KEY_INVULNERABILITY_USE","QGR_KEY_HAZARD_DEATH","QGR_KEY_WATER","QGR_KEY_SLIME","QGR_KEY_LAVA","QGR_KEY_CRUSH","QGR_KEY_TELEFRAG","QGR_KEY_FALLING","QGR_KEY_SUICIDE_CMD","QGR_KEY_TRIGGER_HURT","QGR_KEY_HAZARD_MISC","QGR_KEY_IMPRESSIVE","QGR_KEY_EXCELLENT","QGR_KEY_TEAMMATE_FRAG","QGR_KEY_TEAMMATE_HIT_GIVEN","QGR_KEY_TEAMMATE_HIT_TAKEN","QGR_KEY_TEAMMATE_DAMAGE_GIVEN","QGR_KEY_TEAMMATE_DAMAGE_TAKEN","QGR_KEY_TEAMMATE_SPLASH_GIVEN","QGR_KEY_TEAMMATE_SPLASH_TAKEN","QGR_KEY_TEAM_NAME","QGR_KEY_FLAG_PICKUP","QGR_KEY_FLAG_CAPTURE"] end function
/// Return the ordered ranking key values table for game internal headers: 257 entries beginning with `QGR_KEY_MATCH_RATING` and `QGR_KEY_PLAYED_WITH`.
function rankingKeyValues() return [QGR_KEY_MATCH_RATING,QGR_KEY_PLAYED_WITH,QGR_KEY_HOSTNAME,QGR_KEY_MAP,QGR_KEY_MOD,QGR_KEY_GAMETYPE,QGR_KEY_FRAGLIMIT,QGR_KEY_TIMELIMIT,QGR_KEY_MAXCLIENTS,QGR_KEY_MAXRATE,QGR_KEY_MINPING,QGR_KEY_MAXPING,QGR_KEY_DEDICATED,QGR_KEY_VERSION,QGR_KEY_FRAG,QGR_KEY_SUICIDE,QGR_KEY_SHOT_FIRED,QGR_KEY_HIT_GIVEN,QGR_KEY_HIT_TAKEN,QGR_KEY_DAMAGE_GIVEN,QGR_KEY_DAMAGE_TAKEN,QGR_KEY_SPLASH_GIVEN,QGR_KEY_SPLASH_TAKEN,QGR_KEY_PICKUP_WEAPON,QGR_KEY_TIME,QGR_KEY_FRAG_GAUNTLET,QGR_KEY_SUICIDE_GAUNTLET,QGR_KEY_SHOT_FIRED_GAUNTLET,QGR_KEY_HIT_GIVEN_GAUNTLET,QGR_KEY_HIT_TAKEN_GAUNTLET,QGR_KEY_DAMAGE_GIVEN_GAUNTLET,QGR_KEY_DAMAGE_TAKEN_GAUNTLET,QGR_KEY_SPLASH_GIVEN_GAUNTLET,QGR_KEY_SPLASH_TAKEN_GAUNTLET,QGR_KEY_PICKUP_GAUNTLET,QGR_KEY_TIME_GAUNTLET,QGR_KEY_FRAG_MACHINEGUN,QGR_KEY_SUICIDE_MACHINEGUN,QGR_KEY_SHOT_FIRED_MACHINEGUN,QGR_KEY_HIT_GIVEN_MACHINEGUN,QGR_KEY_HIT_TAKEN_MACHINEGUN,QGR_KEY_DAMAGE_GIVEN_MACHINEGUN,QGR_KEY_DAMAGE_TAKEN_MACHINEGUN,QGR_KEY_SPLASH_GIVEN_MACHINEGUN,QGR_KEY_SPLASH_TAKEN_MACHINEGUN,QGR_KEY_PICKUP_MACHINEGUN,QGR_KEY_TIME_MACHINEGUN,QGR_KEY_FRAG_SHOTGUN,QGR_KEY_SUICIDE_SHOTGUN,QGR_KEY_SHOT_FIRED_SHOTGUN,QGR_KEY_HIT_GIVEN_SHOTGUN,QGR_KEY_HIT_TAKEN_SHOTGUN,QGR_KEY_DAMAGE_GIVEN_SHOTGUN,QGR_KEY_DAMAGE_TAKEN_SHOTGUN,QGR_KEY_SPLASH_GIVEN_SHOTGUN,QGR_KEY_SPLASH_TAKEN_SHOTGUN,QGR_KEY_PICKUP_SHOTGUN,QGR_KEY_TIME_SHOTGUN,QGR_KEY_FRAG_GRENADE,QGR_KEY_SUICIDE_GRENADE,QGR_KEY_SHOT_FIRED_GRENADE,QGR_KEY_HIT_GIVEN_GRENADE,QGR_KEY_HIT_TAKEN_GRENADE,QGR_KEY_DAMAGE_GIVEN_GRENADE,QGR_KEY_DAMAGE_TAKEN_GRENADE,QGR_KEY_SPLASH_GIVEN_GRENADE,QGR_KEY_SPLASH_TAKEN_GRENADE,QGR_KEY_PICKUP_GRENADE,QGR_KEY_TIME_GRENADE,QGR_KEY_FRAG_ROCKET,QGR_KEY_SUICIDE_ROCKET,QGR_KEY_SHOT_FIRED_ROCKET,QGR_KEY_HIT_GIVEN_ROCKET,QGR_KEY_HIT_TAKEN_ROCKET,QGR_KEY_DAMAGE_GIVEN_ROCKET,QGR_KEY_DAMAGE_TAKEN_ROCKET,QGR_KEY_SPLASH_GIVEN_ROCKET,QGR_KEY_SPLASH_TAKEN_ROCKET,QGR_KEY_PICKUP_ROCKET,QGR_KEY_TIME_ROCKET,QGR_KEY_FRAG_PLASMA,QGR_KEY_SUICIDE_PLASMA,QGR_KEY_SHOT_FIRED_PLASMA,QGR_KEY_HIT_GIVEN_PLASMA,QGR_KEY_HIT_TAKEN_PLASMA,QGR_KEY_DAMAGE_GIVEN_PLASMA,QGR_KEY_DAMAGE_TAKEN_PLASMA,QGR_KEY_SPLASH_GIVEN_PLASMA,QGR_KEY_SPLASH_TAKEN_PLASMA,QGR_KEY_PICKUP_PLASMA,QGR_KEY_TIME_PLASMA,QGR_KEY_FRAG_RAILGUN,QGR_KEY_SUICIDE_RAILGUN,QGR_KEY_SHOT_FIRED_RAILGUN,QGR_KEY_HIT_GIVEN_RAILGUN,QGR_KEY_HIT_TAKEN_RAILGUN,QGR_KEY_DAMAGE_GIVEN_RAILGUN,QGR_KEY_DAMAGE_TAKEN_RAILGUN,QGR_KEY_SPLASH_GIVEN_RAILGUN,QGR_KEY_SPLASH_TAKEN_RAILGUN,QGR_KEY_PICKUP_RAILGUN,QGR_KEY_TIME_RAILGUN,QGR_KEY_FRAG_LIGHTNING,QGR_KEY_SUICIDE_LIGHTNING,QGR_KEY_SHOT_FIRED_LIGHTNING,QGR_KEY_HIT_GIVEN_LIGHTNING,QGR_KEY_HIT_TAKEN_LIGHTNING,QGR_KEY_DAMAGE_GIVEN_LIGHTNING,QGR_KEY_DAMAGE_TAKEN_LIGHTNING,QGR_KEY_SPLASH_GIVEN_LIGHTNING,QGR_KEY_SPLASH_TAKEN_LIGHTNING,QGR_KEY_PICKUP_LIGHTNING,QGR_KEY_TIME_LIGHTNING,QGR_KEY_FRAG_BFG,QGR_KEY_SUICIDE_BFG,QGR_KEY_SHOT_FIRED_BFG,QGR_KEY_HIT_GIVEN_BFG,QGR_KEY_HIT_TAKEN_BFG,QGR_KEY_DAMAGE_GIVEN_BFG,QGR_KEY_DAMAGE_TAKEN_BFG,QGR_KEY_SPLASH_GIVEN_BFG,QGR_KEY_SPLASH_TAKEN_BFG,QGR_KEY_PICKUP_BFG,QGR_KEY_TIME_BFG,QGR_KEY_FRAG_GRAPPLE,QGR_KEY_SUICIDE_GRAPPLE,QGR_KEY_SHOT_FIRED_GRAPPLE,QGR_KEY_HIT_GIVEN_GRAPPLE,QGR_KEY_HIT_TAKEN_GRAPPLE,QGR_KEY_DAMAGE_GIVEN_GRAPPLE,QGR_KEY_DAMAGE_TAKEN_GRAPPLE,QGR_KEY_SPLASH_GIVEN_GRAPPLE,QGR_KEY_SPLASH_TAKEN_GRAPPLE,QGR_KEY_PICKUP_GRAPPLE,QGR_KEY_TIME_GRAPPLE,QGR_KEY_FRAG_UNKNOWN,QGR_KEY_SUICIDE_UNKNOWN,QGR_KEY_SHOT_FIRED_UNKNOWN,QGR_KEY_HIT_GIVEN_UNKNOWN,QGR_KEY_HIT_TAKEN_UNKNOWN,QGR_KEY_DAMAGE_GIVEN_UNKNOWN,QGR_KEY_DAMAGE_TAKEN_UNKNOWN,QGR_KEY_SPLASH_GIVEN_UNKNOWN,QGR_KEY_SPLASH_TAKEN_UNKNOWN,QGR_KEY_PICKUP_UNKNOWN,QGR_KEY_TIME_UNKNOWN,QGR_KEY_FRAG_NAILGIN,QGR_KEY_SUICIDE_NAILGIN,QGR_KEY_SHOT_FIRED_NAILGIN,QGR_KEY_HIT_GIVEN_NAILGIN,QGR_KEY_HIT_TAKEN_NAILGIN,QGR_KEY_DAMAGE_GIVEN_NAILGIN,QGR_KEY_DAMAGE_TAKEN_NAILGIN,QGR_KEY_SPLASH_GIVEN_NAILGIN,QGR_KEY_SPLASH_TAKEN_NAILGIN,QGR_KEY_PICKUP_NAILGIN,QGR_KEY_TIME_NAILGIN,QGR_KEY_FRAG_PROX_LAUNCHER,QGR_KEY_SUICIDE_PROX_LAUNCHER,QGR_KEY_SHOT_FIRED_PROX_LAUNCHER,QGR_KEY_HIT_GIVEN_PROX_LAUNCHER,QGR_KEY_HIT_TAKEN_PROX_LAUNCHER,QGR_KEY_DAMAGE_GIVEN_PROX_LAUNCHER,QGR_KEY_DAMAGE_TAKEN_PROX_LAUNCHER,QGR_KEY_SPLASH_GIVEN_PROX_LAUNCHER,QGR_KEY_SPLASH_TAKEN_PROX_LAUNCHER,QGR_KEY_PICKUP_PROX_LAUNCHER,QGR_KEY_TIME_PROX_LAUNCHER,QGR_KEY_FRAG_CHAINGUN,QGR_KEY_SUICIDE_CHAINGUN,QGR_KEY_SHOT_FIRED_CHAINGUN,QGR_KEY_HIT_GIVEN_CHAINGUN,QGR_KEY_HIT_TAKEN_CHAINGUN,QGR_KEY_DAMAGE_GIVEN_CHAINGUN,QGR_KEY_DAMAGE_TAKEN_CHAINGUN,QGR_KEY_SPLASH_GIVEN_CHAINGUN,QGR_KEY_SPLASH_TAKEN_CHAINGUN,QGR_KEY_PICKUP_CHAINGUN,QGR_KEY_TIME_CHAINGUN,QGR_KEY_BOXES,QGR_KEY_ROUNDS,QGR_KEY_BOXES_BULLETS,QGR_KEY_ROUNDS_BULLETS,QGR_KEY_BOXES_SHELLS,QGR_KEY_ROUNDS_SHELLS,QGR_KEY_BOXES_GRENADES,QGR_KEY_ROUNDS_GRENADES,QGR_KEY_BOXES_ROCKETS,QGR_KEY_ROUNDS_ROCKETS,QGR_KEY_BOXES_CELLS,QGR_KEY_ROUNDS_CELLS,QGR_KEY_BOXES_SLUGS,QGR_KEY_ROUNDS_SLUGS,QGR_KEY_BOXES_LG_AMMO,QGR_KEY_ROUNDS_LG_AMMO,QGR_KEY_BOXES_BFG_AMMO,QGR_KEY_ROUNDS_BFG_AMMO,QGR_KEY_BOXES_NAILGUN_AMMO,QGR_KEY_ROUNDS_NAILGUN_AMMO,QGR_KEY_BOXES_PROX_LAUNCHER_AMMO,QGR_KEY_ROUNDS_PROX_LAUNCHER_AMMO,QGR_KEY_BOXES_CHAINGUN_AMMO,QGR_KEY_ROUNDS_CHAINGUN_AMMO,QGR_KEY_HEALTH,QGR_KEY_HEALTH_TOTAL,QGR_KEY_HEALTH_5,QGR_KEY_HEALTH_25,QGR_KEY_HEALTH_50,QGR_KEY_HEALTH_MEGA,QGR_KEY_ARMOR,QGR_KEY_ARMOR_TOTAL,QGR_KEY_ARMOR_SHARD,QGR_KEY_ARMOR_YELLOW,QGR_KEY_ARMOR_RED,QGR_KEY_POWERUP,QGR_KEY_QUAD,QGR_KEY_SUIT,QGR_KEY_HASTE,QGR_KEY_INVIS,QGR_KEY_REGEN,QGR_KEY_FLIGHT,QGR_KEY_SCOUT,QGR_KEY_GUARD,QGR_KEY_DOUBLER,QGR_KEY_AMMOREGEN,QGR_KEY_MEDKIT,QGR_KEY_MEDKIT_USE,QGR_KEY_TELEPORTER,QGR_KEY_TELEPORTER_USE,QGR_KEY_KAMIKAZE,QGR_KEY_KAMIKAZE_USE,QGR_KEY_PORTAL,QGR_KEY_PORTAL_USE,QGR_KEY_INVULNERABILITY,QGR_KEY_INVULNERABILITY_USE,QGR_KEY_HAZARD_DEATH,QGR_KEY_WATER,QGR_KEY_SLIME,QGR_KEY_LAVA,QGR_KEY_CRUSH,QGR_KEY_TELEFRAG,QGR_KEY_FALLING,QGR_KEY_SUICIDE_CMD,QGR_KEY_TRIGGER_HURT,QGR_KEY_HAZARD_MISC,QGR_KEY_IMPRESSIVE,QGR_KEY_EXCELLENT,QGR_KEY_TEAMMATE_FRAG,QGR_KEY_TEAMMATE_HIT_GIVEN,QGR_KEY_TEAMMATE_HIT_TAKEN,QGR_KEY_TEAMMATE_DAMAGE_GIVEN,QGR_KEY_TEAMMATE_DAMAGE_TAKEN,QGR_KEY_TEAMMATE_SPLASH_GIVEN,QGR_KEY_TEAMMATE_SPLASH_TAKEN,QGR_KEY_TEAM_NAME,QGR_KEY_FLAG_PICKUP,QGR_KEY_FLAG_CAPTURE] end function
/// Return a new array `[17,3,31,6,12,5,14,257]` for `headerCounts`.
function headerCounts() return [17,3,31,6,12,5,14,257] end function
