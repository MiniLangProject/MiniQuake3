// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Remaining shared game/cgame public ABI from code/game/bg_public.h.
package mq3.game.bg_public

const GAME_VERSION="baseq3-1"
const DEFAULT_GRAVITY=800
const GIB_HEALTH=-40
const ARMOR_PROTECTION=0.66
const MAX_ITEMS=256
const RANK_TIED_FLAG=0x4000
const DEFAULT_SHOTGUN_SPREAD=700
const DEFAULT_SHOTGUN_COUNT=11
const ITEM_RADIUS=15
const LIGHTNING_RANGE=768
const SCORE_NOT_PRESENT=-9999
const VOTE_TIME=30000
const MINS_Z=-24
const DEFAULT_VIEWHEIGHT=26
const CROUCH_VIEWHEIGHT=12
const DEAD_VIEWHEIGHT=-16

const CS_MUSIC=2
const CS_MESSAGE=3
const CS_MOTD=4
const CS_WARMUP=5
const CS_SCORES1=6
const CS_SCORES2=7
const CS_VOTE_TIME=8
const CS_VOTE_STRING=9
const CS_VOTE_YES=10
const CS_VOTE_NO=11
const CS_TEAMVOTE_TIME=12
const CS_TEAMVOTE_STRING=14
const CS_TEAMVOTE_YES=16
const CS_TEAMVOTE_NO=18
const CS_GAME_VERSION=20
const CS_LEVEL_START_TIME=21
const CS_INTERMISSION=22
const CS_FLAGSTATUS=23
const CS_SHADERSTATE=24
const CS_BOTINFO=25
const CS_ITEMS=27
const CS_MODELS=32
const CS_SOUNDS=288
const CS_PLAYERS=544
const CS_LOCATIONS=608
const CS_PARTICLES=672
const CS_MAX=736

const PMF_DUCKED=1
const PMF_JUMP_HELD=2
const PMF_BACKWARDS_JUMP=8
const PMF_BACKWARDS_RUN=16
const PMF_TIME_LAND=32
const PMF_TIME_KNOCKBACK=64
const PMF_TIME_WATERJUMP=256
const PMF_RESPAWNED=512
const PMF_USE_ITEM_HELD=1024
const PMF_GRAPPLE_PULL=2048
const PMF_FOLLOW=4096
const PMF_SCOREBOARD=8192
const PMF_INVULEXPAND=16384
const PMF_ALL_TIMES=352
const MAXTOUCH=32

const EF_BOUNCE=0x10
const EF_AWARD_DENIED=0x40000
const EV_EVENT_BIT1=0x100
const EV_EVENT_BIT2=0x200
const EV_EVENT_BITS=0x300
const EVENT_VALID_MSEC=300
const ANIM_TOGGLEBIT=128
const TEAM_LOCATION_UPDATE_TIME=1000
const TEAM_MAXOVERLAY=32
const MAX_ITEM_MODELS=4
const DF_NO_FALLING=8
const DF_FIXED_FOV=16
const DF_NO_FOOTSTEPS=32
const MASK_ALL=-1
const MASK_SOLID=1
const MASK_PLAYERSOLID=0x02010001
const MASK_DEADSOLID=0x00010001
const MASK_WATER=0x38
const MASK_OPAQUE=0x19
const MASK_SHOT=0x06000001

/// `Pmove` record for bg public, containing `ps`, `cmd`, `tracemask`, `debugLevel` and `noFootsteps` and related fields.
struct Pmove ps cmd tracemask debugLevel noFootsteps gauntletHit framecount numtouch touchents mins maxs watertype waterlevel xyspeed pmoveFixed pmoveMsec traceFn pointContentsFn end struct
/// `Animation` record for bg public, containing `firstFrame`, `numFrames`, `loopFrames`, `frameLerp` and `initialLerp` and related fields.
struct Animation firstFrame numFrames loopFrames frameLerp initialLerp reversed flipflop end struct
/// `Gitem` record for bg public, containing `classname`, `pickupSound`, `worldModel`, `icon` and `pickupName` and related fields.
struct Gitem classname pickupSound worldModel icon pickupName quantity giType giTag precaches sounds end struct

/// Return `index` for `ITEM_INDEX`.
/// @param index Index of the entry to access.
function ITEM_INDEX(index) return index end function
/// Return the ordered type names table for bg public: 20 entries beginning with `"pmove_t"` and `"animation_t"`.
function typeNames() return ["pmove_t","animation_t","gitem_t","gametype_t","gender_t","pmtype_t","weaponstate_t","statIndex_t","persEnum_t","powerup_t","holdable_t","weapon_t","entity_event_t","global_team_sound_t","animNumber_t","team_t","teamtask_t","meansOfDeath_t","itemType_t","entityType_t"] end function
