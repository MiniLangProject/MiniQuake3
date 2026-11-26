// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// Complete shared CGame-local ABI and declaration facade from code/cgame/cg_local.h.
// Live state stays in the split semantic CGame modules; this file owns the exact
// Baseq3/Missionpack constants, enum ordinals, record shapes and declaration inventory.
package mq3.client.cg_local

/// Font-scale threshold retained from the native CGame declaration interface.
const CG_FONT_THRESHOLD=0.1
/// Number of warning blinks played before a timed powerup expires.
const POWERUP_BLINKS=5
/// Duration in milliseconds of one powerup-expiration blink interval.
const POWERUP_BLINK_TIME=1000
/// Duration in milliseconds of the standard CGame presentation fade.
const FADE_TIME=200
/// Duration in milliseconds of the standard HUD pulse cycle.
const PULSE_TIME=200
/// Milliseconds spent deflecting the camera at the start of damage kick.
const DAMAGE_DEFLECT_TIME=100
/// Milliseconds spent returning the camera after damage deflection.
const DAMAGE_RETURN_TIME=400
/// Total presentation duration in milliseconds of the damage indicator.
const DAMAGE_TIME=500
/// Milliseconds spent moving the view during the initial landing kick.
const LAND_DEFLECT_TIME=150
/// Milliseconds spent restoring the view after the landing kick.
const LAND_RETURN_TIME=300
/// Duration in milliseconds of camera smoothing after stepping onto a ledge.
const STEP_TIME=200
/// Duration in milliseconds of eye-height smoothing after a crouch transition.
const DUCK_TIME=100
/// Duration in milliseconds of the player-model pain twitch.
const PAIN_TWITCH_TIME=200
/// Milliseconds for which the weapon-selection HUD remains visible.
const WEAPON_SELECT_TIME=1400
/// Duration in milliseconds of the item-pickup scale animation.
const ITEM_SCALEUP_TIME=1000
/// Duration in milliseconds of the transition into or out of the zoomed view.
const ZOOM_TIME=150
/// Duration in milliseconds of the pickup-icon emphasis effect.
const ITEM_BLOB_TIME=200
/// Milliseconds for which a weapon muzzle flash remains visible.
const MUZZLE_FLASH_TIME=20
/// Duration in milliseconds over which an expiring local entity sinks away.
const SINK_TIME=1000
/// Milliseconds for which the latest attacker's head icon is displayed.
const ATTACKER_HEAD_TIME=10000
/// Milliseconds allocated to displaying one reward announcement.
const REWARD_TIME=3000
/// Maximum scale multiplier used by the HUD pulse animation.
const PULSE_SCALE=1.5
/// Largest vertical step displacement accepted by stair-step view smoothing.
const MAX_STEP_CHANGE=32
/// Capacity limit for the verts on poly collection or bounded storage used by this client module.
const MAX_VERTS_ON_POLY=10
/// Capacity limit for the mark polys collection or bounded storage used by this client module.
const MAX_MARK_POLYS=256
/// Digit-image index reserved for the minus sign in numeric HUD rendering.
const STAT_MINUS=10
/// Default square HUD icon size in virtual screen coordinates.
const ICON_SIZE=48
/// Width of a standard character in virtual screen coordinates.
const CHAR_WIDTH=32
/// Height of a standard character in virtual screen coordinates.
const CHAR_HEIGHT=48
/// Horizontal gap between text and its adjacent HUD icon.
const TEXT_ICON_SPACE=4
/// Maximum visible character count retained for one team-chat line.
const TEAMCHAT_WIDTH=80
/// Maximum number of team-chat lines retained by the overlay history.
const TEAMCHAT_HEIGHT=8
/// Width of a giant-font character in virtual screen coordinates.
const GIANT_WIDTH=32
/// Height of a giant-font character in virtual screen coordinates.
const GIANT_HEIGHT=48
/// Number of built-in crosshair images available for selection.
const NUM_CROSSHAIRS=10
/// Maximum displayed player-name width in the team overlay.
const TEAM_OVERLAY_MAXNAME_WIDTH=12
/// Maximum displayed location-name width in the team overlay.
const TEAM_OVERLAY_MAXLOCATION_WIDTH=16
/// Fallback player-model name used when no valid model is selected.
const DEFAULT_MODEL="sarge"
/// Fallback body-model name used by team-based player presentation.
const DEFAULT_TEAM_MODEL="sarge"
/// Fallback head-model name used by team-based player presentation.
const DEFAULT_TEAM_HEAD="sarge"
/// Fallback display name used for the red team.
const DEFAULT_REDTEAM_NAME="Stroggs"
/// Fallback display name used for the blue team.
const DEFAULT_BLUETEAM_NAME="Pagans"
/// Capacity limit for the custom sounds collection or bounded storage used by this client module.
const MAX_CUSTOM_SOUNDS=32
/// Capacity limit for the skulltrail collection or bounded storage used by this client module.
const MAX_SKULLTRAIL=10
/// Capacity limit for the rewardstack collection or bounded storage used by this client module.
const MAX_REWARDSTACK=10
/// Capacity limit for the soundbuffer collection or bounded storage used by this client module.
const MAX_SOUNDBUFFER=20
/// Capacity limit for the predicted events collection or bounded storage used by this client module.
const MAX_PREDICTED_EVENTS=16
/// Missionpack fallback body-model name for a team player.
const MISSIONPACK_DEFAULT_TEAM_MODEL="james"
/// Missionpack fallback head-model name for a team player.
const MISSIONPACK_DEFAULT_TEAM_HEAD="*james"

/// Player-model footstep-sound category for normal surfaces or footwear.
const FOOTSTEP_NORMAL=0
/// Player-model footstep-sound category for boot surfaces or footwear.
const FOOTSTEP_BOOT=1
/// Player-model footstep-sound category for flesh surfaces or footwear.
const FOOTSTEP_FLESH=2
/// Player-model footstep-sound category for mech surfaces or footwear.
const FOOTSTEP_MECH=3
/// Player-model footstep-sound category for energy surfaces or footwear.
const FOOTSTEP_ENERGY=4
/// Player-model footstep-sound category for metal surfaces or footwear.
const FOOTSTEP_METAL=5
/// Player-model footstep-sound category for splash surfaces or footwear.
const FOOTSTEP_SPLASH=6
/// Number of player-model footstep categories, used to size the footstep-sound table.
const FOOTSTEP_TOTAL=7
/// Weapon-impact sound category selecting default surface feedback.
const IMPACTSOUND_DEFAULT=0
/// Weapon-impact sound category selecting metal surface feedback.
const IMPACTSOUND_METAL=1
/// Weapon-impact sound category selecting flesh surface feedback.
const IMPACTSOUND_FLESH=2
/// Local-effect entity kind selecting a persistent impact decal.
const LE_MARK=0
/// Local-effect entity kind selecting a model-based explosion.
const LE_EXPLOSION=1
/// Local-effect entity kind selecting a sprite-based explosion.
const LE_SPRITE_EXPLOSION=2
/// Local-effect entity kind selecting a moving fragment with collision and bounce handling.
const LE_FRAGMENT=3
/// Local-effect entity kind selecting an effect that moves, scales, and fades over its lifetime.
const LE_MOVE_SCALE_FADE=4
/// Local-effect entity kind selecting an effect that falls while scaling and fading.
const LE_FALL_SCALE_FADE=5
/// Local-effect entity kind selecting an effect that fades its RGB color components.
const LE_FADE_RGB=6
/// Local-effect entity kind selecting an effect that scales and fades in place.
const LE_SCALE_FADE=7
/// Local-effect entity kind selecting a floating score indicator.
const LE_SCOREPLUM=8
/// Local-effect entity kind selecting the Missionpack kamikaze explosion sequence.
const LE_KAMIKAZE=9
/// Local-effect entity kind selecting an impact against the invulnerability shield.
const LE_INVULIMPACT=10
/// Local-effect entity kind selecting the invulnerability elimination effect.
const LE_INVULJUICED=11
/// Local-effect entity kind selecting a renderer entity displayed without another local-effect update
/// mode.
const LE_SHOWREFENTITY=12
/// Local-effect flag controlling the puff dont scale behavior of the temporary entity.
const LEF_PUFF_DONT_SCALE=1
/// Local-effect flag controlling the tumble behavior of the temporary entity.
const LEF_TUMBLE=2
/// Local-effect flag controlling the sound1 behavior of the temporary entity.
const LEF_SOUND1=4
/// Local-effect flag controlling the sound2 behavior of the temporary entity.
const LEF_SOUND2=8
/// Local-fragment impact-decal kind selecting none marks.
const LEMT_NONE=0
/// Local-fragment impact-decal kind selecting burn marks.
const LEMT_BURN=1
/// Local-fragment impact-decal kind selecting blood marks.
const LEMT_BLOOD=2
/// Local-fragment bounce-sound kind selecting none impact feedback.
const LEBS_NONE=0
/// Local-fragment bounce-sound kind selecting blood impact feedback.
const LEBS_BLOOD=1
/// Local-fragment bounce-sound kind selecting brass impact feedback.
const LEBS_BRASS=2
/// Print destination selecting a system-message presentation.
const SYSTEM_PRINT=0
/// Print destination selecting the ordinary chat-message presentation.
const CHAT_PRINT=1
/// Print destination selecting the team-chat presentation.
const TEAMCHAT_PRINT=2

/// Stores client game local lerp frame record, including `oldFrame`, `oldFrameTime`, `frame`, `frameTime`, `backlerp`, `yawAngle` and additional values.
struct LerpFrame
  /// Previous animation frame used as the interpolation starting point.
  oldFrame
  /// Client time in milliseconds at which the previous animation frame was exact.
  oldFrameTime
  /// Current player-model animation frame being approached by interpolation from oldFrame.
  frame
  /// Client presentation timestamp in milliseconds at which interpolation reaches the current model
  /// frame.
  frameTime
  /// Previous-frame weight used to interpolate the tracked animation presented by the original CGame
  /// compatibility records.
  backlerp
  /// Smoothed yaw angle used to orient the animated body part.
  yawAngle
  /// True while the body part is turning toward its target yaw.
  yawing
  /// Smoothed pitch angle used to orient the animated body part.
  pitchAngle
  /// True while the body part is turning toward its target pitch.
  pitching
  /// Selected animation identifier, including the animation-toggle bit when present.
  animationNumber
  /// Animation description supplying frame ranges and playback timing.
  animation
  /// Client time in milliseconds at which the first frame of the animation becomes exact.
  animationTime
end struct
/// Stores client game local player entity record, including `legs`, `torso`, `flag`, `painTime`, `painDirection`, `lightningFiring` and additional values.
struct PlayerEntity
  /// Animation and interpolation state for the player's legs.
  legs
  /// Animation and interpolation state for the player's torso.
  torso
  /// Animation and interpolation state for the flag carried by the player model.
  flag
  /// Client timestamp of the last pain reaction, used to animate the flinch.
  painTime
  /// Alternating direction selector used for the player's pain animation.
  painDirection
  /// True while the player is continuously firing the lightning gun.
  lightningFiring
  /// World-space endpoint of the last railgun impact used by the weapon effect.
  railgunImpact
  /// True while the railgun's muzzle-flash effect should be emitted.
  railgunFlash
  /// Current rotational angle of the spinning weapon barrel.
  barrelAngle
  /// Client timestamp used to advance or stop weapon-barrel rotation.
  barrelTime
  /// True while the weapon barrel is in its spinning state.
  barrelSpinning
end struct
/// Stores client game local c entity record, including `currentState`, `nextState`, `interpolate`, `currentValid`, `muzzleFlashTime`, `previousEvent` and additional values.
struct CEntity
  /// Entity state received in the current server snapshot.
  currentState
  /// Entity state from the following snapshot, used when interpolation is available.
  nextState
  /// True when a valid following snapshot permits interpolation of this entity.
  interpolate
  /// True when the current snapshot contains a valid state for this entity.
  currentValid
  /// Client timestamp at which the entity's muzzle-flash effect began.
  muzzleFlashTime
  /// Last processed entity event, retained to avoid replaying the same event.
  previousEvent
  /// Teleport-state bit retained to detect discontinuities that must not be interpolated.
  teleportFlag
  /// Last trail-emission time, allowing missile trails to catch up across dropped packets.
  trailTime
  /// Last time a running player's ground-contact dust effect was emitted.
  dustTrailTime
  /// Compatibility member corresponding to native `centity_t.miscTime`; the original declaration is
  /// `int miscTime`.
  miscTime
  /// Timestamp of the most recent snapshot containing this entity.
  snapShotTime
  /// Compatibility member corresponding to native `centity_t.pe`; the original declaration is
  /// `playerEntity_t pe`.
  pe
  /// Timestamp from which prediction-error smoothing decays.
  errorTime
  /// Positional correction retained for smoothing a prediction error.
  errorOrigin
  /// Angular correction retained for smoothing a prediction error.
  errorAngles
  /// True when the entity's transform was extrapolated rather than interpolated.
  extrapolated
  /// Unsmoothened entity position before prediction-error correction.
  rawOrigin
  /// Unsmoothened entity orientation before prediction-error correction.
  rawAngles
  /// World-space endpoint used when rendering the entity's beam.
  beamEnd
  /// Entity position after snapshot interpolation and smoothing.
  lerpOrigin
  /// Entity orientation after snapshot interpolation and smoothing.
  lerpAngles
end struct
/// Stores client game local mark poly record, including `prevMark`, `nextMark`, `time`, `markShader`, `alphaFade`, `color` and additional values.
struct MarkPoly
  /// Previous mark polygon in the active or free linked list.
  prevMark
  /// Next mark polygon in the active or free linked list.
  nextMark
  /// Client timestamp used as the creation or update reference for this temporary visual effect.
  time
  /// Shader used to draw the surface-impact decal.
  markShader
  /// True when the mark fades its alpha channel instead of its RGB components.
  alphaFade
  /// RGBA base color retained by the native-compatible persistent mark polygon.
  color
  /// Polygon description or associated polygon storage used by the mark.
  poly
  /// Vertex records forming the polygon or rendered geometry.
  verts
end struct
/// Stores client game local local entity record, including `prev`, `next`, `leType`, `leFlags`, `startTime`, `endTime` and additional values.
struct LocalEntity
  /// Compatibility member corresponding to native `localEntity_t.prev`; the original declaration is
  /// `struct localEntity_s *prev, *next`.
  prev
  /// Compatibility member corresponding to native `localEntity_t.next`; the original declaration is
  /// `struct localEntity_s *prev, *next`.
  next
  /// Local-effect entity kind selecting its update and rendering behavior.
  leType
  /// Local-effect flags controlling fading, scaling, tumbling, or sound behavior.
  leFlags
  /// Compatibility member corresponding to native `localEntity_t.startTime`; the original declaration
  /// is `int startTime`.
  startTime
  /// Compatibility member corresponding to native `localEntity_t.endTime`; the original declaration is
  /// `int endTime`.
  endTime
  /// Compatibility member corresponding to native `localEntity_t.fadeInTime`; the original declaration
  /// is `int fadeInTime`.
  fadeInTime
  /// Reciprocal effect lifetime used to normalize the fade or growth fraction.
  lifeRate
  /// Compatibility member corresponding to native `localEntity_t.pos`; the original declaration is
  /// `trajectory_t pos`.
  pos
  /// Euler orientation used to place or animate the object.
  angles
  /// Velocity multiplier after an impact; zero stops the fragment and one preserves its speed.
  bounceFactor
  /// RGBA base color retained by the native-compatible temporary local effect.
  color
  /// Base radius retained by the native-compatible local-effect record for sprite scaling.
  radius
  /// Dynamic-light intensity emitted by the local effect.
  light
  /// RGB components of the dynamic light emitted by the effect.
  lightColor
  /// Decal category to leave when an effect fragment strikes a surface.
  leMarkType
  /// Impact-sound category used when an effect fragment bounces.
  leBounceSoundType
  /// Renderer-facing entity description submitted for this local effect.
  refEntity
end struct
/// Stores client game local score record, including `client`, `score`, `ping`, `time`, `scoreFlags`, `powerUps` and additional values.
struct Score
  /// Player slot associated with this score or client-side record.
  client
  /// Player score stored in the shared client-game score-list entry.
  score
  /// Player ping value in the shared client-game scoreboard record, in milliseconds.
  ping
  /// Elapsed player connection time reported by the server for scoreboard presentation.
  time
  /// Flags supplied with the server's scoreboard entry.
  scoreFlags
  /// Powerup bitset supplied with the scoreboard entry.
  powerUps
  /// Percentage of successful weapon hits reported in the scoreboard data.
  accuracy
  /// Number of impressive awards reported for this player.
  impressiveCount
  /// Number of excellent awards reported for this player.
  excellentCount
  /// Number of gauntlet awards reported for this player; spelling follows the native record.
  guantletCount
  /// Number of defense awards reported for this player.
  defendCount
  /// Number of assist awards reported for this player.
  assistCount
  /// Number of flag captures credited to this player.
  captures
  /// True or nonzero when the player's result qualifies as a perfect game.
  perfect
  /// Team identifier retained in the native-compatible scoreboard entry.
  team
end struct
/// Stores client game local client info record, including `infoValid`, `name`, `team`, `botSkill`, `color1`, `color2` and additional values.
struct ClientInfo
  /// True when the client-information entry has been populated from valid server data.
  infoValid
  /// Player display name received from the server's client-information string.
  name
  /// Team affiliation retained in the native-compatible client presentation record.
  team
  /// Bot difficulty level; zero denotes a human player and native bot levels range from one to five.
  botSkill
  /// Primary player color used for team and weapon-effect presentation.
  color1
  /// Secondary player color used for team and weapon-effect presentation.
  color2
  /// Latest player score retained in the shared client-information structure.
  score
  /// Team-location index reported for this player.
  location
  /// Native-compatible client-info health value retained for the team overlay.
  health
  /// Native-compatible client-info armor value retained for team-overlay rendering.
  armor
  /// Currently selected weapon identifier for the client-information entry.
  curWeapon
  /// Player handicap setting used by the user-info and team-display paths.
  handicap
  /// Tournament victories reported for this player.
  wins
  /// Tournament losses reported for this player.
  losses
  /// Team-order role identifying the player's current tactical assignment.
  teamTask
  /// True when this client is the designated leader of its team.
  teamLeader
  /// Player powerup bitmask cached in the shared client-information structure.
  powerups
  /// Compatibility member corresponding to native `clientInfo_t.medkitUsageTime`; the original
  /// declaration is `int medkitUsageTime`.
  medkitUsageTime
  /// Compatibility member corresponding to native `clientInfo_t.invulnerabilityStartTime`; the original
  /// declaration is `int invulnerabilityStartTime`.
  invulnerabilityStartTime
  /// Compatibility member corresponding to native `clientInfo_t.invulnerabilityStopTime`; the original
  /// declaration is `int invulnerabilityStopTime`.
  invulnerabilityStopTime
  /// Compatibility member corresponding to native `clientInfo_t.breathPuffTime`; the original
  /// declaration is `int breathPuffTime`.
  breathPuffTime
  /// Virtual model name selected for the player or preview model.
  modelName
  /// Skin name selected for the player's body model.
  skinName
  /// Virtual model name selected for the player's head.
  headModelName
  /// Skin name selected for the player's head model.
  headSkinName
  /// Red-team model or identity name used by the player's media selection.
  redTeam
  /// Blue-team model or identity name used by the player's media selection.
  blueTeam
  /// True while the player's full media registration is deferred to a later load step.
  deferred
  /// True when the player model uses the Missionpack animation set.
  newAnims
  /// True when the model requires leg yaw to remain aligned with torso yaw.
  fixedlegs
  /// True when the model requires the torso to keep a fixed yaw.
  fixedtorso
  /// Offset applied to position the head model in icon or preview views.
  headOffset
  /// Footstep-sound category selected by the player model.
  footsteps
  /// Model gender used when selecting gender-specific player sounds.
  gender
  /// Model resource selected for the legs presentation.
  legsModel
  /// Skin resource applied to the legs model presentation.
  legsSkin
  /// Model resource selected for the torso presentation.
  torsoModel
  /// Skin resource applied to the torso model presentation.
  torsoSkin
  /// Head-model resource used when drawing a player, head icon, or preview.
  headModel
  /// Skin resource applied to the player's head model.
  headSkin
  /// Image or shader resource used to draw the model icon.
  modelIcon
  /// Animation descriptions indexed by the native player-animation identifiers.
  animations
  /// Registered sound resources associated with the player model or media group.
  sounds
end struct
/// Stores client game local weapon info record, including `registered`, `item`, `handsModel`, `weaponModel`, `barrelModel`, `flashModel` and additional values.
struct WeaponInfo
  /// True once the referenced media resources have been registered with the engine.
  registered
  /// Compatibility member corresponding to native `weaponInfo_t.item`; the original declaration is
  /// `gitem_t *item`.
  item
  /// Weapon-hand model used to position the first-person weapon, even when the hands are not drawn.
  handsModel
  /// Model resource selected for the weapon presentation.
  weaponModel
  /// Model resource selected for the barrel presentation.
  barrelModel
  /// Model resource selected for the flash presentation.
  flashModel
  /// Model-space center used to rotate the weapon preview around its visual midpoint.
  weaponMidpoint
  /// Intensity of the weapon's muzzle-flash dynamic light.
  flashDlight
  /// RGB components of the weapon's muzzle-flash dynamic light.
  flashDlightColor
  /// Alternative firing sounds selected when the weapon produces a muzzle flash.
  flashSound
  /// Shader or image resource used to display the weapon in the HUD.
  weaponIcon
  /// Shader or image resource used to display this weapon's ammunition.
  ammoIcon
  /// Model resource selected for the ammo presentation.
  ammoModel
  /// Model resource selected for the missile presentation.
  missileModel
  /// Sound resource selected for the missile event or effect.
  missileSound
  /// Callback used to emit the projectile's continuous trail effect.
  missileTrailFunc
  /// Intensity of the dynamic light attached to the projectile.
  missileDlight
  /// RGB components of the dynamic light attached to the projectile.
  missileDlightColor
  /// Renderer flags applied to the projectile model.
  missileRenderfx
  /// Callback used to emit an ejected shell casing when the weapon fires.
  ejectBrassFunc
  /// Radius used when emitting this weapon's projectile trail.
  trailRadius
  /// Lifetime or cadence parameter supplied to the weapon's projectile-trail implementation.
  wiTrailTime
  /// Sound resource selected for the ready event or effect.
  readySound
  /// Sound resource selected for the firing event or effect.
  firingSound
  /// True when the weapon's firing sound is sustained as a looping sound.
  loopFireSound
end struct
/// Stores client game local item info record, including `registered`, `models`, `icon`.
struct ItemInfo
  /// True once the referenced media resources have been registered with the engine.
  registered
  /// Renderer resource handles used for models; mirrors native `itemInfo_t.models`.
  models
  /// Renderer resource handle used for icon; mirrors native `itemInfo_t.icon`.
  icon
end struct
/// Stores client game local powerup info record, including `itemNum`.
struct PowerupInfo
  /// Compatibility member corresponding to native `powerupInfo_t.itemNum`; the original declaration is
  /// `int itemNum`.
  itemNum
end struct
/// Stores client game local skull trail record, including `positions`, `numpositions`.
struct SkullTrail
  /// Ordered positions used to build the stored trail or spatial history.
  positions
  /// Number of stored points currently participating in the skull trail.
  numpositions
end struct
/// Stores client game local cg state record, including `clientFrame`, `clientNum`, `demoPlayback`, `levelShot`, `deferredPlayerLoading`, `loading` and additional values.
struct CgState
  /// Client-frame counter incremented for each CGame frame.
  clientFrame
  /// Local client slot retained by the shared client-game runtime record.
  clientNum
  /// True when snapshots and commands are being read from a recorded demo.
  demoPlayback
  /// True while producing the menu screenshot for the current level.
  levelShot
  /// True while player media is scheduled for deferred registration.
  deferredPlayerLoading
  /// True while initial game media and client information are being loaded.
  loading
  /// True after intermission begins, suppressing gameplay-only presentation such as voice rewards.
  intermissionStarted
  /// Sequence number of the latest snapshot received from the engine.
  latestSnapshotNum
  /// Server timestamp associated with the latest received snapshot.
  latestSnapshotTime
  /// Current snapshot used as the lower endpoint of client interpolation.
  snap
  /// Following snapshot used as the upper endpoint of client interpolation, when available.
  nextSnap
  /// Storage for the snapshots that currently bracket the client interpolation time.
  activeSnapshots
  /// Fraction between the current and following snapshot times used for interpolation.
  frameInterpolation
  /// True when the current snapshot transition represents a teleport.
  thisFrameTeleport
  /// True when the following snapshot transition must bypass interpolation.
  nextFrameTeleport
  /// Elapsed client time in milliseconds since the preceding frame.
  frametime
  /// Current client-game presentation timestamp in milliseconds in the shared runtime record.
  time
  /// Client time of the preceding frame, retained for integration and effect updates.
  oldTime
  /// Snapshot time selected as the basis for player-state prediction.
  physicsTime
  /// Bitset recording which time-limit warning thresholds have already been announced.
  timelimitWarnings
  /// Bitset recording which frag-limit warning thresholds have already been announced.
  fraglimitWarnings
  /// True after a map restart, causing presentation and prediction state to be reinitialized.
  mapRestart
  /// True while the camera uses a third-person, chase, or death view.
  renderingThirdPerson
  /// True when prediction has entered a teleport trigger requiring the hyperspace view effect.
  hyperspace
  /// Player state produced locally by command prediction between server snapshots.
  predictedPlayerState
  /// Client entity populated from the locally predicted player state.
  predictedPlayerEntity
  /// True after a valid predicted player state has been produced.
  validPPS
  /// Timestamp from which the stored player-prediction error is smoothed away.
  predictedErrorTime
  /// Positional discrepancy between predicted and authoritative player state.
  predictedError
  /// Next sequence number in the predicted or entity event stream.
  eventSequence
  /// Ring of events generated by local player prediction.
  predictableEvents
  /// Vertical step displacement being smoothed by the first-person camera.
  stepChange
  /// Client timestamp at which stair-step smoothing began.
  stepTime
  /// Eye-height displacement being smoothed after a crouch transition.
  duckChange
  /// Client timestamp at which crouch-height smoothing began.
  duckTime
  /// Eye-height displacement used for the landing camera kick.
  landChange
  /// Client timestamp at which the landing camera kick began.
  landTime
  /// Weapon identifier currently selected by the local player.
  weaponSelect
  /// Automatic rotation angles used to animate pickups and similar world items.
  autoAngles
  /// Orientation basis derived from the normal-speed automatic item rotation.
  autoAxis
  /// Automatic rotation angles for effects that rotate faster than ordinary items.
  autoAnglesFast
  /// Orientation basis derived from the faster automatic item rotation.
  autoAxisFast
  /// Renderer view definition for the current frame.
  refdef
  /// Euler camera orientation associated with the current view definition.
  refdefViewAngles
  /// True while the local player requests the zoomed view.
  zoomed
  /// Timestamp used to interpolate the transition into or out of zoom.
  zoomTime
  /// Mouse-sensitivity multiplier derived from the current zoom field of view.
  zoomSensitivity
  /// Status text displayed while connecting, loading, or waiting for a game view.
  infoScreenText
  /// Timestamp of the most recent request for updated server scores.
  scoresRequestTime
  /// Number of valid scoreboard entries received from the server.
  numScores
  /// Index of the scoreboard entry currently selected in the UI.
  selectedScore
  /// Current score totals indexed by the two competing teams.
  teamScores
  /// Scoreboard entries received from the server.
  scores
  /// True while the player explicitly requests the scoreboard overlay.
  showScores
  /// True while the scoreboard is actually being rendered.
  scoreBoardShowing
  /// Timestamp used to fade the scoreboard after its display request ends.
  scoreFadeTime
  /// Display name of the player responsible for the local player's latest death.
  killerName
  /// Concatenated spectator display names used by the scrolling scoreboard banner.
  spectatorList
  /// Number of characters in the concatenated spectator-name banner.
  spectatorLen
  /// Rendered width of the spectator-name banner in display coordinates.
  spectatorWidth
  /// Next client timestamp at which the spectator banner should scroll.
  spectatorTime
  /// Horizontal draw position of the first copy of the scrolling spectator banner.
  spectatorPaintX
  /// Horizontal draw position of the second copy used to wrap the spectator banner.
  spectatorPaintX2
  /// Character offset into the scrolling spectator-name text.
  spectatorOffset
  /// Character count or offset used while painting the spectator-name banner.
  spectatorPaintLen
  /// Per-client history of carried Harvester skull positions used to render trails.
  skulltrails
  /// Client timestamp at which the current centered announcement began.
  centerPrintTime
  /// Character width selected for the centered announcement.
  centerPrintCharWidth
  /// Vertical display position of the centered announcement.
  centerPrintY
  /// Text of the current centered announcement.
  centerPrint
  /// Number of lines in the centered announcement.
  centerPrintLines
  /// Ammunition-warning state: one means low ammunition and two means empty.
  lowAmmoWarning
  /// Timestamp of the latest kill, used to detect closely spaced award events.
  lastKillTime
  /// Client slot most recently identified under the crosshair.
  crosshairClientNum
  /// Timestamp of the last valid crosshair-player identification.
  crosshairClientTime
  /// Powerup identifier currently emphasized by the HUD flash animation.
  powerupActive
  /// Timestamp at which the active powerup's HUD emphasis began.
  powerupTime
  /// Timestamp used to time the latest attacker's HUD indication.
  attackerTime
  /// Timestamp used to schedule the current voice announcement or portrait.
  voiceTime
  /// Number or top position of queued reward announcements awaiting presentation.
  rewardStack
  /// Timestamp used to schedule the current reward announcement.
  rewardTime
  /// Award count associated with each queued reward announcement.
  rewardCount
  /// HUD shader associated with each queued reward announcement.
  rewardShader
  /// Sound resource associated with each queued reward announcement.
  rewardSound
  /// Write position in the queued-announcement sound ring.
  soundBufferIn
  /// Read position in the queued-announcement sound ring.
  soundBufferOut
  /// Next time at which a queued announcement sound may be played.
  soundTime
  /// Ring buffer of announcement sounds waiting to be played.
  soundBuffer
  /// Next time at which a buffered voice-chat announcement may be played.
  voiceChatTime
  /// Write position in the buffered voice-chat announcement ring.
  voiceChatBufferIn
  /// Read position in the buffered voice-chat announcement ring.
  voiceChatBufferOut
  /// Warmup deadline or state supplied by the server's warmup configuration.
  warmup
  /// Last warmup countdown value announced to the player.
  warmupCount
  /// Item identifier shown by the most recent pickup notification.
  itemPickup
  /// Timestamp at which the most recent item-pickup notification began.
  itemPickupTime
  /// Independent timestamp for the pickup pulse around the crosshair.
  itemPickupBlendTime
  /// Timestamp at which the weapon-selection display was last refreshed.
  weaponSelectTime
  /// First-person weapon animation identifier currently being displayed.
  weaponAnimation
  /// Timestamp at which the current first-person weapon animation began.
  weaponAnimationTime
  /// Timestamp used to fade the latest damage overlay or view-kick effect.
  damageTime
  /// Horizontal direction component of the latest damage indicator.
  damageX
  /// Vertical direction component of the latest damage indicator.
  damageY
  /// Magnitude of the latest damage event used to scale view kick and indicators.
  damageValue
  /// Yaw angle used to animate the status-bar head model.
  headYaw
  /// Target pitch angle at the end of the status-head animation segment.
  headEndPitch
  /// Target yaw angle at the end of the status-head animation segment.
  headEndYaw
  /// Ending timestamp of the current status-head animation segment.
  headEndTime
  /// Starting pitch angle of the status-head animation segment.
  headStartPitch
  /// Starting yaw angle of the status-head animation segment.
  headStartYaw
  /// Starting timestamp of the current status-head animation segment.
  headStartTime
  /// Expiration or reference timestamp used by damage-induced view movement.
  v_dmg_time
  /// Pitch displacement contributed by the damage-induced view kick.
  v_dmg_pitch
  /// Roll displacement contributed by the damage-induced view kick.
  v_dmg_roll
  /// Angular displacement contributed by weapon recoil or view kick.
  kick_angles
  /// Positional displacement contributed by weapon recoil or view kick.
  kick_origin
  /// Sinusoidal phase value used for movement-driven camera or weapon bob.
  bobfracsin
  /// Movement-bob cycle index carried by the predicted player state.
  bobcycle
  /// Horizontal player speed used to scale movement bob and related view effects.
  xyspeed
  /// Next timestamp at which the automatic camera orbit advances.
  nextOrbitTime
  /// Renderer entity used to preview the developer's test model.
  testModelEntity
  /// Virtual asset name of the model selected by the test-model console commands.
  testModelName
  /// True when the developer test model is positioned as a first-person weapon.
  testGun
end struct
/// Stores client game local cg media record, including `charsetShader`, `charsetProp`, `charsetPropGlow`, `charsetPropB`, `whiteShader`, `redCubeModel` and additional values.
struct CgMedia
  /// Shader resource selected for charset rendering.
  charsetShader
  /// Renderer resource handle used for charset prop; mirrors native `cgMedia_t.charsetProp`.
  charsetProp
  /// Renderer resource handle used for charset prop glow; mirrors native `cgMedia_t.charsetPropGlow`.
  charsetPropGlow
  /// Renderer resource handle used for charset prop b; mirrors native `cgMedia_t.charsetPropB`.
  charsetPropB
  /// Shader resource selected for white rendering.
  whiteShader
  /// Model resource selected for the red cube presentation.
  redCubeModel
  /// Model resource selected for the blue cube presentation.
  blueCubeModel
  /// Image or shader resource used to draw the red cube icon.
  redCubeIcon
  /// Image or shader resource used to draw the blue cube icon.
  blueCubeIcon
  /// Model resource selected for the red flag presentation.
  redFlagModel
  /// Model resource selected for the blue flag presentation.
  blueFlagModel
  /// Model resource selected for the neutral flag presentation.
  neutralFlagModel
  /// Shader resource selected for red flag rendering.
  redFlagShader
  /// Shader resource selected for blue flag rendering.
  blueFlagShader
  /// Shader resource selected for flag rendering.
  flagShader
  /// Model resource selected for the flag pole presentation.
  flagPoleModel
  /// Model resource selected for the flag flap presentation.
  flagFlapModel
  /// Skin resource applied to the red flag flap model presentation.
  redFlagFlapSkin
  /// Skin resource applied to the blue flag flap model presentation.
  blueFlagFlapSkin
  /// Skin resource applied to the neutral flag flap model presentation.
  neutralFlagFlapSkin
  /// Model resource selected for the red flag base presentation.
  redFlagBaseModel
  /// Model resource selected for the blue flag base presentation.
  blueFlagBaseModel
  /// Model resource selected for the neutral flag base presentation.
  neutralFlagBaseModel
  /// Model resource selected for the overload base presentation.
  overloadBaseModel
  /// Model resource selected for the overload target presentation.
  overloadTargetModel
  /// Model resource selected for the overload lights presentation.
  overloadLightsModel
  /// Model resource selected for the overload energy presentation.
  overloadEnergyModel
  /// Model resource selected for the harvester presentation.
  harvesterModel
  /// Skin resource applied to the harvester red model presentation.
  harvesterRedSkin
  /// Skin resource applied to the harvester blue model presentation.
  harvesterBlueSkin
  /// Model resource selected for the harvester neutral presentation.
  harvesterNeutralModel
  /// Model resource selected for the armor presentation.
  armorModel
  /// Image or shader resource used to draw the armor icon.
  armorIcon
  /// Renderer resource handle used for team status bar; mirrors native `cgMedia_t.teamStatusBar`.
  teamStatusBar
  /// Shader resource selected for defer rendering.
  deferShader
  /// Renderer resource handle used for gib abdomen; mirrors native `cgMedia_t.gibAbdomen`.
  gibAbdomen
  /// Renderer resource handle used for gib arm; mirrors native `cgMedia_t.gibArm`.
  gibArm
  /// Renderer resource handle used for gib chest; mirrors native `cgMedia_t.gibChest`.
  gibChest
  /// Renderer resource handle used for gib fist; mirrors native `cgMedia_t.gibFist`.
  gibFist
  /// Renderer resource handle used for gib foot; mirrors native `cgMedia_t.gibFoot`.
  gibFoot
  /// Renderer resource handle used for gib forearm; mirrors native `cgMedia_t.gibForearm`.
  gibForearm
  /// Renderer resource handle used for gib intestine; mirrors native `cgMedia_t.gibIntestine`.
  gibIntestine
  /// Renderer resource handle used for gib leg; mirrors native `cgMedia_t.gibLeg`.
  gibLeg
  /// Renderer resource handle used for gib skull; mirrors native `cgMedia_t.gibSkull`.
  gibSkull
  /// Renderer resource handle used for gib brain; mirrors native `cgMedia_t.gibBrain`.
  gibBrain
  /// Renderer resource handle used for smoke2; mirrors native `cgMedia_t.smoke2`.
  smoke2
  /// Model resource selected for the machinegun brass presentation.
  machinegunBrassModel
  /// Model resource selected for the shotgun brass presentation.
  shotgunBrassModel
  /// Shader resource selected for rail rings rendering.
  railRingsShader
  /// Shader resource selected for rail core rendering.
  railCoreShader
  /// Shader resource selected for lightning rendering.
  lightningShader
  /// Shader resource selected for friend rendering.
  friendShader
  /// Shader resource selected for balloon rendering.
  balloonShader
  /// Shader resource selected for connection rendering.
  connectionShader
  /// Shader resource selected for select rendering.
  selectShader
  /// Shader resource selected for view blood rendering.
  viewBloodShader
  /// Shader resource selected for tracer rendering.
  tracerShader
  /// Shader resource selected for crosshair rendering.
  crosshairShader
  /// Shader resource selected for lagometer rendering.
  lagometerShader
  /// Shader resource selected for back tile rendering.
  backTileShader
  /// Shader resource selected for noammo rendering.
  noammoShader
  /// Shader resource selected for smoke puff rendering.
  smokePuffShader
  /// Shader resource selected for smoke puff rage pro rendering.
  smokePuffRageProShader
  /// Shader resource selected for shotgun smoke puff rendering.
  shotgunSmokePuffShader
  /// Shader resource selected for plasma ball rendering.
  plasmaBallShader
  /// Shader resource selected for water bubble rendering.
  waterBubbleShader
  /// Shader resource selected for blood trail rendering.
  bloodTrailShader
  /// Shader resource selected for nail puff rendering.
  nailPuffShader
  /// Renderer resource handle used for blue prox mine; mirrors native `cgMedia_t.blueProxMine`.
  blueProxMine
  /// Shader resources selected for number rendering.
  numberShaders
  /// Shader resource selected for shadow mark rendering.
  shadowMarkShader
  /// Shader resources selected for bot skill rendering.
  botSkillShaders
  /// Shader resource selected for wake mark rendering.
  wakeMarkShader
  /// Shader resource selected for blood mark rendering.
  bloodMarkShader
  /// Shader resource selected for bullet mark rendering.
  bulletMarkShader
  /// Shader resource selected for burn mark rendering.
  burnMarkShader
  /// Shader resource selected for hole mark rendering.
  holeMarkShader
  /// Shader resource selected for energy mark rendering.
  energyMarkShader
  /// Shader resource selected for quad rendering.
  quadShader
  /// Shader resource selected for red quad rendering.
  redQuadShader
  /// Shader resource selected for quad weapon rendering.
  quadWeaponShader
  /// Shader resource selected for invis rendering.
  invisShader
  /// Shader resource selected for regen rendering.
  regenShader
  /// Shader resource selected for battle suit rendering.
  battleSuitShader
  /// Shader resource selected for battle weapon rendering.
  battleWeaponShader
  /// Shader resource selected for haste puff rendering.
  hastePuffShader
  /// Shader resource selected for red kamikaze rendering.
  redKamikazeShader
  /// Shader resource selected for blue kamikaze rendering.
  blueKamikazeShader
  /// Model resource selected for the bullet flash presentation.
  bulletFlashModel
  /// Model resource selected for the ring flash presentation.
  ringFlashModel
  /// Model resource selected for the dish flash presentation.
  dishFlashModel
  /// Model resource selected for the lightning explosion presentation.
  lightningExplosionModel
  /// Shader resource selected for rail explosion rendering.
  railExplosionShader
  /// Shader resource selected for plasma explosion rendering.
  plasmaExplosionShader
  /// Shader resource selected for bullet explosion rendering.
  bulletExplosionShader
  /// Shader resource selected for rocket explosion rendering.
  rocketExplosionShader
  /// Shader resource selected for grenade explosion rendering.
  grenadeExplosionShader
  /// Shader resource selected for bfg explosion rendering.
  bfgExplosionShader
  /// Shader resource selected for blood explosion rendering.
  bloodExplosionShader
  /// Model resource selected for the teleport effect presentation.
  teleportEffectModel
  /// Shader resource selected for teleport effect rendering.
  teleportEffectShader
  /// Model resource selected for the kamikaze effect presentation.
  kamikazeEffectModel
  /// Renderer resource handle used for kamikaze shock wave; mirrors native
  /// `cgMedia_t.kamikazeShockWave`.
  kamikazeShockWave
  /// Model resource selected for the kamikaze head presentation.
  kamikazeHeadModel
  /// Renderer resource handle used for kamikaze head trail; mirrors native
  /// `cgMedia_t.kamikazeHeadTrail`.
  kamikazeHeadTrail
  /// Model resource selected for the guard powerup presentation.
  guardPowerupModel
  /// Model resource selected for the scout powerup presentation.
  scoutPowerupModel
  /// Model resource selected for the doubler powerup presentation.
  doublerPowerupModel
  /// Model resource selected for the ammo regen powerup presentation.
  ammoRegenPowerupModel
  /// Model resource selected for the invulnerability impact presentation.
  invulnerabilityImpactModel
  /// Model resource selected for the invulnerability juiced presentation.
  invulnerabilityJuicedModel
  /// Model resource selected for the medkit usage presentation.
  medkitUsageModel
  /// Shader resource selected for dust puff rendering.
  dustPuffShader
  /// Shader resource selected for heart rendering.
  heartShader
  /// Model resource selected for the invulnerability powerup presentation.
  invulnerabilityPowerupModel
  /// Renderer resource handle used for scoreboard name; mirrors native `cgMedia_t.scoreboardName`.
  scoreboardName
  /// Renderer resource handle used for scoreboard ping; mirrors native `cgMedia_t.scoreboardPing`.
  scoreboardPing
  /// Renderer resource handle used for scoreboard score; mirrors native `cgMedia_t.scoreboardScore`.
  scoreboardScore
  /// Renderer resource handle used for scoreboard time; mirrors native `cgMedia_t.scoreboardTime`.
  scoreboardTime
  /// Renderer resource handle used for medal impressive; mirrors native `cgMedia_t.medalImpressive`.
  medalImpressive
  /// Renderer resource handle used for medal excellent; mirrors native `cgMedia_t.medalExcellent`.
  medalExcellent
  /// Renderer resource handle used for medal gauntlet; mirrors native `cgMedia_t.medalGauntlet`.
  medalGauntlet
  /// Renderer resource handle used for medal defend; mirrors native `cgMedia_t.medalDefend`.
  medalDefend
  /// Renderer resource handle used for medal assist; mirrors native `cgMedia_t.medalAssist`.
  medalAssist
  /// Renderer resource handle used for medal capture; mirrors native `cgMedia_t.medalCapture`.
  medalCapture
  /// Sound resource selected for the quad event or effect.
  quadSound
  /// Sound resource selected for the tracer event or effect.
  tracerSound
  /// Sound resource selected for the select event or effect.
  selectSound
  /// Sound resource selected for the use nothing event or effect.
  useNothingSound
  /// Sound resource selected for the wear off event or effect.
  wearOffSound
  /// Footstep-sound category selected by the player model.
  footsteps
  /// Registered sound handle used for sfx lghit1; mirrors native `cgMedia_t.sfx_lghit1`.
  sfx_lghit1
  /// Registered sound handle used for sfx lghit2; mirrors native `cgMedia_t.sfx_lghit2`.
  sfx_lghit2
  /// Registered sound handle used for sfx lghit3; mirrors native `cgMedia_t.sfx_lghit3`.
  sfx_lghit3
  /// Registered sound handle used for sfx ric1; mirrors native `cgMedia_t.sfx_ric1`.
  sfx_ric1
  /// Registered sound handle used for sfx ric2; mirrors native `cgMedia_t.sfx_ric2`.
  sfx_ric2
  /// Registered sound handle used for sfx ric3; mirrors native `cgMedia_t.sfx_ric3`.
  sfx_ric3
  /// Registered sound handle used for sfx railg; mirrors native `cgMedia_t.sfx_railg`.
  sfx_railg
  /// Registered sound handle used for sfx rockexp; mirrors native `cgMedia_t.sfx_rockexp`.
  sfx_rockexp
  /// Registered sound handle used for sfx plasmaexp; mirrors native `cgMedia_t.sfx_plasmaexp`.
  sfx_plasmaexp
  /// Registered sound handle used for sfx proxexp; mirrors native `cgMedia_t.sfx_proxexp`.
  sfx_proxexp
  /// Registered sound handle used for sfx nghit; mirrors native `cgMedia_t.sfx_nghit`.
  sfx_nghit
  /// Registered sound handle used for sfx nghitflesh; mirrors native `cgMedia_t.sfx_nghitflesh`.
  sfx_nghitflesh
  /// Registered sound handle used for sfx nghitmetal; mirrors native `cgMedia_t.sfx_nghitmetal`.
  sfx_nghitmetal
  /// Registered sound handle used for sfx chghit; mirrors native `cgMedia_t.sfx_chghit`.
  sfx_chghit
  /// Registered sound handle used for sfx chghitflesh; mirrors native `cgMedia_t.sfx_chghitflesh`.
  sfx_chghitflesh
  /// Registered sound handle used for sfx chghitmetal; mirrors native `cgMedia_t.sfx_chghitmetal`.
  sfx_chghitmetal
  /// Sound resource selected for the kamikaze explode event or effect.
  kamikazeExplodeSound
  /// Sound resource selected for the kamikaze implode event or effect.
  kamikazeImplodeSound
  /// Sound resource selected for the kamikaze far event or effect.
  kamikazeFarSound
  /// Sound resource selected for the use invulnerability event or effect.
  useInvulnerabilitySound
  /// Registered sound handle used for invulnerability impact sound1; mirrors native
  /// `cgMedia_t.invulnerabilityImpactSound1`.
  invulnerabilityImpactSound1
  /// Registered sound handle used for invulnerability impact sound2; mirrors native
  /// `cgMedia_t.invulnerabilityImpactSound2`.
  invulnerabilityImpactSound2
  /// Registered sound handle used for invulnerability impact sound3; mirrors native
  /// `cgMedia_t.invulnerabilityImpactSound3`.
  invulnerabilityImpactSound3
  /// Sound resource selected for the invulnerability juiced event or effect.
  invulnerabilityJuicedSound
  /// Registered sound handle used for obelisk hit sound1; mirrors native `cgMedia_t.obeliskHitSound1`.
  obeliskHitSound1
  /// Registered sound handle used for obelisk hit sound2; mirrors native `cgMedia_t.obeliskHitSound2`.
  obeliskHitSound2
  /// Registered sound handle used for obelisk hit sound3; mirrors native `cgMedia_t.obeliskHitSound3`.
  obeliskHitSound3
  /// Sound resource selected for the obelisk respawn event or effect.
  obeliskRespawnSound
  /// Sound resource selected for the winner event or effect.
  winnerSound
  /// Sound resource selected for the loser event or effect.
  loserSound
  /// Sound resource selected for the you suck event or effect.
  youSuckSound
  /// Sound resource selected for the gib event or effect.
  gibSound
  /// Sound resource selected for the gib bounce1 event or effect.
  gibBounce1Sound
  /// Sound resource selected for the gib bounce2 event or effect.
  gibBounce2Sound
  /// Sound resource selected for the gib bounce3 event or effect.
  gibBounce3Sound
  /// Sound resource selected for the tele in event or effect.
  teleInSound
  /// Sound resource selected for the tele out event or effect.
  teleOutSound
  /// Sound resource selected for the no ammo event or effect.
  noAmmoSound
  /// Sound resource selected for the respawn event or effect.
  respawnSound
  /// Sound resource selected for the talk event or effect.
  talkSound
  /// Sound resource selected for the land event or effect.
  landSound
  /// Sound resource selected for the fall event or effect.
  fallSound
  /// Sound resource selected for the jump pad event or effect.
  jumpPadSound
  /// Sound resource selected for the one minute event or effect.
  oneMinuteSound
  /// Sound resource selected for the five minute event or effect.
  fiveMinuteSound
  /// Sound resource selected for the sudden death event or effect.
  suddenDeathSound
  /// Sound resource selected for the three frag event or effect.
  threeFragSound
  /// Sound resource selected for the two frag event or effect.
  twoFragSound
  /// Sound resource selected for the one frag event or effect.
  oneFragSound
  /// Sound resource selected for the hit event or effect.
  hitSound
  /// Registered sound handle used for hit sound high armor; mirrors native
  /// `cgMedia_t.hitSoundHighArmor`.
  hitSoundHighArmor
  /// Registered sound handle used for hit sound low armor; mirrors native `cgMedia_t.hitSoundLowArmor`.
  hitSoundLowArmor
  /// Sound resource selected for the hit team event or effect.
  hitTeamSound
  /// Sound resource selected for the impressive event or effect.
  impressiveSound
  /// Sound resource selected for the excellent event or effect.
  excellentSound
  /// Sound resource selected for the denied event or effect.
  deniedSound
  /// Sound resource selected for the humiliation event or effect.
  humiliationSound
  /// Sound resource selected for the assist event or effect.
  assistSound
  /// Sound resource selected for the defend event or effect.
  defendSound
  /// Sound resource selected for the first impressive event or effect.
  firstImpressiveSound
  /// Sound resource selected for the first excellent event or effect.
  firstExcellentSound
  /// Sound resource selected for the first humiliation event or effect.
  firstHumiliationSound
  /// Sound resource selected for the taken lead event or effect.
  takenLeadSound
  /// Sound resource selected for the tied lead event or effect.
  tiedLeadSound
  /// Sound resource selected for the lost lead event or effect.
  lostLeadSound
  /// Registered sound handle used for vote now; mirrors native `cgMedia_t.voteNow`.
  voteNow
  /// Registered sound handle used for vote passed; mirrors native `cgMedia_t.votePassed`.
  votePassed
  /// Registered sound handle used for vote failed; mirrors native `cgMedia_t.voteFailed`.
  voteFailed
  /// Sound resource selected for the watr in event or effect.
  watrInSound
  /// Sound resource selected for the watr out event or effect.
  watrOutSound
  /// Sound resource selected for the watr un event or effect.
  watrUnSound
  /// Sound resource selected for the flight event or effect.
  flightSound
  /// Sound resource selected for the medkit event or effect.
  medkitSound
  /// Sound resource selected for the weapon hover event or effect.
  weaponHoverSound
  /// Sound resource selected for the capture award event or effect.
  captureAwardSound
  /// Sound resource selected for the red scored event or effect.
  redScoredSound
  /// Sound resource selected for the blue scored event or effect.
  blueScoredSound
  /// Sound resource selected for the red leads event or effect.
  redLeadsSound
  /// Sound resource selected for the blue leads event or effect.
  blueLeadsSound
  /// Sound resource selected for the teams tied event or effect.
  teamsTiedSound
  /// Sound resource selected for the capture your team event or effect.
  captureYourTeamSound
  /// Sound resource selected for the capture opponent event or effect.
  captureOpponentSound
  /// Sound resource selected for the return your team event or effect.
  returnYourTeamSound
  /// Sound resource selected for the return opponent event or effect.
  returnOpponentSound
  /// Sound resource selected for the taken your team event or effect.
  takenYourTeamSound
  /// Sound resource selected for the taken opponent event or effect.
  takenOpponentSound
  /// Sound resource selected for the red flag returned event or effect.
  redFlagReturnedSound
  /// Sound resource selected for the blue flag returned event or effect.
  blueFlagReturnedSound
  /// Sound resource selected for the neutral flag returned event or effect.
  neutralFlagReturnedSound
  /// Sound resource selected for the enemy took your flag event or effect.
  enemyTookYourFlagSound
  /// Sound resource selected for the enemy took the flag event or effect.
  enemyTookTheFlagSound
  /// Sound resource selected for the your team took enemy flag event or effect.
  yourTeamTookEnemyFlagSound
  /// Sound resource selected for the your team took the flag event or effect.
  yourTeamTookTheFlagSound
  /// Sound resource selected for the you have flag event or effect.
  youHaveFlagSound
  /// Sound resource selected for the your base is under attack event or effect.
  yourBaseIsUnderAttackSound
  /// Sound resource selected for the holy shit event or effect.
  holyShitSound
  /// Sound resource selected for the count3 event or effect.
  count3Sound
  /// Sound resource selected for the count2 event or effect.
  count2Sound
  /// Sound resource selected for the count1 event or effect.
  count1Sound
  /// Sound resource selected for the count fight event or effect.
  countFightSound
  /// Sound resource selected for the count prepare event or effect.
  countPrepareSound
  /// Shader resource selected for patrol rendering.
  patrolShader
  /// Shader resource selected for assault rendering.
  assaultShader
  /// Shader resource selected for camp rendering.
  campShader
  /// Shader resource selected for follow rendering.
  followShader
  /// Shader resource selected for defend rendering.
  defendShader
  /// Shader resource selected for team leader rendering.
  teamLeaderShader
  /// Shader resource selected for retrieve rendering.
  retrieveShader
  /// Shader resource selected for escort rendering.
  escortShader
  /// Shader resources selected for flag rendering.
  flagShaders
  /// Sound resource selected for the count prepare team event or effect.
  countPrepareTeamSound
  /// Sound resource selected for the ammoregen event or effect.
  ammoregenSound
  /// Sound resource selected for the doubler event or effect.
  doublerSound
  /// Sound resource selected for the guard event or effect.
  guardSound
  /// Sound resource selected for the scout event or effect.
  scoutSound
  /// Renderer resource handle used for cursor; mirrors native `cgMedia_t.cursor`.
  cursor
  /// Renderer resource handle used for select cursor; mirrors native `cgMedia_t.selectCursor`.
  selectCursor
  /// Renderer resource handle used for size cursor; mirrors native `cgMedia_t.sizeCursor`.
  sizeCursor
  /// Sound resource selected for the regen event or effect.
  regenSound
  /// Sound resource selected for the protect event or effect.
  protectSound
  /// Sound resource selected for the n health event or effect.
  n_healthSound
  /// Sound resource selected for the hgrenb1a event or effect.
  hgrenb1aSound
  /// Sound resource selected for the hgrenb2a event or effect.
  hgrenb2aSound
  /// Sound resource selected for the wstbimpl event or effect.
  wstbimplSound
  /// Sound resource selected for the wstbimpm event or effect.
  wstbimpmSound
  /// Sound resource selected for the wstbimpd event or effect.
  wstbimpdSound
  /// Sound resource selected for the wstbactv event or effect.
  wstbactvSound
end struct
/// Stores client game local cgs state record, including `gameState`, `glconfig`, `screenXScale`, `screenYScale`, `screenXBias`, `serverCommandSequence` and additional values.
struct CgsState
  /// Server configuration strings and associated game-state storage.
  gameState
  /// Renderer configuration reported by the engine for the current display.
  glconfig
  /// Horizontal virtual-screen scaling factor derived from the renderer configuration.
  screenXScale
  /// Vertical virtual-screen scaling factor derived from the renderer configuration.
  screenYScale
  /// Horizontal centering offset used when the actual display is wider than the virtual UI.
  screenXBias
  /// Last reliable server-command sequence tracked by the shared client-game static state.
  serverCommandSequence
  /// Highest snapshot sequence already requested or processed by CGame.
  processedSnapshotNum
  /// True when CGame detected a local server at startup through the engine configuration.
  localServer
  /// Server game-rule identifier mirrored in the native-compatible global client-game state.
  gametype
  /// Compatibility member corresponding to native `cgs_t.dmflags`; the original declaration is `int
  /// dmflags`.
  dmflags
  /// Compatibility member corresponding to native `cgs_t.teamflags`; the original declaration is `int
  /// teamflags`.
  teamflags
  /// Compatibility member corresponding to native `cgs_t.fraglimit`; the original declaration is `int
  /// fraglimit`.
  fraglimit
  /// Capture or objective-score limit parsed from the server's game information.
  capturelimit
  /// Compatibility member corresponding to native `cgs_t.timelimit`; the original declaration is `int
  /// timelimit`.
  timelimit
  /// Compatibility member corresponding to native `cgs_t.maxclients`; the original declaration is `int
  /// maxclients`.
  maxclients
  /// Map name parsed from server information or selected by the client UI.
  mapname
  /// Compatibility member corresponding to native `cgs_t.redTeam`; the original declaration is `char
  /// redTeam[MAX_QPATH]`.
  redTeam
  /// Compatibility member corresponding to native `cgs_t.blueTeam`; the original declaration is `char
  /// blueTeam[MAX_QPATH]`.
  blueTeam
  /// Compatibility member corresponding to native `cgs_t.voteTime`; the original declaration is `int
  /// voteTime`.
  voteTime
  /// Compatibility member corresponding to native `cgs_t.voteYes`; the original declaration is `int
  /// voteYes`.
  voteYes
  /// Compatibility member corresponding to native `cgs_t.voteNo`; the original declaration is `int
  /// voteNo`.
  voteNo
  /// True when vote information changed and the UI should refresh or play feedback.
  voteModified
  /// Compatibility member corresponding to native `cgs_t.voteString`; the original declaration is `char
  /// voteString[MAX_STRING_TOKENS]`.
  voteString
  /// Compatibility member corresponding to native `cgs_t.teamVoteTime`; the original declaration is
  /// `int teamVoteTime[2]`.
  teamVoteTime
  /// Compatibility member corresponding to native `cgs_t.teamVoteYes`; the original declaration is `int
  /// teamVoteYes[2]`.
  teamVoteYes
  /// Compatibility member corresponding to native `cgs_t.teamVoteNo`; the original declaration is `int
  /// teamVoteNo[2]`.
  teamVoteNo
  /// Per-team indicators that team-vote information changed.
  teamVoteModified
  /// Compatibility member corresponding to native `cgs_t.teamVoteString`; the original declaration is
  /// `char teamVoteString[2][MAX_STRING_TOKENS]`.
  teamVoteString
  /// Server timestamp at which the level began, used by elapsed-match-time displays.
  levelStartTime
  /// First team or leading player's score received through server configuration strings.
  scores1
  /// Second team or trailing player's score received through server configuration strings.
  scores2
  /// Red-flag status received through server configuration strings.
  redflag
  /// Blue-flag status received through server configuration strings.
  blueflag
  /// Current flag-objective state used by capture-the-flag presentation.
  flagStatus
  /// Compatibility member corresponding to native `cgs_t.newHud`; the original declaration is `qboolean
  /// newHud`.
  newHud
  /// Model resources derived from the server's model configuration strings.
  gameModels
  /// Sound resources derived from the server's sound configuration strings.
  gameSounds
  /// Model resources selected for the num inline presentation.
  numInlineModels
  /// Model resource selected for the inline draw presentation.
  inlineDrawModel
  /// Compatibility member corresponding to native `cgs_t.inlineModelMidpoints`; the original
  /// declaration is `vec3_t inlineModelMidpoints[MAX_MODELS]`.
  inlineModelMidpoints
  /// Compatibility member corresponding to native `cgs_t.clientinfo`; the original declaration is
  /// `clientInfo_t clientinfo[MAX_CLIENTS]`.
  clientinfo
  /// Color-coded team-chat lines retained in the bounded team-chat history.
  teamChatMsgs
  /// Arrival timestamps corresponding to the stored team-chat lines.
  teamChatMsgTimes
  /// Next write position in the team-chat history ring.
  teamChatPos
  /// Oldest team-chat history position still eligible for display.
  teamLastChatPos
  /// Horizontal position of the pointer in the local display coordinate system.
  cursorX
  /// Vertical position of the pointer in the local display coordinate system.
  cursorY
  /// Compatibility member corresponding to native `cgs_t.eventHandling`; the original declaration is
  /// `qboolean eventHandling`.
  eventHandling
  /// True while CGame captures pointer input for its interactive HUD or menu operation.
  mouseCaptured
  /// Compatibility member corresponding to native `cgs_t.sizingHud`; the original declaration is
  /// `qboolean sizingHud`.
  sizingHud
  /// Compatibility member corresponding to native `cgs_t.capturedItem`; the original declaration is
  /// `void *capturedItem`.
  capturedItem
  /// Renderer resource handle used for active cursor; mirrors native `cgs_t.activeCursor`.
  activeCursor
  /// Team-order identifier currently selected for issuing to a teammate.
  currentOrder
  /// Compatibility member corresponding to native `cgs_t.orderPending`; the original declaration is
  /// `qboolean orderPending`.
  orderPending
  /// Compatibility member corresponding to native `cgs_t.orderTime`; the original declaration is `int
  /// orderTime`.
  orderTime
  /// Compatibility member corresponding to native `cgs_t.currentVoiceClient`; the original declaration
  /// is `int currentVoiceClient`.
  currentVoiceClient
  /// Compatibility member corresponding to native `cgs_t.acceptOrderTime`; the original declaration is
  /// `int acceptOrderTime`.
  acceptOrderTime
  /// Compatibility member corresponding to native `cgs_t.acceptTask`; the original declaration is `int
  /// acceptTask`.
  acceptTask
  /// Compatibility member corresponding to native `cgs_t.acceptLeader`; the original declaration is
  /// `int acceptLeader`.
  acceptLeader
  /// Compatibility member corresponding to native `cgs_t.acceptVoice`; the original declaration is
  /// `char acceptVoice[MAX_NAME_LENGTH]`.
  acceptVoice
  /// Registered renderer and sound resources shared by the client-game presentation.
  media
end struct

/// Lists the type names catalog for client game local in its declared source order.
function typeNames() return ["footstep_t","impactSound_t","lerpFrame_t","playerEntity_t","centity_t","markPoly_t","leType_t","leFlag_t","leMarkType_t","leBounceSoundType_t","localEntity_t","score_t","clientInfo_t","weaponInfo_t","itemInfo_t","powerupInfo_t","skulltrail_t","cg_t","cgMedia_t","cgs_t","q3print_t"] end function
/// Lists the lerp frame field names catalog for client game local in its declared source order.
function lerpFrameFieldNames() return ["oldFrame","oldFrameTime","frame","frameTime","backlerp","yawAngle","yawing","pitchAngle","pitching","animationNumber","animation","animationTime"] end function
/// Lists the player entity field names catalog for client game local in its declared source order.
function playerEntityFieldNames() return ["legs","torso","flag","painTime","painDirection","lightningFiring","railgunImpact","railgunFlash","barrelAngle","barrelTime","barrelSpinning"] end function
/// Lists the centity field names catalog for client game local in its declared source order.
function centityFieldNames() return ["currentState","nextState","interpolate","currentValid","muzzleFlashTime","previousEvent","teleportFlag","trailTime","dustTrailTime","miscTime","snapShotTime","pe","errorTime","errorOrigin","errorAngles","extrapolated","rawOrigin","rawAngles","beamEnd","lerpOrigin","lerpAngles"] end function
/// Lists the mark poly field names catalog for client game local in its declared source order.
function markPolyFieldNames() return ["prevMark","nextMark","time","markShader","alphaFade","color","poly","verts"] end function
/// Lists the local entity field names catalog for client game local in its declared source order.
function localEntityFieldNames() return ["prev","next","leType","leFlags","startTime","endTime","fadeInTime","lifeRate","pos","angles","bounceFactor","color","radius","light","lightColor","leMarkType","leBounceSoundType","refEntity"] end function
/// Lists the score field names catalog for client game local in its declared source order.
function scoreFieldNames() return ["client","score","ping","time","scoreFlags","powerUps","accuracy","impressiveCount","excellentCount","guantletCount","defendCount","assistCount","captures","perfect","team"] end function
/// Lists the client info field names catalog for client game local in its declared source order.
function clientInfoFieldNames() return ["infoValid","name","team","botSkill","color1","color2","score","location","health","armor","curWeapon","handicap","wins","losses","teamTask","teamLeader","powerups","medkitUsageTime","invulnerabilityStartTime","invulnerabilityStopTime","breathPuffTime","modelName","skinName","headModelName","headSkinName","redTeam","blueTeam","deferred","newAnims","fixedlegs","fixedtorso","headOffset","footsteps","gender","legsModel","legsSkin","torsoModel","torsoSkin","headModel","headSkin","modelIcon","animations","sounds"] end function
/// Lists the weapon info field names catalog for client game local in its declared source order.
function weaponInfoFieldNames() return ["registered","item","handsModel","weaponModel","barrelModel","flashModel","weaponMidpoint","flashDlight","flashDlightColor","flashSound","weaponIcon","ammoIcon","ammoModel","missileModel","missileSound","missileTrailFunc","missileDlight","missileDlightColor","missileRenderfx","ejectBrassFunc","trailRadius","wiTrailTime","readySound","firingSound","loopFireSound"] end function
/// Lists the item info field names catalog for client game local in its declared source order.
function itemInfoFieldNames() return ["registered","models","icon"] end function
/// Lists the powerup info field names catalog for client game local in its declared source order.
function powerupInfoFieldNames() return ["itemNum"] end function
/// Lists the skulltrail field names catalog for client game local in its declared source order.
function skulltrailFieldNames() return ["positions","numpositions"] end function
/// Lists the cg field names catalog for client game local in its declared source order.
function cgFieldNames() return ["clientFrame","clientNum","demoPlayback","levelShot","deferredPlayerLoading","loading","intermissionStarted","latestSnapshotNum","latestSnapshotTime","snap","nextSnap","activeSnapshots","frameInterpolation","thisFrameTeleport","nextFrameTeleport","frametime","time","oldTime","physicsTime","timelimitWarnings","fraglimitWarnings","mapRestart","renderingThirdPerson","hyperspace","predictedPlayerState","predictedPlayerEntity","validPPS","predictedErrorTime","predictedError","eventSequence","predictableEvents","stepChange","stepTime","duckChange","duckTime","landChange","landTime","weaponSelect","autoAngles","autoAxis","autoAnglesFast","autoAxisFast","refdef","refdefViewAngles","zoomed","zoomTime","zoomSensitivity","infoScreenText","scoresRequestTime","numScores","selectedScore","teamScores","scores","showScores","scoreBoardShowing","scoreFadeTime","killerName","spectatorList","spectatorLen","spectatorWidth","spectatorTime","spectatorPaintX","spectatorPaintX2","spectatorOffset","spectatorPaintLen","skulltrails","centerPrintTime","centerPrintCharWidth","centerPrintY","centerPrint","centerPrintLines","lowAmmoWarning","lastKillTime","crosshairClientNum","crosshairClientTime","powerupActive","powerupTime","attackerTime","voiceTime","rewardStack","rewardTime","rewardCount","rewardShader","rewardSound","soundBufferIn","soundBufferOut","soundTime","soundBuffer","voiceChatTime","voiceChatBufferIn","voiceChatBufferOut","warmup","warmupCount","itemPickup","itemPickupTime","itemPickupBlendTime","weaponSelectTime","weaponAnimation","weaponAnimationTime","damageTime","damageX","damageY","damageValue","headYaw","headEndPitch","headEndYaw","headEndTime","headStartPitch","headStartYaw","headStartTime","v_dmg_time","v_dmg_pitch","v_dmg_roll","kick_angles","kick_origin","bobfracsin","bobcycle","xyspeed","nextOrbitTime","testModelEntity","testModelName","testGun"] end function
/// Lists the cg media field names catalog for client game local in its declared source order.
function cgMediaFieldNames() return ["charsetShader","charsetProp","charsetPropGlow","charsetPropB","whiteShader","redCubeModel","blueCubeModel","redCubeIcon","blueCubeIcon","redFlagModel","blueFlagModel","neutralFlagModel","redFlagShader","blueFlagShader","flagShader","flagPoleModel","flagFlapModel","redFlagFlapSkin","blueFlagFlapSkin","neutralFlagFlapSkin","redFlagBaseModel","blueFlagBaseModel","neutralFlagBaseModel","overloadBaseModel","overloadTargetModel","overloadLightsModel","overloadEnergyModel","harvesterModel","harvesterRedSkin","harvesterBlueSkin","harvesterNeutralModel","armorModel","armorIcon","teamStatusBar","deferShader","gibAbdomen","gibArm","gibChest","gibFist","gibFoot","gibForearm","gibIntestine","gibLeg","gibSkull","gibBrain","smoke2","machinegunBrassModel","shotgunBrassModel","railRingsShader","railCoreShader","lightningShader","friendShader","balloonShader","connectionShader","selectShader","viewBloodShader","tracerShader","crosshairShader","lagometerShader","backTileShader","noammoShader","smokePuffShader","smokePuffRageProShader","shotgunSmokePuffShader","plasmaBallShader","waterBubbleShader","bloodTrailShader","nailPuffShader","blueProxMine","numberShaders","shadowMarkShader","botSkillShaders","wakeMarkShader","bloodMarkShader","bulletMarkShader","burnMarkShader","holeMarkShader","energyMarkShader","quadShader","redQuadShader","quadWeaponShader","invisShader","regenShader","battleSuitShader","battleWeaponShader","hastePuffShader","redKamikazeShader","blueKamikazeShader","bulletFlashModel","ringFlashModel","dishFlashModel","lightningExplosionModel","railExplosionShader","plasmaExplosionShader","bulletExplosionShader","rocketExplosionShader","grenadeExplosionShader","bfgExplosionShader","bloodExplosionShader","teleportEffectModel","teleportEffectShader","kamikazeEffectModel","kamikazeShockWave","kamikazeHeadModel","kamikazeHeadTrail","guardPowerupModel","scoutPowerupModel","doublerPowerupModel","ammoRegenPowerupModel","invulnerabilityImpactModel","invulnerabilityJuicedModel","medkitUsageModel","dustPuffShader","heartShader","invulnerabilityPowerupModel","scoreboardName","scoreboardPing","scoreboardScore","scoreboardTime","medalImpressive","medalExcellent","medalGauntlet","medalDefend","medalAssist","medalCapture","quadSound","tracerSound","selectSound","useNothingSound","wearOffSound","footsteps","sfx_lghit1","sfx_lghit2","sfx_lghit3","sfx_ric1","sfx_ric2","sfx_ric3","sfx_railg","sfx_rockexp","sfx_plasmaexp","sfx_proxexp","sfx_nghit","sfx_nghitflesh","sfx_nghitmetal","sfx_chghit","sfx_chghitflesh","sfx_chghitmetal","kamikazeExplodeSound","kamikazeImplodeSound","kamikazeFarSound","useInvulnerabilitySound","invulnerabilityImpactSound1","invulnerabilityImpactSound2","invulnerabilityImpactSound3","invulnerabilityJuicedSound","obeliskHitSound1","obeliskHitSound2","obeliskHitSound3","obeliskRespawnSound","winnerSound","loserSound","youSuckSound","gibSound","gibBounce1Sound","gibBounce2Sound","gibBounce3Sound","teleInSound","teleOutSound","noAmmoSound","respawnSound","talkSound","landSound","fallSound","jumpPadSound","oneMinuteSound","fiveMinuteSound","suddenDeathSound","threeFragSound","twoFragSound","oneFragSound","hitSound","hitSoundHighArmor","hitSoundLowArmor","hitTeamSound","impressiveSound","excellentSound","deniedSound","humiliationSound","assistSound","defendSound","firstImpressiveSound","firstExcellentSound","firstHumiliationSound","takenLeadSound","tiedLeadSound","lostLeadSound","voteNow","votePassed","voteFailed","watrInSound","watrOutSound","watrUnSound","flightSound","medkitSound","weaponHoverSound","captureAwardSound","redScoredSound","blueScoredSound","redLeadsSound","blueLeadsSound","teamsTiedSound","captureYourTeamSound","captureOpponentSound","returnYourTeamSound","returnOpponentSound","takenYourTeamSound","takenOpponentSound","redFlagReturnedSound","blueFlagReturnedSound","neutralFlagReturnedSound","enemyTookYourFlagSound","enemyTookTheFlagSound","yourTeamTookEnemyFlagSound","yourTeamTookTheFlagSound","youHaveFlagSound","yourBaseIsUnderAttackSound","holyShitSound","count3Sound","count2Sound","count1Sound","countFightSound","countPrepareSound","patrolShader","assaultShader","campShader","followShader","defendShader","teamLeaderShader","retrieveShader","escortShader","flagShaders","countPrepareTeamSound","ammoregenSound","doublerSound","guardSound","scoutSound","cursor","selectCursor","sizeCursor","regenSound","protectSound","n_healthSound","hgrenb1aSound","hgrenb2aSound","wstbimplSound","wstbimpmSound","wstbimpdSound","wstbactvSound"] end function
/// Lists the cgs field names catalog for client game local in its declared source order.
function cgsFieldNames() return ["gameState","glconfig","screenXScale","screenYScale","screenXBias","serverCommandSequence","processedSnapshotNum","localServer","gametype","dmflags","teamflags","fraglimit","capturelimit","timelimit","maxclients","mapname","redTeam","blueTeam","voteTime","voteYes","voteNo","voteModified","voteString","teamVoteTime","teamVoteYes","teamVoteNo","teamVoteModified","teamVoteString","levelStartTime","scores1","scores2","redflag","blueflag","flagStatus","newHud","gameModels","gameSounds","numInlineModels","inlineDrawModel","inlineModelMidpoints","clientinfo","teamChatMsgs","teamChatMsgTimes","teamChatPos","teamLastChatPos","cursorX","cursorY","eventHandling","mouseCaptured","sizingHud","capturedItem","activeCursor","currentOrder","orderPending","orderTime","currentVoiceClient","acceptOrderTime","acceptTask","acceptLeader","acceptVoice","media"] end function
/// Lists the declaration names catalog for client game local in its declared source order.
function declarationNames() return ["CG_ConfigString","CG_Argv","CG_Printf","CG_Error","CG_StartMusic","CG_UpdateCvars","CG_CrosshairPlayer","CG_LastAttacker","CG_LoadMenus","CG_KeyEvent","CG_MouseEvent","CG_EventHandling","CG_RankRunFrame","CG_SetScoreSelection","CG_GetSelectedScore","CG_BuildSpectatorString","CG_TestModel_f","CG_TestGun_f","CG_TestModelNextFrame_f","CG_TestModelPrevFrame_f","CG_TestModelNextSkin_f","CG_TestModelPrevSkin_f","CG_ZoomDown_f","CG_ZoomUp_f","CG_AddBufferedSound","CG_DrawActiveFrame","CG_AdjustFrom640","CG_FillRect","CG_DrawPic","CG_DrawString","CG_DrawStringExt","CG_DrawBigString","CG_DrawBigStringColor","CG_DrawSmallString","CG_DrawSmallStringColor","CG_DrawStrlen","CG_FadeColor","CG_TeamColor","CG_TileClear","CG_ColorForHealth","CG_GetColorForHealth","UI_DrawProportionalString","CG_DrawRect","CG_DrawSides","CG_DrawTopBottom","CG_AddLagometerFrameInfo","CG_AddLagometerSnapshotInfo","CG_CenterPrint","CG_DrawHead","CG_DrawActive","CG_DrawFlagModel","CG_DrawTeamBackground","CG_OwnerDraw","CG_Text_Paint","CG_Text_Width","CG_Text_Height","CG_SelectPrevPlayer","CG_SelectNextPlayer","CG_GetValue","CG_OwnerDrawVisible","CG_RunMenuScript","CG_ShowResponseHead","CG_SetPrintString","CG_InitTeamChat","CG_GetTeamColor","CG_GetGameStatusText","CG_GetKillerText","CG_Draw3DModel","CG_Text_PaintChar","CG_CheckOrderPending","CG_GameTypeString","CG_YourTeamHasFlag","CG_OtherTeamHasFlag","CG_StatusHandle","CG_Player","CG_ResetPlayerEntity","CG_AddRefEntityWithPowerups","CG_NewClientInfo","CG_CustomSound","CG_BuildSolidList","CG_PointContents","CG_Trace","CG_PredictPlayerState","CG_LoadDeferredPlayers","CG_CheckEvents","CG_PlaceString","CG_EntityEvent","CG_PainEvent","CG_SetEntitySoundPosition","CG_AddPacketEntities","CG_Beam","CG_AdjustPositionForMover","CG_PositionEntityOnTag","CG_PositionRotatedEntityOnTag","CG_NextWeapon_f","CG_PrevWeapon_f","CG_Weapon_f","CG_RegisterWeapon","CG_RegisterItemVisuals","CG_FireWeapon","CG_MissileHitWall","CG_MissileHitPlayer","CG_ShotgunFire","CG_Bullet","CG_RailTrail","CG_GrappleTrail","CG_AddViewWeapon","CG_AddPlayerWeapon","CG_DrawWeaponSelect","CG_OutOfAmmoChange","CG_InitMarkPolys","CG_AddMarks","CG_ImpactMark","CG_InitLocalEntities","CG_AllocLocalEntity","CG_AddLocalEntities","CG_SmokePuff","CG_BubbleTrail","CG_SpawnEffect","CG_KamikazeEffect","CG_ObeliskExplode","CG_ObeliskPain","CG_InvulnerabilityImpact","CG_InvulnerabilityJuiced","CG_LightningBoltBeam","CG_ScorePlum","CG_GibPlayer","CG_BigExplode","CG_Bleed","CG_MakeExplosion","CG_ProcessSnapshots","CG_LoadingString","CG_LoadingItem","CG_LoadingClient","CG_DrawInformation","CG_DrawOldScoreboard","CG_DrawOldTourneyScoreboard","CG_ConsoleCommand","CG_InitConsoleCommands","CG_ExecuteNewServerCommands","CG_ParseServerinfo","CG_SetConfigValues","CG_LoadVoiceChats","CG_ShaderStateChanged","CG_VoiceChatLocal","CG_PlayBufferedVoiceChats","CG_Respawn","CG_TransitionPlayerState","CG_CheckChangedPredictableEvents","trap_Print","trap_Error","trap_Milliseconds","trap_Cvar_Register","trap_Cvar_Update","trap_Cvar_Set","trap_Cvar_VariableStringBuffer","trap_Argc","trap_Argv","trap_Args","trap_FS_FOpenFile","trap_FS_Read","trap_FS_Write","trap_FS_FCloseFile","trap_FS_Seek","trap_SendConsoleCommand","trap_AddCommand","trap_SendClientCommand","trap_UpdateScreen","trap_CM_LoadMap","trap_CM_NumInlineModels","trap_CM_InlineModel","trap_CM_TempBoxModel","trap_CM_PointContents","trap_CM_TransformedPointContents","trap_CM_BoxTrace","trap_CM_TransformedBoxTrace","trap_CM_MarkFragments","trap_S_StartSound","trap_S_StopLoopingSound","trap_S_StartLocalSound","trap_S_ClearLoopingSounds","trap_S_AddLoopingSound","trap_S_AddRealLoopingSound","trap_S_UpdateEntityPosition","trap_S_Respatialize","trap_S_RegisterSound","trap_S_StartBackgroundTrack","trap_S_StopBackgroundTrack","trap_R_LoadWorldMap","trap_R_RegisterModel","trap_R_RegisterSkin","trap_R_RegisterShader","trap_R_RegisterShaderNoMip","trap_R_ClearScene","trap_R_AddRefEntityToScene","trap_R_AddPolyToScene","trap_R_AddPolysToScene","trap_R_AddLightToScene","trap_R_LightForPoint","trap_R_RenderScene","trap_R_SetColor","trap_R_DrawStretchPic","trap_R_ModelBounds","trap_R_LerpTag","trap_R_RemapShader","trap_GetGlconfig","trap_GetGameState","trap_GetCurrentSnapshotNumber","trap_GetSnapshot","trap_GetServerCommand","trap_GetCurrentCmdNumber","trap_GetUserCmd","trap_SetUserCmdValue","testPrintInt","testPrintFloat","trap_MemoryRemaining","trap_R_RegisterFont","trap_Key_IsDown","trap_Key_GetCatcher","trap_Key_SetCatcher","trap_Key_GetKey","trap_CIN_PlayCinematic","trap_CIN_StopCinematic","trap_CIN_RunCinematic","trap_CIN_DrawCinematic","trap_CIN_SetExtents","trap_SnapVector","trap_loadCamera","trap_startCamera","trap_getCameraInfo","trap_GetEntityToken","CG_ClearParticles","CG_AddParticles","CG_ParticleSnow","CG_ParticleSmoke","CG_AddParticleShrapnel","CG_ParticleSnowFlurry","CG_ParticleBulletDebris","CG_ParticleSparks","CG_ParticleDust","CG_ParticleMisc","CG_ParticleExplosion","CG_NewParticleArea"] end function
/// Lists the global names catalog for client game local in its declared source order.
function globalNames() return ["cgs","cg","cg_entities","cg_weapons","cg_items","cg_markPolys","cg_centertime","cg_runpitch","cg_runroll","cg_bobup","cg_bobpitch","cg_bobroll","cg_swingSpeed","cg_shadows","cg_gibs","cg_drawTimer","cg_drawFPS","cg_drawSnapshot","cg_draw3dIcons","cg_drawIcons","cg_drawAmmoWarning","cg_drawCrosshair","cg_drawCrosshairNames","cg_drawRewards","cg_drawTeamOverlay","cg_teamOverlayUserinfo","cg_crosshairX","cg_crosshairY","cg_crosshairSize","cg_crosshairHealth","cg_drawStatus","cg_draw2D","cg_animSpeed","cg_debugAnim","cg_debugPosition","cg_debugEvents","cg_railTrailTime","cg_errorDecay","cg_nopredict","cg_noPlayerAnims","cg_showmiss","cg_footsteps","cg_addMarks","cg_brassTime","cg_gun_frame","cg_gun_x","cg_gun_y","cg_gun_z","cg_drawGun","cg_viewsize","cg_tracerChance","cg_tracerWidth","cg_tracerLength","cg_autoswitch","cg_ignore","cg_simpleItems","cg_fov","cg_zoomFov","cg_thirdPersonRange","cg_thirdPersonAngle","cg_thirdPerson","cg_stereoSeparation","cg_lagometer","cg_drawAttacker","cg_synchronousClients","cg_teamChatTime","cg_teamChatHeight","cg_stats","cg_forceModel","cg_buildScript","cg_paused","cg_blood","cg_predictItems","cg_deferPlayers","cg_drawFriend","cg_teamChatsOnly","cg_noVoiceChats","cg_noVoiceText","cg_scorePlum","cg_smoothClients","pmove_fixed","pmove_msec","cg_cameraOrbit","cg_cameraOrbitDelay","cg_timescaleFadeEnd","cg_timescaleFadeSpeed","cg_timescale","cg_cameraMode","cg_smallFont","cg_bigFont","cg_noTaunt","cg_noProjectileTrail","cg_oldRail","cg_oldRocket","cg_oldPlasma","cg_trueLightning","cg_redTeamName","cg_blueTeamName","cg_currentSelectedPlayer","cg_currentSelectedPlayerName","cg_singlePlayer","cg_enableDust","cg_enableBreath","cg_singlePlayerActive","cg_recordSPDemo","cg_recordSPDemoName","cg_obeliskRespawnDelay","sortedTeamPlayers","numSortedTeamPlayers","drawTeamOverlayModificationCount","systemChat","teamChat1","teamChat2","initparticles"] end function

/// Computes `value>=FOOTSTEP_NORMAL and value<FOOTSTEP_TOTAL` for client game local `validFootstep`.
/// @param value Value used by `return value>=FOOTSTEP_NORMAL and value<FOOTSTEP_TOTAL`.
function validFootstep(value) return value>=FOOTSTEP_NORMAL and value<FOOTSTEP_TOTAL end function
/// Computes `value>=IMPACTSOUND_DEFAULT and value<=IMPACTSOUND_FLESH` for client game local `validImpactSound`.
/// @param value Value used by `return value>=IMPACTSOUND_DEFAULT and value<=IMPACTSOUND_FLESH`.
function validImpactSound(value) return value>=IMPACTSOUND_DEFAULT and value<=IMPACTSOUND_FLESH end function
/// Evaluates client game local `validLocalEntityType` and returns `true`, `missionpack and value>=LE_KAMIKAZE and value<=LE_SHOWREFENTITY` according to its guard/selection conditions.
/// @param value Value tested by `value>=LE_MARK and value<=LE_SCOREPLUM` before the calculation continues.
/// @param missionpack Value used by `return missionpack and value>=LE_KAMIKAZE and value<=LE_SHOWREFENTITY`.
function validLocalEntityType(value,missionpack) if value>=LE_MARK and value<=LE_SCOREPLUM then return true end if;return missionpack and value>=LE_KAMIKAZE and value<=LE_SHOWREFENTITY end function
/// Evaluates client game local `nextSoundBufferSlot` and returns `error(7956,"cg_local.h: invalid sound-buffer slot")`, `(value+1)%MAX_SOUNDBUFFER` according to its guard/selection conditions.
/// @param value Value tested by `value<0 or value>=MAX_SOUNDBUFFER` before the calculation continues.
function nextSoundBufferSlot(value) if value<0 or value>=MAX_SOUNDBUFFER then return error(7956,"cg_local.h: invalid sound-buffer slot") end if;return (value+1)%MAX_SOUNDBUFFER end function
/// Evaluates client game local `nextRewardSlot` and returns `error(7956,"cg_local.h: invalid reward slot")`, `(value+1)%MAX_REWARDSTACK` according to its guard/selection conditions.
/// @param value Value tested by `value<0 or value>=MAX_REWARDSTACK` before the calculation continues.
function nextRewardSlot(value) if value<0 or value>=MAX_REWARDSTACK then return error(7956,"cg_local.h: invalid reward slot") end if;return (value+1)%MAX_REWARDSTACK end function
/// Computes `value>=0 and value<NUM_CROSSHAIRS` for client game local `validCrosshair`.
/// @param value Value used by `return value>=0 and value<NUM_CROSSHAIRS`.
function validCrosshair(value) return value>=0 and value<NUM_CROSSHAIRS end function
/// Computes `vertexCount>=0 and vertexCount<=MAX_VERTS_ON_POLY` for client game local `validMarkPolygon`.
/// @param vertexCount Value used by `return vertexCount>=0 and vertexCount<=MAX_VERTS_ON_POLY`.
function validMarkPolygon(vertexCount) return vertexCount>=0 and vertexCount<=MAX_VERTS_ON_POLY end function
/// Computes `timeLeft>=0 and timeLeft<=POWERUP_BLINKS*POWERUP_BLINK_TIME` for client game local `powerupBlinkWindow`.
/// @param timeLeft Value used by `return timeLeft>=0 and timeLeft<=POWERUP_BLINKS*POWERUP_BLINK_TIME`.
function powerupBlinkWindow(timeLeft) return timeLeft>=0 and timeLeft<=POWERUP_BLINKS*POWERUP_BLINK_TIME end function
/// Evaluates client game local `clampTeamChatHeight` and returns `0`, `TEAMCHAT_HEIGHT`, `value` according to its guard/selection conditions.
/// @param value Value tested by `value<0`, `value>TEAMCHAT_HEIGHT` before the calculation continues.
function clampTeamChatHeight(value) if value<0 then return 0 end if;if value>TEAMCHAT_HEIGHT then return TEAMCHAT_HEIGHT end if;return value end function
