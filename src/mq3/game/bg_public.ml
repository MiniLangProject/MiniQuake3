// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Remaining shared game/cgame public ABI from code/game/bg_public.h.
package mq3.game.bg_public

/// Baseq3 game-module version string exchanged with the client game.
const GAME_VERSION="baseq3-1"
/// Default downward acceleration in world units per second squared.
const DEFAULT_GRAVITY=800
/// Health threshold below which a corpse can be gibbed instead of remaining intact.
const GIB_HEALTH=-40
/// Fraction of incoming damage that armor can absorb before health is reduced.
const ARMOR_PROTECTION=0.66
/// Maximum number of item definitions indexed by the game and client game.
const MAX_ITEMS=256
/// Bit added to a player rank when the score is tied with another player.
const RANK_TIED_FLAG=0x4000
/// Horizontal and vertical spread scale used to distribute shotgun pellets.
const DEFAULT_SHOTGUN_SPREAD=700
/// Number of pellets emitted by a standard shotgun shot.
const DEFAULT_SHOTGUN_COUNT=11
/// Pickup/contact radius used for item interaction bounds in world units.
const ITEM_RADIUS=15
/// Maximum lightning-gun trace distance in world units.
const LIGHTNING_RANGE=768
/// Scoreboard sentinel indicating that a score has not been supplied.
const SCORE_NOT_PRESENT=-9999
/// Maximum lifetime of a vote in milliseconds before it expires.
const VOTE_TIME=30000
/// Bottom of the normal player collision box relative to the player origin.
const MINS_Z=-24
/// Standing eye height above the player origin, in world units.
const DEFAULT_VIEWHEIGHT=26
/// Crouched eye height above the player origin, in world units.
const CROUCH_VIEWHEIGHT=12
/// Eye-height offset used while the player is dead.
const DEAD_VIEWHEIGHT=-16

/// Configuration-string index or range start used to publish music.
const CS_MUSIC=2
/// Configuration-string index or range start used to publish message.
const CS_MESSAGE=3
/// Configuration-string index or range start used to publish motd.
const CS_MOTD=4
/// Configuration-string index or range start used to publish warmup.
const CS_WARMUP=5
/// Configuration-string index or range start used to publish scores1.
const CS_SCORES1=6
/// Configuration-string index or range start used to publish scores2.
const CS_SCORES2=7
/// Configuration-string index or range start used to publish vote time.
const CS_VOTE_TIME=8
/// Configuration-string index or range start used to publish vote string.
const CS_VOTE_STRING=9
/// Configuration-string index or range start used to publish vote yes.
const CS_VOTE_YES=10
/// Configuration-string index or range start used to publish vote no.
const CS_VOTE_NO=11
/// Configuration-string index or range start used to publish teamvote time.
const CS_TEAMVOTE_TIME=12
/// Configuration-string index or range start used to publish teamvote string.
const CS_TEAMVOTE_STRING=14
/// Configuration-string index or range start used to publish teamvote yes.
const CS_TEAMVOTE_YES=16
/// Configuration-string index or range start used to publish teamvote no.
const CS_TEAMVOTE_NO=18
/// Configuration-string index or range start used to publish game version.
const CS_GAME_VERSION=20
/// Configuration-string index or range start used to publish level start time.
const CS_LEVEL_START_TIME=21
/// Configuration-string index or range start used to publish intermission.
const CS_INTERMISSION=22
/// Configuration-string index or range start used to publish flagstatus.
const CS_FLAGSTATUS=23
/// Configuration-string index or range start used to publish shaderstate.
const CS_SHADERSTATE=24
/// Configuration-string index or range start used to publish botinfo.
const CS_BOTINFO=25
/// Configuration-string index or range start used to publish items.
const CS_ITEMS=27
/// Configuration-string index or range start used to publish models.
const CS_MODELS=32
/// Configuration-string index or range start used to publish sounds.
const CS_SOUNDS=288
/// Configuration-string index or range start used to publish players.
const CS_PLAYERS=544
/// Configuration-string index or range start used to publish locations.
const CS_LOCATIONS=608
/// Configuration-string index or range start used to publish particles.
const CS_PARTICLES=672
/// First configuration-string index after the game-defined ranges.
const CS_MAX=736

/// Player movement-state bit indicating ducked.
const PMF_DUCKED=1
/// Player movement-state bit indicating jump held.
const PMF_JUMP_HELD=2
/// Player movement-state bit indicating backwards jump.
const PMF_BACKWARDS_JUMP=8
/// Player movement-state bit indicating backwards run.
const PMF_BACKWARDS_RUN=16
/// Player movement-state bit indicating time land.
const PMF_TIME_LAND=32
/// Player movement-state bit indicating time knockback.
const PMF_TIME_KNOCKBACK=64
/// Player movement-state bit indicating time waterjump.
const PMF_TIME_WATERJUMP=256
/// Player movement-state bit indicating respawned.
const PMF_RESPAWNED=512
/// Player movement-state bit indicating use item held.
const PMF_USE_ITEM_HELD=1024
/// Player movement-state bit indicating grapple pull.
const PMF_GRAPPLE_PULL=2048
/// Player movement-state bit indicating follow.
const PMF_FOLLOW=4096
/// Player movement-state bit indicating scoreboard.
const PMF_SCOREBOARD=8192
/// Player movement-state bit indicating invulexpand.
const PMF_INVULEXPAND=16384
/// Combined movement mask for landing, knockback, and water-jump timers.
const PMF_ALL_TIMES=352
/// Maximum number of entity contacts retained by one player-movement result.
const MAXTOUCH=32

/// Network entity-flag bit indicating bounce.
const EF_BOUNCE=0x10
/// Network entity-flag bit indicating award denied.
const EF_AWARD_DENIED=0x40000
/// Network/predictable event identifier reporting event bit1.
const EV_EVENT_BIT1=0x100
/// Network/predictable event identifier reporting event bit2.
const EV_EVENT_BIT2=0x200
/// Network/predictable event identifier reporting event bits.
const EV_EVENT_BITS=0x300
/// Duration in milliseconds for which transient entity events remain valid.
const EVENT_VALID_MSEC=300
/// Animation bit toggled to restart an animation even when its index is unchanged.
const ANIM_TOGGLEBIT=128
/// Interval in milliseconds between team-location information updates.
const TEAM_LOCATION_UPDATE_TIME=1000
/// Maximum number of players included in a team-overlay message.
const TEAM_MAXOVERLAY=32
/// Upper bound on item models represented by mq3.game.bg_public.
const MAX_ITEM_MODELS=4
/// Deathmatch-option bit enabling no falling.
const DF_NO_FALLING=8
/// Deathmatch-option bit enabling fixed field of view.
const DF_FIXED_FOV=16
/// Deathmatch-option bit enabling no footsteps.
const DF_NO_FOOTSTEPS=32
/// Combined CONTENTS_* mask used for all collision queries.
const MASK_ALL=-1
/// Combined CONTENTS_* mask used for solid collision queries.
const MASK_SOLID=1
/// Combined CONTENTS_* mask used for playersolid collision queries.
const MASK_PLAYERSOLID=0x02010001
/// Combined CONTENTS_* mask used for deadsolid collision queries.
const MASK_DEADSOLID=0x00010001
/// Combined CONTENTS_* mask used for water collision queries.
const MASK_WATER=0x38
/// Combined CONTENTS_* mask used for opaque collision queries.
const MASK_OPAQUE=0x19
/// Combined CONTENTS_* mask used for shot collision queries.
const MASK_SHOT=0x06000001

/// `Pmove` record for bg public, containing `ps`, `cmd`, `tracemask`, `debugLevel` and `noFootsteps` and related fields.
struct Pmove
  /// Authoritative player state used for movement, prediction, and snapshot delivery.
  ps
  /// Current user-command input supplied to movement or client processing.
  cmd
  /// Contents mask used by the player or bot collision traces.
  tracemask
  /// Diagnostic verbosity level used by the module.
  debugLevel
  /// Nonzero when server/game settings suppress footstep events.
  noFootsteps
  /// Nonzero when the current gauntlet attack can hit a target.
  gauntletHit
  /// Counter of completed movement or game update frames.
  framecount
  /// Number of distinct entity contacts collected by the movement step.
  numtouch
  /// Entity numbers contacted during the movement step.
  touchents
  /// Lower player hull bound supplied through the public movement interface.
  mins
  /// Upper player hull bound supplied through the public movement interface.
  maxs
  /// CONTENTS_* mask identifying the liquid around the player.
  watertype
  /// Depth classification of the player immersion in liquid.
  waterlevel
  /// Horizontal speed used to select movement and footstep behavior.
  xyspeed
  /// Nonzero when player movement uses a fixed simulation step.
  pmoveFixed
  /// Fixed movement-step duration in milliseconds.
  pmoveMsec
  /// Injected callback for trace; invoked through the Pmove service/state record.
  traceFn
  /// Injected callback for point contents; invoked through the Pmove service/state record.
  pointContentsFn
end struct
/// `Animation` record for bg public, containing `firstFrame`, `numFrames`, `loopFrames`, `frameLerp` and `initialLerp` and related fields.
struct Animation
  /// First model frame of this animation sequence.
  firstFrame
  /// Number of model frames in the animation sequence.
  numFrames
  /// Number of trailing animation frames repeated during looping.
  loopFrames
  /// Time in milliseconds between consecutive animation frames.
  frameLerp
  /// Time in milliseconds used to reach the first animation frame.
  initialLerp
  /// Nonzero when the animation plays in reverse order.
  reversed
  /// Nonzero when the animation returns through its frames toward its starting pose.
  flipflop
end struct
/// `Gitem` record for bg public, containing `classname`, `pickupSound`, `worldModel`, `icon` and `pickupName` and related fields.
struct Gitem
  /// Map entity class name used to select a spawn function.
  classname
  /// Sound resource played when the item is picked up.
  pickupSound
  /// World/model resources used to represent an item pickup.
  worldModel
  /// Icon resource used to display the item in the interface.
  icon
  /// Human-readable name shown when the item is picked up.
  pickupName
  /// Base amount granted by an item pickup.
  quantity
  /// Item category selected from the IT_* constants.
  giType
  /// Category-specific item identifier, such as a weapon, powerup, or holdable ID.
  giTag
  /// Additional asset names to preload for the item definition.
  precaches
  /// Additional sound resources associated with the item or level.
  sounds
end struct

/// Return `index` for `ITEM_INDEX`.
/// @param index Index of the entry to access.
function ITEM_INDEX(index) return index end function
/// Return the ordered type names table for bg public: 20 entries beginning with `"pmove_t"` and `"animation_t"`.
function typeNames() return ["pmove_t","animation_t","gitem_t","gametype_t","gender_t","pmtype_t","weaponstate_t","statIndex_t","persEnum_t","powerup_t","holdable_t","weapon_t","entity_event_t","global_team_sound_t","animNumber_t","team_t","teamtask_t","meansOfDeath_t","itemType_t","entityType_t"] end function
